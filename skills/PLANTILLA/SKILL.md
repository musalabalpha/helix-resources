---
name: nombre-del-skill
description: >
  UNA línea que dice CUÁNDO se dispara este skill. Esto es lo ÚNICO que el
  modelo lee para decidir si carga el skill completo — no el cuerpo, no el
  nombre del archivo. Debe contener los disparadores literales que el
  usuario va a decir ("cuando el usuario dice X", "antes de Y"), no una
  descripción abstracta de lo que el skill hace por dentro.
---

# nombre-del-skill

<!--
  Anatomía de un skill:

  - El frontmatter (name + description) es lo que decide si esto se carga.
    Si la description es vaga ("ayuda con deploys"), el modelo no sabe
    cuándo activarlo y o nunca dispara o dispara de más.
  - El cuerpo es lo que el modelo lee UNA VEZ que ya decidió cargar el
    skill. Ahí sí puedes explicar el proceso completo.
-->

## Cuándo aplica

<!-- Casos concretos, con ejemplos de frases del usuario si ayuda. -->

## Cuándo NO aplica

<!-- Casos límite donde alguien podría confundirse y disparar esto sin deber. -->

## Pasos

1. ...
2. ...
3. ...

## Anti-patrones

<!-- Errores comunes al ejecutar este skill, o formas de hacerlo mal aunque
     técnicamente se sigan los pasos. -->

<!--
  Regla para crear un skill nuevo:

  SÍ vale la pena crear un skill cuando:
  - Ya escribiste el mismo prompt, en esencia, 3 o más veces.
  - El proceso tiene pasos que se te olvidan si no están escritos (orden
    específico, checklist, formato de salida).

  NO vale la pena crear un skill cuando:
  - Es una instrucción de una sola vez — solo dila directamente.
  - Es una preferencia estable y general ("responde siempre en español",
    "usa 2 espacios de indentación") — eso va en CLAUDE.md, no en un skill.
    Un skill es un PROCESO que se dispara bajo condición; CLAUDE.md es
    contexto que aplica siempre.
-->
