---
name: balance-de-sesion
description: Usar cuando el usuario pide el saldo de la sesión de trabajo con un agente — "recuento", "qué llevamos", "cómo vamos", "recap", "resumen de la sesión", "¿dejaste algo pendiente?", o cuando se siente abrumado y quiere una pausa para ver dónde está antes de decidir si sigue o para. También como primer paso de un ritual de cierre del día. NO usar para el estado de una tarea puntual ni para guardar el trabajo.
---

# balance-de-sesión

Después de varias horas con un agente, el usuario pierde el hilo: se hicieron diez cosas, tres
quedaron a medias y una se atoró sin que nadie lo dijera. Un resumen genérico no ayuda; lo que
ayuda es un saldo honesto, corto y con prueba, más una sugerencia clara de si conviene parar.

## Cuándo aplica

- El usuario pide el saldo con cualquiera de las frases de arriba.
- La sesión cruzó una frontera natural (algo se cerró) y conviene decidir si seguir.
- El usuario está abrumado: el saldo sirve de pausa.
- Otro ritual (cierre del día) lo usa como primer paso.

## Cuándo NO aplica

- Preguntar por el estado de una tarea concreta.
- Guardar o respaldar el trabajo (eso es otro ritual; este solo lee).
- Planear lo que viene.

## Ventana de tiempo

Por defecto, la sesión actual. Si el usuario nombra un periodo ("últimas 24 horas", "hoy"),
úsalo y dilo en la primera línea. Fuera de la sesión, cada línea necesita evidencia igual
(commits, tareas, notas); si no la hay, no va.

## Las 4 cubetas (siempre, en este orden)

1. **✅ Logros** — lo terminado o avanzado, con prueba (ID de tarea, commit, archivo).
2. **⛔ Lo que no se pudo** — intentado y no salió, con la razón.
3. **🧱 Lo que se trabó** — dónde hubo fricción y por qué, aunque no sea derrota.
4. **📌 Pendientes** — separados en *tuyos* (lo que el agente no puede hacer: pagos,
   credenciales, mensajes a terceros) y *míos* (lo que el agente retoma), con dónde viven.

Cubeta vacía → "— nada". Nunca se omite una. Un renglón por cosa, sin párrafos.

## Bloque "cómo quedó" (solo al cerrar un proyecto o sistema grande)

Al terminar algo que ahora corre solo, el usuario necesita el manual, no la lista de cambios:
qué hace cada pieza, cómo funciona en 3 líneas, cómo activar/apagar/revertir (comandos), qué
señales vigilar y dónde, y cuándo revisar. En sesiones normales no va.

## La línea de cierre

Una sola línea que (a) ancla a una señal real del momento —algo se acaba de cerrar, la hora,
el tamaño de lo pendiente— y (b) ofrece una bifurcación suave: parar o un poco más. Nunca
"¿seguimos?" ni "¿algo más?". Decide ella; no la delegues a "puedes usar otro comando".
Si conviene parar, dilo suave pero dilo.

- Frontera limpia y es tarde: "Acabas de cerrar el despliegue y quedó guardado — buen punto
  para parar. Si traes cuerda queda el ajuste chico del reporte."
- A media tarea: "Vamos a la mitad del análisis. Lo remato o lo pauso aquí, que está limpio."
- Todo cerrado: "Quedó todo cerrado. No hay hilo suelto que valga abrir hoy."

## Como sub-paso de otro ritual

Si lo llama un cierre del día: las 4 cubetas son obligatorias aunque sean de una línea cada
una ("todo guardado" no es un balance), y sin línea de cierre — la despedida la pone el ritual.

## Reglas

- Cada línea con evidencia; lo que no tiene prueba va en "se trabó" o no va.
- El cierre se redacta cada vez leyendo el momento, nunca de plantilla.
- Corto: si no cabe en una pantalla, sobra.
