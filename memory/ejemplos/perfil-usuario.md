---
name: perfil-usuario
description: Quién es el usuario, qué stack domina, cómo prefiere que le expliquen las cosas.
metadata:
  type: user
---

# Perfil de usuario

## Stack

- Backend: TypeScript/Node, Python. Cómodo con async/await, menos cómodo con generadores y concurrencia de bajo nivel.
- Frontend: React con hooks, evita clases. Prefiere Tailwind sobre CSS-in-JS.
- Infra: Docker y docker-compose para desarrollo local, no ha tocado Kubernetes en producción.
- Bases de datos: Postgres a diario, ORM (Prisma/SQLAlchemy) por defecto — solo baja a SQL crudo cuando el ORM genera algo evidentemente ineficiente.

## Nivel

Mid-senior. No necesita que se le explique qué es un índice de base de datos o cómo funciona git rebase. Sí agradece que se le explique el porqué de una decisión de arquitectura no obvia (por qué event sourcing y no CRUD simple, por qué este patrón de cache y no otro).

## Cómo prefiere que le expliquen

- Directo, sin preámbulo. Ir al código o al comando primero, la explicación después si hace falta.
- No repetir contexto que ya está en el código o en el mensaje anterior.
- Cuando hay una decisión con trade-offs reales, mencionar la alternativa descartada y por qué — no solo la elegida.
- Prefiere que se le corrija de frente si algo que pidió tiene un problema, en vez de construirlo callado y avisar después.

Ver también [[feedback-verificar-antes-de-afirmar]] para el patrón de corrección más reciente.
