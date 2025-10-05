### 6) Choferes

**DUEÑO** ( **id_dueño**, nombre, teléfono, dirección, dni )
**CHOFER** ( **id_chofer**, nombre, teléfono, dirección, fecha_licencia_desde, fecha_licencia_hasta, dni )
**AUTO** ( **patente**, id_dueño, id_chofer, marca, modelo, año )
**VIAJE** ( **patente**, **hora_desde**, hora_hasta, origen, destino, tarifa, metraje )

*a)* Listar el dni, nombre y teléfono de todos los dueños que NO son choferes
*b)* Listar la patente y el id_chofer de todos los autos a cuyos choferes les caduca la licencia el 01/01/2026

a) π dni, nombre, telefono (**DUEÑO**) - π dni, nombre, telefono (**DUEÑO** |X| **CHOFER**)

b) π patente, id_chofer (**AUTO** |X| σ fecha_licencia_hasta = 01/01/2026 (**CHOFER**))

### 7) Estudiantes y carreras

**ESTUDIANTE** ( **#legajo**, nombreCompleto, nacionalidad, añoDeIngreso, códigoDeCarrera )
**CARRERA** ( **códigoDeCarrera**, nombre )
**INSCRIPCIONAMATERIA** ( **#legajo**, **códigoDeMateria**)
**MATERIA** (**códigoDeMateria**, nombre)

*a)* Obtener el nombre de los estudiantes que ingresaron en 2023.
*b)* Obtener el nombre de los estudiantes con nacionalidad “Argentina” que NO estén en la carrera con código “LI07”
*c)* Obtener el legajo de los estudiantes que se hayan anotado en TODAS las materias.

a) π nombreCompleto (σ añoDeIngreso = 2023 (**ESTUDIANTE**))

b) π nombreCompleto(σ nacionalidad = Argentina (**ESTUDIANTE**) - (σ codigoDeCarrera = LI07(**ESTUDIANTE**)))

c) **INSCRIPCIONAMATERIA** % π codigoDeMateria (**MATERIA**)

### 8) Cursos

**LUGAR_TRABAJO** ( **#empleado**, **#departamento** )
**CURSO_EXIGIDO** ( **#departamento**, **#curso** )
**CURSO_REALIZADO** ( **#empleado**, **#curso** )

*a)* ¿Quiénes son los empleados que han hecho todos los cursos, independientemente de qué departamento los exija?
*b)* ¿Quiénes son los empleados que ya han realizado todos los cursos exigidos por sus departamentos?

a) **CURSO_REALIZADO** % (π #curso (**CURSO_EXIGIDO**))

b) π #empleado (**LUGAR_TRABAJO**) - π #empleado (π #empleado, #curso (**LUGAR_TRABAJO** |X| **CURSO_EXIGIDO**) - **CURSO_REALIZADO**)

### 9) Fabricantes de Muebles

TIPOMUEBLE ( id_tipomueble, descripción )
FABRICANTE ( id_fabricante,nombrefabricante, cuit )
TIPOMADERA ( id_tipomadera, nombremadera )
AMBIENTE ( id_ambiente, descripcionambiente )
MUEBLE ( id_mueble, id_tipomueble, id_fabricante, id_tipomadera, precio, dimensiones, descripcion )
MUEBLEAMBIENTE ( id_mueble, id_ambiente )

*a.* Obtener los nombres de los fabricantes que fabrican muebles en todos los tipos de madera.
*a.* Obtener los nombres de los fabricantes que sólo fabrican muebles en Pino.
*b.* Obtener los nombres de los fabricantes que fabrican muebles para todos los ambientes.
*c.* Obtener los nombres de los fabricantes que sólo fabrican muebles para oficina.
*d.* Obtener los nombres de los fabricantes que sólo fabrican muebles para baño y cocina.
*e.* Obtener los nombres de los fabricantes que producen muebles de cedro y roble.
*f.* Obtener los nombres de los fabricantes que producen muebles de melamina o MDF