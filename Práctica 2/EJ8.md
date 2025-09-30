DEPENDENCIAS FUNCIONALES:

DF1: #festival -> denominacion_festival, localidad

DF2: #banda -> nombre_banda, estilo_musical

DF3: cuil_musico -> nombre_musico, fecha_nacimiento

DF4: #festival, #banda, #tema -> nombre_tema, duracion

DF5: #festival, #banda, #tema, cuil_musico -> instrumento

CC: (#festival, #banda, cuil_musico, #tema, 
	#sponsor, cuil_auspiciante, url_plataforma_entradas)

FESTIVALES cumple con la definición de BCNF?

No, dado que existe la DF3 cuyo determinante { cuil_musico } no es 
	superclave del esquema FESTIVALES

Por lo tanto, particionamos por la df3 creando dos nuevas relaciones:

F1: (**cuil_musico**, nombre_musico, fecha_nacimiento)

F2:  (**#festival**, denominacion_festival, localidad, **cuil_musico**, **#banda**, 
	nombre_banda, estilo_musical, **#tema**, nombre_tema, duracion,
	instrumento, **cuil_auspiciante**, **url_plataforma_entradas**, entradas, **#sponsor**)

F1 está en BCNF ya que { cuil_musico } es superclave del esquema y 
	sólo vale la df3 que es trivial

Se pierde información?

No, porque F1 & F2 es { cuil_musico }, clave de F1

En F2 valen DF1, DF2, DF4 y DF5

F2 cumple con la definición de BCNF?

No, dado que existe la DF2 cuyo determinante { #banda } no es 
	superclave del esquema F2

Por lo tanto, particionamos por la df2 creando dos nuevas relaciones:

F3: (**#banda**, nombre_banda, estilo_musical)

F4:  (**#festival**, denominacion_festival, localidad, **cuil_musico**, **#banda**, 
	**#tema**, nombre_tema, duracion, instrumento, **cuil_auspiciante**, 
	**url_plataforma_entradas**, **#sponsor**)

F3 está en BCNF ya que { #banda } es superclave del esquema y 
	sólo vale la df2 que es trivial

Se pierde información?

No, porque F3 & F4 es { #banda }, clave de F3

En F4 valen  DF1, DF4, DF5

F4 cumple con la definición de BCNF?

No, dado que existe la DF1 cuyo determinante { #festival } no es
	superclave del esquema F4

Por lo tanto, particionamos a partir de la df1 creando dos nuevas relaciones:

F5: (**#festival**, denominacion_festival, localidad)

F6: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, 
	nombre_tema, duracion, instrumento, **cuil_auspiciante**, 
	**url_plataforma_entradas**, **#sponsor**)

F5 está en  BCFN ya que { #festival } es superclave del esquema y
	sólo vale DF1 que es trivial

Se perdió información?

No se pierde información ya que F5 & F6 es { #festival }, clave de F5

En F6 valen DF4, DF5

F6 cumple con la definición BCNF?

No, porque existe la DF4 cuyo determinante { #festival, #banda, #tema } no es superclave del esquema F6

Por lo tanto, particionamos a partir de la df4 creando dos nuevas relaciones:

F7: (**#festival**, **#banda**, **#tema**, nombre_tema, duracion)

F8: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, 
	instrumento, **cuil_auspiciante**, 
	**url_plataforma_entradas**, **#sponsor**)

F7 está en BCNF ya que { #festival, #banda, #tema } es superclave del esquema
	y sólo vale la DF4 que es trivial

Se perdió información?

No se pierde información ya que F7 & F8 es { #festival, cuil_musico, #banda },
	clave de F7

En F8 vale DF5

F8 cumple con la definición de BCNF?

No, porque existe la DF5 cuyo determinante { #festival, #banda, #tema, cuil_musico } no es superclave del esquema F8

Por lo tanto, particionamos a partir de la df8 creando dos nuevas relaciones:

F9: (**#festival**, **#banda**, **#tema**, **cuil_musico**, instrumento)

F10: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, **cuil_auspiciante**,  **url_plataforma_entradas**, **#sponsor**)

F9 se encuentra en BCNF ya que { #festival, #banda, #tema, cuil_musico }
	es superclave del esquema y sólo vale la DF5 que es trivial

Se perdió información?

No se pierde información ya que F9 & F10 es 
	{ #festival, #banda, #tema, cuil_musico }, clave de F9

F10 se encuentra en BCNF?

Sí porque cuimple con la deficinión de BCNF

Particiones en BCNF:

F1: (**cuil_musico**, nombre_musico, fecha_nacimiento)

F3: (**#banda**, nombre_banda, estilo_musical)

F5: (**#festival**, denominacion_festival, localidad)

F7: (**#festival**, **#banda**, **#tema**, nombre_tema, duracion)

F9: (**#festival**, **#banda**, **#tema**, **cuil_musico**, instrumento)

F10: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, **cuil_auspiciante**,  **url_plataforma_entradas**, **#sponsor**)

CC: (#festival, #banda, cuil_musico, #tema, 
	#sponsor, cuil_auspiciante, url_plataforma_entradas)

DEPENDENCIAS MULTIVALUADAS:

DM1: #festival ->> cuil_auspiciante

DM2: #festival ->> #sponsor

DM3: #festival ->> url_plataforma_entradas

DM4: #festival, #banda, #tema ->> cuil_musico

Teniendo en cuenta DM1:

F11: (**#festival**, **cuil_auspiciante**)

F12: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, 	**url_plataforma_entradas**, **#sponsor**)

F11 está en 4NF porque no valen DMs que no sean triviales en ella
F12 no está en 4NF porque DM2 vale en ella y no es trivial

Teniendo en cuenta DM2:

F13: (**#festival** ,**#sponsor**)

F14: (**#festival**, **cuil_musico**, **#banda**,  **#tema**, 	**url_plataforma_entradas**)

F13 está en 4FN porque no valen DMs que no sean triviales en ella
F14 no está en 4FN porque DM3 vale en ella y no es trivial

Teniendo en cuenta DM3:

F15: (**#festival** ,**url_plataforma_entradas**)

F16: (**#festival**, **cuil_musico**, **#banda**,  **#tema**)

Tanto F15 como F16 están en 4NF porque ya no existen DMs que no 
	sean triviales en ellas.

Esquemas en 4FN:

F1: (**cuil_musico**, nombre_musico, fecha_nacimiento)

F3: (**#banda**, nombre_banda, estilo_musical)

F5: (**#festival**, denominacion_festival, localidad)

F7: (**#festival**, **#banda**, **#tema**, nombre_tema, duracion)

F9: (**#festival**, **#banda**, **#tema**, **cuil_musico**, instrumento)

F11: (**#festival**, **cuil_auspiciante**)

F13: (**#festival** ,**#sponsor**)
F15: (**#festival** ,**url_plataforma_entradas**)
F16: (**#festival**, **#banda**, **#tema**,**cuil_musico**)
