# Transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional



coro(**id_coro**, nombre)



coreuta(**dni**, nombre)



ingreso(**id_ingreso**)



registro(**id_registro**, valor_max, valor_min, tipo)


percusion(**id_instrumento**)



cuerda(**id_instrumento**, cant_cuerdas)



viento(**id_instrumento**, nota_alta)



compone(**dni**, **id_coro**)



dirige(**id_coro**, dni)



tiene(**id_ingreso**, dni, id_coro)



corresponde(**id_registro**, **id_instrumento**)



posee(**id_coro**, **dni**, id_registro)