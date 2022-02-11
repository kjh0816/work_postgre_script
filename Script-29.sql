select * from tb_attachfile ta where file_seq ='116720';

select * from tb_repair tr where rev_date like '2021%' and rev_cd =3; 



select * from bibsici b where prnm ='%Á¤ºñ%'; 

select * from biintmt b where depcd ='Q034';

qselect * from biintmt b where deptreecnt = 4 and useflag ='Y';

select * from tb_attachfile ta where lst_dt like '20211221%' and lst_usr ='admi2'; 

select * from  tb_repair where gojang_tel in (select fact_telno from pt_factmt pf where uniind ='2');

select * from icis_rcv_hist irh where be_svc_no ='006107211697' and rcv_date like '20211222%'; 

select * from pt_factmt pf where fact_telno ='006107211697';

select payphone.get_depnm(updepcd,2), payphone.get_depnm(depcd1,3), sum(muinCall), sum(cpms), sum(ja), sum(onefive)  from (
select updepcd, depcd1, count(1) as muinCall,0 as cpms,0 as ja,0 as oneFive  from tb_repair tr where rev_date like '2021%' and uniind ='1' and rev_cd ='1' group by updepcd, depcd1
union all
select updepcd, depcd1, 0,count(1),0,0  from tb_repair tr where rev_date like '2021%' and rev_cd ='2' group by updepcd, depcd1
union all 
select updepcd, depcd1, 0,0,count(1),0  from tb_repair tr where rev_date like '2021%' and uniind ='2'  group by updepcd, depcd1
union all
select updepcd, depcd1, 0,0, 0,count(1)  from tb_repair tr where rev_date like '2021%' and uniind ='3'  group by updepcd, depcd1
) group by updepcd, depcd1;


select updepcd, depcd1  from tb_repair tr where rev_date like '2021%' and uniind ='2'  group by updepcd, depcd1 ;

select updepcd_des, depcd1_des, uniind  from tb_repair tr where rev_date like '2021%'  and rev_cd ='2' group by updepcd_des, depcd1_des, uniind ;



select payphone.get_depnm(updepcd,2), payphone.get_depnm(depcd1,3), sum(muinCall), sum(cpms), sum(ja), sum(onefive)  from (
select updepcd, depcd1, count(1) as muinCall,0 as cpms,0 as ja,0 as oneFive  from tb_repair tr where rev_date like '2021%' and uniind ='1' and rev_cd ='1' group by updepcd, depcd1
union all
select updepcd, depcd1, 0,count(1),0,0  from tb_repair tr where rev_date like '2021%' and rev_cd ='2' group by updepcd, depcd1
union all 
select updepcd, depcd1, 0,0,count(1),0  from tb_repair tr where rev_date like '2021%' and uniind ='2'  group by updepcd, depcd1
union all
select updepcd, depcd1, 0,0, 0,count(1)  from tb_repair tr where rev_date like '2021%' and uniind ='3'  group by updepcd, depcd1
) group by updepcd, depcd1;



select
	'0' as check ,
	org.dephighcd as depHighCd ,
	tel.depcd as depCd ,
	tel.centerdepcd as accDepCd ,
	payphone.get_depnm(tel.centerdepcd,
	'4') accDepNm ,
	tel.ktdepcd as ktDepCd ,
	tel.depnm as depNm ,
	tel.depnm1 as depNm1 ,
	tel.oldktdepcd as oldKtDepCd ,
	tel.useflag as useFlag
from
	payphone.bitelmt tel,
	payphone.biintmt org
where
	1 = 1
	and tel.depcd = org.depcd
	and org.useflag = 'Y'
	and org.deptreecnt = 3
	and tel.depcd is not null
	and tel.useflag = 'Y'
order by
	tel.useflag desc
	
	
	
	select * from payphone.biintmt org where useflag ='Y' and deptreecnt in (2,3);