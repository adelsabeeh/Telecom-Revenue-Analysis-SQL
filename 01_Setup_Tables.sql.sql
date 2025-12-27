select first_name, order_id , order_date
from customers 
inner join orders on customers.id=orders.customer_id
where month(order_date)=12;