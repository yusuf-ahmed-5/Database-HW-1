-- 1
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.bill_no IN (00014, 00017);

-- 6
SELECT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff s ON (rm.headwaiter = s.staff_no OR s.headwaiter = rm.headwaiter)
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;