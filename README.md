# helix-resources

Recursos públicos y genéricos para trabajar con [Claude Code](https://claude.com/claude-code). Pensado para que cualquiera del equipo pueda clonar, copiar lo que le sirva y tirar el resto.

Nada aquí depende de la infraestructura interna: si algo solo funciona con nuestros servidores, nuestras credenciales o nuestro gestor de tareas, **no va en este repo**.

## Qué hay

### [`starter-kit/`](starter-kit/) — punto de partida

Para alguien que empieza con Claude Code y quiere una base configurada en vez de un archivo en blanco. Trae `CLAUDE.md` de ejemplo con bloques etiquetados, permisos y hooks en `settings.json.ejemplo`, tres skills de muestra y ejemplos de memoria persistente.

Se clona una vez, se poda y se adapta. Es un andamio, no un dogma — el propio README de adentro te dice qué borrar.

Incluye [`verificar.sh`](starter-kit/verificar.sh), que comprueba que el hook de seguridad de verdad bloquea lo que dice bloquear. Córrelo antes de confiar en esa configuración: un hook mal escrito no da error, simplemente deja pasar todo.

### [`skills/`](skills/) — biblioteca compartida

Skills reutilizables, una carpeta por skill. Se consultan y se copian sueltas, no se clonan en bloque.

- [`gobernanza-de-tablero/`](skills/gobernanza-de-tablero/) — qué hacer cuando el gestor de tareas dejó de servir: backlog inmanejable, todo en prioridad alta, nada con dueño. No limpia el tablero: primero saca por entrevista el criterio del dueño y limpia con ese criterio. Incluye la clasificación de compromiso / deseo / vigilancia, cómo obtener una definición verificable de "terminado", y el modo aprendiz para no dejar que un proceso automático empiece borrando.
- [`balance-de-sesion/`](skills/balance-de-sesion/) — el saldo honesto de una sesión larga con un agente: qué se logró, qué no salió, qué se trabó y qué queda (tuyo o del agente), cada línea con prueba, más una sugerencia calibrada de si conviene parar. También sirve como primer paso de un ritual de cierre del día.
- [`arranque-del-dia/`](skills/arranque-del-dia/) — ritual de inicio de jornada en menos de 30 líneas: lo que solo tú puedes destrabar, lo que pasó mientras no estabas, lo que toca hoy y un plan de máximo 3 prioridades. Su pieza clave es el filtro anti-viejo: no repite pendientes que ya se resolvieron.
- [`punto-de-guardado/`](skills/punto-de-guardado/) — cerrar una sesión con un agente a cualquier hora, también la última del día: control de versiones sin saltos silenciosos (lo ajeno en commit aparte), tareas tocadas al día, procesos que quedaron corriendo y un puntero `RETOMA` en las notas para que el siguiente arranque no herede un estado que miente.
- [`mapa-de-horizontes/`](skills/mapa-de-horizontes/) — lo que viene en tres horizontes (hoy–mañana, semana, trimestre), cada renglón con evidencia y cruzado contra lo más reciente para no proponer lo que ya se hizo; termina en una sola línea de foco.
- [`diseno-de-prompts/`](skills/diseno-de-prompts/) — prompts listos para usar: modo express por defecto con supuestos marcados, modo doctor para auditar, verificación de que cada nombre citado existe y entrega donde el usuario lo va a encontrar.

## Regla de entrada

Todo lo que entre a este repo pasa primero por [`verificar-fugas.sh`](verificar-fugas.sh):

```bash
./verificar-fugas.sh            # todo el repo
./verificar-fugas.sh skills/    # solo una parte
```

Busca credenciales, rutas absolutas de una máquina real, referencias a gestores de secretos o red privada, emails que no son placeholder, e identificadores de issues internos.

Dos advertencias sobre cómo usarlo:

- **Va a dar falsos positivos.** Una palabra que contiene otra, un ejemplo que parece un path. El script no decide por ti; te obliga a mirar.
- **Un barrido que nunca falla es indistinguible de uno roto.** Si lo modificas, pruébalo con fugas inyectadas a propósito y confirma que las detecta. Este script ya tuvo esa falla **dos veces**:

  1. El chequeo de emails usaba un lookahead negativo que `grep -E` no soporta, así que nunca podía encontrar nada y reportaba "limpio".
  2. El patrón de credenciales era `sk-[a-zA-Z0-9]{10,}`, que exige diez caracteres alfanuméricos *seguidos* después de `sk-`. Una llave real de Anthropic es `sk-ant-api03-…`: el guion después de `ant` corta la cuenta en tres y el patrón nunca dispara. El barrido no detectaba justo la credencial más probable en un repo de Claude Code. Corregido a `sk-[a-zA-Z0-9_-]{16,}`, que además cubre `sk-proj-…` de OpenAI.

  Las dos fallas se ven idénticas desde afuera: el script corre, no marca nada, y todo parece en orden. Por eso la única prueba que cuenta es la que inyecta la fuga a propósito.

Lo que no cubre ningún script: contexto de negocio en prosa. Un ejemplo con el nombre de un cliente real, una decisión interna explicada de más. Eso se atrapa leyendo.

## Licencia

MIT — ver [LICENSE](LICENSE). Úsalo, modifícalo y redistribúyelo libremente; lo único que se pide es conservar el aviso de copyright.
