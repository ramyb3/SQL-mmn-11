select manager.mname, manager.mobile
from manager, restaurant
where manager.city='Karmiel' and restaurant.city=manager.city and manager.mid!=restaurant.mid