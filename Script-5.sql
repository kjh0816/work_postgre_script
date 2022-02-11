-- 외래 테이블 예시
/*
create foreign table fi_biztrip (
CD_COMPANY NVARCHAR2(7),
CD_PC NVARCHAR2(7),
CD_BIZCAR NVARCHAR2(20),
NO_SEQ NUMBER(6),
DT_USE NVARCHAR2(8),
TP_DATE NVARCHAR2(1),
CD_MNGDEPT NVARCHAR2(12),
NO_MNGEMP NVARCHAR2(40),
NUM_STARTACC NUMBER(7),
NUM_ENDACC NUMBER(7),
NUM_MILEACC NUMBER(7),
NUM_COMMUTE NUMBER(7),
NUM_BIZDIS NUMBER(7),
NM_BIGO NVARCHAR2(40),
DTS_INSERT NVARCHAR2(14),
ID_INSERT NVARCHAR2(15),
DTS_UPDATE NVARCHAR2(14),
ID_UPDATE NVARCHAR2(15),
NUM_NBIZDIS NUMBER(7))
server oraerp
options (table 'fi_biztrip')
*/

create foreign table FI_BIZCARAMT
(
CD_BIZCAR NVARCHAR2(40),
YYYYMM NVARCHAR2(6),
NUM_MILEACC NUMBER,
NUM_ENDACC NUMBER,
RENT_AMT NUMBER,
OIL_AMT NUMBER,
ADD_AMT NUMBER,
INS_AMT NUMBER,
ETC_AMT NUMBER)
server oraerp
options (table 'FI_BIZCARAMT')

commit;

select * from fi_bizcaramt where add_amt  = 0;

create table fi_bizcaramt_mng
(
usrcd varchar(5),
CD_BIZCAR varchar(20),
YYYYMM varchar(6),
NUM_MILEACC NUMBER,
NUM_ENDACC NUMBER,
RENT_AMT NUMBER,
OIL_AMT NUMBER,
ADD_AMT NUMBER,
INS_AMT NUMBER,
ETC_AMT NUMBER,
BM varchar(6),
taxdiv varchar(1)
)

commit;

select * from payphone.biintmt b where org_cd ='0000002029';

bimastercf 

insert into fi_bizcaramt_mng (CD_BIZCAR, YYYYMM, NUM_MILEACC, NUM_ENDACC, RENT_AMT, OIL_AMT, ADD_AMT, INS_AMT, ETC_AMT) select * from fi_bizcaramt;   

commit;

select * from payphone.fi_bizcar fb;

select
payphone.get_updepnm_hrdept(fb.cd_mngdept ) as updepnm,
payphone.get_depnm_hrdept(fb.cd_mngdept) as depnm ,
fibm.usrcd, fb.cd_bizcar, fb.nm_bizcar, fb.nm_bizno, fb.nm_model, fb.cd_mngdept,
 fibm.bm, fb.tp_rent , fbm.num_mileacc , fbm.num_endacc, fibm.taxdiv, fbm.rent_amt, fbm.oil_amt,
fbm.add_amt, fbm.ins_amt, fbm.etc_amt
 from payphone.fi_bizcar fb, payphone.fi_bizcar_mant fibm, fi_bizcaramt_mng fbm where fb.cd_bizcar = fbm.cd_bizcar(+) and fb.cd_bizcar  = fibm.cd_bizcar(+);

create table fi_bizcar_mant 
(cd_bizcar varchar(40), updepcd varchar(5), depcd varchar(5), usrcd varchar(5), bm varchar(5),taxdiv varchar(1))

(select * from fi_bizcaramt_mng fbm where )


 group by 

 
minus

 select
payphone.get_updepnm_hrdept(fb.cd_mngdept ) as updepnm,
payphone.get_depnm_hrdept(fb.cd_mngdept) as depnm ,
fbmt.usrcd, fb.cd_bizcar, fb.nm_bizcar, fb.nm_bizno, fb.nm_model, fb.cd_mngdept,
 fbmt.bm, fb.tp_rent , fbm.num_mileacc , fbm.num_endacc, fbmt.taxdiv, fbm.rent_amt,
fbm.add_amt
 from payphone.fi_bizcar fb, payphone.fi_bizcar_mant fbmt , (
select
cd_bizcar, sum(num_mileacc) as num_mileacc,
max(num_endacc ) as num_endacc, sum(rent_amt ) as rent_amt,
sum(add_amt ) as add_amt
from fi_bizcaramt_mng fbm
where yyyymm between '202005' and '202006'  group by cd_bizcar ) fbm where fb.cd_bizcar = fbm.cd_bizcar(+) and fb.cd_bizcar  = fbmt.cd_bizcar;

 select dephighcd from payphone.biintmt b where org_cd ='0000002029' and useflag ='Y'
 
 select * from fi_bizcar_mant;
 
select cd_bizcar, sum(num_mileacc), max(num_endacc ), sum(rent_amt ) , sum(add_amt )  from fi_bizcaramt_mng fbm where yyyymm between '202005' and '202006'  group by cd_bizcar 


select * from fi_bizcaramt_mng fbm where cd_bizcar ='강북-중앙-46하1811'

get_updepnm_hrdept

select * from tc_cpmsmt tc where tc

/*

CREATE OR REPLACE FUNCTION payphone.proc_ins_fi_bizcaramt_mng(v_yyyymm text DEFAULT to_char((current_date - '1 mon'::interval), 'yyyymm'::character varying))
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
*/
/*****************************************************************
* 함수명 : proc_ins_fi_bizcaramt_mng
* 메소드기능 : 차량관리.
* Param : v_yyyymm - 연월
* RETURN VALUE : 숫자
*  AUTHOR : 김영섭
*****************************************************************/
/*
retrow int;
	cnt int; 
BEGIN
	
	select count(1) into cnt from payphone.fi_bizcaramt_mng fbm where fbm.yyyymm = v_yyyymm;
	
	if cnt > 0 then
	
	delete from payphone.fi_bizcaramt_mng fbm where fbm.yyyymm = v_yyyymm;

	end if;
	
	insert into payphone.fi_bizcaramt_mng 
	(cd_bizcar, yyyymm, num_mileacc, num_endacc, rent_amt, oil_amt, add_amt, ins_amt, etc_amt)
	select cd_bizcar, yyyymm, num_mileacc, num_endacc, rent_amt, oil_amt, add_amt, ins_amt, etc_amt
	from fi_bizcaramt where yyyymm = v_yyyymm;

	GET DIAGNOSTICS retrow := ROW_COUNT;
	call payphone.proc_payphone_tb_joblog('PROC_INS_FI_BIZCARAMT_MNG()','1','fi_bizcaramt','payphone.fi_bizcaramt_mng', to_char(now(), 'yyyymmdd'), to_char(now(), 'yyyymmdd'), retrow);

	RETURN retrow;
END;
$function$
;

*/


 
 select
            c.updepcd upDepCd,
            c.depcd depCd,
            c.accdepcd accDepCd,
            c.scd scd,
            c.unino unino,
            c.save_dtm saveDtm,
            c.close_date closeDate,
            c.gb gb,
            f.fact_telno factTelNo
        from payphone.tc_cpmssave c, payphone.pt_factmt f
        where 
        c.unino = f.unino
 and c.save_dtm between '20200701' || '000000'
 and '20200707' || '235959'
 
 
 
 select
		    get_depnm(A.updepcd,2) upDepNm,
		    get_depnm(A.depcd,3) depNm,
		    get_ktdepcdnm(A.ktdepcd) ktDepNm,
		    get_area(A.depcd,B.uniind,A.area) areaNm,        
		    get_phonegb_prnm(A.phoneknd) prNm,          
		    B.fact_telno factTelNo,     
		    get_bldplcnm(A.bldplcno) bldPlcNm,
		    A.curinf_dtm curInfDtm,
		    A.CURINF_ORD curInfOrd,                                                                                       
		    (
		    CASE WHEN TRIM(A.CURINF_ORD) = '고장' THEN                    
		            DECODE(A.ST_POWER,   '1','전원 ','')||                 
		            DECODE(A.ST_LINE,    '1','선로 ','')||                 
		            DECODE(A.ST_COINMACH,'1','주화처리장치 ','')||         
		            DECODE(A.ST_BOXOUT,  '1','금고통이탈 ','')||           
		            DECODE(A.ST_KEYPAD,  '1','키패드 ','')||               
		            DECODE(A.ST_CRDREAD, '1','카드리더 ','')||             
		            DECODE(A.ST_COINSLOT,'1','주화투입구 ','')||           
		            DECODE(A.ST_HANDSET, '1','송수화기 ','')||             
		            DECODE(A.MS_MEMORY,  '1','메모리오류 ','')||           
		            DECODE(A.MS_CTC,     '1','CTC ','')||                  
		            DECODE(A.MS_FEEERR,  '1','요금이상 ','')||             
		            DECODE(A.MS_READCON, '1','판독연속 ','')||             
		            DECODE(A.ST_DISPLAY, '1','표시부 ','')||               
		            DECODE(A.ST_MODEM,   '1','모뎀 ','')||                 
		            DECODE(A.ST_VOICEINF,'1','음성안내 ','')||             
		            DECODE(A.ST_LOOFLEL, '1','루프계전기 ','')             
		   WHEN TRIM(A.CURINF_ORD) = '충만' THEN                           
		      '갯수:'||TO_CHAR(A.COINFULL_CNT)||                           
		       ' 금액:'||TO_CHAR(A.COINFULL_AMT,'999,999')||                
		       ' 율:'||TO_CHAR(A.COINFULL_RATE)||'%'                       
		   WHEN TRIM(A.CURINF_ORD) = '교체' THEN                           
		       '금액:'||TO_CHAR(A.CURBOX_AMT,'999,999')                     
		    END                                                            
		    ) AS curInfDes,
		    decode(A.coinfull_amt,null,'',A.coinfull_amt) coinFullAmt,
            decode(A.coinfull_rate,null,'',0,'',A.coinfull_rate||'%')  coinFullRate,                                              
		  (
		  CASE WHEN TRIM(A.REMOVE_OX) = '0' THEN                         
		          '미등록'                                                 
		     WHEN TRIM(A.REMOVE_OX) = '1' THEN                             
		          '사용중'                                                 
		     WHEN TRIM(A.REMOVE_OX) = '2' THEN                             
		          '해지'                                                   
		     WHEN TRIM(A.REMOVE_OX) = '3' THEN                             
		          '철거'                                                   
		  END                                                              
		  )                                                                
		  AS removeNm,                                     
		    A.sw_ver swVer,
		    A.prod_co prodCo,
		    A.prod_dt prodDt,
		    C.save_dtm saveDtm,
		    C.close_date closeDate,
		    C.desc as "desc"
	  FROM payphone.TC_CPMSMT A, payphone.PT_FACTMT B, payphone.tc_cpmssave C                                 
	  WHERE
	   A.REMOVE_OX NOT IN ('2','3')
	   AND A.unino = C.unino(+)
		       AND substring(C.save_dtm(+),1,8)  <=  '20200707'
		       AND substring(C.close_date(+),1,8)  >=  '20200707'
		       AND substring(A.CURINF_DTM,1,8)  >=  '20200707'   
	   AND A.UNINO = B.UNINO(+)                                        
	   AND A.CURINF_DTM IS NOT NULL    
      ORDER BY A.CURINF_DTM
      
      
      select
payphone.get_updepnm_hrdept(fb.cd_mngdept ) as updepnm,
payphone.get_depnm_hrdept(fb.cd_mngdept) as depnm ,
fibm.usrcd, fb.cd_bizcar, fb.nm_bizcar, fb.nm_bizno, fb.nm_model, fb.cd_mngdept,
 fibm.bm, fb.tp_rent , fbm.num_mileacc , fbm.num_endacc, fibm.taxdiv, fbm.rent_amt, fbm.oil_amt,
fbm.add_amt, fbm.ins_amt, fbm.etc_amt, fb.yn_use 
 from payphone.fi_bizcar fb, payphone.fi_bizcar_mant fibm, fi_bizcaramt_mng fbm where fb.cd_bizcar = fbm.cd_bizcar(+) and fb.cd_bizcar  = fibm.cd_bizcar(+);
 
select * from bibsici b where lcd = '1128'

/*
00	공통
10	공중전화
30	부스활용
50	신품화(KT)
51	신품화(KTT리퍼)
70	물류
72	모바일A/S
73	중고폰판정
75	전보서비스
80	EV충전 
*/
get_depnm_hrdept


	          
	          select * from bibsici b2 where scd ='1128'
	
	          from 
			(
			 select lower(substr(depcd,1,1)) as depGbn,depcd,depnm,dephighcd,deptreecnt, org_cd from payphone.biintmt b where deptreecnt in (1,2) and useflag ='Y' and dephighcd  ='1000'
			 and (org_cd is not null or org_cd !='')
			 union all  
			 select lower(substr(depcd,1,1)) as depGbn,depcd,depnm,dephighcd,deptreecnt, org_cd from payphone.biintmt where deptreecnt = 2  and useflag ='Y' 
			 and depcd not in ('K000')
			 and (org_cd is not null or org_cd !='')
			 and substr(depcd, 2, 5) = '000'
			 )
		  where 1=1
	  
 select depcd,depnm from payphone.biintmt b where deptreecnt in (1,2) and useflag ='Y' and dephighcd  ='1000'
		 and (org_cd is not null or org_cd !='')
		 union all  
		 select depcd,depnm from payphone.biintmt where deptreecnt = 2  and useflag ='Y' 
		 and depcd not in ('K000')
		 and (org_cd is not null or org_cd !='')
		 and substr(depcd, 2, 5) = '000'
		 
		 
select
          lower(substr(depcd,1,1)) as depGbn, depcd, dephighcd , deptreecnt, depnm, org_cd
     from 
		(  
		select depcd, dephighcd , deptreecnt, depnm, org_cd from payphone.biintmt b2 where dephighcd in (
		  select depcd from payphone.biintmt b where deptreecnt in (1,2) and useflag ='Y' and dephighcd  ='1000'
		 and (org_cd is not null or org_cd !='')
		 union all  
		 select depcd from payphone.biintmt where deptreecnt = 2  and useflag ='Y' 
		 and depcd not in ('K000')
		 and (org_cd is not null or org_cd !='')
		 and substr(depcd, 2, 5) = '000'
		 )
		 and useflag ='Y'
		 and (org_cd is not null or org_cd !='') 
		 order by depcd
		 )
	  where 1=1  
	  
	  select * from pt_areamt pa 
	  
		     select
            dephighcd as depHighCd
            ,depcd as depCd
            ,usrcd as usrCd
            ,usrname as usrName
            ,hp_no   as hpNo
        from payphone.bimastercf  
        where bsnind='1'
        and usrname  like '이금숙'
        
        select * from fi_bizcar where nm_model like '%지게차%';
        
        select
		payphone.get_updepnm_hrdept(fb.cd_mngdept ) as upDepNm,
		payphone.get_depnm_hrdept(fb.cd_mngdept) as depNm ,
		fibm.usrCd, fb.cd_bizcar cdBizCar, fb.nm_bizcar nmBizCar, fb.nm_bizno nmBizNo, fb.nm_model nmModel, fb.cd_mngdept cdMngDept,
 		fibm.bm bm, fb.tp_rent tpRent, fbm.num_mileacc numMileAcc, fbm.num_endacc numEndAcc, fibm.taxdiv taxDiv, fbm.rent_amt rentAmt, fbm.oil_amt oilAmt,
		fbm.add_amt addAmt, fbm.ins_amt insAmt, fbm.etc_amt etcAmt, fb.yn_use as ynUse
 	from
 		payphone.fi_bizcar fb,
 		payphone.fi_bizcar_mant fibm,
 		(
	 	select
			cd_bizcar, sum(num_mileacc) as num_mileacc,
			max(num_endacc ) as num_endacc, sum(rent_amt ) as rent_amt,
			sum(add_amt ) as add_amt, sum(oil_amt) as oil_amt, sum(ins_amt) as ins_amt,
			sum(etc_amt) as etc_amt
			from fi_bizcaramt_mng fbm
			where 1=1    
 and yyyymm between '20200501'
 and '20200714'
			  group by cd_bizcar
			  )
 		fbm
 		, (select area , areanm ,areausr, depcd from payphone.pt_areamt where uniind ='1' and area_use ='Y') pa 
 	where fb.cd_bizcar = fbm.cd_bizcar(+)
 and fb.cd_bizcar  = fibm.cd_bizcar(+)
 and fibm.usrcd  = pa.areausr(+)
 and fibm.
 

 
 select * from bimastercf b where usrcd ='admi2'
 
 select
            a.dephighcd as depHighCd
            ,a.depcd as depCd
            ,a.usrcd as usrCd
            ,a.usrname as usrName
            ,a.hp_no   as hpNo
            ,
 (select org_cd
 from biintmt b2
 where depcd = a.depcd
 and deptreecnt in ('1','2','3','4')) as ordCd    
 from payphone.bimastercf a 
 where bsnind='1'
 
 select * from payphone.biintmt b where depnm like '%관리%'
 
 call payphone.proc_ins_fi_bizcaramt_mng(to_char((now() - '1 mon'::interval), 'yyyymm'::character varying))
 
 
 select * from payphone.fi_bizcaramt_mng fbm where yyyymm  ='202006'
 
 
     select  nextval('seq_tb_batch'::regclass);
    
    select * from tb_batch tb 
       
 
 call payphone.proc_ins_fi_bizcaramt_mng() 
 
 
 select * from payphone.pt_factmt_h pfh  where fact_telno ='000234440443'
 
 select * from bimastercf b where usrcd ='03738'
 
 select lstdt, lstusr from pt_factmt pf where fact_telno ='000234440443'
 
     select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
            , uniind
            ,orgCd
        from (
            select
                a.area
                ,a.areausr as usrCd
                 ,'['||decode(uniind,'1','무인','2','자급','3','1541')||']'||areanm as usrName
                ,a.updepcd as depHighCd
                ,a.depcd as depCd
                ,a.accdepcd as accDepCd
                ,a.depcd || a.area areaCd
                ,a.uniind uniind
                ,(select org_cd from biintmt b2 where depcd = a.depcd and deptreecnt in ('1','2','3','4')) as orgCd
			from
			    pt_areamt a,
			    (
			    select
			        usrcd,
			        usrname
			    from
			        payphone.bimastercf
			    where
			        bsnind = '1') b
			where
			    a.areausr = b.usrcd
			    and a.area_use = 'Y'
			     and a.uniind = 1
            ) userInfo
            
            select area , areanm ,areausr, depcd from payphone.pt_areamt where uniind ='1' and area_use ='Y'
            minus 
            select 
             area, usrName, usrCd, depCd from
                (
                select a.area
                 ,areanm as usrName
                ,a.areausr as usrCd
                ,a.depcd as depCd
			from
			    pt_areamt a,
			    (
			    select
			        usrcd,
			        usrname
			    from
			        payphone.bimastercf
			    where
			        bsnind = '1') b
			where
			    a.areausr = b.usrcd
			    and a.area_use = 'Y'
			     and a.uniind = 1)
            
            
			    select
			        usrcd,
			        usrname
			    from
			        payphone.bimastercf where usrcd ='03884'
			     
            select areausr, * from payphone.pt_areamt where uniind ='1' and area_use ='Y' and areausr ='02577' 
            
            select * from vw_mergehr_bimastercf vmb  where usrcd ='03884' 
            
             select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
        from (
        select
        '' as area
        ,a.areausr as usrCd
        , b.usrName as usrName
        , a.updepcd as depHighCd
        , a.depcd as depCd
        ,'' as accDepCd
        ,'' as areaCd
        from payphone.pt_areamt a,
        (
            select
                usrcd,
                usrname
            from
                payphone.bimastercf
            where
                bsnind = '1') b
            where 1=1
            and a.area_use='Y'
            and a.areausr = b.usrcd
            group by  a.updepcd,a.depcd,a.areausr,b.usrName
        ) userInfo
        
        t_log_des_v
        
        select
            p.ssdt                                                   as ssdt
            ,p.telno                                                 as telNo
            ,get_depnm_ktl( p.updepcd )                               as upDepCd
            ,get_depnm_ktl( p.depcd )                                 as depCd
            ,payphone.get_ktdepcdnm((select ktdepcd from pt_factmthist where unino = p.unino order by lstdt desc limit 1)) as ktDepCd
            ,get_phonegb_prnm( p.phoneknd )                           as phoneGb
            ,decode( p.bldgbnm, '1', 'ì˜¥ë‚´', '2', 'ì˜¥ì™¸', p.bldgbnm ) as bldgbNm
            ,get_bldplcnm(p.bldplcno)                                 as bldPlcNm
            ,get_bibsici_prnm( '0246', p.large )                      as large
            ,get_bibsici_prnm( '0247', p.small )                      as small
            ,get_bibsici_prnm( '0248', p.booth_type )                  as boothType
            ,get_bibsici_prnm( '0250', p.booth_con )                   as boothCon
            ,p.sinae                                                 as sinae
            ,p.kukje                                                 as siwoi
            ,p.siwoi                                                 as kukje
            ,p.lm                                                    as lm
            ,p.lv                                                    as lv
            ,p.choijyu                                               as choijyu
            ,p.inf114                                                as inf114
            ,p.gita                                                  as gita
            ,p.kt1588                                                as kt1588
            ,p.kt1577                                                as kt1577
            ,p.kt1541                                                as kt1541
            ,p.kt0502                                                as kt0502
            ,p.ktcard                                                as ktCard
            ,p.wldpass                                               as wldPass
            ,p.wldstar                                               as wldStar
            ,p.kt080                                                 as kt080
            ,p.ktloventl                                             as ktLoveNtl
            ,p.ktcredit                                              as ktCredit
            ,p.wldcard                                               as wldCard
            ,p.totamt                                                as totAmt
            ,get_area( p.depcd, p.uniind, p.area )                  as area
            ,get_area_usrid(p.depcd,'1',p.area)                      as areaId
            ,get_area_usrname( p.depcd, p.uniind, p.area )          as areaUsr
        from payphone.pt_tt_muin_jageup p
                where 1=1
            and p.ssdt between '202004' and '202005'
                    and p.updepcd = 'I000'
            and p.depcd = 'I250'
            and f.ktdepcd = 'M09021'
                    and p.telno like '%' || replace('', '-', '') || '%'
                order by p.ssdt asc

     select
        log_dtm logDtm, 
        get_depnm(updepcd,2) upDepNm,
        get_depnm(depcd,3) depNm,
        get_ktdepcdnm(ktdepcd) ktDepNm,
        (select usrname from payphone.bimastercf where usrcd = areausr) as areaUsr,
        tel_no as factTelNo,
        get_phonegb_prnm(phoneknd) prNm,
        bldplcnm as bldPlcNm,
        amt amt,
        pre_amt as preAmt,
        amt_minus as minusAmt,
        pre_log_dtm as preLogDtm,
        log_err_id logErrId,
        pre_err_id preErrId,
        description description
      from payphone.t_log_des_v
        where 1=1           
                  and log_dtm between '20200701' and '20200721'           
             and amt_minus  >=   '0'::numeric
             
             select
		payphone.get_updepnm_hrdept(fb.cd_mngdept ) as upDepNm,
		payphone.get_depnm_hrdept(fb.cd_mngdept) as depNm ,
		fibm.usrCd, fb.cd_bizcar cdBizCar, fb.nm_bizcar nmBizCar, fb.nm_bizno nmBizNo, fb.nm_model nmModel, fb.cd_mngdept cdMngDept,
 		fibm.bm bm, fb.tp_rent tpRent, fbm.num_mileacc as numMileAcc, fbm.num_endacc numEndAcc, fibm.taxdiv taxDiv, fbm.rent_amt rentAmt, fbm.oil_amt oilAmt,
		fbm.add_amt addAmt, fbm.ins_amt insAmt, fbm.etc_amt etcAmt, fb.yn_use as ynUse
 	from
 		payphone.fi_bizcar fb,
 		payphone.fi_bizcar_mant fibm,
 		(
	 	select
			cd_bizcar, sum(num_mileacc) as num_mileacc,
			max(num_endacc ) as num_endacc, sum(rent_amt ) as rent_amt,
			sum(add_amt ) as add_amt, sum(oil_amt) as oil_amt, sum(ins_amt) as ins_amt,
			sum(etc_amt) as etc_amt
			from fi_bizcaramt_mng fbm
			where 1=1 
			  group by cd_bizcar
 		) fbm
 		
 		select * from payphone.pt_factmt pf2   where fact_telno ='005307912197'
 		
 		select * from payphone.icis_rcv_hist irh where be_svc_no ='005506350590'
 		
insert
	into
	tc_cpmsmt@oracpms (updepcd, tel_no, unino, unino_stat, depcd, phoneknd, ktdepcd, area, areausr, bldplcno , instusr , remousr , tel_id , sw_ver , prod_co, prod_dt, curinf_dtm , curinf_ord, curinf_err_id, coinfull_ox, coinfull_dtm , coinfull_cnt , coinfull_amt, coinfull_rate, faultrep_dtm, fault_ox, fault_dtm, st_power, st_line, st_coinmach, st_boxout, st_keypad , st_crdread , st_coinslot, st_handset, ms_memory, ms_ctc, ms_feeerr, ms_readcon, ms_readacc, st_display, st_modem, st_voiceinf , st_looflel , rmsend_state , rmsend_err_id , rmload_dtm , rmacep_dtm , remove_ox , remove_dt , curexc_dtm , curcard_dtm , curbox_amt , second_dtm , second_ord , second_ox , second_err_id , second_stop , faultinf_dtm , rep_dtm , feeunit_seq , cpms_lstdt , cpms_lstusr , res1 , res2 , res3 , res4 , res5 , res6 , res7 , res8 , old_updepnm , old_depnm , old_ktdepnm , old_phonekndnm , old_exmhodnm , old_bldplcnm , old_blddt , old_care , old_areausr , old_areausrnm , old_remove_ox , old_remove_dt , acccnt_dtm , gubun)	
	
	
	select * from tc_cpmsmt@oracpms tc where tel_no in ('005506350590','005307912197')
 		
 		select * from payphone.pt_factmthist where fact_telno ='005506350590'
 		

 		select tel_no, count(1) from tc_cpmsmt tc  where tel_no  in (
 		SELECT TEL_NO FROM TC_CPMSMT 
) group by tel_no ;

delete from  tc_cpmsmt WHERE UNINO='9999999'

select * from payphone.pt_ttcobalance pt where ssdt like '202007%'  and depcd = 'I030'

select * from pt_ttcossdd@oraktlpt where ssdt like '202007%' and telno ='0051-0508-6756'

select * from payphone.tb_ttcpmsdd tt where telno ='005105086756' and cpmsdt  like '202007%'

select * from pt_ttcpmsdd@oracpms where telno ='005105086756' and cpmsdt like '202007%'

update payphone.tb_ttcpmsdd set 
 outcitycoinfee = 7420,
 downcoin = 110,
 amount =7600
 where unino =1018845
 and lstdt ='20200714110114'
 and cpmsdt ='20200714'
and  depcd ='I030'

select * from payphone.bibsici b where lcd ='0248'

select * from pt_tt_muin_jageup ptmj where 


   delete from tb_ttcpmsdd tt where telno ='004308779051'  and cpmsdt ='20200722' and hhmmss ='151307';
         
        delete from pt_ttcpmsdd_q@oracpms where telno ='004308779051' and cpmsdt ='20200722' and hhmmss ='151307';
        
       
       
select
	payphone.get_bibsici_prnm('0250', pb.boocon) as booConNm ,
	pb.boocon as booCon ,
	payphone.get_bibsici_prnm('0248', pb.booknd) as booKndNm ,
	pb.booknd as booKnd ,
	payphone.get_bibsici_prnm('0286', pb.boodoorind) as booDoorIndNm ,
	pb.boodoorind as booDoorInd ,
	pb.booblddt as booBldDt ,
	pb.boounino as booUniNo ,
	pb.boomgrno as booMgrNo ,
	pv.booemptycnt as booEmptyCnt ,
	payphone.get_bibsici_prnm('0260', pb.litest1) as liTest1Nm ,
	payphone.get_bibsici_prnm('0260', pb.litest2) as liTest2Nm ,
	payphone.get_bibsici_prnm('0260', pb.litest3) as liTest3Nm ,
	payphone.get_bibsici_prnm('0266', pb.etvoltcd) as etVoltCdNm ,
	pb.etinbld as etInBld ,
	pb.tpinbld as tpInBld ,
	payphone.get_bibsici_prnm('0262', pb.remorsn) as booRemoRsnNm ,
	payphone.get_bibsici_prnm('0256', pb.clcyl) as clCylNm ,
	payphone.get_bibsici_prnm('0259', pb.sdcyl) as sdCylNm ,
	payphone.get_bibsici_prnm('0257', pb.retcyl) as retCylNm
from
	payPhone.pt_boothmt pb,
	payPhone.vw_booth_empty pv,
	payPhone.pt_bldplc pt
where
	1 = 1
	and pb.status = '1'
	and pb.bldplcno = pt.bldplcno
	and pb.boounino = pv.boounino
	and pb.depcd = 'G210'
	and pt.uniind = '3'
	and pb.bldplcno = '2009120410'
	and pb.boounino = '382348'
union
select
	payphone.get_bibsici_prnm('0250', pb.boocon) as booConNm ,
	pb.boocon as booCon ,
	payphone.get_bibsici_prnm('0248', pb.booknd) as booKndNm ,
	pb.booknd as booKnd ,
	payphone.get_bibsici_prnm('0286', pb.boodoorind) as booDoorIndNm ,
	pb.boodoorind as booDoorInd ,
	pb.booblddt as booBldDt ,
	pb.boounino as booUniNo ,
	pb.boomgrno as booMgrNo ,
	pv.booemptycnt as booEmptyCnt ,
	payphone.get_bibsici_prnm('0260', pb.litest1) as liTest1Nm ,
	payphone.get_bibsici_prnm('0260', pb.litest2) as liTest2Nm ,
	payphone.get_bibsici_prnm('0260', pb.litest3) as liTest3Nm ,
	payphone.get_bibsici_prnm('0266', pb.etvoltcd) as etVoltCdNm ,
	pb.etinbld as etInBld ,
	pb.tpinbld as tpInBld ,
	payphone.get_bibsici_prnm('0262', pb.remorsn) as booRemoRsnNm ,
	payphone.get_bibsici_prnm('0256', pb.clcyl) as clCylNm ,
	payphone.get_bibsici_prnm('0259', pb.sdcyl) as sdCylNm ,
	payphone.get_bibsici_prnm('0257', pb.retcyl) as retCylNm
from
	payPhone.pt_boothmt pb,
	payPhone.vw_booth_empty pv,
	payPhone.pt_bldplc pt
where
	1 = 1
	and pb.status = '1'
	and pb.boounino = pv.boounino
	and pb.bldplcno = pt.bldplcno
	and pv.booemptycnt > 0
	and pb.depcd = 'G210'
	and pb.bldplcno = '2009120410'
	and pt.uniind = '3'
	
	
	select nvl(lcd,' ') as lcd   
            , nvl(scd,' ') as scd   
            , nvl(prnm, ' ') as prnm  
 from payphone.bibsici
 where 1=1
 and lcd = '0248'  
 and coalesce(ind, 'Y') = 'Y'
              and scd like '9%'
                    order by scd, prnm asc
                    
                    
      select
	nvl(lcd, ' ') as lcd ,
	nvl(scd, ' ') as scd ,
	nvl(prnm, ' ') as prnm
from
	payphone.bibsici
where
	1 = 1
	and lcd = '0248'
	and coalesce(ind, 'Y') = 'Y'
order by
	scd,
	prnm asc
	
	select * from bibsici b2 where lcd ='0248' and scd in (
	 select booknd from payphone.pt_boothmt pb where boounino  in (
	select boounino from pt_factmt pf where uniind ='3')
	and booknd not in ('900','901','902','903','904','905','906')
	group by booknd)
	
	

	 select * from payphone.pt_boothmt pb where boounino  in (
	select boounino from pt_factmt pf where uniind ='3')
	and booknd not in ('900','901','902','903','904','905','906')
	
	select * from payphone.icis_rcv_hist irh where be_svc_no in ('000232986869','006407440281')
	
	
	select * from bibsici b 
	
select lcd, scd , prnm from payphone.bibsici b where lcd ='2057'
union all
select lcd, scd , prnm  from payphone.bibsici b where lcd ='2071'

SELECT * FROM payphone.tb_noticefile tn  


  SELECT RNUM
			   , NOTISEQ
			   , NOTITITLE
			   , NOTITYPE
			   , NOTITYPENM
			   , NOTIDESC
			   , LSTDT
			   , LSTUSR
			   , LSTUSRNM
			   , VIEWYN
			   , FILESEQ1
			   , FILESEQ2
			   , FILESEQ3
			   , FILENM1
			   , FILENM2
			   , FILENM3
			   , FILEURL1
			   , FILEURL2
			   , FILEURL3
			   , ORGFILENM1
			   , ORGFILENM2
			   , ORGFILENM3
		  FROM (
		  		SELECT ROW_NUMBER() OVER(ORDER BY VIEWYN DESC, LSTDT DESC, NOTITITLE DESC) RNUM
				       , NOTISEQ
				       , NOTITITLE
				       , NOTITYPE
				       , '[' || PAYPHONE.GET_BIBSICI_PRNM('2063', NOTITYPE) || ']' AS NOTITYPENM
				       , NOTIDESC
				       , TO_CHAR(TO_DATE(LSTDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD') AS LSTDT
				       , LSTUSR
				       , LSTUSRNM
				       , VIEWYN
				       , MAX(CASE WHEN RN = 1 THEN FILESEQ END) AS FILESEQ1
				       , MAX(CASE WHEN RN = 2 THEN FILESEQ END) AS FILESEQ2
				       , MAX(CASE WHEN RN = 3 THEN FILESEQ END) AS FILESEQ3
				       , MAX(CASE WHEN RN = 1 THEN FILENM END) AS FILENM1
				       , MAX(CASE WHEN RN = 2 THEN FILENM END) AS FILENM2
				       , MAX(CASE WHEN RN = 3 THEN FILENM END) AS FILENM3
				       , MAX(CASE WHEN RN = 1 THEN FILEURL END) AS FILEURL1
				       , MAX(CASE WHEN RN = 2 THEN FILEURL END) AS FILEURL2
				       , MAX(CASE WHEN RN = 3 THEN FILEURL END) AS FILEURL3
				       , MAX(CASE WHEN RN = 1 THEN ORGFILENM END) AS ORGFILENM1
				       , MAX(CASE WHEN RN = 2 THEN ORGFILENM END) AS ORGFILENM2
				       , MAX(CASE WHEN RN = 3 THEN ORGFILENM END) AS ORGFILENM3
				  FROM (
				       SELECT ROW_NUMBER() OVER(PARTITION BY A.NOTISEQ ORDER BY B.FILESEQ) AS RN
				              , A.NOTISEQ AS NOTISEQ
				              , A.NOTITITLE AS NOTITITLE
				              , A.NOTITYPE AS NOTITYPE
				              , A.NOTIDESC AS NOTIDESC
				              , A.LSTDT AS LSTDT
				              , A.LSTUSR AS LSTUSR
				              , PAYPHONE.GET_USRNAME(A.LSTUSR) AS LSTUSRNM
				              , B.FILESEQ
				              , B.FILENM
				              , B.FILEURL
				              , B.ORGFILENM
				              , A.VIEWYN AS VIEWYN
				         FROM PAYPHONE.TB_NOTICE A
				              , PAYPHONE.TB_NOTICEFILE B
				        WHERE 1=1
				          AND A.NOTISEQ = B.NOTISEQ(+)
				          AND 'N' = B.DELYN(+)
				          AND A.DELYN = 'N'
				       )
				 GROUP BY NOTISEQ
				       , NOTITITLE
				       , NOTITYPE
				       , NOTITYPENM
				       , NOTIDESC
				       , LSTDT
				       , LSTUSR
				       , LSTUSRNM
				       , VIEWYN
				 ORDER BY RNUM ASC
		  		)
		 WHERE  RNUM BETWEEN TO_NUMBER('1') AND TO_NUMBER('10')
		 
 select *
 from payphone.tb_noticefile
 where delyn ='N'
 
 
  SELECT 
			a.usrcd as usrCd
			, a.usrname as usrName
            , case when a.dephighcd   <>   '1600'
 and i.deptreecnt = '2' then a.dephighcd else a.depcd end as depCd
			, a.deplvl as depLvl
			, a.dephighcd as depHighCd
			, a.bsnind as bsnInd
			, a.gubun as gubun
			, a.hp_no as hpNo
			, a.lstusr as lstUsr
			, a.lstdt as lstDt
			, b.errcnt as errCnt
			, b.usrpwd as usrPwd
			, b.cretdt as cretDt
			, b.editdt as editDt
			, b.lastdt as lastDt
			, a.group_nm_en groupNmEn
			, i.deptreecnt as depTreeCnt
		    , c.distuse as distUse
		    , c.distmeter as distMeter
		    , c.agreuse as agreUse
		    , c.agregroup as agreGroup
            , nvl(d.area, '') as area
		FROM payphone.bimastercf AS a
		LEFT OUTER JOIN payphone.tb_user_password AS b ON a.usrcd = b.usrcd 
        LEFT OUTER JOIN payphone.biintmt AS i ON a.depcd = i.depcd AND i.deptreecnt IN ('1', '2', '3', '4')
        LEFT OUTER JOIN 
 (select depcd, areausr, area
 from payphone.pt_areamt
 where area_use = 'Y'
 and area_to = '99991231'
 and uniind = '1') d on a.depcd = d.depcd AND a.usrcd = d.areausr
        , payphone.tb_repairset c
		WHERE a.usrcd = '999'
		limit 1
		
		select * from payphone.tb_attachfile ta 
		
		select * from payphone.tb_noticefile tn 
		
		select * from bibsici b  order by lstdt 
		
		select * from 
		
select * from payphone.tb_repairset tr 
		
select
	RN ,
	UNINO ,
	BLDDT ,
	TELNO ,
	BLDGPS ,
	GPS_Y ,
	GPS_X ,
	CHKDT ,
	BLDADDR ,
	BLDPLCNM ,
	COINFULL_RATE ,
	FAULT_DTM ,
	SECOND_DTM ,
	KM_DISTANCE ,
	TEL_DESC ,
	UNIIND ,
	NVL(SUBSTRING(PP_CLDT, 1, 10), '') PP_CLDT ,
	FILEYN ,
	BLDPLCNO
from
	(
	select
		UNINO , BLDDT , TELNO , BLDGPS , GPS_Y , GPS_X , CHKDT , BLDADDR , BLDPLCNM , COINFULL_RATE , FAULT_DTM , SECOND_DTM , KM_DISTANCE , row_number() over (
		order by KM_DISTANCE ) as RN , TEL_DESC , UNIIND , PP_CLDT , FILEYN , BLDPLCNO
	from
		(
		select
			coalesce( FA.UNINO::INT , 0 ) as UNINO
			-- 고유번호
, coalesce( FA.BLDDT , ' ' ) as BLDDT
			-- 설치일자
, coalesce( FA.FACT_TELNO , ' ' ) as TELNO
			-- 전화번호
, coalesce( PL.BLDPLCNM , ' ' ) as BLDPLCNM
			-- 설치장소명
, coalesce( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) as BLDADDR , coalesce( SUBSTRING(FA.CHKDT, 1, 4)|| '-' || SUBSTRING(FA.CHKDT, 5, 2)|| '-' || SUBSTRING(FA.CHKDT, 7, 2), '' ) as CHKDT
			-- 최종방문일자';
, coalesce( PL.GPSX, '' ) as BLDGPS , PL.GPSY as GPS_Y , PL.GPSX as GPS_X , coalesce( (( ACOS( SIN( '37.435736'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.435736'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.128972'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) as KM_DISTANCE ,
			case
				when ( CP.COINFULL_RATE > 70 ) then '1'
				else '0'
			end COINFULL_RATE
			-- 금고충만
,
			case
				when ( RP.CNT is null ) then '0'
				else '1'
			end as FAULT_DTM
			-- 고장처리 여부
,
			case
				when ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') then '0'
				else '1'
			end as SECOND_DTM
			-- 미보고
, decode(FA.UNIIND, '1', (select PRNM from BIBSICI where LCD = '0242' and SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') as TEL_DESC , FA.UNIIND as UNIIND , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT ,
			case
				when ( AF.UNIQNO is null ) then 'N'
				else 'Y'
			end FILEYN
			-- 첨부파일 유무
, FA.BLDPLCNO
		from
			PAYPHONE.BIMASTERCF UR
		left outer join PAYPHONE.PT_AREAMT AM on
			AM.AREAUSR = UR.USRCD
			and AM.DEPCD = UR.DEPCD
			and AM.AREA_TO = '99991231'
		left outer join PAYPHONE.PT_FACTMT FA on
			FA.DEPCD = AM.DEPCD
			and FA.AREA = AM.AREA
			and FA.UNIIND = AM.UNIIND
			and FA.STATUS = '1'
			and FA.FACT_KND = '1'
			-- SELECTFACILITYLISTMAP
		left outer join PAYPHONE.PT_BLDPLC PL on
			FA.BLDPLCNO = PL.BLDPLCNO
			and PL.FT_USE = '1'
			-- I000 005505878776 89066
		left outer join PAYPHONE.TC_CPMSMT CP on
			CP.UPDEPCD = FA.UPDEPCD
			and CP.TEL_NO = FA.FACT_TELNO
			and CP.UNINO = FA.UNINO
		left outer join (
			select
				GOJANG_TEL , JUMGUMJA_ID , WANRO_FLAG , COUNT(*) CNT
			from
				PAYPHONE.TB_REPAIR
			where
				WANRO_FLAG = '0'
			group by
				GOJANG_TEL , JUMGUMJA_ID , WANRO_FLAG ) RP on
			FA.FACT_TELNO = RP.GOJANG_TEL
			and FA.AREA = AM.AREA
			and AM.AREAUSR = RP.JUMGUMJA_ID
		left outer join (
			select
				UNIQNO
			from
				PAYPHONE.TB_ATTACHFILE
			where
				DEL_YN != 'Y'
			group by
				UNIQNO) AF on
			AF.UNIQNO = PL.BLDPLCNO
		where
			1 = 1
			and FA.UNIIND = '1' ) B
	where
		1 = 1
		and KM_DISTANCE < (select to_number( decode(distuse,1,distmeter,'5000' ))/1000 from payphone.tb_repairset tr) ) C
where
	1 = 1
	and GPS_Y is not null
	and GPS_X is not null
order by
	UNIIND,
	RN
limit '50'::numeric offset ('1'::numeric-1) * '50'::numeric


select * from payphone.tb_repairset tr

select * from t_change@oraguard where 

-- s

select * from payphone.bimastercf where usrname like '김승하%'

select * from payphone.tb_loginlog tl where login_dt like '20200805%' and login_usr ='01039'

select * from payphone.tb_user_password   where usrcd  ='01980'

select
	RN ,
	UNINO ,
	BLDDT ,
	TELNO ,
	BLDGPS ,
	GPS_Y ,
	GPS_X ,
	CHKDT ,
	BLDADDR ,
	BLDPLCNM ,
	COINFULL_RATE ,
	FAULT_DTM ,
	SECOND_DTM ,
	KM_DISTANCE ,
	TEL_DESC ,
	UNIIND ,
	NVL(SUBSTRING(PP_CLDT, 1, 10), '') PP_CLDT ,
	FILEYN ,
	BLDPLCNO
from
	(
	select
		UNINO , BLDDT , TELNO , BLDGPS , GPS_Y , GPS_X , CHKDT , BLDADDR , BLDPLCNM , COINFULL_RATE , FAULT_DTM , SECOND_DTM , KM_DISTANCE , row_number() over (
		order by KM_DISTANCE ) as RN , TEL_DESC , UNIIND , PP_CLDT , FILEYN , BLDPLCNO
	from
		(
		select
			coalesce( FA.UNINO::INT , 0 ) as UNINO
			-- ê³ ìœ ë²ˆí˜¸
, coalesce( FA.BLDDT , ' ' ) as BLDDT
			-- ì„¤ì¹˜ì
, coalesce( FA.FACT_TELNO , ' ' ) as TELNO
			-- ì „í™”ë²ˆí˜¸
, coalesce( PL.BLDPLCNM , ' ' ) as BLDPLCNM
			-- ì„¤ì¹˜ìž¥ì†Œëª…
, coalesce( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) as BLDADDR , coalesce( SUBSTRING(FA.CHKDT, 1, 4)|| '-' || SUBSTRING(FA.CHKDT, 5, 2)|| '-' || SUBSTRING(FA.CHKDT, 7, 2), '' ) as CHKDT
			-- ìµœì¢…ë°©ë¬¸ì
, coalesce( PL.GPSX, '' ) as BLDGPS , PL.GPSY as GPS_Y , PL.GPSX as GPS_X , coalesce( (( ACOS( SIN( '37.435736'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.435736'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.128972'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) as KM_DISTANCE ,
			case
				when ( CP.COINFULL_RATE > 70 ) then '1'
				else '0'
			end COINFULL_RATE
			-- ê¸ˆê³ ì¶©ë§Œ
,
			case
				when ( RP.CNT is null ) then '0'
				else '1'
			end as FAULT_DTM
			-- ê³ ìž¥ì²˜ë¦¬ ì—¬ë¶€
,
			case
				when ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') then '0'
				else '1'
			end as SECOND_DTM
			-- ë¯¸ë³´ê³ 
, decode(FA.UNIIND, '1', (select PRNM from BIBSICI where LCD = '0242' and SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') as TEL_DESC , FA.UNIIND as UNIIND , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT ,
			case
				when ( AF.UNIQNO is null ) then 'N'
				else 'Y'
			end FILEYN
			-- ì²¨ë¶€íŒŒì ë¬´
, FA.BLDPLCNO
		from
			PAYPHONE.BIMASTERCF UR
		left outer join PAYPHONE.PT_AREAMT AM on
			AM.AREAUSR = UR.USRCD
			and AM.DEPCD = UR.DEPCD
			and AM.AREA_TO = '99991231'
		left outer join PAYPHONE.PT_FACTMT FA on
			FA.DEPCD = AM.DEPCD
			and FA.AREA = AM.AREA
			and FA.UNIIND = AM.UNIIND
			and FA.STATUS = '1'
			and FA.FACT_KND = '1'
			-- SELECTFACILITYLISTMAP
		left outer join PAYPHONE.PT_BLDPLC PL on
			FA.BLDPLCNO = PL.BLDPLCNO
			and PL.FT_USE = '1'
			-- I000 005505878776 89066
		left outer join PAYPHONE.TC_CPMSMT CP on
			CP.UPDEPCD = FA.UPDEPCD
			and CP.TEL_NO = FA.FACT_TELNO
			and CP.UNINO = FA.UNINO
		left outer join (
			select
				GOJANG_TEL , JUMGUMJA_ID , WANRO_FLAG , COUNT(*) CNT
			from
				PAYPHONE.TB_REPAIR
			where
				WANRO_FLAG = '0'
			group by
				GOJANG_TEL , JUMGUMJA_ID , WANRO_FLAG ) RP on
			FA.FACT_TELNO = RP.GOJANG_TEL
			and FA.AREA = AM.AREA
			and AM.AREAUSR = RP.JUMGUMJA_ID
		left outer join (
			select
				UNIQNO
			from
				PAYPHONE.TB_ATTACHFILE
			where
				DEL_YN != 'Y'
			group by
				UNIQNO) AF on
			AF.UNIQNO = PL.BLDPLCNO
		where
			1 = 1
			and UR.usrcd in (
			select
				'01039'
		union all
			select
				SAWON_CD1
			from
				t_change
			where
				1 = 1
				and job_flag = 'C'
				and SYSDATE between TO_DATE(C_DATE , 'YYYYMMDD') and TO_DATE(FDATE || '235959' , 'YYYYMMDDHH24MISS')
				and SAWON_CD = '01039')
			and UR.dephighcd = 'H000'
			and UR.depcd = 'H030'
			and FA.UNIIND = '1' ) B
	where
		1 = 1 ) C
where
	1 = 1
order by
	UNIIND,
	RN
	
	
	
limit '50'::numeric offset ('1'::numeric-1) * '50'::numeric
        
        
        
2020-08-05 18:16:31,462  INFO : net.sf.log4jdbc.tools.Log4JdbcCustomFormatter.sqlOccured(Log4JdbcCustomFormatter.java:74) [jdbc.sqlonly] SQL  :     select count( 1 ) total

                                from payphone.BIMASTERCF UR
                                left outer join payphone.PT_AREAMT AM on AM.AREAUSR = UR.USRCD
 and AM.depcd = UR.depcd
 and AM.area_to = '99991231'
                                left outer join payphone.PT_FACTMT FA on FA.depcd = AM.depcd
 and FA.area = AM.area
 and FA.UNIIND = AM.UNIIND
 and FA.status = '1'
 and FA.fact_knd = '1' --
 and FA.UNIIND in ( '1', '3' )
                                left outer join payphone.PT_BLDPLC PL on FA.BLDPLCNO = PL.BLDPLCNO
 and PL.ft_use = '1'
                                left outer join payphone.tc_cpmsmt CP on CP.updepcd = FA.updepcd
 and CP.tel_no = FA.FACT_TELNO
 and CP.unino = FA.unino

 where 1 = 1


 and UR.dephighcd = 'H000'

 and UR.depcd = 'H030'

 and UR.usrcd in
 (select '01039'
                                                union all
                                                select SAWON_CD1
 from t_change
 where 1=1
                                                        AND job_flag ='C'
                                                        AND SYSDATE BETWEEN TO_DATE(C_DATE ,'YYYYMMDD') AND TO_DATE(FDATE||'235959' ,'YYYYMMDDHH24MISS')
                                                        AND SAWON_CD= '01039')



 and FA.uniind ='1'

		select
				*
			from
				t_change
			where
				1 = 1
				and job_flag = 'C'
				and SYSDATE between TO_DATE(C_DATE , 'YYYYMMDD') and TO_DATE(FDATE || '235959' , 'YYYYMMDDHH24MISS')
			--	and SAWON_CD = '01039'
				
				 
		 select * from fi_bizcar fb;
		 
		select * from payphone.tmp_bimastercf
		
		SELECT usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	FROM payphone.vw_mergehr_bimastercf;
	
SELECT *
	FROM payphone.vw_mergehr_bimastercf;
	


vw_mergehr_bimastercf


SELECT biitmastercf.usrcd,
    biitmastercf.usrname,
    biitmastercf.depcd,
    biitmastercf.dephighcd,
    biitmastercf.bsnind,
    to_number(biitmastercf.gubun::text) AS gubun,
    to_char(sysdate, 'yyyymmddhhmiss'::character varying) AS lstdt,
        CASE
            WHEN length((biitmastercf.callno1::text || biitmastercf.callno2::text) || biitmastercf.callno3::text) > 10 THEN (biitmastercf.callno1::text || biitmastercf.callno2::text) || biitmastercf.callno3::text
            ELSE ''::text
        END AS hp_no
   FROM biitmastercf
  WHERE 1 = 1 AND ((biitmastercf.usrcd IN ( SELECT buser00m.user_no
           FROM buser00m @ oraguard(user_no character varying(10), user_nm character varying(50), login_id character varying(10), login_pwd character varying(400), group_uid character varying(20), use_yn character varying(1), del_yn character varying(1), pwd_change_yn character varying(1), cti_yn character varying(1), cti_id character varying(20), cti_pwd character varying(20), cti_tel_no character varying(10), updepcd character varying(4), depcd character varying(4), callno1 character varying(4), callno2 character varying(4), callno3 character varying(4), remark character varying(2000), reg_user_no character varying(10), reg_dt timestamp without time zone, depcd2 character varying(204), pwd_change_dt timestamp without time zone, mod_user_no character varying(10), mod_dt timestamp without time zone)
          WHERE buser00m.cti_id IS NOT NULL)) OR (biitmastercf.usrcd IN ( SELECT DISTINCT ar.areausr
           FROM zbak_pt_factmt ft,
            pt_areamt ar
          WHERE ar.area::text = ft.area::text AND ft.status::text = '1'::text AND ar.areausr IS NOT NULL))) 
          union all
 SELECT vw_payphone_bimastercf.usrcd,
    vw_payphone_bimastercf.usrname,
    vw_payphone_bimastercf.depcd,
    vw_payphone_bimastercf.dephighcd,
    vw_payphone_bimastercf.bsnind,
    vw_payphone_bimastercf.gubun,
    to_char(sysdate, 'yyyymmddhh24miss'::character varying) AS lstdt,
    replace(vw_payphone_bimastercf.hp_no::text, '-'::text, ''::text) AS hp_no
   FROM vw_payphone_bimastercf @ orahr(usrcd character varying(10), usrname character varying(40), depcd character varying(50), dephighcd character varying(50), bsnind character(1), gubun numeric, lstdt character varying(14), hp_no character varying(4000))
          union all
  select usrcd, usrname, depcd, dephighcd, bsnind, to_number(gubun), lstdt, hp_no from payphone.tb_admin
   ;
  
 select * from tb_admin;
  
  select * from payphone.tb_user_password tup where usrcd ='01859'
  
  select * from payphone.tb_user_password tup where substring(usrcd )
  
		
		select USRCD,USRNAME,DEPCD,dephighcd,bsnind,gubun,HP_NO from payphone.bimastercf
		MINUS
		select USRCD,USRNAME,DEPCD,dephighcd,bsnind,gubun,HP_NO from payphone.tmp_bimastercf
		
		select * from payphone.bimastercf b  where usrcd not in (select usrcd from payphone.tmp_bimastercf tb );
		
	--	create table payphone.tb_admin as select * from payphone.bimastercf b where usrcd in ('admin','admi2');
		
	
	
	select * from payphone.tmp_bimastercf tb; 
		
	proc_batch_tb_maintain_schedule
	
	SELECT * FROM DTM_CALENDAR@ORAHR	
WHERE YMD BETWEEN trunc(sysdate)  AND LAST_DAY(sysdate);
	
	truncate table payphone.tmp_bimastercf;
	
	INSERT INTO payphone.tmp_bimastercf(
		usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	)
	SELECT usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	FROM payphone.vw_mergehr_bimastercf;
	
select proc_gethr_bimastercf();

select * from payphone.bimastercf b ;


 SELECT
                        a.usrcd as usrCd
                        , a.usrname as usrName
            , case when a.dephighcd   <>   '1600'
 and i.deptreecnt = '2' then a.dephighcd else a.depcd end as depCd
                        , a.deplvl as depLvl
                        , a.dephighcd as depHighCd
                        , a.bsnind as bsnInd
                        , a.gubun as gubun
                        , a.hp_no as hpNo
                        , a.lstusr as lstUsr
                        , a.lstdt as lstDt
                        , b.errcnt as errCnt
                        , b.usrpwd as usrPwd
                        , b.cretdt as cretDt
                        , b.editdt as editDt
                        , b.lastdt as lastDt
                        , a.group_nm_en groupNmEn
                        , i.deptreecnt as depTreeCnt
                    , c.distuse as distUse
                    , c.distmeter as distMeter
                    , c.agreuse as agreUse
                    , c.agregroup as agreGroup
            , nvl(d.area, '') as area
                FROM payphone.bimastercf AS a
                LEFT OUTER JOIN payphone.tb_user_password AS b ON a.usrcd = b.us                                                                                                             rcd
        LEFT OUTER JOIN payphone.biintmt AS i ON a.depcd = i.depcd AND i.deptree                                                                                                             cnt IN ('1', '2', '3', '4')
        LEFT OUTER JOIN
 (select depcd, areausr, area
 from payphone.pt_areamt
 where area_use = 'Y'
 and area_to = '99991231'
 and uniind = '1') d on a.depcd = d.depcd AND a.usrcd = d.areausr
        , payphone.tb_repairset c
                WHERE a.usrcd = 'admi2'
                limit 1
                
                 SELECT
                        a.usrcd as usrCd
                        , a.usrname as usrName
            , case when a.dephighcd   <>   '1600'
 and i.deptreecnt = '2' then a.dephighcd else a.depcd end as depCd
                        , a.deplvl as depLvl
                        , a.dephighcd as depHighCd
                        , a.bsnind as bsnInd
                        , a.gubun as gubun
                        , a.hp_no as hpNo
                        , a.lstusr as lstUsr
                        , a.lstdt as lstDt
                        , b.errcnt as errCnt
                        , b.usrpwd as usrPwd
                        , b.cretdt as cretDt
                        , b.editdt as editDt
                        , b.lastdt as lastDt
                        , a.group_nm_en groupNmEn
                        , i.deptreecnt as depTreeCnt
                    , c.distuse as distUse
                    , c.distmeter as distMeter
                    , c.agreuse as agreUse
                    , c.agregroup as agreGroup
            , nvl(d.area, '') as area
                FROM payphone.bimastercf AS a
                LEFT OUTER JOIN payphone.tb_user_password AS b ON a.usrcd = b.usrcd
        LEFT OUTER JOIN payphone.biintmt AS i ON a.depcd = i.depcd AND i.deptreecnt IN ('1', '2', '3', '4')
        LEFT OUTER JOIN
 (select depcd, areausr, area
 from payphone.pt_areamt
 where area_use = 'Y'
 and area_to = '99991231'
 and uniind = '1') d on a.depcd = d.depcd AND a.usrcd = d.areausr
        , payphone.tb_repairset c
                WHERE a.usrcd = 'admin'
                limit 1

                
                select * from payphone.tb_user_password tup where usrcd ='admi2'
                
                
                select * from biintmt b where depcd ='H210';
                
                select * from payphone.pt_factmt@ pf  where fact_telno  ='000208715407'
                
                
                select * from pt_factmt@oraktlpt where tel1 ='0002' and tel2 ='0871' and tel3 ='5407';
               
               select * from pt_areamt pa where depcd ='H030' and uniind ='1';
              
              select * from pt_areamt pa  where  areausr ='00475'
              
              select * from 
               
               
               select * from pt_areamt pa  where areausr  ='00475'
                
                select * from 
                
                 -- 0002-0871-5407 
                
                select * from tb_msg tm where msg_id ='confirm.init.pwd'
                
                
               update payphone.pt_factmthist set 
	 	custcall  = ''
	 where uniind ='2' and (custcall != '' or custcall != null);
                
                
                
                proc_payphone_tb_joblog
                
                tb_joblog
                
                select * from payphone.pt_factmt pf 
                
                select * from payphone.tb_user_password tup where usrcd ='02463'
                
                
                
  SELECT
                        a.usrcd as usrCd
                        , a.usrname as usrName
            , case when a.dephighcd   <>   '1600'
 and i.deptreecnt = '2' then a.dephighcd else a.depcd end as depCd
                        , a.deplvl as depLvl
                        , a.dephighcd as depHighCd
                        , a.bsnind as bsnInd
                        , a.gubun as gubun
                        , a.hp_no as hpNo
                        , a.lstusr as lstUsr
                        , a.lstdt as lstDt
                        , b.errcnt as errCnt
                        , b.usrpwd as usrPwd
                        , b.cretdt as cretDt
                        , b.editdt as editDt
                        , b.lastdt as lastDt
                        , a.group_nm_en groupNmEn
                        , i.deptreecnt as depTreeCnt
                    , c.distuse as distUse
                    , c.distmeter as distMeter
                    , c.agreuse as agreUse
                    , c.agregroup as agreGroup
            , nvl(d.area, '') as area
                FROM payphone.bimastercf AS a
                LEFT OUTER JOIN payphone.tb_user_password AS b ON a.usrcd = b.usrcd
        LEFT OUTER JOIN payphone.biintmt AS i ON a.depcd = i.depcd AND i.deptreecnt IN ('1', '2', '3', '4')
        LEFT OUTER JOIN
 (select depcd, areausr, area
 from payphone.pt_areamt
 where area_use = 'Y'
 and area_to = '99991231'
 and uniind = '1') d on a.depcd = d.depcd AND a.usrcd = d.areausr
        , payphone.tb_repairset c
                WHERE a.usrcd = '02463'
                limit 1
                
                
                select * from tc_cpmsmt@oracpms where tel_no ='000222124561'

                
                select * from payphone.pt_bldplc pb where bldgb is null and uniind = '2';
                
               select * from tb_maintain tm;
               
              
                select 
             a.unino, gpsy as gps_y, gpsx as gps_x
             , (coalesce( bldadr1 ,'') || coalesce( bldadr2 , '') ) bldadr
             , bldzip, bldplcnm, a.fact_telno as tel_no,bldgb as bldgb
         --    ,coalesce( (( acos( sin( #{gpsY}::float * pi() / 180 ) * sin( gpsy::float * pi() / 180 ) + cos( #{gpsY}::float * pi() / 180 ) * cos( gpsy::float * pi() / 180 ) * cos(( #{gpsX}::float - gpsx::float ) * pi() / 180 )) * 180 / pi()) * 60 * 1.1515 ) * 1.60934, - 1 ) as km_distance
             from payphone.PT_FACTMT a left outer join  payphone.pt_bldplc b
             on a.bldplcno = b.bldplcno and b.ft_use = '1'
             -- where a.unino = #{unino}::numeric
             
             
             
             
select
	a.jungsn as jungSn ,
	get_bibsici_prnm('2066', c.uniind) as uniind ,
	a.junggb as jungGb ,
	get_depnm(c.updepcd, '2') as upDepCdNm ,
	get_depnm(c.depcd, '3') as depCdNm ,
	get_ktdepcdnm(c.ktdepcd) as ktDepCdNm
	-- , get_usrname(a.jungid) as jungNm
,
	get_usrname(c.areausr) as jungNm ,
	get_phonegb_prnm(c.phoneknd) as phoneKnd ,
	a.jungtel as jungTel ,
	c.bldplcnm as bldPlcNm ,
	b.revDate ,
	b.gojang_des as gojangDes ,
	a.jungdt as jungDate ,
	coalesce(a.jungty, '') as jungTy ,
	coalesce(a.jungcd, '') as jungCd ,
	a.jungdes as jungDes ,
	get_usrname(a.lstusr) as usrName ,
	case
		when a.jungdt >= to_char(now()-4, 'YYYYMMDD') then 'Y'
		else 'N'
	end as canFlag ,
	case
		when a.jungid = '99999' then 'Y'
		else 'N'
	end as usrCanFlag ,
	a.rev_seq as revSeq ,
	a.jung_entr_yn as jungEntrYn ,
	case
		when (
		select
			count(1) cnt
		from
			payphone.tb_attachfile t
		where
			t.uniqno = a.jungsn::text
			and t.file_gb = 'mnt'
			and t.del_yn = 'N') > 0 then 'O'
		else 'X'
	end mnt_cnt ,
	get_bibsici_prnm('0244', a.bldgb) as bldGb
from
	payphone.tb_maintain a
left join (
	select
		rev_date || rev_time as revDate , gojang_des , rev_seq
	from
		payphone.tb_repair
	where
		1 = 1
		and rev_date <= '20200828' || '235959'
		and rev_date >= '20200828' || '000000' )b on
	a.rev_seq = b.rev_seq
left join payphone.pt_factmthist c on
	a.jungtel = c.fact_telno
	--  
	and a.updepcd = c.updepcd
	and c.sttdt <= substring(a.jungdt, 1, 8)
	and c.lstdt >= substring(a.jungdt, 1, 8)
where
	1 = 1
	and a.jungdt <= '20200828' || '235959'
	and a.jungdt >= '20200828' || '000000'
order by
	a.jungdt desc
	
	
	select * from payphone.tb_repair tr where gojang_tel ='003109842575'
	
	PROC_CHANGE_PT_FACTMT
	
	from (select a.rev_date,a.rev_time,a.jubsu_no,a.jumgumja_id,(select c.usrname from bimastercf c where c.usrcd =a.jumgumja_id) jumgumja_des,a.hochul_tel,a.suri_cd,a.suri_des, a.wan_date,a.wan_time,a.hochul_date, a.hochul_time,wanro_flag,hochul_gb FROM t_jubsu@oracpms a
          where a.rev_date  >= to_char(current_date-7,'YYYYMMDD')
          minus
         select rev_date,rev_time,jubsu_no,jumgumja_id,jumgumja_des,hochul_tel,suri_cd,suri_des, wan_date,wan_time,hochul_date, hochul_time,wanro_flag,hochul_gb FROM tb_repair
          where rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2') b
    where a.jubsu_no = b.jubsu_no and a.rev_date= b.rev_date and a.rev_time = b.rev_time
    and a.rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2'
    
    PROC_GETGUARD_T_JUBSU
    
    select * from bibsici b where lcd ='2053' 
	
	select * from user_source where text like '%rev_cd=''2''%'
	
	select proc_change_pt_factmt();
	
	select * from payphone.tb_maintain tm where jungtel   ='003109842575' and jungdt like '20200828%'
	
	-- 031 984 2575
	
	
	update pt_factmt@oraktlpt a set a.area = b.area , a.areausr = b.areausr
	from (
	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	minus
	select unino,area,areausr from pt_factmt@oraktlpt) B
	where A.unino = b.unino
	
	select * from
	(
	select a.unino,a.area ,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1' )
	
	select * from pt_areamt b where 1=1 and b.area_use ='Y'
	and (area,depcd,uniind)
 	in (select area,depcd,uniind from payphone.pt_factmt pf where status ='1')	
	
	select unino,area, count( area)
	from pt_factmt@oraktlpt having count( area) > 1 group by unino,area

select a.unino,a.area ,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	
	select unino,count(unino) from 
()
	group by unino 
	
select * from 	(
select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y' group by areausr ) areausr
	from payphone.pt_factmt a
	where status ='1'
	) where 1=1
	and (unino, area, areausr) in (
	select unino,area, areausr
	from pt_factmt@oraktlpt )
	
	
	
	
select *
	from payphone.pt_factmt a
	where status ='1' and depcd ='H220'
	and area ='11' and uniind ='3'
	
	-- 03 07 04 21 08 01 13 02 12 09 06 11
	
	select depcd, area, areausr, uniind  from pt_areamt b where depcd ='H220' and area ='04' and area_use ='Y'  group by  depcd, area, areausr, uniind  
	
	select * from biintmt b  where depcd ='H220';

select * from pt_areamt pa  where depcd ='H220' and areausr in ('01667', '02976') and area_use  ='Y'

select * from bimastercf b  where depcd ='H220'

select * from payphone.pt_factmt pf where depcd ='H220' and area ='11'

select * from pt_bldplc pb  where bldplcno  in (select bldplcno from pt_factmt pf where depcd ='H220' and uniind ='1' and area ='11' );

select * from pt_areamt pa where depcd ='H220' and area_use  ='Y' and uniind ='3'


 -- 01667 02976
	
	  select unino,   area, areausr from pt_Factmt@oraktlpt where depcd ='H220';
	 
	 -- H000 G000 , O000, I000, Q000 
	  -- H030 H220 H060 H040 H020 
	  -- H220
	 
	 select * from biintmt b where deptreecnt ='3' and dephighcd ='H000' and useflag ='Y'
	
	 select depcd, uniind, area, count(area) from payphone.pt_areamt pa where area_use ='Y' group by  depcd,uniind, area
	 
	 for select unino,   area, areausr from pt_Factmt@oraktlpt loop 
	 
	 end loop;
	 
	
	select * from payphone.pt_areamt
	
	
	 select payphone.proc_geterp_fi_asset();
	 
	
	select * from payphone.tb_user_password tup where usrcd ='01859';
	
	
	INSERT INTO payphone.fi_asset(
		cd_asset, cd_company, nm_asset, tp_asset, cd_pc, cd_mngdept
		, no_mngemp, nm_pur, nm_makecomp, nm_size, nm_model
		, dt_pur, tp_get, tp_tax, qt_pur, am_pur, cd_exch
		, rt_exch, am_expur, cd_fixacct, nm_note, dt_dvpur
		, id_insert, dts_insert, id_update, dts_update, st_docu
		, cd_bizarea, cd_mngloca, am_value, am_fpur, qt_fpur
		, bar_code, tp_form, tp_class, yn_seper, cd_purdept
		, no_mngemp2, cd_reasset, in_year, ym_end, cd_asseth
		, cd_saleacct1, cd_saleacct2, cd_disacct1, cd_disacct2
		, cd_userdef1, nm_use, nm_exp, nm_proof, no_extemp
		, nm_asset_l1, nm_asset_l2, nm_asset_l3, nm_asset_l4, nm_asset_l5, am_govern
		--, depcd, used_yn
	)
	
	
	SELECT fas.cd_asset, fas.cd_company, fas.nm_asset, fas.tp_asset, fas.cd_pc, fas.cd_mngdept
		, fas.no_mngemp, fas.nm_pur, fas.nm_makecomp, fas.nm_size, fas.nm_model
		, fas.dt_pur, fas.tp_get, fas.tp_tax, fas.qt_pur, fas.am_pur, fas.cd_exch
		, fas.rt_exch, fas.am_expur, fas.cd_fixacct, fas.nm_note, fas.dt_dvpur
		, fas.id_insert, fas.dts_insert, fas.id_update, fas.dts_update, fas.st_docu
		, fas.cd_bizarea, fas.cd_mngloca, fas.am_value, fas.am_fpur, fas.qt_fpur
		, fas.bar_code, fas.tp_form, fas.tp_class, fas.yn_seper, fas.cd_purdept
		, fas.no_mngemp2, fas.cd_reasset, fas.in_year, fas.ym_end, fas.cd_asseth
		, fas.cd_saleacct1, fas.cd_saleacct2, fas.cd_disacct1, fas.cd_disacct2
		, fas.cd_userdef1, fas.nm_use, fas.nm_exp, fas.nm_proof, fas.no_extemp
		, fas.nm_asset_l1, fas.nm_asset_l2, fas.nm_asset_l3, fas.nm_asset_l4, fas.nm_asset_l5, fas.am_govern
	FROM payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	left outer join payphone.fi_asset aa on aa.cd_asset=fas.cd_asset and aa.cd_company=fas.cd_company
	where 1=1
	and fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	and aa.cd_asset is null
	;
	

alter SERVER tds_erp

01673

select * from payphone.bimastercf b where usrcd ='01673'
OPTIONS (ADD msg_handler 'notice');

ALTER SERVER tds_erp
   OPTIONS (ADD msg_handler 'notice');

select * from fi_bizcar fb ;

select * from fi_asset fa ;

select * from payphone.refep_fi_dpbase rfa ;


select proc_ins_fi_bizcaramt_mng('202003');


select * from fi_bizcaramt_mng fbm where yyyymm like '202007'; 

proc_ins_fi_bizcaramt_mng


select * from tb_user_password tup where usrcd ='01673';

select * from 

 -- ktl01673!

select cd_bizcar, yyyymm, num_mileacc, num_endacc, rent_amt, oil_amt, add_amt, ins_amt, etc_amt
	from fi_bizcaramt where yyyymm = '202007';
	


select * from fi_bizcaramt_mng where yyyymm ='202008';




select proc_ins_fi_bizcaramt_mng('202007');

select proc_batch_tb_maintain_schedule();
		
			

    
	
	select SUM(DA)	
	from (		
	SELECT YMD,1 DA FROM DTM_CALENDAR		
	WHERE YMD BETWEEN trunc(sysdate) AND LAST_DAY(sysdate)		
	AND MINUS_DD ='1'		
	union all		
	SELECT A.YMD,DECODE(B.WORK_CD,'AD10',-1,-0.5) FROM DTM_CALENDAR A,		
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO in (select distinct(b.areausr) areausr
        from payphone.pt_areamt b
        where b.depcd like substr(b.DEPCD,1,1)||'___'
        and (b.depcd, b.area, b.uniind)
        in ( select depcd,area,1 from (
	select A.DEPCD,A.AREA,get_retcyl(a.boounino) retcyl,COUNT(*) cnt		
	from PT_FACTMT A, pt_bldplc B		
	where A.BLDPLCNO = B.bldplcno
	and get_retcyl(a.boounino)='301'
	and a.uniind ='1'
	and a.depcd like '%'
	and a.area like '%'
	and a.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))	
	group by A.DEPCD,A.AREA,get_retcyl(a.boounino)))
        and b.area_use = 'Y') ) B		
	WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD);	
	
payphone.get_area_usrid(list_a.depcd , '1', list_a.area);

 ;
        
    SELECT * FROM DTM_CALENDAR		
	WHERE YMD BETWEEN trunc(sysdate) AND LAST_DAY(sysdate)		
	AND MINUS_DD ='1'		
       
	select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO in (select distinct(b.areausr) areausr
        from payphone.pt_areamt b
        where b.depcd like substr(b.DEPCD,1,1)||'___'
        and (b.depcd, b.area, b.uniind)
        in ( select depcd,area,1 from (
	select A.DEPCD,A.AREA,get_retcyl(a.boounino) retcyl,COUNT(*) cnt		
	from PT_FACTMT A, pt_bldplc B		
	where A.BLDPLCNO = B.bldplcno
	and get_retcyl(a.boounino)='301'
	and a.uniind ='1'
	and a.depcd like '%'
	and a.area like '%'
	and a.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))	
	group by A.DEPCD,A.AREA,get_retcyl(a.boounino)))
        and b.area_use = 'Y')
      
        
      select sum(da) from (SELECT YMD,1 DA FROM DTM_CALENDAR		
	WHERE YMD BETWEEN trunc(sysdate) AND LAST_DAY(sysdate)		
	AND MINUS_DD ='1'	)
	
	union all		
	
	select SUM(DA) 
	from (		
	SELECT YMD,1 DA FROM DTM_CALENDAR		
	WHERE YMD BETWEEN trunc(sysdate) AND LAST_DAY(sysdate)		
	AND MINUS_DD ='1'		
	union all		
	SELECT A.YMD,DECODE(B.WORK_CD,'AD10',-1,-0.5) FROM DTM_CALENDAR A,		
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO ='01668' ) B		
	where YMD = B.STA_YMD);
	--	WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD);		
	
select * from dtm_calendar dc where YMD between to_date('20200921') and to_date('20200925');

select  LAST_DAY(sysdate);

select emp_no,14,sum(dec), 14 + sum(dec) from (
	SELECT B.emp_no,A.YMD,DECODE(B.WORK_CD,'AD10',-1,-0.5) as dec FROM DTM_CALENDAR A,		
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO in (select distinct(b.areausr) areausr
        from payphone.pt_areamt b
        where b.depcd like substr(b.DEPCD,1,1)||'___'
        and (b.depcd, b.area, b.uniind)
        in ( select depcd,area,1 from (
	select A.DEPCD,A.AREA,get_retcyl(a.boounino) retcyl,COUNT(*) cnt		
	from PT_FACTMT A, pt_bldplc B		
	where A.BLDPLCNO = B.bldplcno
	and get_retcyl(a.boounino)='301'
	and a.uniind ='1'
	and a.depcd like '%'
	and a.area like '%'
	and a.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))	
	group by A.DEPCD,A.AREA,get_retcyl(a.boounino)))
        and b.area_use = 'Y') ) B		
	WHERE YMD between B.STA_YMD and B.END_YMD ) group by emp_no;
	
	select SUM(DA) 	
	from (		
	SELECT YMD,1 DA FROM DTM_CALENDAR		
	WHERE YMD BETWEEN trunc(sysdate) AND LAST_DAY(sysdate)		
	AND MINUS_DD ='1'		
	union all	
	SELECT A.YMD,DECODE(B.WORK_CD,'AD10',-1,-0.5) FROM DTM_CALENDAR A,		
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO ='01490' ) B		
	WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD
	);	
	
-- 01668
select * from DTM_DAILY_APPL_PAY		
	where (STA_YMD between trunc(sysdate) and LAST_DAY(sysdate)	
	or END_YMD between trunc(sysdate) and LAST_DAY(sysdate))		
	and EMP_NO ='01788'

 select ymd,sum(da) da from (		
		SELECT YMD,1 DA FROM DTM_CALENDAR	
		WHERE YMD BETWEEN trunc(sysdate)  AND LAST_DAY(sysdate )	
		AND MINUS_DD ='1'	
		MINUS	
		SELECT A.YMD,DECODE(B.WORK_CD,'AD10',1,0.5) FROM DTM_CALENDAR A,	
		(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY	
		where (STA_YMD between trunc(sysdate)  and LAST_DAY(sysdate )	
		or END_YMD between trunc(sysdate)  and LAST_DAY(sysdate ))	
		and EMP_NO ='01668') B	
		WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD)
		group by ymd
		
		select * from payphone.pt_areamt pa where areausr ='01668'
					
    select depcd,area,retcyl,cnt from (
	select A.DEPCD,A.AREA,get_retcyl(a.boounino) retcyl,COUNT(*) cnt		
	from PT_FACTMT A, pt_bldplc B		
	where A.BLDPLCNO = B.bldplcno
	and get_retcyl(a.boounino)='301'
	and a.uniind ='1'
	and a.depcd like 'G250'
	and a.area like '5' 
	and a.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))	
	group by A.DEPCD,A.AREA,get_retcyl(a.boounino))
	
	
	
	select proc_batch_tb_maintain_schedule();

select 4+ (ceil(19/10*1))
	
select  mod(99,100);

select  raise notice '%',100;

 select ymd,sum(da) da from (		
		SELECT YMD,1 DA FROM DTM_CALENDAR	
		WHERE YMD BETWEEN trunc(sysdate)  AND LAST_DAY(sysdate )	
		AND MINUS_DD ='1'	
		MINUS	
		SELECT A.YMD,DECODE(B.WORK_CD,'AD10',1,0.5) FROM DTM_CALENDAR A,	
		(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY	
		where (STA_YMD between trunc(sysdate)  and LAST_DAY(sysdate )	
		or END_YMD between trunc(sysdate)  and LAST_DAY(sysdate ))	
		and EMP_NO ='01668') B	
		WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD)
		group by ymd
		
		select SEQ_TB_MAINTAIN_SCHEDULE.NEXTVAL,unino,'20200910','301',SYSDATE from (			         
	         select rownum rnum,unino,bldplcno,ordr from (		
			select d.UNINO,d.BLDPLCNO,e.ORDR
			from PT_FACTMT d, pt_bldplc e
			where d.BLDPLCNO = e.bldplcno
			and get_retcyl(d.boounino) ='301'
			and d.AREA = '5'
			and d.DEPCD = 'G250'
			and d.uniind ='1'
			and d.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
								where jungdt is not null
				 			and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))
			order by 3))
		where rnum between 4 and 6
		
		SELECT d.YMD FROM DTM_CALENDAR d,
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY
	 where (STA_YMD between to_date('20200914')  AND to_date('20200919')		
	 or END_YMD between to_date('20200914')  AND to_date('20200919')		)		
	 and work_cd ='AD10'
	 and EMP_NO ='01668' ) e		
	 WHERE d.YMD BETWEEN e.STA_YMD AND e.END_YMD
	 
	select count(*)		
	from (		
	SELECT YMD FROM DTM_CALENDAR		
	WHERE YMD between to_date('20200914')  AND to_date('20200919')		
	AND MINUS_DD ='1'
	minus
	SELECT d.YMD FROM DTM_CALENDAR d,
	(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY
	 where (STA_YMD between to_date('20200914')  AND to_date('20200919')	
	 or END_YMD between to_date('20200914')  AND to_date('20200919'))		
	 and work_cd ='AD10'
	 and EMP_NO ='01668' ) e		
	 WHERE d.YMD BETWEEN e.STA_YMD AND e.END_YMD);
	 
	
select * from v_DTM_DAILY_APPL_PAY@ORAHR	
where STA_YMD bETWEEN trunc(sysdate)  AND LAST_DAY(sysdate) and emp_no ='01668';