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
		             AND UPDEPCD = 'O000'
		             AND DEPCD = 'O210'
	                 AND STTDT <= '20210430'
	                 AND LSTDT >= '20210401'
		             AND (AREA, UNIIND) IN (SELECT AREA, UNIIND FROM PT_AREAMT WHERE AREAUSR = '01970' AND AREA_USE = 'Y')
	              )
	        WHERE 1=1
	          AND RN = 1
	       )
	SELECT  GET_DEPNM(UPDEPCD, '2') UPDEPCD_NM
	       , GET_DEPNM(DEPCD, '3') DEPCD1_NM
	       , JUMGUMJA_NM
	       , DECODE(REV_CD_NM, '무인', ' 무인 ', REV_CD_NM) REV_CD_NM
	       , TEL_GB_NM
	       , SUM(CNT) OPER_CNT
	       , SUM(REV_CNT) REV_CNT
	       , SUM(CALL_RT) CALL_RT
	       , SUM(CALL_NOT_RT) CALL_NOT_RT
	       , SUM(CPMS_RT) CPMS_RT
	       , SUM(CPMS_NOT_RT) CPMS_NOT_RT
	       , SUM(JUNGTY1) JUNGTY_CHNG
	       , SUM(JUNGTY2) JUNGTY_CHK
	       , SUM(JUNGTY3) JUNGTY_MAINT
	       , SUM(JUNGTY4) JUNGTY_AGGR
	       , SUM(INS_PPS) INS_PPS
	       , SUM(INS_RSLT) INS_RSLT
	  FROM (
	       SELECT A.UPDEPCD
	              , A.DEPCD
	              , GET_AREA_USRNAME(A.DEPCD, A.UNIIND, A.AREA) JUMGUMJA_NM
	              , GET_BIBSICI_PRNM('2066', A.UNIIND) REV_CD_NM
	              , A.TEL_GB_NM
	              , COUNT(1) CNT
	              , 0 REV_CNT
	              , 0 CALL_RT
	              , 0 CALL_NOT_RT
	              , 0 CPMS_RT
	              , 0 CPMS_NOT_RT
	              , 0 JUNGTY1
	              , 0 JUNGTY2
	              , 0 JUNGTY3
	              , 0 JUNGTY4
	              , 0 INS_PPS
	              , 0 INS_RSLT
	         FROM FMTHST A
	        WHERE 1=1
	        GROUP BY A.UPDEPCD
	              , A.DEPCD
	              , A.UNIIND
	              , A.AREA
	              , A.TEL_GB_NM
	        UNION ALL
	       SELECT A.UPDEPCD
	              , A.DEPCD
	              , GET_AREA_USRNAME(A.DEPCD, A.UNIIND, A.AREA) JUMGUMJA_NM
	              , GET_BIBSICI_PRNM('2066', A.UNIIND) REV_CD_NM
	              , A.TEL_GB_NM
	              , 0 CNT
	              , 1 REV_CNT
	              , CASE WHEN B.REV_CD IN ('1', '3', '5') AND B.WAN_DATE IS NOT NULL AND TO_DATE(SUBSTRING(B.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') <= 2 THEN 1 ELSE 0 END CALL_RT 
	              , CASE WHEN B.REV_CD IN ('1', '3', '5')  AND ((B.WAN_DATE IS NULL AND TRUNC(SYSDATE) - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') > 2) OR TO_DATE(SUBSTRING(B.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') > 2) THEN 1 ELSE 0 END CALL_NOT_RT
	              , CASE WHEN B.REV_CD = '2' AND B.WAN_DATE IS NOT NULL AND TO_DATE(SUBSTRING(B.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') <= 3 THEN 1 ELSE 0 END CPMS_RT
	              , CASE WHEN B.REV_CD = '2' AND ((B.WAN_DATE IS NULL AND TRUNC(SYSDATE) - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') > 2) OR TO_DATE(SUBSTRING(B.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(B.REV_DATE, 1, 8), 'YYYYMMDD') > 3) THEN 1 ELSE 0 END CPMS_NOT_RT
	              , 0 JUNGTY1
	              , 0 JUNGTY2
	              , 0 JUNGTY3
	              , 0 JUNGTY4
	              , 0 INS_PPS
	              , 0 INS_RSLT
	         FROM FMTHST A
	              , PAYPHONE.TB_REPAIR B
	        WHERE 1=1
	          AND A.FACT_TELNO = B.GOJANG_TEL
	          AND B.REV_DATE >= '20210401'
	          AND B.REV_DATE <= '20210430'
	        UNION ALL
	       SELECT A.UPDEPCD
	              , A.DEPCD
	              , GET_AREA_USRNAME(A.DEPCD, A.UNIIND, A.AREA) JUMGUMJA_NM
	              , GET_BIBSICI_PRNM('2066', A.UNIIND) REV_CD_NM
	              , A.TEL_GB_NM
	              , 0 CNT
	              , 0 REV_CNT
	              , 0 CALL_RT
	              , 0 CALL_NOT_RT
	              , 0 CPMS_RT
	              , 0 CPMS_NOT_RT
	              , CASE WHEN B.JUNGTY = 'R' THEN 1 ELSE 0 END JUNGTY1 -- 교체
	              , CASE WHEN B.JUNGTY = 'I' THEN 1 ELSE 0 END JUNGTY2 -- 점검
	              , CASE WHEN B.JUNGTY = 'M' THEN 1 ELSE 0 END JUNGTY3 -- 정비
	              , CASE WHEN B.JUNGTY = 'Q' THEN 1 ELSE 0 END JUNGTY4 -- 정비의뢰
	              , 0 INS_PPS
	              , 0 INS_RSLT
	         FROM FMTHST A
	              , PAYPHONE.TB_MAINTAIN B
	        WHERE 1=1
	          AND A.FACT_TELNO = B.JUNGTEL
	          AND B.JUNGDT >= '20210401' || '000000'
	          AND B.JUNGDT <= '20210430' || '235959'
	        UNION ALL
	       SELECT A.UPDEPCD
	              , A.DEPCD
	              , GET_AREA_USRNAME(A.DEPCD, A.UNIIND, A.AREA) JUMGUMJA_NM
	              , GET_BIBSICI_PRNM('2066', A.UNIIND) REV_CD_NM
	              , CASE WHEN UNIIND = '1' THEN GET_BIBSICI_PRNM('0628', A.PHONEKND)
	                     ELSE GET_BIBSICI_PRNM('2066', A.UNIIND) END TEL_GB_NM
	              , 0 CNT
	              , 0 REV_CNT
	              , 0 CALL_RT
	              , 0 CALL_NOT_RT
	              , 0 CPMS_RT
	              , 0 CPMS_NOT_RT
	              , 0 JUNGTY1
	              , 0 JUNGTY2
	              , 0 JUNGTY3
	              , 0 JUNGTY4
	              , COUNT(B.UNINO) INS_PPS
	              , SUM(CASE WHEN B.JUNGDT IS NOT NULL THEN 1 ELSE 0 END) INS_RSLT
	         FROM FMTHST A
	              , PAYPHONE.TB_MAINTAIN_SCHEDULE B
	        WHERE 1=1
	          AND A.UNINO = B.UNINO
	          AND B.SCHDT >= SUBSTR('20210430', 1, 6) || '01'
	          AND B.SCHDT <= SUBSTR('20210430', 1, 6) || '99'
	        GROUP BY A.UPDEPCD
	              , A.DEPCD
	              , A.UNIIND
	              , A.AREA
	              , A.PHONEKND
	        UNION ALL
	       SELECT A.UPDEPCD
	              , A.DEPCD1 DEPCD
	              , GET_USRNAME(A.JUMGUMJA_ID) JUMGUMJA_NM
	              , '미등록접수' AS REV_CD_NM
	              , '미등록접수' AS TEL_GB_NM
	              , 0 OPER_CNT
	              , 1 REV_CNT
	              , CASE WHEN TO_DATE(SUBSTRING(A.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(A.REV_DATE, 1, 8), 'YYYYMMDD') <= 2 THEN 1 ELSE 0 END CALL_RT
	              , CASE WHEN (A.WAN_DATE IS NULL AND TRUNC(SYSDATE) - TO_DATE(SUBSTRING(A.REV_DATE, 1, 8), 'YYYYMMDD') > 2) OR TO_DATE(SUBSTRING(A.WAN_DATE, 1, 8), 'YYYYMMDD') - TO_DATE(SUBSTRING(A.REV_DATE, 1, 8), 'YYYYMMDD') > 2 THEN 1 ELSE 0 END CALL_NOT_RT
	              , 0 CPMS_RT
	              , 0 CPMS_NOT_RT
	              , 0 JUNGTY_CHNG
	              , 0 JUNGTY_CHK
	              , 0 JUNGTY_MAINT
	              , 0 JUNGTY_AGGR
	              , 0 INS_PPS
	              , 0 INS_RSLT
	         FROM PAYPHONE.TB_REPAIR A
	        WHERE 1=1
	          AND A.REV_CD = '5'
	          AND A.REV_DATE >= '20210401'
	          AND A.REV_DATE <= '20210430'
	          AND A.UPDEPCD = 'O000'
	          AND A.DEPCD1 = 'O210'		 
	          AND A.JUMGUMJA_ID = '01970'
		 	       )
	 GROUP BY UPDEPCD
	       , DEPCD
	       , JUMGUMJA_NM
	       , REV_CD_NM
	       , TEL_GB_NM
	 ORDER BY UPDEPCD_NM
	       , DEPCD1_NM
	       , JUMGUMJA_NM
	       , DECODE(REV_CD_NM, ' 무인 ', 1, '1541', 2, '자급', 3, 4)
	       , TEL_GB_NM
	       
	       
	        SELECT A.UPDEPCD
	              , A.DEPCD
	              , GET_AREA_USRNAME(A.DEPCD, A.UNIIND, A.AREA) JUMGUMJA_NM
	              , GET_BIBSICI_PRNM('2066', A.UNIIND) REV_CD_NM
	              , CASE WHEN UNIIND = '1' THEN GET_BIBSICI_PRNM('0628', A.PHONEKND)
	                     ELSE GET_BIBSICI_PRNM('2066', A.UNIIND) END TEL_GB_NM
	              , 0 CNT
	              , 0 REV_CNT
	              , 0 CALL_RT
	              , 0 CALL_NOT_RT
	              , 0 CPMS_RT
	              , 0 CPMS_NOT_RT
	              , 0 JUNGTY1
	              , 0 JUNGTY2
	              , 0 JUNGTY3
	              , 0 JUNGTY4
	              , COUNT(B.UNINO) INS_PPS
	              , SUM(CASE WHEN B.JUNGDT IS NOT NULL THEN 1 ELSE 0 END) INS_RSLT
	         FROM 
	         (
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
		             AND UPDEPCD = 'O000'
		             AND DEPCD = 'O210'
	                 AND STTDT <= '20210430'
	                 AND LSTDT >= '20210401'
		             AND (AREA, UNIIND) IN (SELECT AREA, UNIIND FROM PT_AREAMT WHERE AREAUSR = '01970' AND AREA_USE = 'Y')
	              )
	        WHERE 1=1
	          AND RN = 1
	      )
	         A
	              , PAYPHONE.TB_MAINTAIN_SCHEDULE B
	        WHERE 1=1
	          AND A.UNINO = B.UNINO
	          AND B.SCHDT >= SUBSTR('20210430', 1, 6) || '01'
	          AND B.SCHDT <= SUBSTR('20210430', 1, 6) || '99'
	        GROUP BY A.UPDEPCD
	              , A.DEPCD
	              , A.UNIIND
	              , A.AREA
	              , A.PHONEKND;
	             
	             select * from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
	             where A.areausr = '01970' and jungdt between '20210401'|| '000000' and '20210430'|| '235959';
	              
	             
	             select * from tb_maintain_schedule b where 1=1
	          AND B.SCHDT >= SUBSTR('20210430', 1, 6) || '01'
	          AND B.SCHDT <= SUBSTR('20210430', 1, 6) || '99'
	          and unino  in (
	       SELECT 
	               UNINO
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
		             AND UPDEPCD = 'O000'
		             AND DEPCD = 'O210'
	                 AND STTDT <= '20210430'
	                 AND LSTDT >= '20210401'
		             AND (AREA, UNIIND) IN (SELECT AREA, UNIIND FROM PT_AREAMT WHERE AREAUSR = '01970' AND AREA_USE = 'Y')
	              )
	        WHERE 1=1
	          AND RN = 1
	    );
	    
	   
	   SELECT * FROM PT_AREAMT WHERE AREAUSR = '01970' 
	                 AND area_from <= '20210430'
	                 AND area_to >= '20210401';
	   
	       SELECT 
	               *
	         FROM (
	              SELECT UPDEPCD
	                     , DEPCD
	                     , UNIIND
	                     , AREA
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
		             AND UPDEPCD = 'O000'
		             AND DEPCD = 'O210'
	                 AND STTDT <= '20210430'
	                 AND LSTDT >= '20210401'
		             AND (AREA, UNIIND) IN (SELECT AREA, UNIIND FROM PT_AREAMT WHERE AREAUSR = '01970' AND AREA_USE = 'Y')
	              )
	        WHERE 1=1
	          AND RN = 1;
	         
	         
	         select * from (
 SELECT UPDEPCD
	              , DEPCD
	              , UNIIND
	              ,area
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
	                     ,area
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
	    


 SELECT UPDEPCD
	              , DEPCD
	              , UNIIND
	              ,area
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
	                     ,area
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
			and areausr  ='01970' and unino = 195085;
		
		select * from pt_Factmthist where unino = 195085
	               AND STTDT <= '20210531'
	               AND LSTDT >= '20210101'
			
		
	              SELECT 
	              *
	                FROM PAYPHONE.PT_FACTMTHIST A
	               WHERE 1=1
		             AND UPDEPCD = 'O000'
		             AND DEPCD = 'O210'
	                 AND STTDT <= '20210531'
	                 AND LSTDT >= '20210101'
		             AND  unino = 195085
	              