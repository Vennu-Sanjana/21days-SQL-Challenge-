Practice Questions : 

1. Rank patients by satisfaction score within each service.

Select 
  patient_id,
  name,
  service,
  satisfaction,
  Dense_rank() over (partition by service order by satisfaction DESC) as satisfaction_score
  from patients;

2. Assign row numbers to staff ordered by their name.

Select 
   staff_id,
   staff_name,
row_number() over (order by staff_name ASC) as staff
from staff;

3. Rank services by total patients admitted.

Select
  service,
  sum(patients_admitted) as total_patients_admitted,
DENSE_RANK() over(order by sum(patients_admitted)DESC) as Rank 
from services_weekly
Group by service;

Challenge Question : 

For each service, rank the weeks by patient satisfaction score (highest first). Show service, week,
patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.

Select * from(
Select 
    service,
	week,
	patient_satisfaction,
	patients_admitted,
Row_number() over(partition by service order by patient_satisfaction DESC) as rank
from services_weekly) as s
where rank<=3;
