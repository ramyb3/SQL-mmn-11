select restaurant.rname, count (inspection.lno) as numcheck
from restaurant, inspection

--last year + 1 = this year
where date_part('year',inspection.idate)+1=date_part('year',CURRENT_DATE) and inspection.lno=restaurant.lno
group by restaurant.rname 