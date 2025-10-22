/*
Utiliza la vista generada en el ejercicio anterior para resolver las siguientes
consultas:
c. Obtener los doctores que comparten ciudad con más de cinco pacientes. 
*/

SELECT dpp.doctor_id, COUNT(*) AS "Cantidad de pacientes con los que comparte ciudad"
FROM doctors_per_patients AS dpp
GROUP BY dpp.doctor_id
HAVING COUNT(doctor_id) > 5