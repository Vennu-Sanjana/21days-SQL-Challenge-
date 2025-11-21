Practice Questions :

1. Find patients who are in services with above-average staff count.

Select p.patient_id,p.name,p.service
from patients p
Join staff_schedule s
on p.service = s.service
Group by p.patient_id, p.name, p.service
Having Count(s.staff_id) > 
      (select AVG(staff_count)
	  from (
	     Select service, count(staff_id) as staff_count
	     from staff_schedule
		 Group by service)
		 );

2. List staff who work in services that had any week with patient satisfaction below 70.

Select Distinct s.staff_id,s.service,w.patient_satisfaction
From staff_schedule s
Join services_weekly w
   on s.service = w.service
where w.patient_satisfaction < 70;

3. Show patients from services where total admitted patients exceed 1000.

Select Distinct p.patient_id, p.name,p.service
from patients p 
Join services_weekly w
on p.service = w.service
Where p.service IN
      (Select service
	  From services_weekly
	  Group by Service
	  Having SUM(patients_admitted) > 1000);

Challenge Question :

Find all patients who were admitted to services that had at least one week where patients were refused 
AND the average patient satisfaction for that service was below the overall hospital average satisfaction.
Show patient_id, name, service, and their personal satisfaction score.

Select Distinct p.patient_id,p.name,p.service,s.patient_satisfaction
from patients p
Join services_weekly s
on p.service = s.service
where p.service IN
         (Select service
		 from services_weekly
		 where patients_refused > 0
		 Group by service)
And p.service In
          (Select service
		  from services_weekly 
		  Group by service
		  Having AVG(patient_satisfaction) < 
		  (Select Avg(patient_satisfaction)
		  from services_weekly)
		  );