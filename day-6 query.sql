Practice Questions : 

1. Count the number of patients by each service.

Select service, count(*) as total_patients 
from patients 
group by service;

2. Calculate the average age of patients grouped by service.

Select service,
round(avg(age),2) as avg_age
from patients 
group by service;

3. Find the total number of staff members per role.

Select role,
count(*) as staff_members
from staff
group by role;

Daily Challenge:

Question: For each hospital service, calculate the total number of patients admitted,
total patients refused, and the admission rate (percentage of requests that were admitted).
Order by admission rate descending.

Select 
  service,
sum(patients_admitted) as total_patients_admitted,
sum(patients_refused) as total_patients_refused,
round(SUM(patients_admitted) * 100.0 / (SUM(patients_admitted) + SUM(patients_refused)),2)
AS admission_rate
from services_weekly
group by service 
order by admission_rate desc;








