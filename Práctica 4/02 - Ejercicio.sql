/*
Hallar aquellos pacientes que para todas sus consultas médicas siempre hayan
dejado su número de teléfono primario (nunca el teléfono secundario).
*/

SELECT patient_id
FROM patient as p
WHERE NOT EXISTS (
	SELECT 1
    FROM appointment as ap
    WHERE ap.patient_id = p.patient_id
    AND ap.contact_phone <> p.primary_phone
)