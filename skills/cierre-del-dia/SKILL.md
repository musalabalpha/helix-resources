---
name: cierre-del-dia
description: Usar cuando el usuario termina su día de trabajo con un agente — "buenas noches", "ya estuvo por hoy", "nos vemos mañana", "mañana seguimos", o al final de un último pedido ("sube los cambios y buenas noches"). Cierra todo: balance, guardado, tablero al día, lista de mañana y procesos que quedaron corriendo. NO usar para guardar a mitad del día (eso es un punto de guardado) ni cuando "buenas noches" es solo el saludo antes de un pedido.
---

# cierre-del-dia

El cierre del día no es un resumen: es dejar la mesa lista para que mañana se arranque sin
arqueología. Lo que se pierde en un mal cierre casi nunca es trabajo; es contexto: qué quedó
a medias, qué ya se entregó pero sigue abierto en el tablero, qué sigue corriendo en una
terminal olvidada.

Las fallas típicas son **de omisión y silenciosas**: un archivo "ajeno" que no se commiteó,
una regla nueva que se anotó en unas notas y nunca llegó al ritual, un servidor de prueba que
se quedó prendido toda la noche.

## Cuándo aplica

- El usuario se despide del día con cualquiera de las frases de arriba.
- «<último pedido> y buenas noches»: primero termina el pedido, luego el ritual.

## Cuándo NO aplica

- Guardar y seguir trabajando hoy: eso es un punto de guardado.
- "Buenas noches" como saludo al abrir una sesión de noche con un pedido.
- Solo ver el balance: eso no guarda nada.

## Ritual (en este orden)

1. **Balance** en 4 cubetas compactas (logros · no se pudo · se trabó · pendientes), sin
   línea de cierre: la despedida va al final. Si tienes el skill `balance-de-sesion`, úsalo
   en su modo sub-paso.
2. **Guardado** — el mismo del punto de guardado (si tienes `punto-de-guardado`, aplica sus
   pasos en vez de copiarlos): commit + push de lo propio, lo ajeno en commit aparte salvo
   que otra sesión siga trabajando, tareas tocadas comentadas y nota con línea
   `RETOMA: <tarea/archivo/paso>`. Acuerda una vez con el usuario que el push del cierre no
   se pregunta; preguntarlo cada noche es fricción.
3. **Reconciliación entregado-vs-tablero.** Revisa el historial del día en los repos tocados
   (`git log --oneline --since=midnight`): todo lo que ya se entregó y siga abierto en el
   gestor de tareas se cierra ahora, con evidencia. Lo entregado-sin-cerrar envenena la
   planeación de mañana.
4. **Aprendizajes — solo si hoy hubo una corrección del usuario o algo falló.** Anótalo donde
   el agente lo lea antes la próxima vez (las notas del skill que falló). Sin incidentes,
   sáltalo en silencio.
5. **Lista de mañana**, en la nota del día: lo que solo el usuario puede hacer (pagos,
   credenciales, mensajes a terceros, aprobar cambios) + cambios de configuración en vivo
   hechos hoy (qué archivo, qué respaldo). El arranque de mañana la lee de ahí.
6. **Procesos que quedaron corriendo.** Lista solo lo que ESTA sesión lanzó y sigue vivo
   (servidores de prueba, monitores, tareas largas). Detén esos, o declara cada uno con cómo
   detenerlo. Nunca toques procesos de otras sesiones, tareas programadas ni servicios del
   sistema; en duda, declara en vez de matar. Nada se queda corriendo sin que el usuario lo
   sepa.
7. **Bloque final**, corto: estados explícitos (versiones · tablero · notas), procesos, lista
   de mañana y una despedida humana, sin ceremonia.

## Reglas

- No cierres con trabajo sin guardar: frontera limpia, o "se retoma en X" escrito.
- No inventes logros; si el día fue flojo, el balance lo dice.
- No arranques trabajo nuevo en el cierre: lo grande va a la lista de mañana.
- Una sola fuente: si el guardado vive en otro ritual, no copies sus reglas aquí; las copias
  derivan y se contradicen.
- Una regla nueva que nace de un cierre malo va al ritual, no solo a las notas: si se queda en
  las notas, el siguiente cierre la vuelve a romper.
