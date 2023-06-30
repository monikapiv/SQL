1. ÚLOHA: Uveďte ako by ste vytvorili tabuľku EMPLOYEE2 identickú s tabuľkou EMPLOYEE

create table w18mp3107.EMPLOYEE2 as (select * from wsqla.employee e) with no data;
--select * from w18mp3107.employee2;

2. ÚLOHA: Naplňte tabuľku EMPLOYEE2 dátami z tabuľky employee ale bez MANAGEROV

select * from wsqla.employee e
where job <> 'MANAGER'; 

insert into w18mp3107.EMPLOYEE2
select *
from wsqla.employee e
where job <> 'MANAGER';

select * from w18mp3107.EMPLOYEE2;

3. ÚLOHA: Zistite ktorý zamestnanec v tabuľke EMPLOYEE má najvyšší plat. (uveďte v SELECTE priezvisko a plat)

select max(salary) from wsqla.employee e;

select lastname, salary from wsqla.employee e
where salary = (select max(salary) from wsqla.employee e);

4. ÚLOHA: Vymažte všetkých zamestnancov, ktorých priezvisko má druhé písmeno veľké E z tabuľky EMPLOYEE2

select lastname from w18mp3107.EMPLOYEE2 
where lastname like '_E%';

delete from w18mp3107.EMPLOYEE2 where lastname like '_E%';

5. ÚLOHA (B): Zistite ktoré oddelenie má najvyšší priemerný plat v employee


select workdept, round(avg(salary), 0) as avg_salary
from wsqla.employee e
group by workdept
order by 2 desc
limit 1;
	 
select 

select * from wsqla.employee e;

select max(avg_salary)
from (select workdept as avg_workdept, round(avg(salary), 0) as avg_salary
		from wsqla.employee e
		group by workdept) as ms;

select workdept, round(avg(salary), 0) as avg_salary
from wsqla.employee e
group by workdept
having  round(avg(salary), 0) = (select max(avg_salary)
	    from (select workdept as avg_workdept, round(avg(salary), 0) as avg_salary
		from wsqla.employee e
		group by workdept) as ms);



6. ÚLOHA (B): Zistite počet aktivít pre každé oddelenie, usporiadajte podlľa počtu aktivít zostupne.  
Použite tabuľky EMP_ACT, EMPLOYEE. Číslo aktivity je v stĺpci ACTNO.


select workdept, actno  
from 
wsqla.emp_act ea
join
wsqla.employee e
on ea.empno = e.empno 
order by 2,1;

select workdept, actno, count(*)
from (select workdept, actno  
      from 
      wsqla.emp_act ea
      join
      wsqla.employee e
      on ea.empno = e.empno 
      order by 2) as abc
group by workdept, actno
order by 1, 3 desc;

select workdept, count(actno)
from (select workdept, actno  
      from 
      wsqla.emp_act ea
      join
      wsqla.employee e
      on ea.empno = e.empno 
      order by 2) as abc
group by workdept
order by 2 desc;




