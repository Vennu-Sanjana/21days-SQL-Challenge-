Practice Questions : 

1. Extract the year from all patient arrival dates.

Select arrival_date,Extract(Year from arrival_date) as year_of_patient_arrival_date 
from patients 

2. Calculate the length of stay for each patient (departure_date - arrival_date).

Select patient_id, 
 departure_date - arrival_date as length_of_stay
from patients

3. Find all patients who arrived in a specific month.

Select Patient_id, arrival_Date
from patients
where Extract(Month from arrival_date) = 10;

Challenge Question : 

Calculate the average length of stay (in days) for each service, showing only services where the average 
stay is more than 7 days. Also show the count of patients and order by average stay descending.

Select
    service,
	count(Patient_id) as patient_count,
    round(AVG(departure_date - arrival_date),2) as avg_length_of_stay
from patients
Group by service
having round(AVG(departure_date - arrival_date),2) > 7
order by avg_length_of_stay DESC;


