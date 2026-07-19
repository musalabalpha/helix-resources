---
name: wrap-it-up
description: Usar cuando el usuario dice "guarda y seguimos", "checkpoint", "wrap it up", o antes de cerrar la sesión o cambiar de tema/frente de trabajo. Deja el estado en una frontera limpia y recuperable.
---

# wrap-it-up

Cierra el trabajo en curso en un punto limpio: nada a medias, nada solo en tu cabeza.

## Pasos

1. **Verificar el estado real de git, no asumir.**
   Correr `git status` y `git diff` de verdad. No confiar en lo que crees que cambiaste — lee la salida. Si hay archivos que no reconoces, pregunta antes de commitear.

2. **Commitear el trabajo pendiente con mensaje que explique el porqué.**
   El mensaje de commit no describe el diff (eso ya lo dice el diff), describe la decisión: por qué este cambio, qué alternativa se descartó, qué queda pendiente. Si el trabajo está roto o a medias, dilo en el mensaje — no finjas que está terminado.

3. **Escribir o actualizar una memoria de sesión con cuatro campos obligatorios:**
   - Qué quedó vivo (en progreso, sin cerrar).
   - Qué quedó cerrado (terminado y verificado).
   - Qué gotcha apareció (si algo costó caro entender, usar el skill `gotcha` para capturarlo aparte).
   - Cuál es el siguiente paso concreto (una acción ejecutable, no "seguir viendo esto").

4. **Actualizar el índice `MEMORY.md`.**
   Una línea nueva o actualizada, formato `- [Título](archivo.md) — gancho de una línea`. El índice nunca lleva contenido, solo referencias.

5. **Dejar un resumen de 3 líneas al usuario.**
   Qué se hizo, qué quedó pendiente, cuál es el siguiente paso. Sin relleno.

## Anti-patrones

- **Declarar cerrado algo sin correr las pruebas.** Si no corriste la verificación, el estado es "en progreso", no "listo". Ver skill `gotcha` si esto ya te mordió antes.
- **Guardar prosa en lugar de hechos accionables.** "Se avanzó bastante en el módulo de auth" no sirve. "Falta manejar el caso de token expirado en `refreshSession()`" sí sirve.
- **Commitear sin revisar el diff completo.** `git add -A` a ciegas mete archivos que no debían ir (credenciales, temporales, cambios de otro frente).
- **Memoria de sesión sin siguiente paso concreto.** Si el siguiente paso es vago, la próxima sesión pierde 10 minutos reconstruyendo contexto que ya tenías.
- **Wrap-it-up como sustituto de terminar la tarea.** Si la tarea está a 5 minutos de cerrar, ciérrala — no guardes checkpoint para evitar el último esfuerzo.
