Practice Questions :

1. Show each patient with their services average satisfaction as an additional column 

Select 
   p.patient_id,
   p.name, 
   p.service,
   s.avg_satisfaction
from patients p 
join   
(Select 
    service,
	round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly 
Group by service
) s
on p.service = s.service;

2. Create a derived table of service statistics and query from it.

Select 
    p.Patient_id,
	p.name,
	p.service,
	s.total_beds_available,
	s.total_patients_admitted,
	s.avg_satisfaction
from patients p
Join 
(Select 
   service,
   round(avg(patient_satisfaction),2) as avg_satisfaction,
   sum(available_beds) as total_beds_available,
   sum(patients_admitted) as total_patients_admitted
   from services_weekly 
   Group by service ) s
on p.service = s.service;

3. Display staff with their services total patient count as a calculated field 

Select s.staff_id,
       s.staff_name,
	   s.service,
	   p.total_patients_count
from staff s
Join 
	  (Select 
	      p.service, 
		  count(patient_id) as total_patients_count
		from patients p
		Group by service
		) p
on s.service = p.service;

Challenge Question :

Create a report showing each service with: service name, total patients admitted, the difference 
between their total admissions and the average admissions across all services, and a rank indicator
('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.

Select 
    service,
    Sum(patients_admitted) AS total_patients_admitted,
    Sum(patients_admitted) - (
        Select round(AVG(total_per_service),2)
        From (
            Select SUM(patients_admitted) AS total_per_service
            From services_weekly
            Group by service
        ) avg_table
    ) AS difference_from_average,
    CASE 
        When Sum(patients_admitted) > (
            Select AVG(total_per_service)
            From (
                Select SUM(patients_admitted) AS total_per_service
                From services_weekly
                Group by service
            ) avg_table
        ) Then 'Above Average'
        When SUM(patients_admitted) = (
            Select AVG(total_per_service)
            From (
                Select SUM(patients_admitted) AS total_per_service
                From services_weekly
                Group by service
            ) avg_table
        ) Then 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
From services_weekly
Group by service
Order by total_patients_admitted DESC;




