Investigation steps :

1. Identify where and when the crime happened

SELECT 
    room AS crime_scene,
    entry_time AS crime_time
FROM keycard_logs
WHERE room = 'CEO Office'
ORDER BY entry_time DESC;

2. Analyze who accessed critical areas at the time  

SELECT 
    e.name,
    k.room AS crime_scene,
    k.entry_time,
    k.exit_time
FROM keycard_logs k
JOIN employees e 
    ON k.employee_id = e.employee_id
WHERE 
    k.room = 'CEO Office'
    AND k.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:15'
ORDER BY k.entry_time;

3. Cross-check alibis with actual logs

SELECT a.*, kl.log_id, kl.room, kl.entry_time, kl.exit_time
FROM alibis a
LEFT JOIN keycard_logs kl
ON a.employee_id = kl.employee_id
AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time
ORDER BY alibi_id;

4. Investigate suspicious calls made around the time

SELECT 
    c.caller_id, 
    e1.name AS caller_name, 
    c.receiver_id, 
    e2.name AS receiver_name, 
    c.call_time, 
    c.duration_sec
FROM calls c
JOIN employees e1 ON c.caller_id = e1.employee_id
JOIN employees e2 ON c.receiver_id = e2.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00';

5. Match evidence with movements and claims

SELECT 
    e.evidence_id,
    e.room AS evidence_room,
    e.description AS evidence_description,
    e.found_time,
	kl.employee_id,
    emp.name AS employee_name,
    kl.entry_time,
    kl.exit_time,
	a.claimed_location,
    a.claim_time
FROM evidence e
LEFT JOIN keycard_logs kl
    ON e.room = kl.room
LEFT JOIN employees emp
    ON kl.employee_id = emp.employee_id
LEFT JOIN alibis a
    ON kl.employee_id = a.employee_id
ORDER BY e.evidence_id;

6. Combine all findings to identify the killer

SELECT DISTINCT
    emp.employee_id,
    emp.name AS employee_name,
    kl.room AS movement_room,
    kl.entry_time,
    kl.exit_time,
    a.claimed_location,
    a.claim_time
FROM keycard_logs kl
JOIN employees emp
    ON kl.employee_id = emp.employee_id
LEFT JOIN alibis a
    ON a.employee_id = kl.employee_id
WHERE 
    kl.room = 'CEO Office'
    AND kl.entry_time <= '2025-10-15 21:00'
    AND kl.exit_time >= '2025-10-15 20:50';

Full name of killer is David Kumar