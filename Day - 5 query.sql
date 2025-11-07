Practice Questions : 

1. Count the total number of patients in the hospital.

Select count(*) as total_patients
from patients 

2. Calculate the average satisfaction score of all patients

Select round(avg(satisfaction),2) as satisfaction_score
from patients

3. Find the minimum and maximum age of patients.

Select Min(age) as minimum_age, 
Max(age) as maximum_age 
from patients 

Daily Challenge:

Calculate the total number of patients admitted, total patients refused, and the 
average patient satisfaction across all services and weeks. Round the average satisfaction 
to 2 decimal places.

Select
    sum(patients_admitted) as total_patients_admitted,
    sum(patients_refused) as total_patients_refused,
    round(avg(patient_satisfaction),2) as avg_satisfaction_score,
    count(Distinct week) as total_weeks
from services_weekly





