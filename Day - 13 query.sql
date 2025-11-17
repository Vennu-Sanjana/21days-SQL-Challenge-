Practice Questions : 

1. Join patients and staff based on their common service field 
(show patient and staff who work in same service).

Select 
     p.name as patient,
     s.staff_name as staff,
     s.service as service
from patients p
inner join staff s 
on p.service = s.service;

2. Join services_weekly with staff to show weekly service data with staff information.

Select 
    sw.week,
	sw.service,
	s.staff_name,
	s.role
from services_weekly sw
inner join staff s 
on sw.service = s.service

3. Create a report showing patient information along with staff assigned to their service.

Select 
    p.name as patient,
	p.age as age,
	p.service,
	s.staff_name,
	s.role
from patients p
Inner join staff s
on p.service = s.service;

Challenge Question : 

Create a comprehensive report showing patient_id, patient name, age, service, and the total 
number of staff members available in their service. Only include patients from services
that have more than 5 staff members. Order by number of staff descending, then by patient name.

Select
    p.patient_id, 
	p.name as patient_name,
	p.age as age,
	p.service,
	count(s.staff_id) as total_staff
from patients p
Inner Join staff s
on p.service = s.service
Group by 
    p.patient_id,p.name,p.age,p.service
having count(s.staff_id) > 5
order by 
    total_staff Desc, 
	patient_name ASC;





