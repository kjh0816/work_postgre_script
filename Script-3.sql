select * from bibsici b where scd ='000'


select * from payphone.tb_menu tm 

select * from tb_user_password tup where usrcd ='99999'

select * from payphone.pt_bldplc_h pbh where opdt  like '20200615%'

select * from 

select
		     distuse    --�����Ϸ� �Ÿ����� ���� (0:������, 1: ����)
		    ,distmeter  --�����Է� ������ �����Ÿ� ���ѹ���
		    ,agreuse    --��ġ��� �������� ����(0:������, 1: ����)
		    ,agregroup  --��ġ��� ���� ����� �׷�����ڱ׷�(0:Admin, 1:��������, 2:���δ����, 3:��������, 4:���������)
		from
		    payphone.tb_repairset;
		    
		   select  from payphone.pt_bldplc pb 
		   
		   
		   INSERT INTO payphone.tb_maintain
		( jungdt  
		, jungtel 
		, depcd
		, accdepcd  
		, updepcd
		, junggb  
		, jungty 
		, jungcd  
		, jungid  
		, jungdes 
		, rev_seq 
		, lstusr
		, gpsx
		, gpsy
		, jung_entr_yn
		, jungsn
		)  
		VALUES(to_char(now() , 'YYYYMMDDHH24MISS'), '005105124101', 'F040' , (select accdepcd from payphone.pt_factmt where fact_telno='005105124101' and status='1'),  'F000',  'R', 'M', '1', '99999',  'test', '0'::int, '99999', '36.78015166666667', '127.00312666666666', '', '476647'::int ); 
		
	select * from payphone.tb_maintain tm where jungsn ='605368'
	
	select MAX(jungsn) from payphone.tb_maintain tm 
	
	alter sequence payphone.seq_tb_maintain restart with 605369;
	
select gpsx as bldGpsX , gpsy as bldGpsY
 from payphone.pt_bldplc pb
 where bldplcno in 
 (select bldplcno
 from payphone.pt_factmt pf
 where unino ='996835')

 
 
	-- gps x :36.78015166666667 ���� / phone gps y : 127.00312666666666 �浵 
 
 select distuse,distmeter from payphone.tb_repairset tr 
 
 
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
	              SELECT COALESCE( FA.UNINO::INT , 0 ) AS UNINO-- ������ȣ
	                     , COALESCE( FA.BLDDT , ' ' ) AS BLDDT-- ��ġ����
	                     , COALESCE( FA.FACT_TELNO , ' ' ) AS TELNO-- ��ȭ��ȣ
	                     , COALESCE( PL.BLDPLCNM , ' ' ) AS BLDPLCNM-- ��ġ��Ҹ�
	                     , COALESCE( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) AS BLDADDR
	                     , COALESCE( SUBSTRING(FA.CHKDT,1,4)||'-'||SUBSTRING(FA.CHKDT,5,2)||'-'||SUBSTRING(FA.CHKDT,7,2), '' ) AS CHKDT-- �����湮����';
	                     , COALESCE( PL.GPSX, '' ) AS BLDGPS , PL.GPSY AS GPS_Y , PL.GPSX AS GPS_X
	                     , COALESCE( (( ACOS( SIN( '37.43555666666667'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.43555666666667'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.12904833333332'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) AS KM_DISTANCE
	                     , CASE WHEN ( CP.COINFULL_RATE > 70 ) THEN '1' ELSE '0' END COINFULL_RATE -- �ݰ��游
	                     , CASE WHEN (  RP.CNT IS NULL ) THEN '0' ELSE '1' END AS FAULT_DTM -- ����ó�� ����
	                     , CASE WHEN ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') THEN '0' ELSE '1' END AS SECOND_DTM -- �̺���
	                     , DECODE(FA.UNIIND, '1', (SELECT PRNM FROM BIBSICI WHERE LCD = '0242' AND SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') AS TEL_DESC
	                     , FA.UNIIND AS UNIIND
	                     , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT
	                     , CASE WHEN ( AF.UNIQNO IS NULL ) THEN 'N' ELSE 'Y' END FILEYN -- ÷������ ����
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
 
                   
 and UR.usrcd =  '99999'     -- 01759�� session���� �Ѿ�� usrcd(���)�� ������ ��, Default ��ȸ
                   
 and UR.dephighcd = 'F000'
                   
 and UR.depcd = 'F040'
 
 
	                 AND FA.UNIIND ='1'
 
 
 
 
 
	              ) B
	        WHERE 1=1
 
	       ) C
	 WHERE 1=1
 
 
	 ORDER BY UNIIND, RN
	 
	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::NUMERIC

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
	              SELECT COALESCE( FA.UNINO::INT , 0 ) AS UNINO-- ������ȣ
	                     , COALESCE( FA.BLDDT , ' ' ) AS BLDDT-- ��ġ����
	                     , COALESCE( FA.FACT_TELNO , ' ' ) AS TELNO-- ��ȭ��ȣ
	                     , COALESCE( PL.BLDPLCNM , ' ' ) AS BLDPLCNM-- ��ġ��Ҹ�
	                     , COALESCE( PL.BLDADR1 || ' ' || PL.BLDADR2, ' ' ) AS BLDADDR
	                     , COALESCE( SUBSTRING(FA.CHKDT,1,4)||'-'||SUBSTRING(FA.CHKDT,5,2)||'-'||SUBSTRING(FA.CHKDT,7,2), '' ) AS CHKDT-- �����湮����';
	                     , COALESCE( PL.GPSX, '' ) AS BLDGPS , PL.GPSY AS GPS_Y , PL.GPSX AS GPS_X
	                     , COALESCE( (( ACOS( SIN( '37.43555666666667'::FLOAT * PI() / 180 ) * SIN( GPSY::FLOAT * PI() / 180 ) + COS( '37.43555666666667'::FLOAT * PI() / 180 ) * COS( GPSY::FLOAT * PI() / 180 ) * COS(( '127.12904833333332'::FLOAT - GPSX::FLOAT ) * PI() / 180 )) * 180 / PI()) * 60 * 1.1515 ) * 1.60934, - 1 ) AS KM_DISTANCE
	                     , CASE WHEN ( CP.COINFULL_RATE > 70 ) THEN '1' ELSE '0' END COINFULL_RATE -- �ݰ��游
	                     , CASE WHEN (  RP.CNT IS NULL ) THEN '0' ELSE '1' END AS FAULT_DTM -- ����ó�� ����
	                     , CASE WHEN ( CP.SECOND_DTM > TO_CHAR( CURRENT_DATE, 'YYYYMMDD' )|| '000000') THEN '0' ELSE '1' END AS SECOND_DTM -- �̺���
	                     , DECODE(FA.UNIIND, '1', (SELECT PRNM FROM BIBSICI WHERE LCD = '0242' AND SCD = FA.PHONEKND), '2', FA.GDCD, '3', '1541') AS TEL_DESC
	                     , FA.UNIIND AS UNIIND
	                     , TO_CHAR(TO_DATE(PL.PP_CLDT, 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS') PP_CLDT
	                     , CASE WHEN ( AF.UNIQNO IS NULL ) THEN 'N' ELSE 'Y' END FILEYN -- ÷������ ����
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
 and UR.usrcd =  '99999'     -- 01759�� session���� �Ѿ�� usrcd(���)�� ������ ��, Default ��ȸ
 and UR.dephighcd = 'F000'
 and UR.depcd = 'F040'
	                 AND FA.UNIIND ='1'
	              ) B
	        WHERE 1=1
	       ) C
	 WHERE 1=1
	 ORDER BY UNIIND, RN
	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::numeric
	
	select * from payphone.tb_maintain tm  where jungsn ='605378'
	
	
	select payphone.proc_getguard_sms();
	
	SELECT HOCHUL_ID, ETC2, MSG, '0', to_char(sysdate, 'yyyymmddhh24miss'::text)
	FROM SMS_INTERFACE@oraguard
	where HOCHUL_ID is not null
	
	and reqdate < sysdate;
	
select * from sms_msg@oraguard


select * from payphone.icis_rcv_hist irh where be_svc_no ='003109819826'
