#1 Retrieve all columns from the patients table.
Select * from Patients 

#2 Select only the patient_id, name, and age columns from the patients table.
Select Patient_id,name,age from patients 

#3 Display the first 10 records from the services_weekly table.
Select * from Services_weekly
limit 10

### Daily Challenge:

Question: List all unique hospital services available in the hospital.

Select Distinct Service
from Patients