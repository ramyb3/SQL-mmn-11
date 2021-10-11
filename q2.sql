create function trigf1() returns trigger as $$
begin
	if (new.passed=0 and ((new.violations is null) or (new.violations=''))) then
	begin
		raise exception 'error!';	
		return null;
		end;
	
	else
		return new;	
	end if;
end;

$$ language plpgsql;

create trigger T1
before insert on inspection
for each row
execute procedure trigf1();