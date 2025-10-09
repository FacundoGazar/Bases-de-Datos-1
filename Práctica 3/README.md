### 6) Choferes

 - **DUEÑO** ( **id_dueño**, nombre, teléfono, dirección, dni )
 - **CHOFER** ( **id_chofer**, nombre, teléfono, dirección, fecha_licencia_desde, fecha_licencia_hasta, dni )
 - **AUTO** ( **patente**, id_dueño, id_chofer, marca, modelo, año )
 - **VIAJE** ( **patente**, **hora_desde**, hora_hasta, origen, destino, tarifa, metraje )

1. a) Listar el dni, nombre y teléfono de todos los dueños que NO son choferes
2. b) Listar la patente y el id_chofer de todos los autos a cuyos choferes les caduca la licencia el 01/01/2026

a) π dni, nombre, telefono (**DUEÑO**) - π dni, nombre, telefono (**DUEÑO** |X| **CHOFER**)

b) π patente, id_chofer (**AUTO** |X| σ fecha_licencia_hasta = 01/01/2026 (**CHOFER**))

### 7) Estudiantes y carreras

- **ESTUDIANTE** ( **#legajo**, nombreCompleto, nacionalidad, añoDeIngreso, códigoDeCarrera )
- **CARRERA** ( **códigoDeCarrera**, nombre )
- **INSCRIPCIONAMATERIA** ( **#legajo**, **códigoDeMateria**)
- **MATERIA** (**códigoDeMateria**, nombre)

1. a) Obtener el nombre de los estudiantes que ingresaron en 2023.
2. b) Obtener el nombre de los estudiantes con nacionalidad “Argentina” que NO estén en la carrera con código “LI07”
3. c) Obtener el legajo de los estudiantes que se hayan anotado en TODAS las materias.

a) π nombreCompleto (σ añoDeIngreso = 2023 (**ESTUDIANTE**))

b) π nombreCompleto(σ nacionalidad = Argentina (**ESTUDIANTE**) - (σ codigoDeCarrera = LI07(**ESTUDIANTE**)))

c) **INSCRIPCIONAMATERIA** % π codigoDeMateria (**MATERIA**)

### 8) Cursos

- **LUGAR_TRABAJO** ( **#empleado**, **#departamento** )
- **CURSO_EXIGIDO** ( **#departamento**, **#curso** )
- **CURSO_REALIZADO** ( **#empleado**, **#curso** )

1. a) ¿Quiénes son los empleados que han hecho todos los cursos, independientemente de qué departamento los exija?
2. b) ¿Quiénes son los empleados que ya han realizado todos los cursos exigidos por sus departamentos?

a) **CURSO_REALIZADO** % (π #curso (**CURSO_EXIGIDO**))

b) π #empleado (**LUGAR_TRABAJO**) - π #empleado (π #empleado, #curso (**LUGAR_TRABAJO** |X| **CURSO_EXIGIDO**) - **CURSO_REALIZADO**)

### 9) Fabricantes de Muebles

- TIPOMUEBLE ( **id_tipomueble**, descripción )
- FABRICANTE ( **id_fabricante**, nombrefabricante, cuit )
- TIPOMADERA ( **id_tipomadera**, nombremadera )
- AMBIENTE ( **id_ambiente**, descripcionambiente )
- MUEBLE ( **id_mueble**, id_tipomueble, id_fabricante, id_tipomadera, precio, dimensiones, descripcion )
- MUEBLEAMBIENTE ( **id_mueble**, **id_ambiente** )

1. Obtener los nombres de los fabricantes que fabrican muebles en todos los tipos de madera.
2. Obtener los nombres de los fabricantes que sólo fabrican muebles en Pino.
3. Obtener los nombres de los fabricantes que fabrican muebles para todos los ambientes.
4. Obtener los nombres de los fabricantes que sólo fabrican muebles para oficina.
5. Obtener los nombres de los fabricantes que sólo fabrican muebles para baño y cocina.
6. Obtener los nombres de los fabricantes que producen muebles de cedro y roble.
7. Obtener los nombres de los fabricantes que producen muebles de melamina o MDF

a) Obtener los nombres de los fabricantes que fabrican muebles en todos los tipos de madera.

 1. **AUX** <- π id_fabricante, id_tipomadera (**FABRICANTE** |X| **MUEBLE**) % π id_tipomadera (**TIPOMADERA**)
 2.  π nombrefabricante (**AUX** |X| **FABRICANTE**)

b) Obtener los nombres de los fabricantes que sólo fabrican muebles en Pino.

 1. **AUX** <- **MUEBLE** |X| π id_tipomadera (σ nombremadera <> 'Pino' (**TIPOMADERA**))
 2. **AUX_DOS** <- π id_fabricante (**FABRICANTE**) - π id_fabricante (**AUX**)
 3. π nombrefabricante (**FABRICANTE** |X| **AUX_DOS**)

c) Obtener los nombres de los fabricantes que fabrican muebles para todos los ambientes.

1. **AUX** <- π id_fabricante, id_ambiente (**FABRICANTE** |X| **MUEBLE** |X| **MUEBLEAMBIENTE**) % π id_ambiente (**AMBIENTE**)
2. π nombrefabricante (**AUX** |X| **FABRICANTE**)

d) Obtener los nombres de los fabricantes que sólo fabrican muebles para oficina.

 1. **AUX** <- **MUEBLEAMBIENTE** |X| π id_ambiente (σ descripcionambiente <> 'Oficina'(**AMBIENTE**))
 2. π nombrefabricante (**FABRICANTE** |X| (π id_fabricante (**FABRICANTE**) - π id_fabricante (**FABRICANTE** |X| **MUEBLE** |X| **AUX**)))

e) Obtener los nombres de los fabricantes que sólo fabrican muebles para baño y cocina.

 1. **AUX** <- **MUEBLEAMBIENTE** |X| π id_ambiente (σ descripcionambiente <> 'Baño' AND descripcionambiente <> 'Cocina'(**AMBIENTE**))
 2. π nombrefabricante (**FABRICANTE** |X| (π id_fabricante (**FABRICANTE**) - π id_fabricante (**FABRICANTE** |X| **MUEBLE** |X| **AUX**)))

f) Obtener los nombres de los fabricantes que producen muebles de cedro y roble.

1. **AUX** <- (π id_fabricante, id_tipomadera (**FABRICANTE** |X| **MUEBLE**)) % π id_tipomadera (σ nombremadera = 'Roble' OR nombremadera = 'Cedro' (**TIPOMADERA**))
2. π nombrefabricante (**AUX** |X| **FABRICANTE**)

g) Obtener los nombres de los fabricantes que producen muebles de melamina o MDF

1. **AUX** <- (π id_fabricante, id_tipomueble(**FABRICANTE** |X| **MUEBLE**)) |X| π id_tipomueble (σ descripcion = 'Melamina' OR descripcion = 'MDF' (**TIPOMUEBLE**)
2. π nombrefabricante (**AUX** |X| **FABRICANTE**)

