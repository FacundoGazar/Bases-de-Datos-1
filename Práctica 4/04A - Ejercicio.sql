/*
Utiliza la vista generada en el ejercicio anterior para resolver las siguientes
consultas:
b. Obtener los nombres de los pacientes sin doctores en su ciudad
*/

SELECT p.patient_name
FROM patient as p LEFT JOIN doctors_per_patients as dpp
ON p.patient_id = dpp.patient_id
WHERE dpp.doctor_id IS NULL

