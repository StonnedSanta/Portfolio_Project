use telecom_churndb;

select * 
from telecom_customer_churn;

-- How many customers joined the company during the last quarter? How many customers joined?
select tenure, count(id)
from telecom_customer_churn
group by tenure
having tenure <=3
-- work in progress
