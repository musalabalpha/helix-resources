---
name: diseno-de-prompts
description: Usar cuando el usuario pide un prompt — "hazme un prompt para…", "dame el prompt para que otro agente…", "mejora/audita este prompt", "el prompt no me sale", "ayúdame a pedirle a la IA X" — o instrucciones para un agente, una automatización o una sesión nueva. También cuando una tarea compleja saldría mejor si primero se diseña el prompt. NO usar para contestar la pregunta de fondo, para redactar el texto final que leerá una persona, ni para investigar.
---

# diseno-de-prompts

Un prompt malo no falla de forma ruidosa: devuelve algo plausible, en otro formato, con otro
tono, y el usuario gasta tres rondas corrigiendo. Un buen prompt deja escritas las cuatro
cosas que el modelo no puede adivinar —qué producir, para quién, cómo se ve y cómo se sabe
que salió bien— y nada más.

Este skill no es una clase de prompt engineering. Entrega un prompt listo para usar, lo
verifica y lo deja donde el usuario lo va a encontrar.

## Cuándo aplica

- El usuario pide un prompt, o instrucciones para un agente, una tarea programada o una
  sesión nueva.
- Un prompt existente "no funciona" y hay que auditarlo.
- La tarea es lo bastante compleja como para que valga la pena diseñar el prompt antes de
  ejecutarla.

## Cuándo NO aplica

- Contestar la pregunta de fondo: si el usuario pregunta algo, contéstalo.
- Redactar el contenido final para una persona (correo, mensaje): eso es escritura normal.
- Investigar.

## Modos

### Express (por defecto)

Construye el prompt con lo que ya hay en la conversación. Antes de escribir, infiere las 4
piezas:

1. **Objetivo** — qué debe producir el modelo.
2. **Audiencia y uso** — para quién es y dónde se usa.
3. **Formato** — cómo se ve la salida (lista, JSON, tabla, máximo de palabras).
4. **Criterio de éxito** — cómo se sabe que salió bien y qué fallas evitar.

Lo que no esté claro, decídelo y márcalo como `[ASUNCIÓN: ...]` dentro o al pie del prompt,
para que el usuario lo corrija de un vistazo. Un término ambiguo ("que sea profesional") se
traduce a algo operativo y se marca igual.

### Cuándo preguntar (excepción)

Solo si el usuario está presente y falta una pieza que cambia el prompt de fondo (no un
detalle que una asunción resuelve), o si el usuario invita a preguntar. Una sola tanda,
máximo 3 preguntas.

**Nunca preguntes** si la sesión corre sin nadie (tarea programada, corrida nocturna), si
corres dentro de otro agente o si te invoca otro flujo: decide, marca `[ASUNCIÓN]` y sigue.
Un prompt con supuestos marcados sirve; una pregunta sin nadie que la conteste detiene todo.

### Doctor (auditoría)

Cuando te entregan un prompt existente, o te piden revisar un entregable contra su pedido.
Checklist:

1. ¿Tiene un rol concreto (industria, nivel, geografía si importa)?
2. ¿Separa contexto, tarea, restricciones y formato (tags XML o equivalente)?
3. ¿El formato de salida es explícito?
4. ¿Tiene ejemplos, si la tarea es compleja?
5. ¿Las instrucciones dicen qué hacer, no solo qué no hacer?
6. ¿Hay términos ambiguos sin traducir ("bueno", "claro", "natural")?
7. ¿Necesita razonamiento paso a paso antes de responder?
8. ¿Hay instrucciones redundantes o contradictorias?
9. ¿Mezcla varias tareas sin estructura?
10. ¿El entregable amerita marco teórico? Y si lo tiene, ¿cambia alguna conclusión?

Entrega del modo doctor: el prompt reescrito completo, los 3 cambios que más impactan y por
qué, y una nota si el problema real no era el prompt sino la tarea.

## Las 7 técnicas (usa las que sumen, no todas)

1. **Rol específico** — industria, experiencia y contexto real. "Analista de crédito con 15
   años en crédito a pymes" rinde; "el mejor analista del mundo" no agrega nada.
2. **Tags estructurados** — `<context>`, `<task>`, `<constraints>`, `<output_format>`,
   `<examples>`; inventa los tuyos cuando ayuden (`<historial>`, `<datos_cliente>`).
3. **Ejemplos** — 1 a 3 ejemplos resueltos valen más que describir el formato en abstracto.
   Si das varios, que varíen, para que se aprenda el patrón y no el contenido.
4. **Razonamiento guiado** — para análisis o decisiones, pide pensar paso a paso antes de
   responder, con los aspectos a considerar enumerados.
5. **Formato de salida explícito** — "JSON con las llaves X, Y, Z" o "máximo 120 palabras,
   en prosa, sin viñetas".
6. **Restricciones positivas** — di qué hacer. Si una negativa es esencial, di por qué.
7. **Pre-llenado** — solo donde puedes escribir el inicio de la respuesta del modelo (API,
   prompts de sistema). En chat normal, usa formato explícito + "empieza directo con `{`,
   sin preámbulo".

## Marco teórico (solo cuando cambia algo)

Aplica un marco reconocido cuando el prompt produzca análisis, diagnóstico, diseño de
proceso, una decisión con consecuencias o algo que se defenderá ante terceros. No lo
apliques en redacción simple, tareas de formato (resumir, traducir) ni consultas factuales.

- Nómbralo, atribúyelo y justifícalo en una línea ("Cinco Fuerzas, Porter 1979, porque…").
- Solo marcos con caso documentado de uso real, no por prestigio de nombre.
- **Anti-teatro:** si el marco no cambia ninguna decisión del entregable, quítalo y di que
  se evaluó y se descartó.
- Si decides no aplicar marco, dilo en una línea para que no parezca olvido.
- Si el entregable es una decisión, usa el marco de decisión que ya tengas (valor esperado,
  pre-mortem, chequeo de sesgos) en vez de improvisar uno.

## Plantilla base (menú, no cuota)

```
Actúa como [rol específico].

<context>[antecedentes y datos]</context>
<marco_teorico>[solo si aplica: marco, autor, por qué]</marco_teorico>
<task>[qué producir, en una o dos oraciones]</task>
<constraints>[límites y reglas duras]</constraints>
<output_format>[estructura exacta de la salida]</output_format>
<examples>[1-3 ejemplos, si aplica]</examples>
```

Si el caso pide un prompt de 6 líneas, no entregues uno de 60. El prompt también debe
pedirle al modelo que use primero el contexto que ya tiene antes de lanzar herramientas
pesadas.

## Antes de entregar (siempre)

- **Cada nombre citado existe.** Si el prompt menciona un archivo, una ruta, una herramienta
  o un skill, compruébalo. Un nombre roto se ve bien hasta que alguien corre el prompt. Con
  enlaces simbólicos, comprueba un archivo de adentro, no el enlace: un enlace roto sigue
  apareciendo en un listado.
- **Las premisas están revisadas.** Si el pedido nombra algo que no conoces, léelo en el
  contexto antes de escribir, no después.

## Cómo entregar (según el destino)

- **Para correr aquí mismo** (el prompt es el paso previo a la tarea): entrega y cierra con
  "Di «córrelo» y lo ejecuto". Si el pedido ya dice que lo ejecutes, hazlo, salvo que el prompt haga algo irreversible o hacia afuera (enviar, publicar, borrar, pagar): ahí muestra el prompt y espera el «córrelo».
- **Para otra sesión u otro agente:** guárdalo en un archivo nuevo con fecha y tema (p. ej.
  `inbox/AAAA-MM-DD-prompt-<tema>.md`; nunca sobrescribas uno existente) y di la ruta en la
  última línea. Un prompt que vive
  solo en el chat se pierde.
- En ambos casos: el prompt en un bloque de código, más 2-3 líneas de qué técnicas usaste y
  por qué. Una variante A/B solo si hay una duda real de diseño.

## Anti-patrones

- **Sobreinstruir:** cientos de líneas de "SIEMPRE" y "NUNCA". El modelo rinde peor; mejor
  pocas reglas con su porqué.
- **Vago:** "hazlo bonito", "que sea profesional", sin traducir.
- **Tareas mezcladas:** cinco pedidos en un párrafo, sin estructura.
- **Contexto insuficiente:** "redacta el correo" sin decir a quién ni para qué.
- **Ejemplos que se contradicen:** dos tonos distintos y el modelo no sabe cuál seguir.
- **Preguntar sin nadie del otro lado:** en una corrida desatendida, cada pregunta es un paro.

## Salida esperada

```
Aquí está tu prompt:

<bloque de código con el prompt; supuestos marcados como [ASUNCIÓN: ...]>

Técnicas: rol específico + formato JSON explícito + 2 ejemplos (el formato es lo que más falla).
Guardado en inbox/2026-01-15-prompt-<tema>.md   ← o bien: Di «córrelo» y lo ejecuto.
```
