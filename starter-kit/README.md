# Starter kit para Claude Code

Un punto de partida para que tu agente deje de empezar de cero cada sesión.

Esto **no es una biblia**. Es un andamio: una estructura que sostiene mientras
construyes la tuya, diseñada para que le vayas quitando piezas. Si en un mes
borraste la mitad y el resto lo reescribiste, funcionó.

---

## Arranque rápido (~20 min)

```bash
git clone <este-repo> claude-starter-kit
cd claude-starter-kit
mkdir -p ~/.claude/memory ~/.claude/skills
```

**Si ya usabas Claude Code, respalda primero** — los pasos de abajo escriben
sobre tu configuración global:

```bash
cp ~/.claude/CLAUDE.md    ~/.claude/CLAUDE.md.bak    2>/dev/null
cp ~/.claude/settings.json ~/.claude/settings.json.bak 2>/dev/null
```

```bash
# 1. Instrucciones globales
cp CLAUDE.md ~/.claude/CLAUDE.md

# 2. Memoria (índice + ejemplos del formato)
cp memory/MEMORY.md ~/.claude/memory/
cp -r memory/ejemplos ~/.claude/memory/

# 3. Skills
cp -r skills/wrap-it-up skills/gotcha ~/.claude/skills/

# 4. Permisos y hooks — LÉELO antes de copiarlo (ver sección 5)
./verificar.sh                              # confirma que el hook sí bloquea
cp settings.json.ejemplo ~/.claude/settings.json
```

Si ya tenías un `settings.json`, no lo sobrescribas: abre ambos y fusiona a mano
las entradas de `allow`/`deny` que te sirvan.

Luego abre `~/.claude/CLAUDE.md` y haz una sola pasada: cada bloque viene
etiquetado `[NÚCLEO]`, `[OPINADO]` o `[BORRA SI NO APLICA]`. Borra lo que no
sea tuyo. Ese primer podado es la mitad del valor del kit.

Los ejemplos de `memory/ejemplos/` están ahí para que veas el formato. Bórralos
cuando tengas memorias reales.

---

## 1. Por qué esto existe

Un agente sin estructura re-aprende lo mismo cada sesión. Le explicas tu stack,
tus convenciones, la razón por la que esa librería está fijada a esa versión, y
al día siguiente vuelves a explicarlo. Peor: vuelve a proponer la solución que
ya descartaron juntos hace dos semanas, y no tiene forma de saberlo.

El kit ataca eso con cuatro piezas que hacen cosas distintas:

| Pieza | Qué resuelve | Cuándo se lee |
|---|---|---|
| `CLAUDE.md` | Cómo trabajar contigo | Cada sesión, completo |
| `memory/` | Qué ya sabemos | Índice cada sesión; el detalle, bajo demanda |
| `skills/` | Procesos que se repiten | Solo cuando dispara el trigger |
| `settings.json` | Qué puede hacer solo | Cada llamada a herramienta |

La distinción importante es **cuándo se lee cada una**, porque eso define qué
poner en cada lugar. `CLAUDE.md` lo pagas siempre; un skill solo lo pagas cuando
aplica. Meter en `CLAUDE.md` un procedimiento de diez pasos que usas una vez por
semana es quemar contexto en las otras cientos de sesiones.

---

## 2. CLAUDE.md

Es el archivo de instrucciones permanentes. Hay dos niveles y se acumulan:

- `~/.claude/CLAUDE.md` — global, aplica a todo.
- `<repo>/CLAUDE.md` — del proyecto. Se suma al global; en conflicto, gana el
  del proyecto por ser más específico.

**Qué SÍ va aquí:**

- Cómo quieres que trabaje: nivel de autonomía, qué frenar, cómo comunicarse.
- Reglas de decisión que aplican siempre ("arregla la causa, no el síntoma").
- Contexto del proyecto que **no se deduce leyendo el código**: cómo se corre,
  qué servicio externo necesita, qué decisiones ya se tomaron y descartaron.

**Qué NO va:**

- La estructura de carpetas y qué hace cada módulo. Eso lo lee solo, y una
  descripción desactualizada es peor que ninguna: miente con autoridad.
- Procedimientos largos de uso ocasional. Eso es un skill.
- Lo que ya está en el README del repo.

**El error más común** es que crezca sin control. Cada línea la pagas en cada
sesión, y un archivo de 600 líneas diluye lo importante hasta volverlo invisible.
Si algo lleva meses sin aplicar, bórralo. Se puede volver a escribir.

**La prueba de fuego:** para cada línea, pregúntate si el comportamiento cambia
sin ella. Si no cambia, es decorativa.

---

## 3. Memoria

`CLAUDE.md` guarda reglas. La memoria guarda **hechos**, y crece con el uso.

La estructura del kit: un archivo por hecho, con frontmatter, y un `MEMORY.md`
que es solo el índice.

```markdown
---
name: gotcha-cache-valores-viejos
description: el caché sirve datos viejos si la conexión se abre en modo immutable
metadata:
  type: reference
---

**Síntoma:** la consulta devuelve el valor anterior aunque el registro ya cambió.
...
```

**Por qué un archivo por hecho y no un documento grande:** el índice se carga
completo en cada sesión, y solo cuesta una línea por memoria. El contenido se lee
únicamente cuando la descripción sugiere que es relevante. Un archivo gigante te
cobra todo siempre, y encima es imposible borrarle una parte sin releerlo entero.

**Los cuatro tipos:**

- `user` — quién eres. Stack, nivel, cómo prefieres que te expliquen.
- `feedback` — correcciones que diste sobre cómo trabajar. **Incluye siempre el
  porqué**: sin la razón, la regla se aplica en contextos donde no aplicaba.
- `project` — trabajo en curso, restricciones, decisiones. Convierte fechas
  relativas a absolutas: "la semana pasada" no significa nada en tres meses.
- `reference` — punteros a recursos: URLs, dashboards, tickets.

**Qué no guardar:** lo que git ya cuenta (qué se arregló y cuándo), lo que el
código ya dice, y lo que solo importaba en esa conversación.

**Higiene:** antes de crear, busca si ya existe un archivo del tema y actualízalo.
Una memoria equivocada es peor que ninguna — bórrala en cuanto la detectes. Y al
recordar algo que nombra un archivo o un flag, verifica que siga existiendo antes
de recomendarlo: la memoria refleja lo que era cierto cuando se escribió.

---

## 4. Skills

Un skill es un procedimiento empaquetado que se carga **solo cuando aplica**.
Un directorio con un `SKILL.md`:

```markdown
---
name: wrap-it-up
description: Guarda el estado del trabajo antes de cerrar o cambiar de frente.
  Dispara con "guarda y seguimos", "checkpoint", "wrap it up".
---

## Cuándo aplica
...
## Pasos
...
## Anti-patrones
...
```

**Lo único que importa de verdad es la `description`.** Es lo único que el modelo
lee para decidir si carga el skill. Si no contiene las palabras que tú realmente
dices, el skill nunca dispara y da igual lo bien escrito que esté el cuerpo.
Escribe ahí los triggers literales, no una descripción elegante.

**Cuándo crear uno:** ya escribiste el mismo prompt tres o más veces, o el proceso
tiene pasos que se te olvidan y el olvido cuesta.

**Cuándo no:** instrucción de una sola vez, o algo que aplica siempre — eso va en
`CLAUDE.md`.

El kit trae dos que valen desde el día uno:

- **`wrap-it-up`** — guarda el estado en una frontera limpia: git, memoria de
  sesión, siguiente paso concreto. Úsalo antes de cerrar o de cambiar de tema.
  Sin esto, el contexto se evapora y la siguiente sesión arranca a ciegas.
- **`gotcha`** — captura un aprendizaje que costó caro, con el síntoma escrito
  como lo verás la próxima vez (el mensaje de error literal), porque así es como
  lo vas a buscar.

Y `PLANTILLA/` para escribir el tuyo.

---

## 5. Autonomía y frenos

El agente es más útil mientras menos lo interrumpas, y más peligroso mientras
menos lo frenes. El punto de equilibrio no es un ajuste global: es una lista
explícita de qué corre solo y qué no.

**Corre solo:** leer, buscar, correr pruebas, `git status`/`diff`/`log`, escribir
en una rama, levantar servicios locales. Todo esto es reversible o inofensivo, y
pedir permiso cada vez destruye el valor de tenerlo.

**Siempre pregunta:** borrar datos, `push --force`, reescribir historia, tocar
producción o infraestructura compartida, publicar o desplegar, mandar mensajes,
gastar dinero, y cualquier cambio bastante más grande que lo que pediste.

Esto vive en dos lugares con fuerza distinta:

- **`settings.json`** (`permissions.allow` / `deny`) — mecánico y confiable.
  El `allow` elimina los prompts que te entrenan a aprobar sin leer, que es el
  verdadero riesgo de tener demasiados. El `deny` bloquea de forma dura.
- **`CLAUDE.md`** — el criterio para lo que una lista no puede enumerar
  ("frena si el arreglo es tres veces más grande que el pedido").

Para lo que no se negocia existen los **hooks**: `PreToolUse` intercepta la
llamada antes de ejecutarla y puede bloquearla. A diferencia de una instrucción
en `CLAUDE.md`, un hook no depende de que el modelo se acuerde. Si hay un comando
que jamás debe correr en tu máquina, va en un hook, no en una instrucción.

`settings.json.ejemplo` trae un punto de partida de los tres. **Léelo antes de
copiarlo** — es el archivo del kit con más consecuencias.

Y **pruébalo**: un hook mal escrito falla en silencio — deja pasar todo mientras
aparenta proteger. `./verificar.sh` corre once casos contra el hook (seis que
debe bloquear, cinco que debe dejar pasar) y te dice si de verdad funciona.
Vuelve a correrlo cada vez que lo edites.

---

## 6. Workflows de código

**Worktrees para trabajo paralelo.** `git worktree` te da otra copia del repo en
otra rama sin tocar la tuya. Sirve para dos cosas: dejar al agente trabajando en
algo mientras tú sigues en lo tuyo, y aislar cambios que quizá deseches. Lo que
no funciona es dos agentes en la misma copia — se pisan.

Cuidado si corres varios en el mismo repo: un agente con acceso a git puede
borrar el worktree de otro. Si delegas, dale la ruta exacta donde trabajar y
prohíbele explícitamente `git worktree remove` y `prune`.

**Subagentes para lo ruidoso.** Buscar en cien archivos, rastrear logs, mapear un
subsistema: todo eso llena el contexto de material que no vas a volver a usar.
Un subagente lo hace en su propio contexto y devuelve la conclusión. La regla:
delega cuando la tarea es aislable y el ruido intermedio no te sirve. No delegues
cuando ya sabes en qué archivo está — eso es más caro que buscarlo.

**Segundo motor como revisor.** El agente que escribió el código es mal juez de
ese código: arrastra las mismas suposiciones que lo produjeron. Una segunda
pasada — otro modelo, o una sesión limpia sin el historial de cómo se llegó ahí —
encuentra cosas que el autor no ve. Especialmente si le pides refutar, no revisar.

**Planear antes de tocar.** Para cambios de varios archivos, un plan escrito
primero — qué archivos, en qué orden, cómo se verifica cada paso — sale más
barato que descubrir a la mitad que el enfoque no servía. Para un arreglo de una
línea, planear es ceremonia.

---

## 7. Economía

Todo lo que el agente lee lo pagas, y el contexto lleno degrada las respuestas
antes de agotarse. Tres palancas, de mayor a menor impacto:

**Delegar el ruido.** La más grande. Búsquedas amplias, archivos enormes, salidas
de logs: van a un subagente. El principal se queda con la conclusión.

**Podar lo que se carga siempre.** `CLAUDE.md` y `MEMORY.md` se pagan en cada
sesión. Cincuenta líneas muertas en el global cuestan más al año que cualquier
consulta puntual.

**No disparar herramientas por reflejo.** Si el contexto ya tiene la respuesta,
usarla. Cinco llamadas para confirmar algo que ya sabías es puro costo.

Hay también estilos de salida que comprimen la comunicación, útiles si te estorba
la prosa. Impacto menor que las tres de arriba, pero acumulan.

**La trampa:** ahorrar leyendo menos de lo necesario. Un diagnóstico equivocado
por no haber leído el archivo completo cuesta la sesión entera. Ahorra en lo que
no cambia la respuesta, nunca en entender el problema.

---

## 8. Anti-patrones

**Sobre-tooling.** Cinco llamadas donde el contexto ya tenía la respuesta. Cada
una cuesta tokens y latencia.

**Sub-tooling.** Reinventar a mano lo que un skill ya hace mejor. Sale peor y más
caro. El opuesto del anterior, y ambos vienen de no revisar qué hay disponible.

**Asumir capacidades.** Prometer un resultado con una herramienta que no está
instalada o no está autenticada. Verifica antes de prometer.

**Declarar victoria sin evidencia.** "Arreglado" sin haber corrido nada. Es el
más caro de todos porque destruye la confianza en todos los demás reportes: si
uno resultó falso, hay que verificar todos.

**El `CLAUDE.md` obeso.** Crece, nadie borra, y lo importante se pierde entre
lo decorativo.

**Memoria como diario.** Guardar la narrativa de la sesión en vez del hecho
accionable. Si no cambia una decisión futura, no es memoria.

**Parchar el síntoma.** Arreglar la ruta que menciona el ticket y dejar rotos a
los otros cinco que llaman a la misma función.

**Contexto sin frontera.** Cerrar la terminal a media tarea sin guardar. Mañana
empiezas de cero y con la mitad de los detalles perdidos.

---

## 9. Cómo hacerlo tuyo

Este kit refleja las preferencias de quien lo escribió. Algunas te van a servir
tal cual y otras te van a estorbar. La forma de usarlo es **quitar rápido y
agregar despacio**.

**Primer día:** podar. Recorre `CLAUDE.md` bloque por bloque. Lo `[OPINADO]` que
no sea tuyo, fuera. Lo `[BORRA SI NO APLICA]` que no aplique, fuera. Si no estás
seguro, bórralo — lo puedes volver a poner cuando lo extrañes, y esa señal vale
más que la duda.

**Primera semana:** usar sin agregar. Trabaja normal y anota dónde el agente se
comportó distinto a lo que querías. Todavía no escribas reglas nuevas — la mayoría
de las que se te ocurren el primer día resuelven problemas que no tienes.

**Después:** agregar solo con evidencia. Una regla nueva a `CLAUDE.md` cuando
corregiste lo mismo dos o tres veces. Un skill nuevo cuando repetiste el mismo
prompt tres veces. Un gotcha cuando algo costó más de quince minutos por una
razón no obvia.

**El ritual que sostiene todo esto:** al cerrar una sesión, guarda el estado
(`wrap-it-up`) y captura lo que costó caro (`gotcha`). Sin ese hábito, el sistema
se congela en el día uno y deja de reflejar cómo trabajas de verdad.

**Señal de que va bien:** en un mes, esto no se parece al kit original. Borraste
cosas, reescribiste otras, y las memorias de más valor son las que escribiste tú
después de que algo se rompió.

**Señal de que va mal:** el kit sigue idéntico. Significa que no lo estás usando
o que no estás cerrando sesiones con el ritual — y en cualquiera de los dos casos
el agente sigue empezando de cero.
