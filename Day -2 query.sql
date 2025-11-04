Practice questions : 
1.Find all patients who are older than 60 years.
Select name,age  from patients where age > 60 

2.Retrieve all staff members who work in the 'Emergency' service.
Select staff_name from staff where service = 'emergency'

3.List all weeks where more than 100 patients requested admission in any service.
Select week 
from services_weekly
group by week
having sum(patients_request) > 100

Challenge Question : 
Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.

Select patient_id,name,age,satisfaction
from patients 
where service = 'surgery' and satisfaction > 70
