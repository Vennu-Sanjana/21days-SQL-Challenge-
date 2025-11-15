Practice Questions : 

1. Find all weeks in services_weekly where no special event occurred.

Select week 
from services_weekly 
where event is null
or event = 'none';

2. Count how many records have null or empty event values.

Select count(*)
from services_weekly
where event is null or event = '' or event = 'none';

3. List all services that had at least one week with a special event.

Select Distinct service
from services_weekly
where event is not null 
and event <> ''
and event <>'none';

Challenge Question : 

Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status 
('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale.
Order by average patient satisfaction descending.

Select
  Case When event IS NOT NULL and event <> '' and event <> 'none'
       THEN 'With Event' ELSE 'No Event' END AS event_status,
  Count(*) AS week_count,
  round(Avg(patient_satisfaction),2) as avg_patient_satisfaction,
  round(Avg(staff_morale),2) as avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction Desc;



