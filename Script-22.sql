select * from tb_repair tr; 

select * from pt_ttcoboxno pt; 

tb_ttcossdd



select * from tb_maintain where jungsn in ('1595265','1599310');

select * from pt_factmthist pf where pf.fact_telno = '006102420954'  and  pf.sttdt  < substring('20210104091706' ,1,8) and pf.lstdt > substring('20210104091706' ,1,8) and opflag != 'F'
 
select substring(jungdt, 1,8),tm.updepcd, tm.depcd, pf.areausr,sum(decode(pf.uniind, '1', 1, 0)),sum(decode(pf.uniind, '2', 1, 0)), sum(decode(pf.uniind, '3', 1, 0)),
sum(decode(junggb,'T',1,0)), sum(decode(junggb,'P',1,0)), sum(decode(junggb,'R',1,0)),0
from tb_maintain tm
left outer join (select fact_telno, sttdt, lstdt, area , areausr, uniind from pt_factmthist where opflag != 'F') pf   
on pf.fact_telno = tm.jungtel  and  pf.sttdt  <= substring(tm.jungdt ,1,8) and pf.lstdt >= substring(tm.jungdt ,1,8) 
where substring(jungdt, 1,8) between '20210101' and '20210531' group by jungdt, tm.updepcd, tm.depcd, pf.areausr ;



select dt, updepcd, depcd, areausr, sum(mu), sum(ja), sum("1541"), sum("go"), sum(ea), sum(soon), sum(jib) from (
select dt, updepcd, depcd, areausr, sum(decode(uniind,'1',1,0)) mu, sum(decode(uniind,'2',1,0)) ja, sum(decode(uniind,'3',1,0)) "1541",
sum(decode(junggb,'T',1,0)) as "go", sum(decode(junggb,'P',1,0)) as ea,sum(decode(junggb,'R',1,0)) as soon,0 as jib
from
(
select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr,
(select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)) uniind,
 tm.junggb 
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
) group by dt, updepcd, depcd, areausr
 union all
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr,
0,0,0,0,0,0,count(1) from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr 
)
group by  dt, updepcd, depcd, areausr
;



select dt, updepcd, depcd, areausr,sum(무인) from (
select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
union all
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr
) group by dt, updepcd, depcd, areausr;


select sum(무인) from (
select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
)
;


select * from biintmt b where  useflag ='Y' and deptreecnt in ('2');

select distinct areanm from pt_areamt pa where uniind ='1' and areausr = 

select dt as 일자,
(select depnm from biintmt b where depcd = aaa.updepcd and useflag ='Y' and deptreecnt in ('2','3','4') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd   and deptreecnt in ('3') group by depnm)  as 지사 ,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as 이름,
sum(무인) as 무인,sum(자급) as 자급, sum(일오사일) as 일오사일, sum(고장) as 고장, sum(예방) as 예방, sum(순회) as 순회, sum(집금) as 집금
from (
select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
union all 
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr
) aaa group by dt,updepcd, depcd , areausr;



select * from tb_ttcpmsdd tt where telno ='003108460149'; 

select * from 