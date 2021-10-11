with temp1 as(
select inspector.iname, inspector.iid, count(inspection.passed) as num
from inspector, inspection, restaurant
where inspection.iid=inspector.iid and restaurant.city!='Eilat' and restaurant.lno=inspection.lno
group by inspector.iname, inspector.iid, inspection.passed
having inspection.passed=0

intersect
select inspector.iname, inspector.iid, count(inspection.passed)
from inspector, inspection, restaurant
where inspection.iid=inspector.iid and restaurant.lno=inspection.lno
group by inspector.iname, inspector.iid, inspection.passed
)

select iname, iid, max(num)
from temp1
where num=(select max(num) from temp1)
group by iname, iid