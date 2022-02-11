select * from tb_user_password tup  where usrcd ='99999';

--c7fc2f3dfdbfbdde9a3bdfc7805cc5d9efaf8962845f5942d0e8413bd73ab570
--7ca6a9ac71a40207b00bbf2e2949e6bd503202e017be7ed5169a18ef6d6c3725

select * from bimastercf b where usrcd ='02864'; 

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
		    AND A.PHONEKND IN ('01','02','03','031','033','04','05','06')
		    AND A.STATUS = '1'
		    AND B.UNINO IS NULL
		ORDER BY
		A.UPDEPCD,
		A.DEPCD,
		A.AREA,
		A.PHONEKND;

	
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
       
       select * from payphone.pt_factmt pf; 
;


select  * from pt_factmt pf  where bldplcno  in (select bldplcno from pt_bldplc pb where bldplcnm   LIKE '%' || '송보화인빌' || '%' ) ;


delete from pt_factmt pf where uniind ='2'

