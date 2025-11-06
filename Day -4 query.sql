Practice Questions : 

1. Display the first 5 patients from the patients table.

Select *  
from patients 
Limit 5;

2. Show patients 11-20 using OFFSET.

Select * 
from patients 
Limit 10
Offset 10;

3.Get the 10 most recent patient admissions based on arrival_date.

Select * 
from patients 
order by arrival_date Desc
Limit 10;

Daily Challenge:

Find the 3rd to 7th highest patient satisfaction scores from the patients table,
showing patient_id, name, service, and satisfaction. Display only these 5 records.

Select Patient_id, name, service, Satisfaction as satisfaction_score
from patients
order by satisfaction desc
Limit 5
offset 2;




