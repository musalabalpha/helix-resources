#!/usr/bin/env bash
# Barrido de fugas: nada entra a este repo público sin pasar esto.
#
# Un repo público sano no se mantiene con buenas intenciones. Lo que se cuela
# no suele ser una API key — es un path con tu usuario, el nombre de un cliente
# en un ejemplo, o una referencia a un issue interno. Se cuela cuando el repo
# crece y ya nadie lo revisa archivo por archivo.
#
# Uso:  ./verificar-fugas.sh [ruta]      (por defecto: todo el repo)
set -u
cd "$(dirname "$0")"
DIR="${1:-.}"
fallos=0

barrido() {
  # $3 opcional: regex de exclusión para placeholders legítimos. Va como grep -v
  # aparte y NO dentro del patrón: grep -E no soporta lookahead negativo, y un
  # (?!...) ahí no da error — simplemente nunca matchea y el chequeo miente.
  local desc="$1" patron="$2" excluir="${3:-}"
  local hits
  hits=$(grep -rniE "$patron" --exclude-dir=.git --exclude="$(basename "$0")" "$DIR" 2>/dev/null || true)
  [ -n "$excluir" ] && hits=$(printf '%s' "$hits" | grep -viE "$excluir" || true)
  if [ -n "$hits" ]; then
    printf '  REVISAR  %s\n' "$desc"
    printf '%s\n' "$hits" | head -10 | sed 's/^/           /'
    fallos=$((fallos + 1))
  else
    printf '  ok       %s\n' "$desc"
  fi
}

echo "Barrido de fugas en: $DIR"
echo

# Secretos: lo obvio, pero lo que más caro sale.
barrido "credenciales (sk-, ghp_, PAT, PEM, Bearer, AWS)" \
  'sk-[a-zA-Z0-9]{10,}|ghp_[a-zA-Z0-9]{10,}|github_pat_|xoxb-|AKIA[0-9A-Z]{12}|-----BEGIN|Bearer +[a-zA-Z0-9._-]{16,}'

# Rutas de máquina: delatan usuario, estructura y a veces la organización.
barrido "rutas absolutas de una máquina real" \
  '/Users/[a-zA-Z0-9._-]+|/home/[a-zA-Z0-9._-]+|C:\\\\Users\\\\'

# Gestores de secretos y redes privadas: referencias que no sirven fuera.
barrido "referencias a vault o red privada" \
  'op://|vault://|\.ts\.net|\.internal\b|localhost:[0-9]{4,}'

# Contacto: emails reales en ejemplos son el clásico copy-paste olvidado.
# example.com / example.org son placeholders legítimos.
barrido "emails que no son placeholder" \
  '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' \
  '@(example|test|localhost)\.(com|org|net)|@ejemplo\.'

# Rastros internos: identificadores de gestor de tareas y nombres de proyecto.
# Ajusta estos prefijos a los tuyos antes de usar el script en otro repo.
barrido "identificadores de issues internos" \
  '\b(HLX|LAB|OPS)-[0-9]+\b'

echo
if [ "$fallos" -eq 0 ]; then
  echo "Limpio: nada que revisar antes de publicar."
else
  echo "$fallos categoría(s) con hits. Revísalos antes de hacer push."
  echo "Algunos serán falsos positivos (una palabra que contiene otra); el punto"
  echo "es que los MIRES, no que el script decida por ti."
  exit 1
fi
