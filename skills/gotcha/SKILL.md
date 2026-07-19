---
name: gotcha
description: Usar cuando algo falló por una razón no obvia y ya se resolvió, o el usuario dice "apunta esto", "que no se me olvide", "esto nos costó caro". Captura el aprendizaje para que no se repita la misma investigación.
---

# gotcha

Un gotcha es deuda de investigación pagada una vez. Si no se escribe, se vuelve a pagar completa la próxima vez.

## Qué califica como gotcha

- Costó más de 15 minutos entender qué estaba pasando.
- La causa real no era la causa obvia (el error apuntaba a un lado, el problema estaba en otro).
- Es razonable que vuelva a pasar — mismo patrón, misma librería, mismo tipo de configuración.

## Qué NO califica

- Algo que el código o la documentación ya explican claramente. Si un comentario en el propio archivo ya lo cubre, no dupliques.
- Un error de una sola vez sin patrón detrás (typo, dedo, credencial vencida por descuido puntual).
- Un bug normal que se arregló con el proceso normal de debugging, sin sorpresa en la causa.

## Formato del archivo resultante

Cuatro campos, en este orden:

1. **Síntoma observable** — lo que se ve, tal cual aparece. Usa el mensaje de error literal, el código de salida, el comportamiento exacto. Este es el campo más importante: es lo que el yo del futuro va a copiar y pegar en una búsqueda cuando el problema vuelva a aparecer. Si el síntoma está parafraseado o resumido, la búsqueda futura no lo va a encontrar.
2. **Causa real** — qué estaba pasando de verdad, no la primera hipótesis descartada.
3. **Remedio** — qué se hizo para resolverlo, en pasos ejecutables.
4. **Cómo detectarlo la próxima vez** — qué señal temprana o chequeo rápido evita repetir toda la investigación.

## Ejemplo de estructura mínima

```
## Síntoma
`ECONNREFUSED 127.0.0.1:5432` al arrancar el servidor, aunque Postgres está corriendo.

## Causa real
El contenedor de Postgres publica en el puerto 5433 desde el último cambio de
docker-compose; la app seguía apuntando a 5432 por una variable de entorno cacheada.

## Remedio
Actualizar DATABASE_URL a puerto 5433, reiniciar la sesión de shell (la variable
vieja quedaba exportada en el entorno actual).

## Detección temprana
`docker compose port db 5432` antes de asumir que el puerto no cambió.
```

## Anti-patrones

- Escribir el síntoma parafraseado en vez del texto literal del error.
- Mezclar varios gotchas no relacionados en un solo archivo.
- Capturar el gotcha y no enlazarlo desde el índice de memoria — se vuelve invisible.
