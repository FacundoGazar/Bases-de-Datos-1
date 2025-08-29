# Transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional



User(**username**, nombre, email)



album(**id_album**, des, nombre, fecha)



publicacion(**id_publicacion**, fecha, texto)



etiqueta(**id_etiqueta**, nombre)



contenido(**id_contenido**, comentario, fecha)



foto(**id_contenido**, resolucion)



video(**id_contenido**, duracion)



participa(**username**, **id_album**)



crea(**id_album**, username)



realiza(**id_publicacion**, username, id_album)



contiene(**id_publicacion**, **id_etiqueta**)



guarda(**id_publicacion**, id_contenido)



cargaContenido(**id_contenido**, id_album, username)



cargaFoto(**id_contenido**, id_album, username)



cargaVideo(**id_contenido**, id_album, username)