---
name: punto-de-guardado
description: Usar cuando el usuario cierra una sesión de trabajo con un agente, a cualquier hora (también la última del día) — "guarda", "guarda y seguimos", "checkpoint", "quick save", "wrap it up", "cierra este frente", "respalda lo que llevamos", "ya estuvo por hoy". También cuando el contexto de la conversación ya está gordo o antes de una tarea riesgosa. NO usar para un resumen que no guarda nada.
---

# punto-de-guardado

Después de horas con un agente, el trabajo vive en cuatro sitios que se desincronizan: el
repositorio, el gestor de tareas, las notas y la cabeza del usuario. Un punto de guardado los
pone al día en pocos pasos, sin cerrar el día, y deja escrito por dónde se retoma.

El error típico no es olvidar guardar: es **guardar a medias sin decirlo** — un commit que
deja fuera "lo que no era mío", una tarea que nadie comentó — y que el siguiente arranque
herede un estado que miente.

## Cuándo aplica

- El usuario lo pide con cualquiera de las frases de arriba.
- El contexto de la conversación está gordo (cerca del límite, muchas vueltas) y conviene
  seguir en una sesión nueva.
- Antes de una tarea riesgosa o al cambiar de tema.

## Cuándo NO aplica

- Solo saber cómo vamos: eso es un balance, no guarda nada.
- A media edición con archivos rotos: primero termina o revierte el paso en curso.

## Un solo ritual

No preguntes "¿guardo y sigo, o guardo y abro sesión nueva?". La gente usa una sola frase
para todo, y muchas veces sigue trabajando justo después, casi siempre para hacer lo que el
guardado le dejó listo (aprobar un cambio, desplegar). Guarda siempre igual; sugiere sesión
nueva solo si el contexto está gordo o cambia el frente. Si es la última sesión del día, es el
mismo ritual: el "Te toca" es la lista de mañana, y la línea con hora que deja en las notas
marca cuál fue la última sesión (mejor que la fecha de edición de un archivo).

## Pasos

1. **Balance express.** 3–5 líneas: qué se logró, qué quedó a medias, dónde exacto se retoma.
2. **Control de versiones — nunca saltar en silencio.** Revisa el estado de cada repo tocado.
   - Lo propio: commit + push.
   - Lo ajeno (archivos que regenera una tarea programada, cambios de otra sesión que ya
     terminó): commit aparte, con un mensaje que diga que es ajeno.
   - Si otra sesión está trabajando en paralelo (hay un lock del repo, el usuario lo avisó, o
     el archivo cambió hace minutos): no lo toques; lístalo en el cierre.
   - Detente solo ante: archivos pesados sin rastrear, secretos o datos personales, ramas
     sensibles.
3. **Gestor de tareas.** Solo lo tocado en la sesión: comentario "se retoma en X" en lo que
   quedó a medias y cerrar lo ya entregado. No barras todo el tablero. Si no se tocó nada,
   dilo.
4. **Notas — ahí vive el puntero de re-arranque.** Nadie copia y pega un "retoma en…" del
   chat; el siguiente arranque lee las notas. Actualiza la nota del frente de hoy (no crees
   otra por cada guardado) con estado exacto, decisiones y una línea
   `RETOMA: <tarea/archivo/paso>`. Si hay un índice que se carga al inicio de cada sesión,
   su línea va corta y con el RETOMA. Deja además una línea con la hora en la nota del día:
   así el arranque de mañana sabe cuál fue la última sesión.
5. **Procesos que quedaron corriendo.** Lista solo lo que ESTA sesión lanzó y sigue vivo
   (servidores de prueba, monitores, tareas largas). Detén esos, o declara cada uno con cómo
   detenerlo. Nunca toques procesos de otras sesiones, tareas programadas ni servicios del
   sistema; en duda, declara en vez de matar.
6. **Línea de cierre**, siempre con todos los estados; nada implícito:
   - `versiones ✅ 2 commits (sin commitear: config.json — otra sesión) · tareas ✅ 1 comentada / sin tareas tocadas · notas ✅ <nota> · procesos ✅ ninguno / queda <X>`
   - **Te toca:** 1–3 acciones que solo el usuario puede hacer (aprobar el cambio, desplegar)
     o "nada".
   - Solo si aplica: "Recomiendo sesión nueva (contexto gordo): retoma con el RETOMA de
     <nota>".

## Reglas

- Frontera limpia: nunca guardes a media edición.
- Solo persiste lo hecho; no re-ejecutes trabajo.
- No inventes logros: cada línea con prueba (commit, tarea, archivo).
- Ligero: unos pocos pasos. Si el guardado se vuelve ceremonia, sobra.
