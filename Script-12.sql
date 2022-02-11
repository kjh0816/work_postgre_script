select * from bibsici b  where prnm like '일반방음부스%';

select * from pt_boothmt pb  where booknd ='624' ;

select * from (SELECT DISTINCT ON (fact_telno)
 			divktcs 
			, fact_telno 
			, phoneknd 
			, bldplcnm 
			, bldgb
			, bldloc3
			, bldadr1
			, bldadr2
			, gpsx
			, gpsy 
			, atm
			, bldaed
			, booelc
			, lstdt
		FROM ( SELECT
			         CASE
			         	WHEN fac.blddt BETWEEN '20201210' AND '20201210' THEN '신규'
						ELSE '변경'
			         END divktcs 
					 , fac.fact_telno 
					 , fac.phoneknd 
					 , bld.bldplcnm 
					 , bld.bldgb
					 , decode(bld.bldloc3, null, null, substr(bld.bldloc3, 0, 1) || '00') AS bldloc3
					 , bld.bldadr1
					 , bld.bldadr2
					 , bld.gpsx
					 , bld.gpsy 
					 , decode(boo.booknd,'624','Y','N') AS atm
					 , decode(substr(bld.pp_etcfac, 1, 1), 'N', 'N', null, 'N', 'Y') AS bldaed
					 , decode(boo.booknd, '715', 'Y', 'N') AS booelc
					 , substr(fac.lstdt, 0, 8) AS lstdt
				FROM pt_factmt fac
			 	INNER JOIN pt_boothmt boo 
			 		ON fac.boounino = boo.boounino
				INNER JOIN pt_bldplc bld 
					ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511')
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201210' AND '20201210'
				UNION ALL 
				SELECT
			         '해지' AS divktcs 
					 , fac.fact_telno 
					 , fac.phoneknd 
					 , fac.bldplcnm 
					 , fac.bldgb
					 , decode(fac.bldloc3, null, null, substr(fac.bldloc3, 0, 1) || '00') AS bldloc3
					 , fac.bldadr1
					 , fac.bldadr2
					 , fac.gpsx
					 , fac.gpsy 
					 , decode(fac.booknd,'624','Y','N') AS atm
					 , decode(fac.bldaed, null, 'N', fac.bldaed) as bldaed
					 , decode( fac.booknd, '715', 'Y', 'N' ) AS booelc
					 , fac.lstdt
				FROM pt_factmthist fac
				WHERE 1=1
					AND fac.uniind = '1'
					AND fac.opflag = 'D'
					AND fac.lstdt IS NOT NULL
					AND fac.bldloc1 <> '52'and fac.bldzip NOT IN ('24139','17511')
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201210' AND '20201210' )
		ORDER BY fact_telno, lstdt desc)
		minus
		
		select * from (SELECT DISTINCT ON (fact_telno)
 			divktcs 
			, fact_telno 
			, phoneknd 
			, bldplcnm 
			, bldgb
			, bldloc3
			, bldadr1
			, bldadr2
			, gpsx
			, gpsy 
			, atm
			, bldaed
			, booelc
			, lstdt
		FROM ( SELECT
			         CASE
			         	WHEN fac.blddt BETWEEN '20201210' AND '20201210' THEN '신규'
						ELSE '변경'
			         END divktcs 
					 , fac.fact_telno 
					 , fac.phoneknd 
					 , bld.bldplcnm 
					 , bld.bldgb
					 , decode(bld.bldloc3, null, null, substr(bld.bldloc3, 0, 1) || '00') AS bldloc3
					 , bld.bldadr1
					 , bld.bldadr2
					 , bld.gpsx
					 , bld.gpsy 
					 , decode(boo.booknd,'624','Y','N') AS atm
					 , decode(substr(bld.pp_etcfac, 1, 1), 'N', 'N', 'Y') AS bldaed
					 , decode(boo.booknd, '715', 'Y', 'N') AS booelc
					 , substr(fac.lstdt, 0, 8) AS lstdt
				FROM pt_factmt fac
			 	INNER JOIN pt_boothmt boo 
			 		ON fac.boounino = boo.boounino
				INNER JOIN pt_bldplc bld 
					ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511')
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201210' AND '20201210'
				UNION ALL 
				SELECT
			         '해지' AS divktcs 
					 , fac.fact_telno 
					 , fac.phoneknd 
					 , fac.bldplcnm 
					 , fac.bldgb
					 , decode(fac.bldloc3, null, null, substr(fac.bldloc3, 0, 1) || '00') AS bldloc3
					 , fac.bldadr1
					 , fac.bldadr2
					 , fac.gpsx
					 , fac.gpsy 
					 , decode(fac.booknd,'624','Y','N') AS atm
					 , fac.bldaed
					 , decode( fac.booknd, '715', 'Y', 'N' ) AS booelc
					 , fac.lstdt
				FROM pt_factmthist fac
				WHERE 1=1
					AND fac.uniind = '1'
					AND fac.opflag = 'D'
					AND fac.lstdt IS NOT NULL
					AND fac.bldloc1 <> '52'and fac.bldzip NOT IN ('24139','17511')
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201210' AND '20201210' )
		ORDER BY fact_telno, lstdt desc);
		
	
	select * from biintmt b where depcd ='E010';
	

SELECT
		    GET_DEPNM(A.UPDEPCD,'2') upDepNm,
		    GET_DEPNM(A.DEPCD,'3') depNm,
		    GET_KTDEPCDNM(A.KTDEPCD) ktDepNm,
		    GET_AREA(a.depcd,a.uniind,a.area) areaNm,
		    get_areausr(A.depcd,A.uniind,A.area) areaUsr,
		    A.FACT_TELNO factTelNo,
		    GET_PHONEGB_PRNM(A.PHONEKND) phoneKndNm,
		    GET_BLDPLCNM(A.BLDPLCNO) bldPlcNm,
		    A.BLDDT bldDt,
		    get_areausrphone(A.depcd,A.uniind,A.area) callNum,
		    A.AREA AREA,
		    A.REMODT remoDt,
		    B.SW_VER swVer,
		    B.PROD_CO prodCo
		FROM
		    payphone.PT_FACTMT A,
		    payphone.TC_CPMSMT B
		WHERE
		A.UPDEPCD = B.UPDEPCD(+)
		    AND A.FACT_TELNO = B.TEL_NO(+)
		    AND A.UNINO = B.UNINO(+)
		    AND A.UNIIND = '1'
		    AND A.FACTGB = '1'
		    AND A.PHONEKND IN ('01','02','03','031','033','04','05','06','061')
		    AND A.STATUS = '1'
		    AND B.UNINO IS NULL
		ORDER BY
		A.UPDEPCD,
		A.DEPCD,
		A.AREA,
		A.PHONEKND;
		
	select * from user_source where text like '%BUSER00M%';
	
select * from payphone.pt_factmthist pf  where fact_telno ='003204210368';

select * from tc_cpmsmt tc where tel_no ='003204210368';

select * from pt_factmt pf where fact_telno ='003204210368';

select * from pt_Factmt_h where fact_tel;

SELECT
		    GET_DEPNM(A.UPDEPCD,'2') upDepNm,
		    GET_DEPNM(A.DEPCD,'3') depNm,
		    GET_KTDEPCDNM(A.KTDEPCD) ktDepNm,
		    GET_AREA(a.depcd,a.uniind,a.area) areaNm,
		    get_areausr(A.depcd,A.uniind,A.area) areaUsr,
		    A.FACT_TELNO factTelNo,
		    GET_PHONEGB_PRNM(A.PHONEKND) phoneKndNm,
		    GET_BLDPLCNM(A.BLDPLCNO) bldPlcNm,
		    A.BLDDT bldDt,
		    get_areausrphone(A.depcd,A.uniind,A.area) callNum,
		    A.AREA AREA,
		    A.REMODT remoDt,
		    B.SW_VER swVer,
		    B.PROD_CO prodCo
		FROM
		    payphone.PT_FACTMT A,
		    payphone.TC_CPMSMT B
		WHERE
		A.UPDEPCD = B.UPDEPCD(+)
		    AND A.FACT_TELNO = B.TEL_NO(+)
		    AND A.UNINO = B.UNINO(+)
		    AND A.UNIIND = '1'
		    AND A.FACTGB = '1'
		    AND A.PHONEKND IN ('01','02','03','031','033','04','05','06','061')
		    AND A.STATUS = '1'
		    AND B.UNINO IS null;
		    
		   
		    SELECT
                    GET_DEPNM(A.UPDEPCD,'2') upDepNm,
                    GET_DEPNM(A.DEPCD,'3') depNm,
                    GET_KTDEPCDNM(A.KTDEPCD) ktDepNm,
                    GET_AREA(a.depcd,a.uniind,a.area) areaNm,
                    get_areausr(A.depcd,A.uniind,A.area) areaUsr,
                    A.FACT_TELNO factTelNo,
                    GET_PHONEGB_PRNM(A.PHONEKND) phoneKndNm,
                    GET_BLDPLCNM(A.BLDPLCNO) bldPlcNm,
                    A.BLDDT bldDt,
                    get_areausrphone(A.depcd,A.uniind,A.area) callNum,
                    A.AREA AREA,
                    A.REMODT remoDt,
                    B.SW_VER swVer,
                    B.PROD_CO prodCo
                FROM
                    payphone.PT_FACTMT A,
                    payphone.TC_CPMSMT B
                WHERE
                A.UPDEPCD = B.UPDEPCD(+)
                    AND A.FACT_TELNO = B.TEL_NO(+)
                    AND A.UNINO = B.UNINO(+)
                    AND A.UNIIND = '1'
                    AND A.FACTGB = '1'
                    AND A.PHONEKND IN ('01','02','03','031','033','04','05','06','061')
                    AND A.STATUS = '1'
                    AND B.UNINO IS NULL
                ORDER BY
                A.UPDEPCD,
                A.DEPCD,
                A.AREA,
                A.PHONEKND;
                
               select * from pt_factmt pf  where fact_telno like '%5367%';
               
              
               SELECT RN
	       , UNINO
	       , BLDDT
	       , TELNO
	       , BLDGPS
	       , GPS_Y
	       , GPS_X
	       , CHKDT
	       , BLDADDR
	       , BLDPLCNM
	       , COINFULL_RATE
	       , FAULT_DTM
	       , SECOND_DTM
	       , KM_DISTANCE
	       , TEL_DESC
	       , UNIIND
	       , NVL(SUBSTRING(PP_CLDT, 1, 10), '') PP_CLDT
	       , FILEYN
	       , BLDPLCNO
	  FROM (
	       SELECT UNINO
	              , BLDDT
	              , TELNO
	              , BLDGPS
	              , GPS_Y
	              , GPS_X
	              , CHKDT
	              , BLDADDR
	              , BLDPLCNM
	              , COINFULL_RATE
	              , FAULT_DTM
	              , SECOND_DTM
	              , KM_DISTANCE
	              , ROW_NUMBER() OVER (ORDER BY KM_DISTANCE ) AS RN
	              , TEL_DESC
	              , UNIIND
	              , PP_CLDT
	              , FILEYN
	              , BLDPLCNO
	         FROM (
	              SELECT COALESCE( FA.UNINO::INT , 0 ) AS UNINO-- 고유번호
	                     , COALESCE( FA.BLDDT , ' ' ) AS BLDDT-- 설치일자
	                     , COALESCE( FA.FACT_TELNO , ' ' ) AS TELNO-- 전화번호
	                     , COALESCE( PL.BLDPLCNM , ' ' ) AS BLDPLCNM-- 설치장소명
	                     , COALESCE( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) AS BLDADDR
	                     , COALESCE( SUBSTRING(FA.CHKDT,1,4)||'-'||SUBSTRING(FA.CHKDT,5,2)||'-'||SUBSTRING(FA.CHKDT,7,2), '' ) AS CHKDT-- 최종방문일자';
	                     , COALESCE( PL.GPSX, '' ) AS BLDGPS , PL.GPSY AS GPS_Y , PL.GPSX AS GPS_X
	                     , COALESCE( (( ACOS( SIN( '37.435736'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.435736'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.128972'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) AS KM_DISTANCE
	                     , CASE WHEN ( CP.COINFULL_RATE > 70 ) THEN '1' ELSE '0' END COINFULL_RATE -- 금고충만
	                     , CASE WHEN (  RP.CNT IS NULL ) THEN '0' ELSE '1' END AS FAULT_DTM -- 고장처리 여부
	                     , CASE WHEN ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') THEN '0' ELSE '1' END AS SECOND_DTM -- 미보고
	                     , DECODE(FA.UNIIND, '1', (SELECT PRNM FROM BIBSICI WHERE LCD = '0242' AND SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') AS TEL_DESC
	                     , FA.UNIIND AS UNIIND
	                     , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT
	                     , CASE WHEN ( AF.UNIQNO IS NULL ) THEN 'N' ELSE 'Y' END FILEYN -- 첨부파일 유무
	                     , FA.BLDPLCNO
	                FROM PAYPHONE.BIMASTERCF UR
	                     LEFT OUTER JOIN PAYPHONE.PT_AREAMT AM ON AM.AREAUSR = UR.USRCD
	                                 AND AM.DEPCD = UR.DEPCD
	                                 AND AM.AREA_TO = '99991231'
	                     LEFT OUTER JOIN PAYPHONE.PT_FACTMT FA ON FA.DEPCD = AM.DEPCD
	                                 AND FA.AREA = AM.AREA
	                                 AND FA.UNIIND = AM.UNIIND
	                                 AND FA.STATUS = '1'
	                                 AND FA.FACT_KND = '1'   -- SELECTFACILITYLISTMAP
	                     LEFT OUTER JOIN PAYPHONE.PT_BLDPLC PL ON FA.BLDPLCNO = PL.BLDPLCNO
	                                 AND PL.FT_USE = '1' -- I000 005505878776 89066
	                     LEFT OUTER JOIN PAYPHONE.TC_CPMSMT CP ON CP.UPDEPCD = FA.UPDEPCD
	                                 AND CP.TEL_NO = FA.FACT_TELNO
	                                 AND CP.UNINO = FA.UNINO
	                     LEFT OUTER JOIN (
	                                     SELECT GOJANG_TEL
	                                            , JUMGUMJA_ID
	                                            , WANRO_FLAG
	                                            , COUNT(*) CNT
	                                       FROM PAYPHONE.TB_REPAIR
	                                      WHERE WANRO_FLAG = '0'
	                                      GROUP BY GOJANG_TEL
	                                            , JUMGUMJA_ID
	                                            , WANRO_FLAG
	                                     ) RP ON FA.FACT_TELNO = RP.GOJANG_TEL
	                                 AND FA.AREA = AM.AREA
	                                 AND AM.AREAUSR = RP.JUMGUMJA_ID
	                      LEFT OUTER JOIN  (SELECT UNIQNO FROM  PAYPHONE.TB_ATTACHFILE WHERE DEL_YN != 'Y' group by UNIQNO) AF ON AF.UNIQNO = PL.BLDPLCNO
	               WHERE 1=1
	                 AND PL.BLDPLCNM LIKE '%' || '송보화인빌' || '%'   -- 설치장소 (콤보 선택시)
	              ) B
	        WHERE 1=1
	       ) C
	 WHERE 1=1
	 ORDER BY UNIIND, RN
	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::numeric;
	
select * from PAYPHONE.PT_AREAMT;


 SELECT RN
	       , UNINO
	       , BLDDT
	       , TELNO
	       , BLDGPS
	       , GPS_Y
	       , GPS_X
	       , CHKDT
	       , BLDADDR
	       , BLDPLCNM
	       , COINFULL_RATE
	       , FAULT_DTM
	       , SECOND_DTM
	       , KM_DISTANCE
	       , TEL_DESC
	       , UNIIND
	       , NVL(SUBSTRING(PP_CLDT, 1, 10), '') PP_CLDT
	       , FILEYN
	       , BLDPLCNO
	  FROM (
	       SELECT UNINO
	              , BLDDT
	              , TELNO
	              , BLDGPS
	              , GPS_Y
	              , GPS_X
	              , CHKDT
	              , BLDADDR
	              , BLDPLCNM
	              , COINFULL_RATE
	              , FAULT_DTM
	              , SECOND_DTM
	              , KM_DISTANCE
	              , ROW_NUMBER() OVER (ORDER BY KM_DISTANCE ) AS RN
	              , TEL_DESC
	              , UNIIND
	              , PP_CLDT
	              , FILEYN
	              , BLDPLCNO
	         FROM (
	              SELECT COALESCE( FA.UNINO::INT , 0 ) AS UNINO-- 고유번호
	                     , COALESCE( FA.BLDDT , ' ' ) AS BLDDT-- 설치일자
	                     , COALESCE( FA.FACT_TELNO , ' ' ) AS TELNO-- 전화번호
	                     , COALESCE( PL.BLDPLCNM , ' ' ) AS BLDPLCNM-- 설치장소명
	                     , COALESCE( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) AS BLDADDR
	                     , COALESCE( SUBSTRING(FA.CHKDT,1,4)||'-'||SUBSTRING(FA.CHKDT,5,2)||'-'||SUBSTRING(FA.CHKDT,7,2), '' ) AS CHKDT-- 최종방문일자';
	                     , COALESCE( PL.GPSX, '' ) AS BLDGPS , PL.GPSY AS GPS_Y , PL.GPSX AS GPS_X
	                     , COALESCE( (( ACOS( SIN( '37.435736'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.435736'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.128972'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) AS KM_DISTANCE
	                     , CASE WHEN ( CP.COINFULL_RATE > 70 ) THEN '1' ELSE '0' END COINFULL_RATE -- 금고충만
	                     , CASE WHEN (  RP.CNT IS NULL ) THEN '0' ELSE '1' END AS FAULT_DTM -- 고장처리 여부
	                     , CASE WHEN ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') THEN '0' ELSE '1' END AS SECOND_DTM -- 미보고
	                     , DECODE(FA.UNIIND, '1', (SELECT PRNM FROM BIBSICI WHERE LCD = '0242' AND SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') AS TEL_DESC
	                     , FA.UNIIND AS UNIIND
	                     , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT
	                     , CASE WHEN ( AF.UNIQNO IS NULL ) THEN 'N' ELSE 'Y' END FILEYN -- 첨부파일 유무
	                     , FA.BLDPLCNO
	                FROM PAYPHONE.BIMASTERCF UR
	                     LEFT OUTER JOIN PAYPHONE.PT_AREAMT AM ON AM.AREAUSR = UR.USRCD
	                                 AND AM.DEPCD = UR.DEPCD
	                                 AND AM.AREA_TO = '99991231'
	                     LEFT OUTER JOIN PAYPHONE.PT_FACTMT FA ON FA.DEPCD = AM.DEPCD
	                                 AND FA.AREA = AM.AREA
	                                 AND FA.UNIIND = AM.UNIIND
	                                 AND FA.STATUS = '1'
	                                 AND FA.FACT_KND = '1'   -- SELECTFACILITYLISTMAP
	                     LEFT OUTER JOIN PAYPHONE.PT_BLDPLC PL ON FA.BLDPLCNO = PL.BLDPLCNO
	                                 AND PL.FT_USE = '1' -- I000 005505878776 89066
	                     LEFT OUTER JOIN PAYPHONE.TC_CPMSMT CP ON CP.UPDEPCD = FA.UPDEPCD
	                                 AND CP.TEL_NO = FA.FACT_TELNO
	                                 AND CP.UNINO = FA.UNINO
	                     LEFT OUTER JOIN (
	                                     SELECT GOJANG_TEL
	                                            , JUMGUMJA_ID
	                                            , WANRO_FLAG
	                                            , COUNT(*) CNT
	                                       FROM PAYPHONE.TB_REPAIR
	                                      WHERE WANRO_FLAG = '0'
	                                      GROUP BY GOJANG_TEL
	                                            , JUMGUMJA_ID
	                                            , WANRO_FLAG
	                                     ) RP ON FA.FACT_TELNO = RP.GOJANG_TEL
	                                 AND FA.AREA = AM.AREA
	                                 AND AM.AREAUSR = RP.JUMGUMJA_ID
	                      LEFT OUTER JOIN  (SELECT UNIQNO FROM  PAYPHONE.TB_ATTACHFILE WHERE DEL_YN != 'Y' group by UNIQNO) AF ON AF.UNIQNO = PL.BLDPLCNO
	               WHERE 1=1
 	                 AND PL.BLDPLCNM LIKE '%' || '송보화인빌' || '%'   -- 설치장소 (콤보 선택시)
 	              ) B
	        WHERE 1=1
 	       ) C
	 WHERE 1=1
  	 ORDER BY UNIIND, RN
	 	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::numeric;
	
select  * from pt_factmt pf  where bldplcno  in (select bldplcno from pt_bldplc pb where bldplcnm   LIKE '%' || '송보화인빌' || '%' ) ;

-- 128.1107263785952


select * from pt_bldplc pb where bldplcnm  like '송보화인빌%';


    select
	GET_DEPNM1(UPDEPCD, 2) UPDEPNM1,
	GET_DEPNM1(DEPCD, 3) DEPNM1,
	NVL(GET_KTDEPNM1(KTDEPCD), '미등록') KTDEPNM1,
	GET_TELNO(TEL_NO) TEL_NO,
	NVL(GET_PRNM('0628', PHONEKND), '미등록') PHONENM,
	NVL(GET_BLDPLCNM(DEPCD, BLDPLCNO), '미등록') BLDPLCNM,
	CITY_AMT,
	OTCT_AMT,
	WORD_AMT,
	T114_AMT,
	DOWN_AMT,
	TOTAL_AMT,
	NVL(GET_USRNM(AREAUSR), '미등록') USRNM,
	NVL(AREA, '미등록') AREANM,
	case
		when remodt > '20201231235959' then ''
		else nvl(REMODT, '')
	end remodt,
	etc_amt,
	nvl(scd, ' ') scd,
	nvl(dsec, ' ') dsec
from
	(
	select
		UPDEPCD, TEL_NO, max(depcd) depcd, max(ktdepcd) ktdepcd, max(areausr) areausr, max(area) area, max(PHONEKND) PHONEKND, max(BLDPLCNO) BLDPLCNO, MAX(REMODT) REMODT, SUM(CITY_AMT) CITY_AMT, SUM(OTCT_AMT) OTCT_AMT, SUM(WORD_AMT) WORD_AMT, SUM(T114_AMT) T114_AMT, SUM(DOWN_AMT) DOWN_AMT, SUM(TOTAL_AMT) TOTAL_AMT, SUM(AMOUNT) AMOUNT, SUM(etc_amt) etc_amt, max(scd) scd, max(dsec) dsec
	from
		(
		select
			UPDEPCD, '0' depcd, '0' ktdepcd, '0' BLDPLCNO, '0' areausr, '0' area, TEL_NO, '0' phoneknd, ' ' REMODT, SUM(CITY_AMT) CITY_AMT, SUM(OTCT_AMT) OTCT_AMT, SUM(WORD_AMT) WORD_AMT, SUM(T114_AMT) T114_AMT, SUM(DOWN_AMT) DOWN_AMT, SUM(TOTAL_AMT) TOTAL_AMT, SUM(AMOUNT) AMOUNT, SUM(etc_amt) etc_amt, ' ' scd, ' ' dsec
		from
			tc_month_v
		where
			yyyymm between substr('20201203000000', 1, 14) and substr('20201231235959', 1, 14)
			and UPDEPCD = NVL('G000', UPDEPCD)
			and TEL_NO like '%%%' || '%'
		group by
			UPDEPCD, TEL_NO
	union all
		select
			tc.updepcd updepcd, tc.depcd depcd, tc.ktdepcd ktdepcd, tc.BLDPLCNO BLDPLCNO, tc.areausr areausr, tc.area area, tc.tel_no tel_no, tc.phoneknd phoneknd, nvl(tc.REMODT, ' ') REMODT, 0, 0, 0, 0, 0, 0, 0, 0, nvl((
			select
				bi.prnm
			from
				bibsici bi
			where
				lcd = '1200'
				and '1200' || bi.scd = sa.scd), ' ') scd, nvl(dsec, ' ') dsec
		from
			pt_factmt tc, (
			select
				*
			from
				tc_cpmssave
			where
				(save_dtm between '20201203000000' and '20201231235959')
				or (close_date >= '20201203000000'
				and save_dtm <= '20201203000000')) sa
		where
			(tc.remodt >= substr('20201203000000', 1, 8)
			or tc.remodt is null )
			and tc.TEL_NO like '%%%' || '%'
			and tc.UPDEPCD = NVL('G000', tc.UPDEPCD)
			and tc.DEPCD = NVL('G240', tc.DEPCD)
			and tc.KTDEPCD = NVL('', tc.KTDEPCD)
			and tc.AREA = NVL('', tc.AREA)
			and tc.AREAUSR = NVL('', tc.AREAUSR)
			and tc.unino = sa.unino(+)
			and tc.blddt <= TO_CHAR(LAST_DAY(TO_DATE(substr('20201203000000', 1, 8), 'YYYYMMDD')), 'YYYYMMDD'))
	group by
		updepcd, tel_no )
where
	TEL_NO like '%%%' || '%'
	and DEPCD = NVL('G240', DEPCD)
	and PHONEKND = NVL('02', PHONEKND)
	and KTDEPCD = NVL('', KTDEPCD)
	and AREA = NVL('', AREA)
	and AREAUSR = NVL('', AREAUSR)
	and TOTAL_AMT <= 60
	and AMOUNT <= 60
	and etc_amt = 0
order by
	UPDEPCD,
	DEPCD,
	AREAUSR,
	KTDEPCD;
	

select
			get_depnm(a.updepcd,2) upDepNm,
			get_depnm(a.depcd,3) depNm,
			get_ktdepcdnm(a.ktdepcd) ktDepNm,
			get_area(a.depcd,a.uniind,a.area) areaNm,
			get_areausr(a.depcd,a.uniind,a.area) areaUsr,
			a.fact_telno as factTelNo,
			get_phonegb_prnm(a.phoneknd) prNm,
			get_bldplcnm(a.bldplcno) bldPlcNm,
			sum(b.city_amt) cityAmt,
			sum(b.otct_amt) otctAmt,
			sum(b.word_amt) wordAmt,
			sum(b.t114_amt) t114Amt,
			sum(b.down_amt) downAmt,
			sum(b.amount) amount,
			sum(b.etc_amt) etcAmt,
			sum(b.total_amt) totalAmt
			from pt_factmt a,
			(
			    select   tel_no,  sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
			    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
			    sum(b.total_amt) total_amt
 from tc_month_v@oracpms b 
			 where  1=1         
 and b.yyyymm between '20201203000000'
 and '20201231235959'
 and tel_no ='000204800217'
	        			    group by tel_no
			) b ,
			 (select unino
 from payphone.tc_cpmssave 
			where 1=1 and
			 			(save_dtm BETWEEN '20201230'||'000000' AND '20201230'||'235959')
			        or
			(close_date 
	                     >=  '20201230'||'000000' AND save_dtm  <=  '20201230'||'000000')
	         			)  c
			where 1=1
 and a.fact_telno = b.tel_no(+)
 and a.unino = c.unino(+)
 and (
			 a.REMODT  >=  '20201203' or
			   a.REMODT is null or a.REMODT ='')
 and a.updepcd like 'G000' || '%'
 and a.depcd   like 'G240'|| '%'	
 and total_amt  <=   '60'::numeric
				group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd;
				
			000204800217
			
			    select   tel_no,  sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
			    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
			    sum(b.total_amt) total_amt
 from payphone.tc_month_v b 
			 where  1=1         
 and b.yyyymm between '20201203'
 and '20201230' and tel_no ='003107948537'
	        			    group by tel_no;
	        			   
	        			   
	        			   select * from user_source where text like '%tc_month_v%';
			
	        			  
	        			  PROC_GETGUARD_CLDT;
	        			  PROC_BATCH_GETCPMS_TCMONTHV;
	        			  
	        			 
	        			 select * from tb_user_password tup where usrcd ='admi2';
	        			 
	        			select * from tb_loginlog tl where login_usr ='admi2' and login_dt like '20210104%';
	        			
	        		
	        		
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
	and aa.cd_asset is null;
	

select * from payphone.fi_asset fa where cd_asset = 'B200812015807';

proc_geterp_fi_asset;


select * from refep_fi_asset where nm_note ='';

select * from refep_fi_dpbase where st_asset not in ('4','5');

select * from tb_maintain tm where depcd is null;

-- Q320

select * from biintmt b where depcd ='Q320';

select * from fi_asset fa where cd_asset ='A20201200008';

select * from refep_fi_dpbase rfd ; 

alter table refep_fi_asset add column TEXT_USERDEF2 varchar(200); 

--TEXT_USERDEF1
--TEXT_USERDEF2

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
	left outer join 
	(
		select cd_asset, cd_company,st_asset, ym_dpasset from 
		(
			select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase
		)
		where rowidx ='1'
	) fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	left outer join payphone.fi_asset aa on aa.cd_asset=fas.cd_asset and aa.cd_company=fas.cd_company
	where 1=1
	and fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	and aa.cd_asset is null
	;
	

select payphone.proc_change_pt_factmt();

  select payphone.proc_geterp_fi_asset();