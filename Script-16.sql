select sysdate from dual;

select * from tb_user_password tup where usrcd ='00933';

select * from bimastercf b where usrname ='박희원';


INSERT INTO tb_repair (rev_date,rev_time,rev_cd,rev_table,gojang_tel,jubsu_no,updepcd,updepcd_des,depcd1,depcd1_des,ktdepcd,ktdepcd_des,sldepcd,sldepcd_des,depcd2,depcd2_des,gojang_cd,singo_gb,rev_id,rev_des,singoja_tel,memo,jumgumja_id,jumgumja_des,hochul_id,hochul_des,hochul_tel,hochul_date,hochul_time,tel_gb,tel_desc,as_gb,gojang_des,wan_flag,sulchi_jangso,hochul_gb,sulchi_date,chamgo,"inout",uniind,cti_callkey,suri_cd,suri_des,wan_date,wan_time,wanro_flag,ijang_time,lstdt,lstusr) VALUES
	 ('20210416','142246','2','ktlcpms.t_jubsu','006305621421',15023,'O000','호남본부','O220','익산지사','S06020','고창지점',NULL,NULL,'O223','O223','A3','3','30000','CPMS','CPMS',NULL,'00933','조일후','00933','조일후','01028709800','20210416','142948','03','주카겸용',NULL,'주화처리장치',NULL,'고창부안축협앞','2','19961114',NULL,NULL,' ','','32002','표준정비','20210416','145155','2','2775','20210416150901','00933');

	
	select bldplcno from pt_factmt pf where fact_telno  = '006305621421';
	
select * from pt_bldplc pb where bldplcno = '0000126374';

	select * from tb_repair tr where rev_date like '20210416' and hochul_id ='00933'; 

	select MAX(rev_seq) from tb_repair tr;
	
	nextval('seq_repair'::regclass)
	
	alter sequence seq_repair restart with 79984;
	
create table pt_factmt_tmp as select * from pt_factmt pf; 



insert into pt_factmt  
select * from pt_Factmt_tmp
;


select * from pt_areamt pa where areausr ='00933';

truncate pt_areamt;

insert into pt_areamt  select * from pt_areamt_20210416 ;

select * from tb_maintain tm ; 

 select 
			rn
			 ,UNINO
			 ,BLDPLCNO
	 	 	, TELNO
	 	 	, BLDGPS
	 	 	, gps_y
	 	 	, gps_x
	 	 	, faultrep_dtm
	 	 	, bldaddr
	 	 	, TEL_GB
	 	 	, TEL_DESC
	 	 	, gojangDes
	 	 	, revCd
	 	 	, rev_seq
			from 
			(
				select 
					 UNINO
					 ,BLDPLCNO
			 	 	, TELNO
			 	 	, BLDGPS
			 	 	, gps_y
			 	 	, gps_x
			 	 	, faultrep_dtm
			 	 	, bldaddr
			 	 	, TEL_GB
			 	 	, coalesce(TEL_DESC, '') as TEL_DESC
			 	 	, gojangDes
		 			, row_number() over (order by  faultrep_dtm  ) as rn
					, revCd
					, rev_seq
				from 
				(
					select 
					   gojang_tel as TELNO            -- 고장전화번호  
					   ,tel_gb as telGb                    -- 전화기종코드
					   ,gojang_des as gojangDes            -- 고장내역
					   ,sulchi_jangso as bldaddr      	-- 전화위치(설치장소)          
					   ,rev_cd  as revCd
					   , rev_seq 
					   , rev_date || rev_time as faultrep_dtm
					   ,
 (select prnm
 from payphone.BIBSICI
 where lcd = '2053'
 and scd = rev_cd) as revNm --접수분류
						, b.unino
						, b.bldplcno
						, c.gpsx as BLDGPS
						, gpsy as gps_y
						, gpsx as gps_x
						, a.TEL_GB -- 전화기종코드
		 				, a.TEL_DESC  -- 전화기종
		 				, 
 (select count(1) cnt
 from payphone.tb_maintain m
 where m.rev_seq = a.rev_seq) req_cnt -- 정비의뢰 건수
					 
 from payphone.tb_repair a, payphone.PT_FACTMT b
					 left outer join payphone.pt_bldplc c on b.bldplcno = c.bldplcno
					
 where 1=1
					
 and a.gojang_tel = b.fact_telno
                   -- 
 and b.bldplcno = c.bldplcno
                    
 and a.updepcd  = 'O000'        
                    
 and a.depcd1    = 'O220' 
					
 and a.jumgumja_id = '00933'
					
 and b.fact_knd = '1'
					--
 and c.ft_use = '1'
					 
 and (a.wanro_flag = '0' or a.wanro_flag is null)  
					  
					  
					 	and rev_cd = '2'
					  
					  
					  
				) a
				where req_cnt = 0
			) b
			order by rn
			limit '50'::numeric
			offset ('1'::numeric-1)*'50'::numeric
			;


select * from tb_repair tr; 
0002-0846-3241;


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
	                -- AND FA.FACT_TELNO =  '003105914193'   -- 전화번호 (콤보 선택시) 
	                and FA.uniind ='2'
	              ) B
	        WHERE 1=1
	       ) C
	 WHERE 1=1
	 ORDER BY UNIIND, RN
	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::numeric;
	
select * from pt_areamt pa where AREA_TO = '99991231' and area ='08' and depcd ='G210';

select depcd from bimastercf b where depcd ='G210';
select * from pt_Factmt where uniind ='2';


  select COALESCE(gpsx,'0') as bldGpsX , COALESCE(gpsy,'0') as bldGpsY, uniind as bldUniind
 from payphone.pt_bldplc pb
 where bldplcno in 
 (select bldplcno
 from payphone.pt_factmt pf
 where unino ='335875');
 
   select uniind
 from payphone.pt_factmt
 where unino = '335875';
 
 select *
 from payphone.pt_factmt pf
 where unino ='335875'


  select COALESCE(gpsx,'0') as bldGpsX , COALESCE(gpsy,'0') as bldGpsY, uniind as bldUniind
 from payphone.pt_bldplc pb
 where bldplcno in 
 (select bldplcno
 from payphone.pt_factmt pf
 where unino ='335875');
 



  select 
            unino, gps_y, gps_x,
            bldadr, bldzip, bldplcnm, tel_no, coalesce(km_distance,1) as km_distance,
            b.gojang_tel, b.gojang_des, b.tel_desc, a.bldgb
       
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
             
 where a.unino = '761157'::numeric
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
        
        ;
        
       
       select * from bimastercf b;
      
      
       select area from pt_factmt pf where uniind ='3' and fact_telno = '003207610306';
       
       
        SELECT A.JUNGSN
	       , A.JUNGDT
	       , A.JUNGTEL
	       , COALESCE(C.BLDPLCNM, '') BLDPLCNM
	       , A.JUNGGB
	       , A.JUNGTY
	       , A.JUNGCD
	       , GET_BIBSICI_PRNM('2055', A.JUNGGB) PRNM
	       , GET_BIBSICI_PRNM('2056', A.JUNGTY) JUNGTYNM
	       , DECODE(A.JUNGTY, 'I',GET_BIBSICI_PRNM('2071', A.JUNGCD),GET_BIBSICI_PRNM('2057', A.JUNGCD)) JUNGCDNM
	       , JUNGDES
	       , (CASE WHEN (SELECT COUNT(1) CNT FROM PAYPHONE.TB_ATTACHFILE FI WHERE FI.UNIQNO = A.JUNGSN::TEXT AND FI.FILE_GB = 'mnt' AND FI.DEL_YN != 'Y') > 0 THEN 'Y' ELSE 'N' END) FILEYN
	  FROM PAYPHONE.TB_MAINTAIN A
	       , PAYPHONE.PT_FACTMT B
	       , PAYPHONE.PT_BLDPLC C
	 WHERE A.JUNGTEL = B.FACT_TELNO
	   AND B.BLDPLCNO = C.BLDPLCNO(+)
	   AND C.FT_USE(+) = '1'
	   AND A.JUNGID = '99999'
	   AND B.FACT_KND = '1'
	   AND A.JUNGDT LIKE '20210308' || '%';
	   
	  select * from TB_MAINTAIN where jungid  ='99999' order by jungsn desc;
	  
	 
	 
	 CREATE EXTENSION odbc_fdw;
	 
	