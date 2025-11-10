Practice Questions : 

1. Find services that have admitted more than 500 patients in total.

Select Service,
     sum(patients_admitted) as patients_count
from services_weekly
group by service
having sum(patients_admitted) > 500;

2. Show services where average patient satisfaction is below 75.

Select Service, 
       Avg(patient_Satisfaction) as avg_patient_satisfaction
from services_weekly
group by service
having Avg(patient_Satisfaction) < 75;

Select Service,
 round(Avg(patient_satisfaction),2) as avg_patient_satisfaction
from services_weekly
group by service
order by Avg(patient_satisfaction);

---Output : No services fell below the 75 satisfaction, a positive performance indicator.

3. List weeks where total staff presence across all services was less than 50.

SELECT 
    week,
    SUM(present) AS staff_presence
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;

Daily Challenge:

Identify services that refused more than 100 patients in total and had an average patient 
satisfaction below 80. Show service name, total refused, and average satisfaction.

Select 
  service, 
  Sum(patients_refused) as total_refused_patients,
  round(AVG(patient_satisfaction),2) as avg_satisfaction 
from services_weekly
Group by Service
having Sum(patients_refused) >100 and 
AVG(patient_satisfaction) < 80;