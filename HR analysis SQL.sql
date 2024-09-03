select * from hr_1;
select * from hr_2;
------ KPI-1 ---------
select Department,count(attrition) `Number of Attrition`from hr_1
where attrition = 'yes'
group by Department;
---- create a view -----
create view Dept_average as
select department, round(count(attrition)/(select count(employeenumber) from hr_1)*100,2)  as attrtion_rate
from hr_1
where attrition = "yes"
group by department;
select * from dept_average;

----- KPI-2 ------
---- create a stored procedure -----
call emp_role('male',"Research Scientist");
---- KPI-3 -----
select h1.department,
round(count(h1.attrition)/(select count(h1.employeenumber) from hr_1 h1)*100,2) `Attrtion rate`,
round(avg(h2.MonthlyIncome),2) average_incom from hr_1 h1 join hr_2 h2
on h1.EmployeeNumber = h2.`employee id`
where attrition = 'Yes'
group by h1.department;

create view Attrition_employeeincome as
select h1.department,
round(count(h1.attrition)/(select count(h1.employeenumber) from hr_1 h1)*100,2) `Attrtion rate`,
round(avg(h2.MonthlyIncome),2) average_income from hr_1 h1 join hr_2 h2
on h1.EmployeeNumber = h2.`employee id`
where attrition = 'Yes'
group by h1.department;
select * from attrition_employeeincome;

----- kpi-4 -----
select h1.department,Round(avg(h2.totalworkingyears),0) from hr_1 h1
join hr_2 h2 on h1.employeenumber = h2.`Employee ID`
group by h1.department;

Create view `Employee Age` as 
select h1.department,Round(avg(h2.totalworkingyears),0) from hr_1 h1
join hr_2 h2 on h1.employeenumber = h2.`Employee ID`
group by h1.department;

select * from `employee age`;
----  kpi-5 ----
select * from hr_2;
select h1.jobrole,h2.worklifebalance, count(h2.worklifebalance) Employee_count
from hr_1 h1 join hr_2 h2
on h1.employeenumber = h2.`Employee ID`
group by h1.jobrole,h2.worklifebalance
order by h1.jobrole;
--- create a stored procedure ----- 
 ---- KPI-6 ---
select * from hr_2;
select h2.`YearsSinceLastPromotion`,count(h1.attrition)  attrition_count
from hr_1 h1 join hr_2 h2 on h1.employeenumber = h2.`employee id`
where h1.attrition = 'Yes'
group by `YearsSinceLastPromotion`
order by `YearsSinceLastPromotion`;







