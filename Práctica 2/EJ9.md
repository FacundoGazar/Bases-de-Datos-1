DEPENDENCIAS FUNCIONALES

 - DF1: #torneo -> nombre_torneo
 - DF2: #equipo -> nombre_equipo, estadio_equipo
 - DF3: #torneo, año, #equipo -> puesto
 - DF4: #torneo, año, puesto -> #equipo
 - DF5: #reglamentacion -> descripicion

## CC1: {#torneo, año, #reglamentacion, #equipo, #auspiciante}
## CC2: {#torneo, año, #reglamentacion, puesto, #auspiciante}

TORNEOS cumple con la definición de BCNF?

No, dado que existe la DF1 cuyo determinante {#torneo} no es superclave del esquema TORNEOS

Por lo tanto, particionamos a partir de la DF1 creando dos nuevas relaciones:

- T1(**#torneo**, nombre_torneo)
- T2(**#torneo**, **año**, **#equipo**, nombre_equipo, estadio_equipo, **puesto**,
**#reglamentacion**, descripcion, **#auspiciante**)

T1 está en BCNF ya que { #torneo } es superclave del esquema y sólo vale la DF1 que es trivial

Se pierde información?

No, porque T1 & T2 es { #torneo }, clave de T1.

En T2 valen DF2, DF3, DF4, DF5

T2 cumple con la definición de BCNF?

No, dado que existe la DF2 cuyo determinante { #equipo } no es superclave del esquema

Por lo tanto, particionamos a partir de la DF2 creando dos nuevas relaciones:

- T3(**#equipo**, nombre_equipo, estadio_equipo)
- T4(**#torneo**, **año**, **#equipo**, **puesto**,
**#reglamentacion**, descripcion, **#auspiciante**)

T3 está en BCNF ya que { #equipo } es superclave del esquema y sólo vale la DF2 que es trivial

Se pierde información?

No, porque T3 & T4 es { #equipo }, clave de T3

En T4 valen DF3, DF4, DF5

T4 se encuentra en BCNF?

No, ya que existe la DF5 cuyo determinante { #reglamentación } no es superclave del esquema

Por lo tanto, particionamos a partir de la DF5

- T5(**#reglamentacion**, descripcion)
- T6(**#torneo**, **año**, **#equipo**, **puesto**,
**#reglamentacion**, **#auspiciante**)

T5 está en BCNF porque { #reglamentacion } es superclave del esquema y sólo vale la DF5 que es trivial

Se pierde información?

No porque T5 & T6 es { #reglamentacion }, clave de T5

En T6 valen DF3 y DF4

T6 se encuentra en BCNF?

No porque existe la DF3 cuyo determinante { #torneo, año, #equipo } no es superclave del esquema

Por lo tanto, particionamos a partir de la DF3 creando dos nuevas relaciones

- T7( **#torneo**, **año**, **#equipo**, puesto)
- T8(**#torneo**, **año**, **#equipo**, **#reglamentacion**, **#auspiciante**)

T7 está en BCNF ya que { #torneo, año, #equipo } es superclave del esquema y sólo valen DF3 y DF4 que son triviales

Se pierde informacion?

No porque T7 & T8 es { #torneo, año, #equipo }, clave de T7

T8 se encuentra en BCNF?

Sí porque cumple con la definición de BCNF

Particiones en BCNF:

- T1(**#torneo**, nombre_torneo)
- T3(**#equipo**, nombre_equipo, estadio_equipo)
- T5(**#reglamentacion**, descripcion)
- T7( **#torneo**, **año**, **#equipo**, puesto)
- T8(**#torneo**, **año**, **#equipo**, **#reglamentacion**, **#auspiciante**)

## CP: {#torneo, año, #equipo, #reglamentacion, #auspiciante}

DEPENDENCIAS MULTIVALUADAS:

- DM1: #torneo, año ->> #equipo
- DM2: #torneo, año ->> #auspiciante
- DM3: #torneo ->> #reglamentacion

Teniendo en cuenta DM1:

- T9(#torneo, año, #equipo)
- T10(#torneo, año, #reglamentacion, #asupiciante)

1. T9 se encuentra en 4FN porque no valen DMs que no sean triviales en ella
2. T10 no se encuentra en 4FN porque DM3 vale en ella y no es trivial

Teniendo en cuenta DM3:

- T11(#torneo, #reglamentacion)
- T12(#torneo, año, #auspiciante)

1. Tanto T11 y T12 se encuentran en 4FN porque no valen DMs que no sean triviales en ellas.

Esquemas en 4FN:

- T1(**#torneo**, nombre_torneo)
- T3(**#equipo**, nombre_equipo, estadio_equipo)
- T5(**#reglamentacion**, descripcion)
- T7( **#torneo**, **año**, **#equipo**, puesto)
- T9(**#torneo**, **año**, **#equipo**)
- T11(**#torneo**, **#reglamentacion**)
- T12(**#torneo**, **año**, **#auspiciante**)

Esquemas en 4FN sin proyecciones:

- T1(**#torneo**, nombre_torneo)
- T3(**#equipo**, nombre_equipo, estadio_equipo)
- T5(**#reglamentacion**, descripcion)
- T7( **#torneo**, **año**, **#equipo**, puesto)
- T11(**#torneo**, **#reglamentacion**)
- T12(**#torneo**, **año**, **#auspiciante**)
