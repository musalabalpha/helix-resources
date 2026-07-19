---
name: gotcha-ejemplo
description: Un cliente de caché servía valores viejos porque la conexión se abría en modo de solo-lectura sin invalidación.
metadata:
  type: reference
---

# Gotcha: caché sirve valores viejos tras actualizar el dato en origen

## Síntoma

La API devuelve un valor desactualizado después de un `UPDATE` confirmado en la base de datos — se puede verificar con una consulta directa a la base que el valor nuevo sí está ahí, pero el endpoint que pasa por el caché sigue devolviendo el anterior. No hay error, no hay excepción, el dato simplemente no cambia hasta que el proceso se reinicia.

## Causa real

El cliente de caché se abrió en modo de solo-lectura (`readonly=true` / conexión "immutable") por una optimización de arranque más rápido. Ese modo asume que el archivo/fuente no cambia durante la vida de la conexión y cachea agresivamente sin revisar invalidaciones — no es un problema de TTL, es que la conexión ni siquiera está escuchando cambios.

## Remedio

Cambiar la conexión de caché a modo lectura-escritura estándar (sin la bandera de inmutabilidad), o si se necesita el modo rápido de solo-lectura, abrir una conexión nueva por request en vez de reusar una conexión larga viva.

## Cómo detectarlo la próxima vez

Si un valor confirmado en el origen no se refleja en la API y no hay ningún error en logs, sospechar primero de una conexión de caché con bandera de inmutabilidad o "read-only" antes de investigar TTLs o lógica de invalidación — el síntoma de "cero errores, dato viejo" es la huella característica de este modo, no de un caché normal con TTL vencido.

Relacionado: [[feedback-verificar-antes-de-afirmar]] — este tipo de bug es fácil de "arreglar" en apariencia (un restart lo enmascara) sin haber corregido la causa real.
