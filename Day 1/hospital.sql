USE hospital_lab;
SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointments a
LEFT JOIN patients p
ON a.patient_id = p.patient_id
LEFT JOIN doctors d
ON a.doctor_id = d.doctor_id;


SELECT 
    d.doctor_name,
    d.specialization
FROM appointments a
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed';


SELECT 
    a.appointment_id,
    p.patient_name,
    a.appointment_date
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
WHERE p.city = 'Hyderabad';


SELECT 
    p.patient_id,
    p.patient_name,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id;


SELECT 
    p.patient_id,
    p.patient_name
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;


SELECT 
    d.doctor_id,
    d.doctor_name,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id;


SELECT 
    d.doctor_id,
    d.doctor_name
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;


SELECT 
    a.appointment_id,
    a.patient_id,
    a.doctor_id,
    a.appointment_date,
    a.status
FROM appointments a
LEFT JOIN patients p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;


SELECT 
    appointment_id,
    patient_id,
    appointment_date,
    status
FROM appointments
WHERE doctor_id IS NULL;


SELECT 
    p.patient_name,
    d.doctor_name,
    d.specialization,
    d.consultation_fee,
    a.status
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id;


SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS appointment_count
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;


SELECT 
    d.doctor_id,
    d.doctor_name,
    SUM(d.consultation_fee) AS total_consultation_value
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.doctor_name;


SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS appointment_count
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING COUNT(a.appointment_id) > 1;


SELECT 
    d.specialization,
    SUM(d.consultation_fee) AS total_consultation_value
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.specialization
ORDER BY total_consultation_value DESC
LIMIT 1;


SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(a.appointment_id) AS appointment_count
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name;


SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(DISTINCT a.doctor_id) AS doctor_count
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name
HAVING COUNT(DISTINCT a.doctor_id) > 1;


SELECT DISTINCT
    p.patient_id,
    p.patient_name
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiology';


SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    d.consultation_fee
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE d.consultation_fee > 900;


SELECT 
    AVG(d.consultation_fee) AS average_consultation_fee
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed';


SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS completed_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.doctor_name
ORDER BY completed_appointments DESC
LIMIT 1;