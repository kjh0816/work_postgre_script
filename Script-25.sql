select dt as ����,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as ���� ,
areausr as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as �̸�,
sum(����A) as ���ΰ���,sum(�ڱ�A) as �ڱް���, sum(�Ͽ�����A) as �Ͽ����ϰ���, sum(����) as ��������Ƚ��, sum(����) as ��������Ƚ��, sum(��ȸ) as ��ȸ����Ƚ��, sum(����) as ����Ƚ��, sum(sil) as ���˽����Ǽ�, sum(bang) as �����ѽü���
from (	            
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����A,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����,
0 as sil,
0 as bangfrom
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1	      
union all
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr, telno,
0,0,0,0,0,0,1,0,0 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno
union all
select substring(jungdt,1,8) dt, A.updepcd, A.depcd, A.areausr,A.fact_telno, 0,0,0,0,0,0,0,1,0  from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
where jungdt between '20210101'|| '000000' and '20210531'|| '235959'
union all
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
0,0,0,0,0,0,0,0,1
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm

) aaa  group by dt,updepcd, depcd , areausr;


-- ������ ����, �ڱ� ������
select
rev_Date, updepcd, depcd1, hochul_id, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as ����A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as �ڱ�A,
0,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1' ;

select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
1,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='2';

select * from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='2' 
and( wanro_flag is not null or wanro_flag != '0') ;


select *  from tb_repair tr  where wanro_flag ='2' and rev_date between '20210101' and '20210531';


select * from  tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='2'; 


select 
substring(jungdt,1,8) dt
, A.updepcd, 
A.depcd,
A.areausr,
0,0,0,0,0,0,0,1,0  from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
where jungdt between '20210101'|| '000000' and '20210531'|| '235959'

select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='3' 
and ( wanro_flag is not null or wanro_flag != '0')
;


-- ��¥, ����, ����, ���, ����ڸ�, �ݼ���-���ΰ���, �ݼ���-�ڱް���, �ݼ���-1541,cpms����Ǽ�, �ݼ���-����ó��, �ݼ��� �ڱ�ó��, �ݼ���-1541ó��, cpmsó��, ��������, ����Ƚ��, �����ѽü��� 
select 
rev_Date,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd1  and deptreecnt in ('3') group by depnm)  as ���� ,
hochul_id as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.hochul_id  ) as �̸�,
sum(callmu) as �ݼ��͹��ΰ���,
sum(callja) as �ݼ����ڱް���,
sum(callone) as �ݼ����Ͽ����ϰ���,
sum(cpmsgo) as cpms����,
sum(callmujung) as �ݼ��͹���ó��,
sum(calljajung) as �ݼ����ڱ�ó��,
sum(callonejung) as �ݼ����Ͽ�����ó��,
sum(callcpmsjung) as cpmsó��,
sum(cpmsghl) as cpmsȸ��,
sum(junggi) as ��������,
sum(jub) as ����,
sum(jungsisal) as �����ѽü���
from (
select
rev_Date, updepcd, depcd1, hochul_id, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as callmu,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as callja,
0 as callone,
0 as cpmsgo,
0 as callmujung,
0 as calljajung,
0 as callonejung,
0 as callcpmsjung,
0 as cpmsghl,
0 as junggi,
0 as jub,
0 as jungsisal
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1' 
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='3'
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='2'
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
0,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as callwanmu,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as callwanja,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1' 
and( wanro_flag is not null or wanro_flag != '0') 
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='3' 
and ( wanro_flag is not null or wanro_flag != '0')
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='2' and lstusr != '30000'
and ( wanro_flag is not null or wanro_flag != '0') 
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0
from tb_repair where wanro between '20210101' and '20210531' and rev_cd ='2' and lstusr = '30000'
and ( wanro_flag is not null or wanro_flag != '0') 
union all
select 
substring(jungdt,1,8) dt,
A.updepcd, 
A.depcd,
A.areausr,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0 from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
where jungdt between '20210101'|| '000000' and '20210531'|| '235959'
union all
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno
union all
select  dt,
tm.updepcd,
tm.depcd,
areausr,   
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm
) aaa  group by rev_date ,updepcd, depcd1 , hochul_id;


select * from tb_maintain tm where  jungid ='02438' and jungtel in (select gojang_tel from tb_repair tr where rev_date like '20210328%' and hochul_id ='02438') and jungdt like '2021%';

select * from tb_repair tr where rev_date like '20210328%' and hochul_id ='02438';

select * from bimastercf b where lstusr ='30000';

select * from user_source where text like '%30000%';

select * from tb_repair tr where lstusr ='30000' and rev_table = 'ktlcpms.t_jubsu';


select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='5';
select * from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='5';

select * from tb_repair tr where rev_date ='20210102' and hochul_id ='01896'