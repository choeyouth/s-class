-- distinct

select * from employees;

-- 1.employees
-- 직업이 어떤것들이 있는지 가져오시오. > job_id
select distinct job_id from employees;

-- 2.employees
-- 고용일이 2002~2004년 사이인 직원들은 어느 부서에서 근무합니까? > hire_date + department_id
select distinct department_id from employees
    where hire_date BETWEEN '2002/01/01' and '2004/12/31';

-- 3.employees
-- 급여가 5000불 이상인 직원들은 담당 매니저가 누구? > manager_id
select DISTINCT manager_id from employees
    where salary >= 5000;

select * from tblInsa;
-- 4.tblInsa
-- 남자 직원 + 80년대생들의 직급은 무엇입니까? > ssn + jikwi
select DISTINCT jikwi from tblInsa
    where ssn like '8%';

-- 5.tblInsa
-- 수당 20만원 넘는 직원들은 어디 삽니까? > sudang + city    
select DISTINCT city from tblInsa
    where sudang >= 200000;

-- 6.tblInsa
--연락처가 아직 없는 직원은 어느 부서입니까? > null + buseo
select DISTINCT buseo from tblInsa
    where tel is null;

