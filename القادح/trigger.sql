CREATE OR REPLACE TRIGGER PAYROLL_TRIGGER
after DELETE OR UPDATE
ON PAYROLL
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
if (updating and (:old.IS_DONE='1')) then
raise_application_error(-20001, 'Can not Update');
end if;
if (deleting and (:old.IS_DONE='1')) then
raise_application_error(-20001, 'Can not delete');
end if;
end;