---
name: arranque-del-dia
description: Usar cuando el usuario empieza su jornada y quiere saber qué le toca — "buenos días", "arrancamos", "qué hay hoy", "qué tengo pendiente", "corre el arranque", primera sesión de la mañana. Arma en menos de 30 líneas lo que solo él puede destrabar, lo que pasó mientras no estaba, lo que toca hoy y un plan de máximo 3 prioridades. NO usar si el saludo va seguido de un pedido concreto, ni para balance de la sesión en curso.
---

# arranque-del-dia

Un arranque de día falla de dos maneras. La obvia: se vuelve un reporte de 80 líneas que
nadie lee. La silenciosa: repite pendientes que ya se resolvieron ayer, y el usuario deja
de confiar en él. La segunda es peor, porque la primera se nota y la segunda no.

Este skill **no calcula nada nuevo**: lee fuentes que ya existen, filtra lo viejo y
propone. Si una fuente no está, lo dice en una línea y sigue.

## Cuándo aplica

- El usuario abre la jornada con un saludo o con "qué hay hoy".
- El usuario pega su lista de tareas del día: úsala como insumo y corre el arranque.

## Cuándo NO aplica

- Saludo de cortesía + pedido concreto ("buenos días, revisa X"): atiende el pedido y ofrece
  el arranque en una línea al final.
- A media tarde, "cómo vamos": responde directo, sin ritual.
- Balance de lo hecho en la sesión: eso es otro skill.

## Bloques (en este orden al decirlos, ≤30 líneas en total)

1. **Te toca a ti** (máx 3 ítems, cada uno con tiempo estimado). Lo que solo el usuario
   destraba: decisiones que esperan su OK, bloqueos a su nombre, pendientes del último
   cierre de sesión. Va primero porque es lo que se pierde cuando vive disperso en notas.
2. **Mientras no estabas** (máx 5 líneas). Resultados de procesos automáticos (tareas
   programadas, trabajos nocturnos), fallas, alertas de logs. Solo lo que cambió.
3. **El día.** Citas de hoy, tareas que vencen, lo que marca el calendario o el tablero.
4. **Plan propuesto.** Máx 3 prioridades, cada una con una razón de una línea anclada a un
   dato (vencimiento, incidente, bloqueo). Si el usuario tiene objetivos del trimestre,
   etiqueta cada prioridad según el objetivo que mueve; si ninguna mueve un objetivo,
   dilo: es la señal de deriva.

Cierre: una pregunta simple — "¿arrancamos con la prioridad 1?". Nunca "¿en qué te ayudo?".

## Filtro anti-viejo (obligatorio)

Antes de poner un ítem en "Te toca a ti", crúzalo con la fuente más reciente que tengas
(último registro de sesión, estado actual en el gestor de tareas). Si ya dice hecho,
cerrado o arreglado, no sale.

Toda fuente tiene edad. Si la fuente de decisiones pendientes no es de hoy, dilo con su
edad y no la subas al top 3 sin cruzarla. Si el usuario dice "eso ya quedó", sácalo y
anota que la fuente estaba vieja.

## Fuentes: baratas primero

- Prefiere un volcado diario (exportación, snapshot, archivo generado por un proceso
  programado) sobre una consulta en vivo a una API: es más barato y no falla por
  autenticación a primera hora.
- Consulta en vivo solo si no hay volcado.
- Fuente que falla o no responde: una línea "(sin datos de X)" y sigue. Sin reintentos.
- Revisa que las rutas que lees sigan vivas: una ruta de log que ya no se escribe da
  "sin datos" todos los días y nadie lo nota.

## Reglas duras

- **Solo lectura.** No mueve estados, no ejecuta arreglos, no manda mensajes. Si algo
  requiere acción, se propone en el plan.
- **Verdad primero.** Nada inventado ni recalculado; sección sin fuente se omite de forma
  visible.
- **≤30 líneas.** El detalle vive en los tableros; aquí se apunta, no se duplica.
- **Máx 3 prioridades.** Proponer siete es no proponer ninguna.
