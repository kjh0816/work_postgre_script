select usrcd,usrpwd ,char_length(usrpwd), octet_length(usrpwd) from payphone.tb_user_password having char_length(usrpwd) < 64
group by usrcd,usrpwd

select * from payphone.tb_user_password tup where usrcd ='01859'

select * from payphone.bimastercf b  where usrcd  ='02006';
--01859 01050005384
--02006 01096707377


-- e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
--d19f8a050eea3f421485e15190638239ba0662651a4d728177d7b281caf07261
-- 7674f9e2d280769fd33efd95f780a6ed6329c263d7a122c3522238b51b3edd
-- f5bb2ba9bdc85327304e3fc4b187e8789fc204848496ed814c21f96cf0952cfb
 

t_log_des_v

select * from payphone.pt

proc_getmake_tb_cosscpmsmm

get_updepnm_hrdept

--expr:(dataset.getColumn(currow, "actCode")=="A3" || dataset.getColumn(currow, "actCode")=="A4") && dataset.getColumn(currow, "procGubun")=="11" ? "해지처리완료" : "처리"


select areausr, count(1) from pt_areamt pa where uniind ='1' and area_use ='Y' group by areausr 

select * from pt_factmt pf w

  select 
            unino, gps_y, gps_x,
            bldadr, bldzip, bldplcnm, tel_no, coalesce(km_distance,1) as km_distance,
            b.gojang_tel, b.gojang_des, b.tel_desc
       
 from 
        (
             select 
             a.unino, gpsy as gps_y, gpsx as gps_x
             , (coalesce( bldadr1 ,'') || coalesce( bldadr2 , '') ) bldadr
             , bldzip, bldplcnm, a.fact_telno as tel_no, bldgb as bldgb,
             coalesce( (( acos( sin( '37.435736'::float * pi() / 180 ) * sin( gpsy::float * pi() / 180 ) + cos( '37.435736'::float * pi() / 180 ) * cos( gpsy::float * pi() / 180 ) * cos(( '127.128972'::float - gpsx::float ) * pi() / 180 )) * 180 / pi()) * 60 * 1.1515 ) * 1.60934, - 1 ) as km_distance
             from payphone.PT_FACTMT a left outer join  payphone.pt_bldplc b
             on a.bldplcno = b.bldplcno
 and b.ft_use = '1'
              where a.unino = '970879'::numeric
        )a left outer join 
        (
                         select gojang_tel, gojang_des, tel_desc
            from payphone.tb_repair
            where (wanro_flag = '0' or wanro_flag is null)
            group by gojang_tel, gojang_des, tel_desc
                     )
         b
        on a.tel_no = b.gojang_tel
        limit 1

select * from bimastercf b where usrcd ='02577'

select * from bibsici  where lcd like '%0244%';

get_bibsici_prnm

select * from biintmt b where depcd ='O030'

select * from payphone.

select '201911' AS CPJSDT,UPDEPCD,DEPCD,ACCDEPCD,KTDEPCD, a.fact_telno TELNO
		, DECODE(PHONEKND,'06','07',PHONEKND) PHONEGB
		, SUBSTR('201911',1,4) AS YYYY, SUBSTR('201911',5,2) AS MON
		, SUBSTR(a.fact_telno,1,4) tel1, SUBSTR(a.fact_telno,5,4) tel2, SUBSTR(a.fact_telno,9,4) tel3
		, (SELECT C.BOXNO FROM PT_TTCOBOXNO C  WHERE C.UNINO = A.UNINO) AS BOXNO
		, SSCOLLECTCNT, CPCOLLECTCNT, GET_BLDPLCNM(BLDPLCNO) AS SSPLC, BLDPLCNO
		, NVL(CPMSCARD,0) CPMSCARD, NVL(CPMSCOIN,0) CPMSCOIN
		, NVL(CPMSAMOUNT,0) CPMSAMOUNT, NVL(SSFEE,0) SSFEE
		, NVL(SSFEE-CPMSAMOUNT,0) JSFEE_KUMGO, NVL(SSFEE-CPMSCOIN,0) JSFEE_USING
		, ROUND(( NVL(CPMSAMOUNT,0) * 0.01 ), 0) TRANS_ERR_KUMGO
		, ROUND(( NVL(CPMSCOIN,0) * 0.01 ), 0) TRANS_ERR_USING
		, 0 JUNGSAN_ERR, 0 KUMGO_DONAN
		, 0 GITA_ERR, 0 WONIN_NOT, 0 BUJOK_1, 0 BUJOK_2, 0 BUJOK_3, 0 BUJOK_4, 0 BUJOK_5
		, (case  when (SSFEE - ( NVL(CPMSAMOUNT,0)) + (ROUND(( NVL(CPMSAMOUNT,0) * 0.01 ), 0))) >= 0
	 		then 0
			else (SSFEE - ( NVL(CPMSAMOUNT,0)) + (ROUND(( NVL(CPMSAMOUNT,0) * 0.01 ), 0)))
		end ) TOTAL_BUJOK_KUMGO
		, (case  when (SSFEE - ( NVL(CPMSCOIN,0)) + (ROUND(( NVL(CPMSCOIN,0) * 0.01 ), 0))) >= 0
			then 0
			else (SSFEE - ( NVL(CPMSCOIN,0)) + (ROUND(( NVL(CPMSCOIN,0) * 0.01 ), 0)))
		end ) TOTAL_BUJOK_USING
		, A.UNINO ,	area
		, (select areausr from payphone.pt_areamt where uniind=a.uniind and depcd=a.depcd and area=a.area and area_to='99991231') areausr
		, -2 JSLAG, TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') LSTDT
		, (select areausr from payphone.pt_areamt where uniind=a.uniind and depcd=a.depcd and area=a.area and area_to='99991231') sabun
		, '' DOCOMMT, '' RESERVED1, '' RESERVED2
	from pt_factmthist a
	, (
		select unino, SUM(SASAN) SSCOLLECTCNT, SUM(CPMS) CPCOLLECTCNT, SUM(CPMSCARD) CPMSCARD
		, SUM(CPMSCOIN) CPMSCOIN, SUM(CPMSAMOUNT) CPMSAMOUNT, SUM(SSFEE) SSFEE , sum(amount)as amount  
	 	FROM (
	 		select unino, COUNT(*) SASAN, 0 CPMS, sum(amount)as amount
	 		, 0 CPMSCARD, 0 CPMSCOIN, 0 CPMSAMOUNT, SUM(AMOUNT) SSFEE
			from payphone.tb_ttcossdd
			where ssdt like '201911'||'%'
			--AND	UPDEPCD LIKE SUBSTR(arg_depcd,1,1)||'%'
			--and depcd LIKE arg_depcd
			--AND KTDEPCD LIKE arg_ktdepcd
			group by unino
			union all
			select unino, 0 SASAN, COUNT(*) CPMS, sum(amount)*-1 as amount
			, SUM((CITYCARDFEE + OUTCITYCARDFEE + WORLDCARDFEE + CARDFEE114 + CITYICFEE + OUTCITYICFEE + WORLDICFEE + ICFEE114)) CPMSCARD
			, SUM((CITYCOINFEE + OUTCITYCOINFEE + WORLDCOINFEE + COINFEE114 + DOWNCOIN)) CPMSCOIN
			, SUM(AMOUNT) CPMSAMOUNT, 0 SSFEE
			from payphone.tb_ttcpmsdd
			where cpmsdt between to_char(add_months(to_date('201911','yyyymm'),-1),'yyyymm')||'26' and '201911'||'25'
			--and depcd LIKE arg_depcd
			--AND KTDEPCD LIKE arg_ktdepcd
			group by unino
		)
		group by unino
	) b
	where a.unino=b.unino
    and (a.lstdt ='99991231' or (a.opflag='D' and a.remodt between to_char(add_months(to_date('201911','yyyymm'),-1),'yyyymm')||'26' and '201911'||'25'))

    
    select * from payphone.pt_factmt pf where uniind  in (3) and bldplcno  in (select bldplcno  from payphone.pt_bldplc pb where uniind='3' and gpsx is null);
    
    
    select COALESCE(gpsx,'0') as bldGpsX , COALESCE(gpsy,'0') as bldGpsY, uniind as bldUniind from payphone.pt_bldplc where bldplcno in (select bldplcno from payphone.pt_factmt pf) and gpsx is null
 
    
    select * from payphone.tb_user_password tup where usrcd ='99999'
    
    select * from payphone.tb_maintain tm where jungdt like '20200620%'
    
    select bldplcno from payphone.pt_factmt pf where fact_telno ='003107210466'
    
    select  from payphone.pt_bldplc pb where bldplcno ='2016070137'
    
    
   
    
     select count( 1 ) total
		from (
				select 
				coalesce( FA.UNINO::int , 0 ) as UNINO-- 고유번호                         
				, coalesce( PL.gpsx, '' ) as BLDGPS , PL.gpsy as gps_y , PL.gpsx as gps_x 
				, coalesce( (( acos( sin( '37.43555666666667'::float * pi() / 180 ) * sin( gpsy::float * pi() / 180 ) + cos( '37.43555666666667'::float * pi() / 180 ) * cos( gpsy::float * pi() / 180 ) * cos(( '127.12904833333332'::float - gpsx::float ) * pi() / 180 )) * 180 / pi()) * 60 * 1.1515 ) * 1.60934, - 1 ) as km_distance 
				from payphone.BIMASTERCF UR
				left outer join payphone.PT_AREAMT AM on AM.AREAUSR = UR.USRCD and AM.depcd = UR.depcd and AM.area_to = '99991231'
				left outer join payphone.PT_FACTMT FA on FA.depcd = AM.depcd and FA.area = AM.area and FA.UNIIND = AM.UNIIND and FA.status = '1' and FA.fact_knd = '1' -- and FA.UNIIND in ( '1', '3' )
				left outer join payphone.PT_BLDPLC PL on FA.BLDPLCNO = PL.BLDPLCNO and PL.ft_use = '1'
				left outer join payphone.tc_cpmsmt CP on CP.updepcd = FA.updepcd and CP.tel_no = FA.FACT_TELNO and CP.unino = FA.unino
		        where 1 = 1
		             and FA.uniind ='1'
				) a
        where 1=1
        and km_distance   <   5
        and gps_y is not null
        and gps_x is not null
        
        
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
, coalesce( PL.GPSX, '' ) as BLDGPS , PL.GPSY as GPS_Y , PL.GPSX as GPS_X , coalesce( (( ACOS( SIN( '37.43555666666667'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.43555666666667'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.12904833333332'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) as KM_DISTANCE ,
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
		and KM_DISTANCE < 5 ) C
where
	1 = 1
	and GPS_Y is not null
	and GPS_X is not null
order by
	UNIIND,
	RN
limit '50'::numeric offset ('1'::numeric-1) * '50'::numeric

select * from payphone.tb_user_password tup where usrcd ='99999'

select * from user_source where text like '%tb_repair%'

select * from payphone.tb_user_group tug 

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
		WHERE a.usrcd = '99999'
		limit 1
		
		insert
	into
	payphone.tc_cpmssave ( updepcd, depcd, accdepcd, save_dtm, unino, gb, scd, "desc", close_date, lstusr, lstdt )
values ( 'I000', 'I040', 'I040', '20200702000000', '57518', '1', '120002', '전기단선', '20200710000000', '99999', to_char(now(), 'YYYYMMDDhh24miss') )

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
 and '20200702' || '235959'
 
 select * from payphone.tb_user_password tup where usrcd ='99999'
 
 
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
 
 
 select * from payphone.pt_bldplc pb where bldplcnm  like '%수정마을%';



 

select
	          depGbn, depcd, depnm, dephighcd, deptreecnt, org_cd as orgCd 
 from 
			(
			 select lower(substr(depcd,1,1)) as depGbn,depcd,depnm,dephighcd,deptreecnt, org_cd
 from payphone.biintmt b
 where deptreecnt in (1,2)
 and useflag ='Y'
 and dephighcd  ='1000'
 and (org_cd is not null or org_cd !='')
			 union all  
			 select lower(substr(depcd,1,1)) as depGbn,depcd,depnm,dephighcd,deptreecnt, org_cd
 from payphone.biintmt
 where deptreecnt = 2 
 and useflag ='Y' 
 and depcd not in ('K000')
 and (org_cd is not null or org_cd !='')
 and substr(depcd, 2, 5) = '000'
			 )
 where 1=1
	    
			
			select * from payphone.bimastercf b where usrcd ='99999'
			
			select * from payphone.tb_user_group tug 
			
			--99999	김영섭	F040		F000	1	5	01072265478	admin	20191022104048	admin
			-- General BranchOffice MoneyBalance Headquarter LocalHead Admin FieldManager Tester branchMechanic LocalMechanic 
			
			select * from fi_bizcar
		
		select * from tb_user_group tug 
		
		
		CREATE OR REPLACE FUNCTION payphone.get_orgCd_depCd(depcd text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
/*****************************************************************
* 함수명 : get_depnm_ktl
* 메소드기능 : 기관정보테이블(biintmt)의 코드명 (depnm)을 리턴한다.
* Param : depcd_from - 기관코드
* RETURN VALUE : 기관명
*  AUTHOR : 조남일
*****************************************************************/
	return_value text;
BEGIN
	BEGIN
		SELECT org_cd
		INTO return_value
		FROM biintmt
		WHERE depcd = depcd
		AND deptreecnt IN ('1','2','3','4');
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		return_value := ' ';
	END;

	RETURN return_value;
END;
$function$
;


CREATE OR REPLACE FUNCTION payphone.get_depnm_hrdept(cd_mngdept text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
/*****************************************************************
* 함수명 : get_depnm_ktl
* 메소드기능 : 기관정보테이블(biintmt)의 코드명 (depnm)을 리턴한다.
* Param : depcd_from - 기관코드
* RETURN VALUE : 기관명
*  AUTHOR : 조남일
*****************************************************************/
	return_value text;
BEGIN
	BEGIN
		SELECT depnm
		INTO return_value
		FROM biintmt
		WHERE org_cd = cd_mngdept
		AND deptreecnt IN ('1','2','3','4');
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		return_value := ' ';
	END;

	RETURN return_value;
END;
$function$
;

CREATE OR REPLACE FUNCTION payphone.get_updepnm_hrdept(cd_mngdept text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
/*****************************************************************
* 함수명 : get_depnm_ktl
* 메소드기능 : 기관정보테이블(biintmt)의 코드명 (depnm)을 리턴한다.
* Param : depcd_from - 기관코드
* RETURN VALUE : 기관명
*  AUTHOR : 조남일
*****************************************************************/
	return_value text;
BEGIN
	BEGIN
		SELECT depnm
		INTO return_value
		FROM biintmt
		WHERE depcd in (select dephighcd from payphone.biintmt b where org_cd =cd_mngdept and useflag ='Y')
		AND deptreecnt IN ('1','2','3','4');
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		return_value := ' ';
	END;

	RETURN return_value;
END;
$function$
;



  select
            dephighcd as depHighCd
            ,depcd as depCd
            ,usrcd as usrCd
            ,usrname as usrName
            ,hp_no   as hpNo
            ,(select org_cd from biintmt b2 where depcd = a.depcd and deptreecnt in (1,2,3,4))
        from payphone.bimastercf  a
        where bsnind='1'
        
        
        select nvl(lcd,' ') as lcd   
            , nvl(scd,' ') as scd   
            , nvl(prnm, ' ') as prnm  
 from payphone.bibsici
 where 1=1
 and lcd = '1128'
                    order by scd, prnm asc
                    
                    
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
 and '20200715'     
			  group by cd_bizcar
 		) fbm
 	where fb.cd_bizcar = fbm.cd_bizcar(+)
 and fb.cd_bizcar  = fibm.cd_bizcar(+);
 
select * from 

select * from biintmt b where org_cd ='1830'

select * from fi_bizcar fb where cd_bizcar ='강남-강남-14허6748'

minus


select * from fi_bizcar_mant fbm where cd_bizcar  ='강남-강남-14허6748'


 -- 14허6748



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
 and yyyymm between '20200501'
 and '20200715'
			  group by cd_bizcar
 		) fbm
 	where fb.cd_bizcar = fbm.cd_bizcar(+)
 and fb.cd_bizcar  = fibm.cd_bizcar(+)
 		and fb.cd_mngdept in 
 (select org_cd
 from payphone.biintmt
 where dephighcd = 'H000' AND deptreecnt IN ('1','2','3','4')
 and org_cd is not null)
 		and fb.cd_mngdept = 
 (select org_cd
 from biintmt
 where depcd = 'H003' AND deptreecnt IN ('1','2','3','4')
 and org_cd is not null)
 
 
 select
			cd_bizcar,*
			from fi_bizcaramt_mng fbm
			where 1=1        
 and yyyymm between '20200501'
 and '20200715'
and cd_bizcar = '강남-사운-50하6644'

select  to_char((now() - '1 mon'::interval), 'yyyymm'::character varying);


select * from  payphone.tb_batch tb 

insert into payphone.tb_batch
        (batchnm
        , jobclassid
        , jobgroup
        , cronexpre
        , jobexeccd
        , useyn
        , crtusr
        , crtdt
        , lstusr
        , lstdt)
        values
        ('차량관리 동기화'
        , 'jobGetErpFiBizCarAmt'
        , NULL
        , '0 0 5 20 * ?'
        , '2'
        , 'N'
        , 'admin'
        , to_char(now(), 'YYYYMMDDhh24miss')
        , 'admin'
        , to_char(now(), 'YYYYMMDDhh24miss')
        );
        
     select  nextval('seq_tb_batch'::regclass);
       
       seq_tb_batch();
       
      
        select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
            , uniind
            ,orgCdUsrcd
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
                ,(select org_cd from biintmt b2 where depcd = a.depcd and deptreecnt in ('1','2','3','4')) || usrcd as orgCdUsrcd 
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
             
             
             
      		select * from payphone.tb_noticefile where filenm ='file_fe65a0fa-d2a9-7d60-435f-0c68065e1cb3_dev_payphone_191216.apk'
      		
      		 select count(1)
 from payphone.tb_noticefile
 where delyn ='Y'
 and filenm = 'file_fe65a0fa-d2a9-7d60-435f-0c68065e1cb3_dev_payphone_191216.apk'
 
 
   select count(1)
 from payphone.tb_noticefile
 where delyn ='N'
 and  filenm = 'file_3f01b55b-353e-251d-a0c1-0c39e3d6fabf_IMG_0231.JPG'
 
 
  SELECT FILE_URL || FILE_NM FULL_FILE_NM
	  FROM PAYPHONE.TB_ATTACHFILE
	 WHERE 1=1
	   AND FILE_SEQ = '370'::int

	   
select *
 from payphone.tb_noticefile
 where delyn ='N'
 and  filenm = 'file_410f42c6-3dc4-cd77-c162-a4c1f56b001f_payphone_1.3.0.apk'
 
 
 SELECT UNIQNO
		       , FILE_GB
		       , FILE_NO
		       , FILE_NM
		       , FILE_EXT
		       , FILE_URL
		       , LST_DT
		       , LST_USR
		       , ORIGN_FILE_NM
		       , DEL_YN
		       , FILE_SEQ
		  FROM PAYPHONE.TB_ATTACHFILE
		 WHERE 1=1
		   AND DEL_YN = 'N'
		 ORDER BY FILE_NO
		 
		 select * from payphone.tb_user_password tup where usrcd ='99999'
		 
	
		 
		 -- c7fc2f3dfdbfbdde9a3bdfc7805cc5d9efaf8962845f5942d0e8413bd73ab570
		 -- c7fc2f3dfdbfbdde9a3bdfc7805cc5d9efaf8962845f5942d0e8413bd73ab570
		 
		 
		 payphone.proc_gethr_bimastercf();
		 
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
		WHERE a.usrcd = '99999'
		limit 1
		
		
		
		 select custcall from payphone.pt_factmt pf  where uniind ='3'
		 
		 
		    select 
	   rn,
	   rev_cd, rev_date, rev_time, rev_des, memo, rev_seq
	  from 
	   (
		  select 
		       rev_cd, rev_date, rev_time, rev_des, memo, rev_seq,
		       row_number() over (order by  lstdt desc  ) as rn
		  from 
		  (
		   select 
		       rev_cd, rev_date, rev_time, rev_des, memo, lstdt, rev_seq
	        from payphone.tb_repair a
	        where  1 = 1
	        and updepcd  = 'G000'        
            and depcd1    = 'G260'  
     and rev_cd = '5'
 and jumgumja_id = '02583' 	           
	 and (wanro_flag = '0' or wanro_flag is null)
		  ) a
		 ) b
		order by rn
        limit '50'::numeric
        offset ('1'::numeric-1)*'50'::numeric
        
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
		and rev_date >= '20200801' || '000000' )b on
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
	and a.jungdt >= '20200801' || '000000'
order by
	a.jungdt desc
	
	
	select * from payphone.tb_maintain tm  where jungdt  like '20200828%'
	
	--

	select fact_telno from payphone.pt_factmt pf where uniind  ='3' and bldplcno  in (select bldplcno  from payphone.pt_bldplc pb where bldgb is null);
	


insert into payphone.pt_areamt
            (updepcd
            ,depcd
            ,uniind     
            ,area
            ,areaUsr                      
            ,lstdt
            ,lstusr
            ,area_use
            
            ,areanm
            
            
            
            ,accdepcd
            
            ,area_from
            ,area_to
          ) values (
             'H000'
            ,'H220' 
            ,'3'             
            ,'04' 
            ,'02976'
            ,to_char(now(), 'YYYYMMDDhh24miss')
            ,'99999'
            ,'Y'
            
            ,'인천11'
            
            
            
            ,'H220'
            
            ,'20200831'
            ,'99991231'
          )
          
          
          proc_backup_pt_areamt_h
          
          proc_backup_pt_areamt_h
          
          
          select MAX(opseq) from pt_areamt_h pah 
          
          SELECT setval('seq_pt_areamt_h', 3480, true);
          
         
         select * from tb_msg tm 
         
         
         
         select ''     as depCd, 
               ''     as uniInd, 
               ''     as areaCd,
               ''     as areaUsr, 
               '전체' as areaNm,
               ''     as areaUse
        union all
        select depcd    as depCd, 
               uniind   as uniInd, 
               area     as areaCd,
               areausr  as areaUsr, 
               areanm || '(' ||
                 case uniind when '1' then '무인'
                             when '2' then '자급'
                             when '3' then '1541'
                             else '' end || ', ' ||
                 case area_use when 'Y' then '사용'
                               when 'N' then '미사용'
                               else '' end || ')' as areaNm,
               area_use as areaUse
         from payphone.pt_areamt
         where 1=1
         order by depCd, uniInd, areaCd