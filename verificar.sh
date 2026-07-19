#!/usr/bin/env bash
# Comprueba que el hook PreToolUse de settings.json.ejemplo bloquea lo que dice
# bloquear. Un hook mal escrito falla en silencio: deja pasar todo y aparenta
# proteger. Corre esto antes de confiar en el archivo, y otra vez si lo editas.
set -u
cd "$(dirname "$0")"
FILE="${1:-settings.json.ejemplo}"

HOOK=$(python3 -c "
import json,sys
d=json.load(open('$FILE'))
print(d['hooks']['PreToolUse'][0]['hooks'][0]['command'])
") || { echo "No pude leer el hook de $FILE"; exit 1; }

fallos=0
check() {
  local desc="$1" cmd="$2" esperado="$3"
  printf '{"tool_name":"Bash","tool_input":{"command":"%s"}}' "$cmd" \
    | bash -c "$HOOK" >/dev/null 2>&1
  local rc=$?
  if [ "$rc" = "$esperado" ]; then
    printf '  ok    %s\n' "$desc"
  else
    printf '  FALLA %s (exit=%s, esperado %s)\n' "$desc" "$rc" "$esperado"
    fallos=$((fallos + 1))
  fi
}

echo "Debe BLOQUEAR (exit 2):"
check "rm -rf en home"        "rm -rf ~/Documents"          2
check "rm -rf ruta relativa"  "rm -rf ./node_modules"       2
check "rm -rf raiz"           "rm -rf /"                    2
check "rm -fr flags al reves" "rm -fr ~/x"                  2
check "push --force"          "git push --force origin main" 2
check "reset --hard"          "git reset --hard HEAD~3"     2

echo "Debe PASAR (exit 0):"
check "npm test"              "npm test"                    0
check "git status"            "git status"                  0
check "borrar un archivo"     "rm archivo.txt"              0
check "push normal"           "git push origin main"        0
check "build"                 "npm run build"               0

echo
if [ "$fallos" -eq 0 ]; then
  echo "Todo bien: el hook bloquea y deja pasar lo que debe."
else
  echo "$fallos caso(s) fallando. NO confies en este hook hasta arreglarlo."
  exit 1
fi
