Practice Questions : 

1.List all unique services in the patients table.

Select Distinct Service 
from patients ;

2. Find all unique staff roles in the hospital.

Select Distinct role
from staff;

3. Get distinct months from the services_weekly table.

Select Distinct month
from services_weekly

Challenge Question : 

Find all unique combinations of service and event type from the services_weekly table where
events are not null or none, along with the count of occurrences for each combination. Order by count
descending.

Select 
         Service,
         event,
		 count(*) as total_count
from services_weekly
where event is not null 
and event <> 'none'
Group by service,event
order by total_count DESC;



