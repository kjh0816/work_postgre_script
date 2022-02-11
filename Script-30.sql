select * from tb_user_password tup where usrcd = 'admi2' and lastdt = '20211230'; 

select * from tb_batch;

proc_geterp_fi_asset;


select * from bimastercf b where usrcd ='admi2'; -- 01049219810


select * from user_source where text like '%sms_payphone%';

PROC_MAKEOTP


SELECT trim(to_char(trunc(random() * 10000)::int,'0000')); 

payphone.bimastercf

select
	a.usrcd as usrCd ,
	a.usrname as usrName ,
	case
		when a.dephighcd <> '1600'
		and i.deptreecnt = '2' then a.dephighcd
		else a.depcd
	end as depCd ,
	a.deplvl as depLvl ,
	a.dephighcd as depHighCd ,
	a.bsnind as bsnInd ,
	a.gubun as gubun ,
	a.hp_no as hpNo ,
	a.lstusr as lstUsr ,
	a.lstdt as lstDt ,
	b.errcnt as errCnt ,
	b.usrpwd as usrPwd ,
	b.cretdt as cretDt ,
	b.editdt as editDt ,
	b.lastdt as lastDt ,
	a.group_nm_en groupNmEn ,
	i.deptreecnt as depTreeCnt ,
	c.distuse as distUse ,
	c.distmeter as distMeter ,
	c.agreuse as agreUse ,
	c.agregroup as agreGroup ,
	nvl(d.area,
	'') as area
from
	payphone.bimastercf as a
left outer join payphone.tb_user_password as b on
	a.usrcd = b.usrcd
left outer join payphone.biintmt as i on
	a.depcd = i.depcd
	and i.deptreecnt in ('1', '2', '3', '4')
left outer join (
	select
		depcd,
		areausr,
		area
	from
		payphone.pt_areamt
	where
		area_use = 'Y'
		and area_to = '99991231'
		and uniind = '1') d on
	a.depcd = d.depcd
	and a.usrcd = d.areausr ,
	payphone.tb_repairset c
where
	a.usrcd = '99999'
limit 1 