

select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr, jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by tm.jungdt, tm.updepcd, tm.depcd,jungid, jungtel, junggb;



select substring(tm.jungdt, 1,8) dt, tm.updepcd, tm.depcd,jungid as areausr, jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8)  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by tm.jungdt, tm.updepcd, tm.depcd,jungid, jungtel, junggb
union all 
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr, telno,
0,0,0,0,0,0,1 from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno;


select dt as 일자,
(select depnm from biintmt b where depcd = aaa.updepcd and useflag ='Y' and deptreecnt in ('2','3','4') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd   and deptreecnt in ('3') group by depnm)  as 지사 ,
areausr as 사번,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as 이름,
sum(무인) as 무인,sum(자급) as 자급, sum(일오사일) as 일오사일, sum(고장) as 고장, sum(예방) as 예방, sum(순회) as 순회, sum(집금) as 집금
from (
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
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
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
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
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
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
(select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= substring(tm.jungdt ,1,8) and lstdt >= substring(tm.jungdt ,1,8) group by uniind)as 무인,
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
decode(A.uniind,'1',1,0) as 무인,
decode(A.uniind,'2',1,0) as 자급,
decode(A.uniind,'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
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
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
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
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb) tm;

   select substring(jungdt,1,8) dt, A.updepcd, A.depcd, A.areausr,A.fact_telno, 0,0,0,0,0,0,0,1,0  from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
	             where jungdt between '20210101'|| '000000' and '20210531'|| '235959';
	             
	            
	            
select dt as 일자,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as 지사 ,
areausr as 사번,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as 이름,
sum(무인A) as 무인시설점검횟수,sum(자급A) as 자급시설점검횟수, sum(일오사일A) as 일오사일점검횟수 , sum(고장) as 고장점검횟수, sum(예방) as 예방점검횟수, sum(순회) as 순회점검횟수, sum(집금) as 집금횟수, sum(sil) as 점검실적건수, sum(bang) as 점검한시설수
from (	            
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
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
			, fac.updepcd as upDepCd -- 본부 
			, fac.depcd as depCd -- 지사
			, fac.accdepcd as accDepCd -- 지점
			, fac.ktdepcd as ktDepCd -- 전화국
			, fac.area as area -- 구역
			, fac.phonemgrno -- 자산번호 
			, fac.depcd || fac.area as areaCd 
			, usr.usrname as asraUsrNm -- 담당자 
			, fac.fact_telno as factTelNo -- 전화번호 
			, bld.bldplcno as bldPlcNo 
			, bld.bldplcnm as bldPlcNm -- 설치장소명 
			, bld.gpsx as gpsX -- 경도  
			, bld.gpsy as gpsY -- 위도		
			, schd.schdt -- 점검예정일자
			, schd.jungdt -- 정비일자
			, boo.retcyl -- 순회주기
			, bld.bldadr1 -- 설치주소1(기본주소)
            , bld.bldadr2 -- 설치주소2(상세주소)
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
		
	
	
	select dt as 일자,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as 지사 ,
areausr as 사번,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as 이름,
sum(무인A) as 무인시설점검횟수,sum(자급A) as 자급시설점검횟수, sum(일오사일A) as 일오사일점검횟수 , sum(고장) as 고장점검횟수, sum(예방) as 예방점검횟수, sum(순회) as 순회점검횟수, sum(집금) as 집금횟수, sum(sil) as 점검실적건수, sum(bang) as 점검한시설수
from (	            
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
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
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select decode(uniind, null, (select uniind from pt_factmthist  where opflag = 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),uniind) from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
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



           select dt as 일자,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd  and deptreecnt in ('3') group by depnm)  as 지사 ,
areausr as 사번,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.areausr  ) as 이름,
sum(무인A) as 무인시설점검횟수,sum(자급A) as 자급시설점검횟수, sum(일오사일A) as 일오사일점검횟수 , sum(고장) as 고장점검횟수, sum(예방) as 예방점검횟수, sum(순회) as 순회점검횟수, sum(집금) as 집금횟수, sum(sil) as 점검실적건수, sum(bang) as 점검한시설수
from (	            
select  dt, tm.updepcd, tm.depcd,areausr,  jungtel, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
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
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = tm.jungtel and   sttdt  <= dt and lstdt >= dt  group by uniind),'3',1,0) as 일오사일A,
decode(junggb,'T',1,0) as 고장,
decode(junggb,'P',1,0) as 예방,
decode(junggb,'R',1,0) as 순회,
0 as 집금,
0 as sil,
0 as bangfrom
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531') tm
where 1=1	

select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel, junggb
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'

select rev_Date, sum(무인A), sum(자급A), sum(일오사일A) from
(
select
rev_Date,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date  group by uniind),'3',1,0) as 일오사일A
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1') group by rev_date; 


select
rev_Date,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as 무인A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as 자급A,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date  group by uniind),'3',1,0) as 일오사일A
from tb_repair tr where rev_date between '20210101' and '20210531' 

select jungtel,(select bldplcno from pt_factmt pf wh
ere fact_telno = jungtel) ,ST_Transform(ST_GeomFromText('POINT('||gpsy||' '|| gpsx ||')', 4326), 2097) from tb_maintain tm where jungdt like '20210201%' and jungid ='01870'  order by jungdt;

