---
name: mapa-de-horizontes
description: Usar cuando el usuario quiere alzar la vista y ver lo que viene — "next", "qué viene", "hacia dónde vamos", "toca base", o al cerrar un frente de trabajo antes de escoger el siguiente. Devuelve un mapa corto en tres horizontes (hoy–mañana, semana, trimestre) anclado a evidencia y cierra con UNA línea de foco. NO usar si "next" llega justo después de una lista de pasos (ahí significa "sigue con el paso"), para el siguiente item puntual del gestor de tareas, ni para el balance de lo ya hecho.
---

# mapa-de-horizontes

Después de cerrar un frente, el usuario tiene que escoger el siguiente, y ahí se equivoca
fácil: escoge lo más nuevo, lo más vistoso o lo que tiene enfrente, no lo que más destraba.
Un mapa de lo que viene ayuda si es corto, si todo lo que dice es cierto hoy y si termina en
una sola recomendación. Una lista de deseos no ayuda: paraliza.

El riesgo principal no es olvidar algo; es **proponer algo que ya se hizo**. El gestor de
tareas dice qué existe, no si sigue vivo: un item que alguien terminó sin cerrarlo sigue
apareciendo como pendiente, y si el mapa lo repite, el usuario deja de creerle al mapa.

## Cuándo aplica

- El usuario pide el panorama con cualquiera de las frases de arriba.
- Se cerró un frente y conviene decidir el siguiente con información, no por inercia.
- Inicio de semana o de ciclo: el usuario quiere el mapa antes de escoger hilo.

## Cuándo NO aplica

- "next" o "siguiente" justo después de una lista de pasos, un plan en curso o un "¿sigo?":
  significa "sigue con el paso siguiente". Hazlo, sin mapa.
- Preguntar por el siguiente item concreto del gestor de tareas.
- El balance de lo ya hecho en la sesión (eso mira hacia atrás; este mira hacia adelante).
- El arranque del día, si ya existe un ritual para eso: no lo repitas el mismo día.

## Paso 0 — Fuentes y filtro anti-viejo (antes del primer renglón)

- **Qué existe:** el gestor de tareas. De preferencia una copia del día (barata y no falla);
  en vivo solo si no hay copia. Si no responde, dilo en un renglón y sigue con lo demás: no
  conviertas "reconectar el gestor" en el foco salvo que bloquee lo prioritario.
- **Si sigue vivo:** cada renglón, y sobre todo el foco, se cruza contra lo más reciente que
  exista: la última nota de cierre, la bitácora del día y el historial del repositorio
  (commits desde ayer). Dice hecho, cerrado, mergeado o arreglado → no sale. Terminado pero
  sin cerrar → un solo renglón "cerrar X (ya está hecho)", nunca relistar su trabajo. Sin
  verificar → no va.
- **Sin suposiciones de contexto:** no atribuyas tareas a otra máquina, persona o equipo si
  la fuente no lo dice.
- Si el usuario corrige un renglón ("eso ya se hizo"), quítalo y di en una línea qué fuente
  estaba vieja.

## Los 3 horizontes (en este orden, siempre)

Cada renglón con evidencia (ID de tarea, commit, nota, decisión). Plan sin tarea =
**[huérfano]**: candidato a crear, nunca se crea desde aquí. Si el usuario tiene un foco
declarado para el trimestre, cada renglón del mediano y del largo dice si lo mueve
("dentro de foco") o no ("fuera de foco").

1. **🔜 Corto (hoy–mañana)** — máx 6 renglones. Primero lo que solo el usuario destraba
   (decisiones, pagos, credenciales, mensajes a terceros; máx 3, con tiempo estimado), luego
   lo que retoma el agente. Si el agente opera sistemas, cierra con un renglón de salud.
2. **🗓️ Mediano (semana–ciclo)** — máx 5 renglones: el siguiente hito real de cada frente
   activo y qué destraba qué, en orden. Un frente sin siguiente paso definido: ése es el
   hallazgo.
3. **🔭 Largo (hasta la meta del trimestre)** — máx 2 renglones: estado de las apuestas
   principales contra su meta y el próximo punto de revisión. Lo congelado no se lista.

Horizonte vacío → decirlo ("mediano: nada comprometido esta semana"). Nunca rellenar.

## Renglón de salud (si aplica)

Solo si el agente opera sistemas (tareas programadas, servicios). Barato: el inventario o el
log que ya existe, no correr nada pesado. Solo anomalías, una por renglón y con dueño; todo
verde → "todo verde" y ya. Distingue "falló" de "terminó y reportó hallazgos": hay procesos
cuyo código de salida distinto de cero es un aviso, no una caída. Si el ritual de arranque ya
lo dijo hoy en la misma conversación, remite a él.

## La línea de foco (lo distintivo)

Una sola línea al final. Debe: (a) nombrar UNA cosa; (b) decir qué destraba y por qué ella y
no otra; (c) haber pasado el filtro anti-viejo.

> "Si mañana solo haces una cosa: <X> — destraba <Y>, y sin eso <Z> sigue parado."

El foco sigue dependencias reales (qué destraba más) y lo que mueve el foco del trimestre; no
lo más nuevo ni lo más vistoso. Empate genuino → dilo y di el criterio para romperlo. Es la
parte que el usuario usa: cuídala más que el resto.

## Reglas duras

- **Solo lectura:** el mapa no crea tareas, no mueve estados, no manda mensajes.
- **Máximo 20 renglones.** Si desborda, recorta en este orden: largo → mediano → detalle de
  salud. El foco nunca se recorta.
- Cada renglón con evidencia; sin prueba no va.
- La línea de foco se redacta fresca cada vez, nunca de plantilla.

## Anti-patrones

- **Relistar lo hecho.** Es la falla más cara: el usuario deja de creerle al mapa. Por eso el
  paso 0 va antes que todo.
- **Lista de deseos.** Diez prioridades son ninguna. El mapa termina en una.
- **El foco es la herramienta rota.** Si una fuente falla, se dice y se sigue; el usuario no
  pidió un reporte de la herramienta.
- **Repetir el ritual de la mañana.** Si ya se dijo hoy, remite.
- **Largo plazo de adorno.** Si el trimestre ya tiene meta, el largo son dos renglones contra
  esa meta, no un repaso de todas las ideas.

## Salida esperada

```
🔜 Corto
- Tuyo: <decisión> (~10 min) — <ID>
- Mío: <tarea> — <ID o commit>
- Salud: todo verde
🗓️ Mediano
- <frente>: siguiente hito <X> → destraba <Y> (dentro de foco)
🔭 Largo
- <apuesta>: <estado contra la meta>; revisión <fecha>
Si mañana solo haces una cosa: <X> — destraba <Y>.
```
