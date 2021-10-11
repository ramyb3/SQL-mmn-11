with temp1 as
(select date_part('month',idate) as _month, iname, count(*) as num
from inspection
natural join inspector
where date_part('year',inspection.idate)='2021'
group by _month, iname)

select *
from temp1
where (_month=1 and num=(select max(num) from temp1 where _month=1)) or
(_month=2 and num=(select max(num) from temp1 where _month=2)) or
(_month=3 and num=(select max(num) from temp1 where _month=3)) or
(_month=4 and num=(select max(num) from temp1 where _month=4)) or
(_month=5 and num=(select max(num) from temp1 where _month=5)) or
(_month=6 and num=(select max(num) from temp1 where _month=6)) or
(_month=7 and num=(select max(num) from temp1 where _month=7)) or
(_month=8 and num=(select max(num) from temp1 where _month=8)) or
(_month=9 and num=(select max(num) from temp1 where _month=9)) or
(_month=10 and num=(select max(num) from temp1 where _month=10)) or
(_month=11 and num=(select max(num) from temp1 where _month=11)) or
(_month=12 and num=(select max(num) from temp1 where _month=12))