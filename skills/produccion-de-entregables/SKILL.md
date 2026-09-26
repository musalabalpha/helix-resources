---
name: produccion-de-entregables
description: Usar cuando el usuario pida un entregable nuevo que no es una respuesta directa — "hazme una propuesta", "arma un plan", "necesito una maqueta", "prepárame el handover", "escribe el manual / la guía / el playbook / el runbook", "rediseña X", "dame el prompt para otro agente" — aunque no nombre este skill y aunque otro skill de brainstorming esté activo. Alinea qué se entrega antes de construirlo, elige carril (rápido, normal o visual) y entrega con una ruta probada y un seguimiento a 7 días. No hace falta para ediciones chicas ni para tareas recurrentes con su propio proceso: si se carga igual, van por el carril rápido.
---

# produccion-de-entregables

Un entregable rara vez falla por falta de capacidad. Falla antes o después: se construye algo
en una forma que nadie pidió, o se entrega algo que nadie abre y nadie ejecuta. Este skill pone
dos compuertas baratas —alinear la forma antes de construir y probar la entrega antes de darla
por hecha— y un recordatorio a los 7 días.

## Carril (elígelo antes de empezar)

| Carril | Cuándo | Qué corre |
|---|---|---|
| **Rápido** | Editar algo que ya existe · la forma ya la dio el usuario o el encargo llega definido (los pasos 1–3 ocurrieron antes) · tarea recurrente con su propio proceso | Sin opciones ni ronda de forma: hazlo, con plan si se ejecuta. Aplican el paso 7 (si quien recibe no puede repreguntar) y el paso 8. |
| **Normal** | Entregable nuevo con 2 o más formas posibles | Pasos 0–8. |
| **Visual** | Algo que el usuario juzga viéndolo: interfaz, marca, maqueta, slides | Pasos 0–8 + ajustes visuales (abajo). |

Si dudas, toma el carril más completo. Terminar un entregable no apaga el proceso: el siguiente
pedido de la misma sesión ("ahora dame el prompt para X") vuelve a elegir carril.

## Pasos (normal y visual)

### 0. Recon
Antes de opinar, revisa el trabajo previo (repo, notas, gestor de tareas); las superficies que
YA cubren la idea (no crees una segunda que signifique lo mismo); y las premisas del pedido,
incluidas las que tú afirmaste antes. Si hace falta panorama externo, investiga primero y usa ese
resumen como insumo. Si delegas el recon, verifica que el subagente tenga las herramientas que
la tarea pide.

### 1. Marco por eje
Un marco entra solo si decide algo concreto: uno por cada eje de diseño (qué se agrupa, qué se
ordena, qué codifica el color, quién decide), citando autor y obra. El de nicho predice mejor la
calidad que el genérico. Si ningún marco decide nada, dilo; no inventes uno. Catálogo:
`references/marcos-por-dominio.md`.

### 2. Tres opciones + resumen
Exactamente 3, cada una decidible sola, que contrastan en UN eje visible desde el título:
- normal: formato o alcance;
- reglas o gobernanza: autoría ("yo lo redacto" vs "lo decidimos"), porque las reglas que no
  son del dueño no se cumplen;
- vara alta (la referencia es lo mejor de su categoría): el efecto buscado (sorpresa, deseo),
  no solo credibilidad.

1 recomendada, marcada como voto. Usa los términos del usuario tal cual, sin siglas inventadas.
Preséntalas como opciones de un toque (en Claude Code, AskUserQuestion con un preview por
opción; en un chat, numeradas para responder con el número). Plantilla:
`templates/tres-opciones.md`.

### 3. El usuario elige y se alinea la forma
Espera la elección explícita. Luego acuerda 5 puntos y cierra con "así lo entrego, ¿va?":
1. **Forma**: artefacto exacto (documento, HTML, script, PR) y dónde vive. Si es interfaz:
   "¿lo dibujo o lo escribo?" (por default, dibujar).
2. **Alcance**: qué incluye y qué NO.
3. **Uso**: quién lo consume y si puede repreguntarte (si no puede, el paso 7 es obligatorio).
4. **Terminado**: criterio de aceptación en 1–2 líneas.
5. **Reversible o no, y costo** si es alto.

Iterar sobre fundamentos después (diseño → taxonomía → color) es señal de que este paso se saltó.

### 4. Quién ejecuta
Por default, quien corre el proceso, con subagentes; dilo en 1 línea. Si entra otro agente o
persona, asigna dueño, canal de aviso y evidencia esperada. Asignar una tarea en un gestor no
despierta a nadie: escribe tú el encargo y no conviertas al usuario en mensajero.

### 5. Plan (si el entregable se ejecuta)
Tareas de 2–5 min, rutas exactas, código completo, pruebas primero cuando hay código, commits
frecuentes. Plantilla: `templates/plan-de-ejecucion.md`. Si el destino tiene reglas de alta (una
carpeta con encabezado obligatorio, una tarea que debe existir antes del documento), respeta su
orden antes de escribir.

### 6. Construir
Compensa las fugas (tabla abajo): resumen siempre, fechas explícitas, borrador terminado, "feo
pero vivo". Todo verificador (hook, validador, permiso) se EJECUTA contra casos que debe
bloquear y al menos uno que debe dejar pasar: "la sintaxis es válida" no prueba que funcione. Si
el orden de las operaciones importa, mídelo; no lo razones.

### 7. Revisor crítico
Pasa el entregable completo por un revisor con ojos frescos: un skill de prompts en modo
auditoría (p. ej. `diseno-de-prompts`, modo doctor) o un subagente que no participó. Va
penúltimo: al inicio no hay entregable que auditar, solo predicciones. **Obligatorio** si quien recibe no puede repreguntarte
(cliente, repo público, otro agente u otra sesión); opcional si el usuario lo consume contigo.
Si encuentra un hueco, vuelve al paso que corresponde.

### 8. Entrega
- Resumen de máximo 6 líneas (1 idea por línea).
- Ruta o link **probado**: ábrelo tú; si es web, desde fuera de tu máquina. Un link sin probar
  no es entrega.
- Confirmación binaria "¿procedo? sí/no", marcando si es reversible.
- Seguimiento: una fecha límite a 7 días con la pregunta "¿se ejecutó?" en tu gestor de tareas,
  o en el ritual diario que ya exista. Terminar en "¿procedo?" y no volver a mirar es el modo de
  falla más común.

## Ajustes del carril visual
- Base = el sistema de marca del proyecto (su manual u hoja de estilos), no otra pieza que "se
  ve parecida".
- ANTES de maquetar, pide 2–3 referencias que le encanten al usuario y extrae su vocabulario
  (peso, densidad, movimiento, ánimo). Aprobar un concepto en texto no predice que guste la
  ejecución.
- Las 3 opciones del paso 2 son maquetas feas o previews, no descripciones.
- Máximo 1 ronda de producción por sesión: si se rechaza, vuelve a las referencias en vez de
  iterar a ciegas.
- Antes de decir "listo", captura de pantalla (celular y escritorio si aplica).

## Modelo de fugas

Patrones de quien pide que degradan el resultado si el proceso no los compensa:

| Fuga | Qué es | Cómo la compensa el proceso |
|---|---|---|
| **Cabeza-disco** | Las ideas se pierden si no aterrizan en estructura | Resumen siempre presente; nada suelto |
| **Ceguera-tiempo** | Los plazos no se sienten hasta que vencen | Fechas explícitas y aviso cuando vence |
| **Hoja en blanco** | Arrancar de cero paraliza | Borrador terminado, no opciones infinitas |
| **Perfeccionismo** | Pulir impide publicar | "Feo pero vivo", una entrega a la vez, alcance cerrado |

Averigua cuáles dominan en tu usuario; si tu entorno guarda notas entre sesiones (por ejemplo
`CLAUDE.md`), anótalo ahí.

## Casos especiales
- **Otro skill activo** (p. ej. uno de brainstorming que dice "después solo escribe el plan"):
  si el resultado final es documento, propuesta, plan o reglas, este proceso gobierna la
  producción y el brainstorming alinea el diseño. Son capas, no alternativas.
- **Sesión desatendida** con encargo pre-autorizado: elige la recomendada solo si es la única
  consistente con las reglas del usuario y queda una compuerta real antes de que sea definitivo:
  el PR si hay repo, o un borrador marcado "pendiente de aprobación", sin publicar ni enviar.
  Dilo ahí y nunca hagas tú el merge ni el envío. Si es visual y no hay referencias del usuario, no elijas: deja las
  preguntas listas y detente ahí.
- **Pedido difuso** ("ayúdame a pensar X"): fija el eje, revisa lo que ya existe antes de la
  segunda pregunta, pregunta una cosa a la vez y cierra en cuanto haya decisión suficiente.

## Anti-patrones
- Construir sin elección explícita ni forma alineada.
- Marco decorativo: nombrarlo sin que decida nada.
- 4 o más opciones, opciones indistinguibles o en tabla larga.
- Resumen de más de 6 líneas; entregable sin resumen o sin ruta.
- Correr el proceso completo para una edición chica: eso es carril rápido.
- Parar en la propuesta cuando el usuario pidió bajarla a sistema: si el alcance es claro y
  reversible, ejecuta el cierre completo.
- Confundir completado estructural con utilidad real: si "ya está completo" pero "no se siente
  útil", es una segunda versión de uso, no una victoria.
- Asumir que asignar una tarea hace que alguien la haga.

## Archivos
- `templates/tres-opciones.md` · `templates/plan-de-ejecucion.md`
- `references/marcos-por-dominio.md` · `references/mensajes-de-decision.md`
