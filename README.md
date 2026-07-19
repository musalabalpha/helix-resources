# helix-resources

Recursos públicos y genéricos para trabajar con [Claude Code](https://claude.com/claude-code). Pensado para que cualquiera del equipo pueda clonar, copiar lo que le sirva y tirar el resto.

Nada aquí depende de la infraestructura interna: si algo solo funciona con nuestros servidores, nuestras credenciales o nuestro gestor de tareas, **no va en este repo**.

## Qué hay

### [`starter-kit/`](starter-kit/) — punto de partida

Para alguien que empieza con Claude Code y quiere una base configurada en vez de un archivo en blanco. Trae `CLAUDE.md` de ejemplo con bloques etiquetados, permisos y hooks en `settings.json.ejemplo`, tres skills de muestra y ejemplos de memoria persistente.

Se clona una vez, se poda y se adapta. Es un andamio, no un dogma — el propio README de adentro te dice qué borrar.

Incluye [`verificar.sh`](starter-kit/verificar.sh), que comprueba que el hook de seguridad de verdad bloquea lo que dice bloquear. Córrelo antes de confiar en esa configuración: un hook mal escrito no da error, simplemente deja pasar todo.

### `skills/` — biblioteca compartida

Skills reutilizables, una carpeta por skill. Se consultan y se copian sueltas, no se clonan en bloque.

*(Vacío por ahora — se irá llenando.)*

## Regla de entrada

Todo lo que entre a este repo pasa primero por [`verificar-fugas.sh`](verificar-fugas.sh):

```bash
./verificar-fugas.sh            # todo el repo
./verificar-fugas.sh skills/    # solo una parte
```

Busca credenciales, rutas absolutas de una máquina real, referencias a gestores de secretos o red privada, emails que no son placeholder, e identificadores de issues internos.

Dos advertencias sobre cómo usarlo:

- **Va a dar falsos positivos.** Una palabra que contiene otra, un ejemplo que parece un path. El script no decide por ti; te obliga a mirar.
- **Un barrido que nunca falla es indistinguible de uno roto.** Si lo modificas, pruébalo con fugas inyectadas a propósito y confirma que las detecta. Este script ya tuvo esa falla una vez: el chequeo de emails usaba un lookahead negativo que `grep -E` no soporta, así que nunca podía encontrar nada y reportaba "limpio". Pasaba la vista y mentía.

Lo que no cubre ningún script: contexto de negocio en prosa. Un ejemplo con el nombre de un cliente real, una decisión interna explicada de más. Eso se atrapa leyendo.

## Licencia

MIT — ver [LICENSE](LICENSE). Úsalo, modifícalo y redistribúyelo libremente; lo único que se pide es conservar el aviso de copyright.
