Practice Questions : 

1. Combine patient names and staff names into a single list.

Select name as patient_name
from patients 

union 

select staff_name 
from staff_schedule;

2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).

Select name, 'high_satisfaction_patients' as category
from patients
where satisfaction > 90 

union all

select name, 'low_satisfaction_patients' as category
from patients
where satisfaction < 50;

3. List all unique names from both patients and staff tables.

select name
from patients

union

select staff_name
from staff;

Challenge Question : 

Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id),
full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or
'emergency' services. Order by type, then service, then name.

Select id,full_name,type,service
FROM(
SELECT patient_id as ID,name as full_name,'Patient' as type, service
FROM patients
WHERE service IN ('surgery','emergency')
UNION ALL
SELECT staff_id AS id, staff_name as full_name,'Staff' as type,service
FROM staff
WHERE service IN ('surgery','emergency')
) combined
ORDER BY type,service,full_name;



