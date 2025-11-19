Practice Questions : 

1. Join patients, staff, and staff_schedule to show patient service and staff availability.

SELECT 
    p.name AS patient_name,
    p.service,
    s.staff_name,
    ss.week,
    ss.present
FROM patients p
JOIN staff s 
    ON p.service = s.service
JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id
       AND s.service = ss.service;

2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.

SELECT
    sw.week,
    sw.month,
    sw.service,
    sw.available_beds,
    sw.patients_request,
    sw.patients_refused,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event,
    s.staff_name,
    s.role,
    ss.present
FROM services_weekly sw
JOIN staff s
    ON sw.service = s.service
JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id
       AND s.service = ss.service
       AND sw.week = ss.week;

3. Create a multi-table report showing patient admissions with staff information.

SELECT
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.arrival_date,
    p.departure_date,
    p.service,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.week,
    ss.present
FROM patients p
JOIN staff s
    ON p.service = s.service
JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id
    AND s.service = ss.service;

Challenge Question : 

Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted
that week, total patients refused, average patient satisfaction, count of staff assigned to service,
and count of staff present that week. Order by patients admitted descending.

SELECT
    sw.service,
	max(sw.patients_admitted) as total_patients_admitted,
	max(sw.patients_refused) as total_patients_refused,
	round(avg(sw.patient_satisfaction),2) as avg_satisfaction,
	Count(Distinct s.staff_id) as total_staff,
	Count(Case When ss.week = 20 and ss.present = 1 then ss.staff_id END) as staff_present_week_20
From services_weekly sw
Left join staff s ON sw.service = s.service
Left join staff_schedule ss on s.staff_id = ss.staff_id
where sw.week = 20
Group by sw.service
Order by total_patients_admitted DESC;