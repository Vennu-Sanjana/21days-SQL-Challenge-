Practice Questions : 

1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.

Select patient_id,name,
Case 
    when satisfaction between 85 and 100 Then 'High'
	when satisfaction between 70 and 84 Then 'Medium'
	when satisfaction between 60 and 69 Then 'Low'
End as satisfaction_level
from patients;

2. Label staff roles as 'Medical' or 'Support' based on role type.

SELECT
    role,
    CASE 
        WHEN role IN ('doctor', 'nurse') THEN 'Medical'
        WHEN role = 'nursing_assistant' THEN 'Support'
        ELSE 'Support'
    END AS role_type
FROM staff;

3. Create age groups for patients (0-18, 19-40, 41-65, 65+).

Select name,age,
   Case 
   when age between 0 and 18 Then 'Child'
   when age between 19 and 40 then 'Young adult'
   when age between 41 and 65 then 'Adult'
   when age > 65 then 'Senior'
   end as age_category
from patients;

Daily Challenge:

Create a service performance report showing service name, total patients admitted, and a performance 
category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65,
otherwise 'Needs Improvement'. Order by average satisfaction descending.

Select 
    service,
	count(*) as total_patients,
	round(Avg(satisfaction),2) as avg_satisfaction,
	case 
	    when avg(satisfaction) >=85 Then 'Excellent'
		when avg(satisfaction) >=75 Then 'Good'
		when avg(satisfaction) >=65 Then 'Fair'
		Else 'Needs Improvement'
		End as satisfaction_category
from patients
Group by service
order by satisfaction_category Desc;


