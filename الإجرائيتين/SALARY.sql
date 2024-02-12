CREATE OR REPLACE procedure SARAHHW.salary(sal_month in number)
as
cursor emp_cur is
select emp_id,initial_sal from employee;
cur_id number;
cursor compen_sal_cal is
SELECT a.compen_value,a.COMPENSATION_COMPEN_ID ,c.PERCENT_CASH,extract(month from a.COMPEN_DATE)
 from emp_compen a left join COMPENSATION c on a.COMPENSATION_COMPEN_ID=c.compen_id
 where a.employee_emp_id=cur_id AND sal_month= extract(month from a.COMPEN_DATE);

cursor disc_sal_cal is
SELECT a.disc_value,a.DISCOUNT_DISC_ID,c.PERCENT_CASH,extract(month from a.disc_date)
 from emp_discount a left join discount c on a.discount_disc_id=c.disc_id
 where a.employee_emp_id=cur_id AND sal_month= extract(month from a.disc_date);
family_sal number(15):=0;
food number:=0;
housing number:=0;
work_nature number:=0;
social_insurance number:=0;
installment number:=0;
punishment_sal number:=0;
reward_sal number :=0;
sal_one_day number:=0;
total_abs number:=0;
tax number:=0;
init_sal number:=0;
fin_sal number:=0;
sal_date char(30);
begin
--to make sure that the month in the input of procedure was between of 1 and 12
if(sal_month between 1 AND 12) then
sal_date:='30/'||sal_month||'/'||extract(year from sysdate);
for cu in emp_cur
loop
family_sal:=0;
food :=0;
housing :=0;
work_nature :=0;
social_insurance :=0;
installment:=0;

select sum(value_in_month) into punishment_sal from punishment where punishment.employee_emp_id=cu.emp_id
AND (sal_month BETWEEN extract(month from punishment.punish_date) AND extract(month from punishment.punish_date)+ PUNISHMENT.FOR_N_MONTHS-1) ;
if(punishment_sal is null)
then
punishment_sal:=0;
end if;

select sum(value_in_month) into reward_sal from reward where reward.employee_emp_id=cu.emp_id
AND (sal_month BETWEEN extract(month from reward.reward_date) AND extract(month from reward.reward_date)+ reward.FOR_N_MONTHS-1) ;
if(reward_sal is null)
then
reward_sal:=0;
end if;

select sum(period_days) into total_abs from absence where absence.EMPLOYEE_EMP_ID=cu.emp_id
AND sal_month=extract(month from absence.absen_date);
if(total_abs is null)
then
total_abs:=0;
end if;

init_sal:=cu.initial_sal;

cur_id:=cu.emp_id;
fin_sal:=init_sal;
for curs_comp in compen_sal_cal
loop

if(curs_comp.COMPENSATION_COMPEN_ID=2)
then
food:=food+curs_comp.compen_value;
end if;
if(curs_comp.COMPENSATION_COMPEN_ID=4)
then
work_nature:=work_nature+curs_comp.compen_value;
end if;
if(curs_comp.COMPENSATION_COMPEN_ID=3)
then
housing:=housing+curs_comp.compen_value;
end if;
if(curs_comp.COMPENSATION_COMPEN_ID=1)
then
family_sal:=family_sal+curs_comp.compen_value;
end if;

if (curs_comp.percent_cash='1')
then 
fin_sal := fin_sal+(fin_sal*curs_comp.compen_value/100);
end if;
if (curs_comp.percent_cash='0')
then 
fin_sal :=fin_sal+ curs_comp.compen_value;
end if;
end loop;

for curs_disc in disc_sal_cal
loop
if(curs_disc.discount_disc_id=2)
then
installment:=installment+curs_disc.disc_value;
end if;
if(curs_disc.discount_disc_id=1)
then
social_insurance:=social_insurance+curs_disc.disc_value;
end if;
if (curs_disc.percent_cash='1')
then 
fin_sal := fin_sal-(fin_sal*curs_disc.disc_value/100);
end if;
if (curs_disc.percent_cash='0')
then 
fin_sal :=fin_sal-curs_disc.disc_value;
end if;
end loop;

sal_one_day:=(fin_sal)/30;

fin_sal:=fin_sal-(sal_one_day*total_abs);

fin_sal:=fin_sal+reward_sal-punishment_sal;

--call the tax procedure
begin tax_tax(cu.emp_id,sal_month,tax);end;
fin_sal:=fin_sal-tax;
insert into payroll values (cu.emp_id,family_sal,food,housing,work_nature,social_insurance,installment,punishment_sal,reward_sal,total_abs,tax,init_sal,fin_sal,to_date(sal_date,'dd/MM/YYYY'),1);
end loop;

else --if the month in the input of procedure was bigger than 12 or smaller than 1
DBMS_OUTPUT.PUT_LINE('please enter a number between 1 and 12 then retry..');
end if;
end;
/
