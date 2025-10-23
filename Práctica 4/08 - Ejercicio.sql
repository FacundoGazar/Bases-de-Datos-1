/*
Crear un Trigger de modo que al insertar un dato en la tabla Appointment, se
actualice la cantidad de appointments del paciente, la fecha de actualización y el
usuario responsable de la misma (actualiza la tabla APPOINTMENTS PER
PATIENT).
*/

DELIMITER $$

CREATE TRIGGER act_app AFTER INSERT ON appointment FOR EACH ROW BEGIN
	IF EXISTS (
		SELECT 1
        FROM appointments_per_patient AS app
        WHERE app.id_patient = NEW.patient_id
    )
    THEN
		UPDATE appointments_per_patient
        SET 
			count_appointments = (
				SELECT COUNT(*)
				FROM appointment AS a
				WHERE a.patient_id = NEW.patient_id
			),
			last_update = NOW(),
			user = CURRENT_USER()
        WHERE id_patient = NEW.patient_id;
	ELSE
		INSERT INTO appointments_per_patient(id_patient, count_appointments, last_update, user)
        VALUES (NEW.patient_id, 1, NOW(), CURRENT_USER());
	END IF;
END$$