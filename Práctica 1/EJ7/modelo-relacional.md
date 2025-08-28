# Transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional



user(\*\*email\*\*, nombre, peso, altura)



entrenamiento(\*\*id\_entrenamiento\*\*, calorias, tiempo)



correr(\*\*id\_entrenamiento\*\*, velocidad)



objetivo(\*\*id\_objetivo\*\*, objetivo\_tiempo, porcentaje\_obtenido)



logro(\*\*id\_logro\*\*, nombre, desc)



fecha(\*\*id\_fecha\*\*, fecha)



realiza(\*\*email\*\*, \*\*id\_entrenamiento\*\*)



tiene(\*\*id\_entrenamiento\*\*, id\_objetivo)



obtiene(\*\*email\*\*, \*\*id\_logro\*\*)



sucede(\*\*id\_fecha\*\*, \*\*email\*\*, \*\*id\_logro\*\*)


