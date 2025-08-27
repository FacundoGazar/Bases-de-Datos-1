# transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional

pozo(**id_pozo**, latitud, longitud, nombre, fecha_produccion)

monitoreo(**id_monitoreo**, fecha, metodo)

parámetro(**valor_referencia**, nombre)

resultado(**id_resultado**, valor)

analógico(**numero_serie**, fecha_calibracion)

digital(**numero_serie**, marca, modelo)

realiza(**id_monitoreo**, **valor_referencia**, id_pozo)

mide(**id_monitoreo**, **valor_referencia**)

obtiene(**id_resultado**,  id_monitoreo, valor_referencia)

utiliza(**id_resultado**, numero_serie)