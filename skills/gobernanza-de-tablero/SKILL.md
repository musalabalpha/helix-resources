---
name: gobernanza-de-tablero
description: Usar cuando el gestor de tareas dejó de servir — el usuario dice "esto es un basurero", "tengo 200 issues y ninguno avanza", "todo está en alta prioridad", "ya no lo abro", "no sé qué sigue", o pide ordenar/limpiar/auditar su backlog. También antes de proponer reglas de proceso a un equipo. NO usar para mover un issue puntual.
---

# gobernanza-de-tablero

Un tablero se pudre siempre igual: alguien captura sin filtro, nadie borra, la prioridad se
vuelve gratis, y un día el tablero deja de describir el trabajo real. A partir de ahí miente,
y un tablero que miente es peor que no tener tablero, porque la gente decide con él.

Este skill no limpia el tablero. **Extrae el criterio del dueño y luego limpia con ese
criterio.** El orden importa: limpiar sin criterio produce un tablero ordenado que se vuelve
a pudrir en tres semanas.

## Cuándo aplica

- El backlog creció más rápido de lo que nadie lo puede revisar.
- Un tercio o más de los items están en prioridad alta.
- Hay items sin dueño, o con dueño nominal que nadie ejerce.
- Nadie recuerda por qué existe la mitad de las cosas.
- Se van a proponer reglas de proceso, y conviene que salgan del dueño y no del agente.

## Cuándo NO aplica

- Mover, cerrar o comentar un issue concreto. Eso es operación normal.
- Un tablero sano que solo necesita priorizar la semana.
- Cuando el usuario ya te dio las reglas y solo quiere que las apliques.

## Regla base: entrevista, no menú

No le des al dueño una lista de opciones para elegir. Genera criterio nuevo, no elige de tu
catálogo. Pregunta **una cosa a la vez**, anclada en datos reales de su tablero, y déjalo
hablar. Su criterio ya existe; solo nunca se escribió.

Prefiere preguntar por **comportamiento pasado** en vez de por principios. "¿Qué es urgente
para ti?" produce una definición de manual. "¿Qué te hizo soltar lo que estabas haciendo en
las últimas dos semanas?" produce la verdad, y casi nunca coinciden.

## Pasos

### 1. Mide antes de opinar

Saca los números reales: cuántos items activos, cuántos sin dueño, cuántos en alta, cuántos
sin tocar en 30 días, cuál es el más viejo. No afirmes nada que no hayas medido.

Cuidado con la métrica de estancamiento: si mides por "última actualización", cualquier
proceso automático que roce items viejos los hace ver frescos. Mide por fecha de creación o
por tiempo en el estado actual.

### 2. La pregunta diagnóstica

Toma tres items reales, viejos, de distinta naturaleza, y pregunta:

> **Si mañana estos tres desaparecieran del tablero sin avisarte, ¿de cuál te enterarías, y
> cómo te enterarías?**

No preguntes cuál conservar. Pregunta **por qué vía llegaría la noticia**. Las respuestas
caen en patrones muy distintos, y ese patrón es la clasificación que buscas.

### 3. Clasifica todo en tres categorías

La mayoría de los tableros mezcla tres cosas que no se parecen. Solo una pertenece ahí:

| Categoría | Cómo se reconoce | Dónde va |
|---|---|---|
| **Compromiso** | Alguien externo espera. Si desaparece, esa persona lo cobra | Se queda en el tablero, con dueño |
| **Deseo** | Nadie espera. Si se retoma el proyecto padre, la necesidad se regenera sola | Lista ligera fuera del tablero |
| **Vigilancia** | Vuelve cada día o cada semana. No tiene un "ya quedó" posible | Un proceso automático, nunca un item |

La tercera es la que más daño hace y la más fácil de pasar por alto. Un riesgo recurrente
escrito como tarea (revisar el gasto, revisar accesos, revisar la salud del sistema) **nunca
se completa**, porque completarlo no es posible. Se queda meses en el tablero pareciendo
pendiente mientras el riesgo sigue ocurriendo. Si al leer un item piensas "esto habría que
hacerlo seguido", no es un item: es un cron sin escribir.

### 4. Saca la definición de "terminado"

Casi nadie la tiene escrita, y sin ella los proyectos no se terminan: se abandonan.

No preguntes por la definición. Pide que describa el día en que ya se logró:

> **Imagínate que despiertas un día cualquiera y ya pasó. ¿Qué ves esa mañana que hoy no ves?**

Pide cosas mirables: qué abrió, qué le llegó, qué ya no tuvo que hacer. De ahí sale un
criterio verificable. El patrón más común y más útil que aparece es alguna forma de *"corre
sin mí y solo me busca cuando hay que decidir"*, que sí se puede comprobar un martes
cualquiera. "El proyecto está completo" no se puede comprobar nunca.

### 5. Haz escasa la prioridad

La prioridad solo significa algo si tiene tope. Sin cupo, marcar algo como alto es gratis,
y lo gratis se hace ruido. Fija un número máximo y sostenlo: para subir uno, baja otro.

Antes de recalificar, saca el criterio de urgencia con el paso 2 aplicado a su comportamiento
real. Un hallazgo frecuente e incómodo: **lo que de verdad interrumpe al dueño no suele estar
en el tablero**. Si es así, el tablero no es su lista de trabajo, y "alta prioridad" ahí
adentro significa otra cosa. Averigua qué significa antes de tocar un solo item.

### 6. Toda regla necesita mecanismo

Una regla que nadie vigila no es una regla, es una intención. Se cumple una semana y se
olvida sin que nadie lo note.

Dos mecanismos, porque uno solo no basta:

- **Al nacer:** algo que rechaza lo inválido en el momento de crearlo. Cierra el grifo.
- **Periódico:** algo que audita lo existente y reporta. Atrapa lo que se escapó por vías
  que el primero no cubre.

Declara siempre qué **no** cubre el mecanismo. Casi nunca es universal: típicamente cubre una
vía de entrada y deja libres las otras (la interfaz web, otro agente, otra persona).
Una cobertura parcial que se cree total es peor que ninguna.

### 7. Modo aprendiz antes que automático

Cuando toque activar algo que borra, cancela o archiva: **no lo dejes ejecutar solo desde el
primer día.** Que proponga y espere.

El patrón que funciona:

1. **Propone**, dentro de un canal que el dueño ya lee. No inventes un aviso nuevo: un aviso
   más compite con la atención que estás tratando de proteger.
2. **Sustenta.** Cada propuesta dice con qué criterio la hizo. Sin esto no se puede corregir.
3. **Aprende explícito.** Cada corrección se escribe como regla en un archivo que el proceso
   lee antes de la corrida siguiente. Si "aprende" no tiene un archivo detrás, no aprende: al
   mes propone lo mismo y el dueño deja de leerlo.
4. **Escala cambiando la pregunta.** Si no hay respuesta, el recordatorio no repite la
   propuesta: reporta el contador. "Llevas N días sin contestar sobre estos 5." El contador
   es evidencia. Algo que aguantó varias rondas sin que nadie lo defienda ya se murió solo.
5. **Modo pausa.** El sistema necesita saber que el dueño está ausente: vacaciones,
   incapacidad, viaje. Mientras dure, nada muere y nada insiste. Casi ningún sistema tiene
   este concepto y todos lo necesitan.

El silencio nunca debe matar. Pero tampoco debe acumular para siempre: por eso el contador.

### 8. El derecho a insistir se gana y se gasta

Tarde o temprano alguien pide que el sistema sea insistente para lo verdaderamente
importante. Correcto, con dos condiciones:

- **Se gana.** Un sistema sin historial de buen criterio que empieza a perseguir a la gente
  persigue por cosas equivocadas. Los pasos 7.2 y 7.3 son cómo se lo gana.
- **Es escaso.** Mismo principio que la prioridad: si insiste tres veces al mes, le hacen
  caso; tres veces al día, lo silencian. **Un canal silenciado es peor que uno que no
  existe**, porque el emisor cree que sigue comunicando.

## Anti-patrones

- **Limpiar antes de entrevistar.** Produce un tablero ordenado sin criterio nuevo. Se vuelve
  a llenar igual, y encima el dueño ya gastó su paciencia en la limpieza.
- **Rellenar los huecos tú.** Si el dueño no decidió algo, nómbralo como decisión abierta en
  el documento. Un default puesto por el agente se vuelve regla sin que nadie lo haya elegido.
- **Borrar en vez de archivar.** Archivar es reversible y basta para recuperar cupo y
  claridad. Borrar destruye historia por una ganancia que no existe.
- **Podar por conteos sin verificar el alcance.** Antes de borrar una etiqueta o un
  contenedor "vacío", confirma contra la fuente real y con el alcance correcto: una etiqueta
  puede verse muerta en un equipo y estar viva en otro, y un contenedor puede verse vacío
  solo porque su trabajo ya se archivó. Verifica incluyendo lo archivado.
- **Retirar la vigilancia antes de construir el reemplazo.** Si un item recurrente sale del
  tablero antes de que exista el proceso que lo cubre, el riesgo deja de verse sin dejar de
  existir. Primero el mecanismo, después el retiro.
- **Confiar en un mecanismo que nunca falló.** Un guardia que nunca bloqueó nada es
  indistinguible de uno roto. Pruébalo con lo que **debe** atrapar, no solo con lo que debe
  dejar pasar.

## Salida esperada

Un documento con: los números medidos, las reglas en palabras del dueño, los umbrales
concretos, las decisiones que quedaron abiertas con su nombre, y los límites declarados de
cada mecanismo.

Las reglas se escriben como las dijo el dueño, no como las diría un manual. Un documento que
suena a plantilla no se defiende cuando alguien lo quiera romper en tres meses.
