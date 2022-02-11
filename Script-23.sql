

select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr, jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by tm.jungdt, tm.updepcd, tm.depcd,jungid, jungtel, junggb;



select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr, jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by tm.jungdt, tm.updepcd, tm.depcd,jungid, jungtel, junggb
union all 
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr, telno,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno;


select dt as ����,
(select depnm from biintmt b where depcd = aaa.updepcd and useflag ='Y' and deptreecnt in ('2','3','4') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd   and deptreecnt in ('3') group by depnm)  as ���� ,
areausr as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as �̸�,
sum(����) as ����,sum(�ڱ�) as �ڱ�, sum(�Ͽ�����) as �Ͽ�����, sum(����) as ����, sum(����) as ����, sum(��ȸ) as ��ȸ, sum(����) as ����
from (
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm
union all 
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr, telno,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno
) aaa group by dt,updepcd, depcd , areausr;



select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm
union all 
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr, telno,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno


select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm
where dt = '20210402' --between '20210101' and '20210531' 
and areausr = '00938'; 

select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb;

select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr,
(select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind)as ����,
junggb
from tb_maintain tm  where substring(jungdt, 1,8)  = '20210402' --between '20210101' and '20210531' 
and jungid = '00938';

select jungtel ,gpsx,gpsy from tb_maintain tm where jungdt like '20210104%' and jungid ='01870';

select * from tb_maintain_schedule tms;  



WITH FMTHST AS (
 SELECT UPDEPCD
	              , DEPCD
	              , UNIIND
	              , AREA
	              , FACT_TELNO
	              , PHONEKND
	              , STATUS
	              , UNINO
	              , LSTDT
	              , CASE WHEN UNIIND = '1' THEN GET_BIBSICI_PRNM('0628', PHONEKND)
	                     ELSE GET_BIBSICI_PRNM('2066', UNIIND) END TEL_GB_NM
	              , RN
	         FROM (
	              SELECT UPDEPCD
	                     , DEPCD
	                     , UNIIND
	                     , AREA
	                     , FACT_TELNO
	                     , PHONEKND
	                     , STATUS
	                     , UNINO
	                     , LSTDT
	                     , HISTSN
	                     , RANK() OVER (PARTITION BY UNINO ORDER BY HISTSN ASC) AS RN
	                FROM PAYPHONE.PT_FACTMTHIST A
	               WHERE 1=1
	               AND STTDT <= '20210531'
	               AND LSTDT >= '20210101'
	              )
	        WHERE 1=1
	        AND RN = 1
)
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode(A.uniind,'1',1,0) as ����,
decode(A.uniind,'2',1,0) as �ڱ�,
decode(A.uniind,'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from FMTHST A,
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where A.fact_telno = tm.jungtel	      
and areausr = '01970' and dt = '20210405';

select * from (
 SELECT UPDEPCD
	              , DEPCD
	              , UNIIND
	              , areausr
	              , FACT_TELNO
	              , PHONEKND
	              , STATUS
	              , UNINO
	              , LSTDT
	              , CASE WHEN UNIIND = '1' THEN GET_BIBSICI_PRNM('0628', PHONEKND)
	                     ELSE GET_BIBSICI_PRNM('2066', UNIIND) END TEL_GB_NM
	              , RN
	         FROM (
	              SELECT UPDEPCD
	                     , DEPCD
	                     , UNIIND
	                     , areausr
	                     , FACT_TELNO
	                     , PHONEKND
	                     , STATUS
	                     , UNINO
	                     , LSTDT
	                     , HISTSN
	                     , RANK() OVER (PARTITION BY UNINO ORDER BY HISTSN ASC) AS RN
	                FROM PAYPHONE.PT_FACTMTHIST A
	               WHERE 1=1
	               AND STTDT <= '20210531'
	               AND LSTDT >= '20210101'
	              )
	        WHERE 1=1
	        AND RN = 1
) A, tb_maintain_schedule B where A.unino = B.unino 
and A.areausr ='01970' 
	          AND B.SCHDT >= SUBSTR('20210401', 1, 6) || '01'
	          AND B.SCHDT <= SUBSTR('20210401', 1, 6) || '99'
; 

select * from tb_maintain_schedule where schdt like '20210405%' and ();

select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����A,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����,
0 as sil,
0 as bang
from
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
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm;



select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
0,0,0,0,0,0,0,0,1
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm
where areausr = '01870' and dt = '20210104'

select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm;

   select substring(jungdt,1,8) dt, A.updepcd, A.depcd, A.areausr,A.fact_telno, 0,0,0,0,0,0,0,1,0  from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
	             where jungdt between '20210101'|| '000000' and '20210531'|| '235959';
	             
	            
	            
select dt as ����,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as ���� ,
areausr as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as �̸�,
sum(����A) as ���νü�����Ƚ��,sum(�ڱ�A) as �ڱ޽ü�����Ƚ��, sum(�Ͽ�����A) as �Ͽ���������Ƚ�� , sum(����) as ��������Ƚ��, sum(����) as ��������Ƚ��, sum(��ȸ) as ��ȸ����Ƚ��, sum(����) as ����Ƚ��, sum(sil) as ���˽����Ǽ�, sum(bang) as �����ѽü���
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
0 as bang
from
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


select *  from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
where jungdt between '20210104'|| '000000' and '20210104'|| '235959' and A.areausr = '01870' 

select * from pt_factmt@oracpms pf where unino = 49895;

select * from pt_factmthist pf where unino = 49895;


SELECT schd.schunino 
			, fac.unino
			, fac.updepcd as upDepCd -- ���� 
			, fac.depcd as depCd -- ����
			, fac.accdepcd as accDepCd -- ����
			, fac.ktdepcd as ktDepCd -- ��ȭ��
			, fac.area as area -- ����
			, fac.phonemgrno -- �ڻ��ȣ 
			, fac.depcd || fac.area as areaCd 
			, usr.usrname as asraUsrNm -- ����� 
			, fac.fact_telno as factTelNo -- ��ȭ��ȣ 
			, bld.bldplcno as bldPlcNo 
			, bld.bldplcnm as bldPlcNm -- ��ġ��Ҹ� 
			, bld.gpsx as gpsX -- �浵  
			, bld.gpsy as gpsY -- ����		
			, schd.schdt -- ���˿�������
			, schd.jungdt -- ��������
			, boo.retcyl -- ��ȸ�ֱ�
			, bld.bldadr1 -- ��ġ�ּ�1(�⺻�ּ�)
            , bld.bldadr2 -- ��ġ�ּ�2(���ּ�)
            , bld.bldzip
            , bld.roadaddr AS roadAddr
		FROM tb_maintain_schedule AS schd
		INNER JOIN pt_factmt AS fac
			ON fac.unino = schd.unino
		left outer join pt_boothmt AS boo
			ON fac.boounino = boo.boounino			
		LEFT OUTER JOIN pt_bldplc AS bld 
			ON fac.bldplcno = bld.bldplcno 
		LEFT OUTER JOIN pt_areamt AS arm 
			ON arm.area = fac.area 
				AND arm.uniind = fac.uniind 
				AND arm.depcd = fac.depcd 
				AND arm.area_use = 'Y' 
				AND arm.area_to ='99991231' 
		LEFT OUTER JOIN bimastercf usr 
			ON usr.usrcd = arm.areausr
		WHERE 1 = 1
				and fac.updepcd = 'Q000'
 and fac.depcd = 'Q010'
 and fac.depcd || fac.area = 'Q01005'
	        AND schd.schdt BETWEEN '20210101' AND '20210131'
		ORDER BY schd.jungdt, schd.schdt, boo.retcyl, bld.gpsx, bld.gpsy;
		
	
	
	select dt as ����,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as ���� ,
areausr as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as �̸�,
sum(����A) as ���νü�����Ƚ��,sum(�ڱ�A) as �ڱ޽ü�����Ƚ��, sum(�Ͽ�����A) as �Ͽ���������Ƚ�� , sum(����) as ��������Ƚ��, sum(����) as ��������Ƚ��, sum(��ȸ) as ��ȸ����Ƚ��, sum(����) as ����Ƚ��, sum(sil) as ���˽����Ǽ�, sum(bang) as �����ѽü���
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
0 as bang
from
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


           
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
(select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind) as uniind,
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as ����A,
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as �ڱ�A,
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as �Ͽ�����A,
decode(junggb,'T',1,0) as ����,
decode(junggb,'P',1,0) as ����,
decode(junggb,'R',1,0) as ��ȸ,
0 as ����,
0 as sil,
0 as bang
from
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1 and (select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind)  is null ;

select * from pt_factmthist  where fact_telno = '005403333827' --and   sttdt  <= '20210106' and lstdt >= '20210106' group by uniind;

select * from pt_factmt_h pfh where fact_telno = '005403333827' ;

select * from pt_factmt pf where fact_telno ='006407598862';

select * from pt_factmt pf where  fact_telno = '003304816419' ;

select fact_telno, blddt, updepnm, depnm, asrausrnm, opflag, sttdt, lstdt from pt_factmthist  where opflag in ('F','I')  and   sttdt  <= '20210531' and lstdt >= '20210101' order by fact_telno, histsn  ;

select * from pt_factmthist pf  where 
unino in
(
select * 
from
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1 and (select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind)  is null )
and  sttdt  <= '20210531' and lstdt >= '20210101' and pf opflag ='F'
;


select * 
from
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1 and (select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind)  is null )


select * from pt_factmthist where areausr ='02467' and ;

select * from pt_factmthist pf  where fact_telno  in (
select jungtel from tb_maintain tm where jungid = '02745' and jungdt like'20210517%') and opflag ='F';



select unino,blddt, sttdt from pt_factmthist  where opflag = 'F' and blddt = sttdt 
minus
select unino,blddt, sttdt from pt_factmthist where opflag = 'I' and blddt = sttdt and blddt > '20200527'

select unino 
from
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1 and (select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind)  is null )
and  sttdt  <= '20210531' and lstdt >= '20210101' and pf opflag ='F';

select * from 

update pt_factmthist set
opflag = 'U'
where 
(unino,blddt, sttdt ) in (
select unino,blddt, sttdt from pt_factmthist  where opflag = 'F' and blddt = sttdt 
minus
select unino,blddt, sttdt from pt_factmthist where opflag = 'I' and blddt = sttdt and blddt > '20200527'
);

select * from pt_factmthist pf where (unino,blddt, sttdt ) in (
select unino,blddt, sttdt from pt_factmthist  where opflag = 'F' and blddt = sttdt 
minus
select unino,blddt, sttdt from pt_factmthist where opflag = 'I' and blddt = sttdt and blddt > '20200527'
)

select unino,blddt, sttdt from pt_factmthist where opflag = 'I' and blddt = sttdt and blddt > '20200527';

select * from pt_factmthist pf where unino = '1320870';



           select dt as ����,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as ����,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as ���� ,
areausr as ���,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as �̸�,
sum(����A) as ���νü�����Ƚ��,sum(�ڱ�A) as �ڱ޽ü�����Ƚ��, sum(�Ͽ�����A) as �Ͽ���������Ƚ�� , sum(����) as ��������Ƚ��, sum(����) as ��������Ƚ��, sum(��ȸ) as ��ȸ����Ƚ��, sum(����) as ����Ƚ��, sum(sil) as ���˽����Ǽ�, sum(bang) as �����ѽü���
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
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1	

select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'

select rev_Date, sum(����A), sum(�ڱ�A), sum(�Ͽ�����A) from
(
select
rev_Date,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as ����A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as �ڱ�A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date  group by uniind),'3',1,0) as �Ͽ�����A
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1') group by rev_date; 


select
rev_Date,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as ����A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as �ڱ�A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date  group by uniind),'3',1,0) as �Ͽ�����A
from tb_repair tr where rev_date between '20210101' and '20210531' 

select jungtel,(select bldplcno from pt_factmt pf wh
ere fact_telno = jungtel) ,ST_Transform(ST_GeomFromText('POINT('||gpsy||' '|| gpsx ||')', 4326), 2097) from tb_maintain tm where jungdt like '20210201%' and jungid ='01870'  order by jungdt;

