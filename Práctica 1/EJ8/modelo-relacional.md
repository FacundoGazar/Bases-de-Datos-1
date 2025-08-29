# Transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional



departamento(**id_dpto**, nombre, prod_prom)



empleado(**legajo**, dni, apellido, nombre)



mueble(**id_mueble**, volumen, hh_promedio)



turno(**id_turno**, hora_fin, hora_inicio, dia)



material(**id_material**, nombre, stock_max)



trabaja(**id_dpto**,**legajo**)



responsable(**id_dpto**, legajo)



especializa(**id_mueble**, id_dpto, legajo)



compone(**id_mueble**,**id_material**, cantidad)



realiza(**id_turno**,**legajo**,**id_dpto**)
