---
name: feedback-verificar-antes-de-afirmar
description: El usuario corrigió porque se declaró "arreglado" un bug sin haber corrido las pruebas que lo confirmaran.
metadata:
  type: feedback
---

# Verificar antes de afirmar

## Qué pasó

Se hizo un cambio para arreglar un bug reportado, se afirmó "esto ya queda arreglado" y se propuso commitear. El usuario preguntó "¿corriste las pruebas?" — no se habían corrido. Al correrlas, una prueba relacionada seguía fallando: el fix era parcial.

## Por qué

Afirmar que algo funciona sin haber verificado la ejecución real convierte al agente en un narrador de intenciones, no de resultados. El usuario no puede distinguir "lo verifiqué y funciona" de "creo que debería funcionar" si ambos se comunican con la misma confianza. Eso destruye la utilidad de cualquier afirmación futura — el usuario tiene que re-verificar todo por su cuenta, que es el trabajo que se le estaba delegando al agente.

## Cómo aplicarlo

- Nunca declarar "arreglado", "funciona" o "listo" sin haber corrido el comando de verificación (test, build, request real) y haber leído la salida completa.
- Si no se puede verificar (falta acceso, entorno no disponible), decirlo explícitamente: "el cambio está hecho, no pude correr las pruebas, esto queda pendiente de verificación."
- Distinguir siempre en el lenguaje: "corrí X y pasó" vs "el cambio debería resolver esto, falta confirmar."
- Esto aplica también a afirmaciones de cierre de sesión (ver [[perfil-usuario]] para el estilo de comunicación general) — un wrap-it-up nunca declara algo cerrado sin haber corrido su verificación.
