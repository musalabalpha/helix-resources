# Mensajes de decisión (chat, correo, notificación)

Cuando un entregable termina en "necesito que decidas algo", el mensaje es parte del
entregable. Un mensaje técnicamente correcto puede ser cognitivamente caro: convierte el
canal en un volcado de pendientes y nadie decide.

## Principio

```txt
1 recomendación
3 respuestas posibles
1 consecuencia si no responde
1 link al detalle
```

## Qué evitar

- Abrir con números grandes ("47 pendientes esperan tu decisión"): paralizan.
- Tono dramático o militar.
- Mezclar telemetría interna (conteos, estados del sistema) con la decisión.
- Listas parciales con "y 44 más".
- No ofrecer una acción de bajo esfuerzo.

## Plantilla

```txt
🟡 Necesito una decisión

Recomiendo: aprobar el cambio de proveedor de correo.

Por qué importa:
los envíos fallidos bajan de 8% a menos de 1% sin cambiar nada más.

Responde:
A) aprobar
B) revisar antes
C) pausar esta semana

Si no respondes: no se cambia nada irreversible.

Detalle: <link>
```

## Variante mínima para celular

```txt
🟡 Una decisión

Recomiendo: aprobar el cambio de proveedor de correo.

✅ aprobar · 👀 revisar · ⏸ pausar

Sin respuesta: no avanzo nada irreversible.
```

La telemetría completa vive en el detalle, no en la notificación.
