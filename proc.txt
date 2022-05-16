CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_staff_report`(
	in staff_code nvarchar(250),
    in staff_name nvarchar(250),
    in pre_date_of_birth nvarchar(100),
    in next_date_of_birth nvarchar(100),
    in pre_join_date nvarchar(100),
    in next_join_date nvarchar(100),
    in staff_status integer
)
BEGIN
	SELECT  st.id,
			st.code as staff_code,
			st.first_name as first_name,
			st.last_name as last_name,
			st.date_of_birth,
			st.join_date,
			case 
				when st.status = 1 then 'Working'
				when st.status = 2 then 'Has Retired'
			end as status,
			br.name as branch,
			dp.name as department,
			po.name as position
	FROM db_staff.staff st 
	join db_staff.branch br on st.branch_id = br.id
	join db_staff.department dp on st.department_id = dp.id
	join db_staff.position po on st.position_id = po.id
	where (staff_code is null or st.code like concat('%',staff_code,'%')) 
	and (staff_name is null or st.full_name like concat('%',staff_name,'%')) 
	and ((pre_date_of_birth is null and next_date_of_birth is null) or (st.date_of_birth between str_to_date(pre_date_of_birth,'%Y-%m-%d')  and str_to_date(next_date_of_birth,'%Y-%m-%d')))
	and ((pre_join_date is null and next_join_date is null) or (st.join_date between str_to_date(pre_join_date,'%Y-%m-%d')  and str_to_date(next_join_date,'%Y-%m-%d')))
    and (case when staff_status = -1 then st.status in (1,2) else st.status = staff_status end);
END