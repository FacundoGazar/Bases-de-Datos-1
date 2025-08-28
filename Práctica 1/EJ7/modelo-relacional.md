# Transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional



user(**email**, nombre, peso, altura)



entrenamiento(**id_entrenamiento**, calorias, tiempo)



correr(**id_entrenamiento**, velocidad)



objetivo(**id_objetivo**, objetivo_tiempo, porcentaje_obtenido)



logro(**id_logro**, nombre, desc)



fecha(**id_fecha**, fecha)



realiza(**email**, **id_entrenamiento**)



tiene(**id_entrenamiento**, id_objetivo)



obtiene(**email**, **id_logro**)



sucede(**id_fecha**, **email**, **id_logro**)




