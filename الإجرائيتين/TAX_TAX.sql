CREATE OR REPLACE procedure SARAHHW.tax_tax ( p_id in number ,inmonth in number, p_tax out number)
as
--cursor to get compensations of employee
cursor compen_tax_cal is
SELECT a.compen_value ,c.in_tax,c.PERCENT_CASH,extract(month from a.COMPEN_DATE)
 from emp_compen a left join COMPENSATION c on a.COMPENSATION_COMPEN_ID=c.compen_id
 where a.employee_emp_id=p_id AND extract(month from a.COMPEN_DATE) = inmonth;
 
--cursor to get discounts of employee
cursor disc_tax_cal is
SELECT a.disc_value ,c.in_tax,c.PERCENT_CASH,extract(month from a.disc_date)
 from emp_discount a left join discount c on a.discount_disc_id=c.disc_id
 where a.employee_emp_id=p_id AND extract(month from a.disc_date)=inmonth ;
 
--variable to calculate the salary after compensations and discounts in it
sal_for_tax employee.initial_sal%type :=0;

--cursor for calculate the tax according to salary_slices
cursor slices is
select * from sal_slice;

--To store the data of current salary slice
slice_row slices%rowtype;

--To store initial salary
this_initial EMPLOYEE.INITIAL_SAL%type;

begin
p_tax:=0;
select initial_sal into this_initial from employee where emp_id=p_id;
sal_for_tax:=this_initial;
for curs_comp in compen_tax_cal
loop
if (curs_comp.percent_cash='1' AND curs_comp.in_tax='1')
then 
sal_for_tax := sal_for_tax+(this_initial*curs_comp.compen_value/100);
end if;
if (curs_comp.percent_cash='0' AND curs_comp.in_tax='1')
then 
sal_for_tax :=sal_for_tax+ curs_comp.compen_value;
end if;
end loop;

for curs_disc in disc_tax_cal
loop
if (curs_disc.percent_cash='1' AND curs_disc.in_tax='1')
then 
sal_for_tax := sal_for_tax-(this_initial*curs_disc.disc_value/100);
end if;
if (curs_disc.percent_cash='0' AND curs_disc.in_tax='1')
then 
sal_for_tax :=sal_for_tax- curs_disc.disc_value;
end if;
end loop;

select * into slice_row from sal_slice where sal_for_tax between from_sal AND to_sal;
p_tax:=p_tax+((sal_for_tax-(slice_row.from_sal-1))*slice_row.percent/100);

open slices;
loop
fetch slices into slice_row;
exit when slices%notfound;
if(slice_row.to_sal<sal_for_tax) then
p_tax:=p_tax+((slice_row.to_sal-slice_row.from_sal)*slice_row.percent/100);
END IF;
end loop;
close slices ;
end;
/
