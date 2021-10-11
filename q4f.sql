select inspector.iname
from inspector, restaurant, inspection
where restaurant.city='Haifa' and inspection.lno=restaurant.lno and inspector.iid=inspection.iid
group by inspector.iname, inspector.iid, restaurant.city 
having count('Haifa')=all(select count(*) from restaurant where restaurant.city='Haifa')