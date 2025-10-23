CREATE INDEX idx_doctor_specialty ON doctor(doctor_specialty);
CREATE INDEX idx_patient_city ON patient(patient_city);

explain select count(a.patient_id)
from appointment a, patient p, doctor d, medical_review mr
where a.patient_id= p.patient_id
and a.patient_id= mr.patient_id
and a.appointment_date=mr.appointment_date
and mr.doctor_id = d.doctor_id
and d.doctor_specialty = 'Cardiology'
and p.patient_city = 'Rosario'
