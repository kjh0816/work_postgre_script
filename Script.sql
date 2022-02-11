select * from pt_ttcossdd_g@oraktlpt where  depcd like 'G210' and ssdt like '202005%'

select * from biintmt b  where depnm like '강북%'

select * from pt_ttcobalance@oraktlpt pt where   depcd like 'G210' and ssdt like '202005%'


 select unino as unino, fact_telno as factTelno from payphone.pt_factmt order by unino desc limit 100  
 
  select unino as unino, fact_telno as factTelno from payphone.pt_factmt order by unino desc limit 100
  
  select * from payphone.tc_cpmsmt tc  where tel_no  ='005502236742'
  
  select * from tc_cpmsmt@oracpms tc  where tel_no  ='005502236742'
  
  select payphone.proc_getcpms_tc_cpmsmt();
  
 proc_change_pt_factmt
 
        select payphone.proc_getcpms_tc_cpmsmt();
        
       proc_payphone_tb_joblog
       
       select * from tb_joblog where log_nm like 'proc_getcpms_tc_cpmsmt%' and log_fromdy  like '20200526';
       
      SELECT * FROM pg_stat_activity where query like '%cpms%' ORDER BY query_start ASC;
      
     SELECT datname, usename, state, query FROM pg_stat_activity WHERE state = 'active';

    
    
    
SELECT
    current_timestamp - query_start AS runtime,
    datname, usename, query
FROM pg_stat_activity
WHERE state = 'active'
      AND current_timestamp - query_start > '1 min'
ORDER BY 1 DESC;

    
     
     select 
     -- 141221
     
     select * from t_log_des_v@oracpms
     
     select pid, now() - query_start as "runtime", usename, datname, state, query from pg_stat_activity where now() - query_start > '2 minutes'::interval and state = 'active' order by runtime desc;

    
    select payphone.proc_change_pt_factmt()
    
    
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
                a.area
                ,a.areausr as usrCd
                 ,'['||decode(uniind,'1','무인','2','자급','3','1541')||']'||areanm as usrName
                ,a.updepcd as depHighCd
                ,a.depcd as depCd
                ,a.accdepcd as accDepCd
                ,a.depcd || a.area areaCd
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
 and a.uniind = '1'
            ) userInfo
            
            select * from payphone.pt_areamt pa where pa.uniind  ='3' and area_use ='Y'
            
            
            select 
            updepcd as depHighCd
            , depcd as depCd 
            , area as area
            , '['||decode(uniind,'1','무인','2','자급','3','1541')||']'||areanm as areaNm 
        from payphone.pt_areamt   
        
          select 
            updepcd as depHighCd
            , depcd as depCd 
            , area as area
            , '['||decode(uniind,'1','무인','2','자급','3','1541')||']'|| areanm as areaNm 
            ,areausr 
            ,uniind 
        from payphone.pt_areamt     
        where area_use  ='Y'
        
        
        select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
            , uniind 
        from (
            select
                a.area
                ,a.areausr as usrCd
                 ,'['||decode(uniind,'1','무인','2','자급','3','1541')||']'||areanm as usrName
                ,a.updepcd as depHighCd
                ,a.depcd as depCd
                ,a.accdepcd as accDepCd
                ,a.depcd || a.area areaCd
                ,a.uniind  uniind
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
            ) userInfo
            where areacd ='G21013'
        order by area
        
                select
            dephighcd as depHighCd
            ,depcd as depCd
            ,usrcd as usrCd
            ,usrname as usrName
            ,hp_no   as hpNo
        from payphone.bimastercf  
        where bsnind='1'
        
        
update bimastercf SET hp_no ='01068227579'
WHERE usrcd ='02820'; 

select * from biitmastercf b 


select '0' as check,
               a.bldplcno  ,  -- 설치장소 관리번호
               case when b.bldplcno is null then '0'
                    else '1' end as factUseFlag,
 (select dephighcd
 from biintmt
 where depcd = a.depcd
 and deptreecnt = '3') as upDepCd   ,  -- 본부
               a.depcd     ,  -- 기관코드(지사)
               a.uniind    ,  -- 사업구분(1:무인, 2:자급
               a.bldplcnm  ,  -- 설치장소
               a.ft_use as ftUse,  -- 사용구분
               a.bldgb     ,  -- 설치구분[0244]
               a.bldloc1 as bldUpLoc  ,  -- 설치위치대분류[0246]
               a.bldloc2 as bldLoc    ,  -- 설치위치소분류[0247]
               a.gpsx as gpsX,  -- GPS X 좌표 
               a.gpsy as gpsY,  -- GPS Y 좌표
               a.bldzip    ,  -- 우편번호
               a.bldadr1 as bldAddr1,  -- 설치주소1(기본주소)
               a.bldadr2 as bldAddr2,  -- 설치주소2(상세주소)
               a.roadaddr as roadAddr,
               a.pp_clusr   as clUsr ,  -- 청소담당자번호
               a.land_pr    as landPr ,  -- 공시지가
               a.auto_yn    as autoYn ,  -- 자동연장여부
               a.elec_yn    as elecYn,  -- 전기점용료 납부구분[0087]
               a.elec_amt   as elecAmt,  -- 전기점용료 납부금액
               a.elec_depnm as elecDepNm,  -- 전기점용료 납부기관
               a.elec_num   as elecNum,  -- 수용가번호
               a.road_yn    as roadYn,  -- 도로점용료 구분[0088]
               a.road_amt   as roadAmt,  -- 도로점용료 금액
               a.road_name  as roadName,  -- 도로점용료 납부기관
               a.pay_cl     as payCl,  -- 납부주기
               a.sta_date   as staDate,  -- 점용시작일
               a.end_date   as endDate,  -- 점용종료일
               coalesce(substr(a.pp_etcfac, 1, 1), 'N') as aedYn,  -- 부가시설[AED, 공기질측정기, 따릉이, WI-FI 순서대로 "|"로 구분하여 저장 "Y|Y|Y|Y"
               coalesce(substr(a.pp_etcfac, 3, 1), 'N') as airYn,
               coalesce(substr(a.pp_etcfac, 5, 1), 'N') as bikeYn,
               coalesce(substr(a.pp_etcfac, 7, 1), 'N') as wifiYn
               , b.areanm as areaNm, b.areausr as asraUsr, b.usrname as asraUsrNm, b.depcd|| b.area as areaCd
               , to_number(a.ordr) as ordr -- 우선순위
               , case when (SELECT count(1) cnt FROM payphone.tb_attachfile t WHERE t.uniqno = a.bldplcno AND t.file_gb = 'plc'
 and del_yn = 'N') > 0 then 'O' else 'X' end attach_cnt
 from payphone.pt_bldplc a,               
 (select distinct
                       a.depcd, a.uniind, a.bldplcno, a.area, b.areanm, b.areausr, c.usrname                 
 from payphone.pt_factmt a,
                       payphone.pt_areamt b,
                       payphone.bimastercf c                
 where a.status    = '1'                  
 and a.fact_knd  = '1'                  
 and a.updepcd   = b.updepcd                  
 and a.depcd     = b.depcd                   --
 and a.accdepcd  = b.accdepcd                  
 and a.uniind    = b.uniind                  
 and a.area      = b.area                  
 and b.areausr   = c.usrcd                  
 and b.area_use  = 'Y') b       
 where 1=1          
 and a.depcd    = b.depcd(+)        
 and a.uniind   = b.uniind(+)         
 and a.bldplcno = b.bldplcno(+)               
 and a.depcd  in 
 (select depcd
 from biintmt
 where dephighcd = 'G000'
 and deptreecnt = '3'
 and useflag ='Y')
 and a.depcd    = 'G210'
 and a.uniind = '3'
         order by a.depcd, factUseFlag desc, a.bldplcno
         
         select a from pt_bldplc pb  where bldplcno  ='0000025044'
         
         
         proc_getmake_tb_cosscpmsmm
         
           select payphone.proc_getmake_tb_cosscpmsmm('202005');
         
          FMTHST
           
          select to_char(now(),'yyyymm');
          
         select 
     
select * from payphone.tb_cosscpmsmm tc  where tc.cpjsdt  like '202003%'

     select * from payphone.tb_cosscpmsmm tc  where  unino  ='1319863'

select '202005' AS CPJSDT,UPDEPCD,DEPCD,ACCDEPCD,KTDEPCD, a.fact_telno TELNO
		, DECODE(PHONEKND,'06','07',PHONEKND) PHONEGB
		, SUBSTR('202005',1,4) AS YYYY, SUBSTR('202005',5,2) AS MON
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
			where ssdt like '202005'||'%'
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
			where cpmsdt between to_char(add_months(to_date('202005','yyyymm'),-1),'yyyymm')||'26' and '202005'||'25'
			--and depcd LIKE arg_depcd
			--AND KTDEPCD LIKE arg_ktdepcd
			group by unino
		)
		group by unino
	) b
	where a.unino=b.unino
    and (a.lstdt ='99991231' or (a.opflag='D' and a.remodt between to_char(add_months(to_date('202005','yyyymm'),-1),'yyyymm')||'26' and '202005'||'25'))
    and a.unino ='1319863'

    select * from 
   pt_factmthist a where 1=1
    and (a.lstdt ='99991231' or (a.opflag='D' and a.remodt between to_char(add_months(to_date('202005','yyyymm'),-1),'yyyymm')||'26' and '202005'||'25'))
    and a.unino ='1319863'
    
    select * from payphone.pt_factmt_h pfh  where unino ='1319872'
    
    select boounino from payphone.pt_factmt_h pfh  where unino ='1319872'
    
    select unino,count(unino ) from payphone.pt_factmthist a  where 
     (a.lstdt ='99991231') and sttdt like '202005%'
     group by unino 
      having count(unino) > 1
 
      delete payphone.pt_factmthist where (unino,sttdt ,opflag,histsn ) in
 (select unino, sttdt, opflag ,min(histsn) from payphone.pt_factmthist pf  where unino 
 in (1320023,
1319969,
1319913,
1319998,
1320001,
1319916,
1319995,
1320028,
1319948,
1319992,
1319949,
1320010,
1319970,
1320015,
1320011,
1320017,
1319968,
1319965,
1320002,
1320000,
1319951,
1319971,
1319892,
1320025,
1319909,
1319863,
1319898,
1320014,
1319877,
1319860,
1319996,
1319980,
1319872,
1320016,
1319893,
1319999,
1319912,
1320013,
1319990) and opflag  ='I' group by  unino, sttdt, opflag)

select histsn ,unino ,sttdt from payphone.pt_factmthist pf  where unino in ('1319953', '1319981','1319994')

select * from payphone.pt_factmt_h pfh   where unino ='1319867'

select * from payphone.pt_factmt_h pfh  where unino ='1319867'

select * from payphone.pt_factmthist pf where unino in (1320023,
1319969,
1319913,
1319998,
1320001,
1319916,
1319995,
1320028,
1319948,
1319992,
1319949,
1320010,
1319970,
1320015,
1320011,
1320017,
1319968,
1319965,
1320002,
1320000,
1319951,
1319971,
1319892,
1320025,
1319909,
1319863,
1319898,
1320014,
1319877,
1319860,
1319996,
1319980,
1319872,
1320016,
1319893,
1319999,
1319912,
1320013,
1319990) and opflag  ='I'

select count(1) from payphone.pt_factmt_h pfh  where opflag  ='I' and opdt  like '202005%'

select sttdt, lstdt ,opflag ,unino,blddt ,remodt from payphone.pt_factmthist pf  
     where unino in (select unino from payphone.pt_factmt_h	 where opdt like '20200513'||'%' and opflag ='I')
     and blddt  like '20200513'||'%' and sttdt  like '20200513'



select * from payphone.pt_factmt_h pf   
     where unino in (select unino from payphone.pt_factmt_h	 where opdt like to_char(current_date-1,'yyyymmdd')||'%' and opflag ='I')
     and blddt  like to_char(current_date-1,'yyyymmdd')||'%'

select fac.unino, fac.uniind, fac.fact_telno, fac.blddt, fac.remodt, fac.remorsn
	    
	    
	    select fac.unino, fac.uniind, fac.fact_telno, fac.blddt, fac.remodt, fac.remorsn
			, ( select prnm from bibsici where lcd in ( '0908', '0262' ) and scd = fac.remorsn ) as remoRsnNm 
			, fac.blddt  as sttdt, '99991231' as lstdt, fac.status
			, 'I' as opflag, fac.updepcd, payphone.get_depnm( fac.updepcd, '2' ) as upDepNm, fac.depcd, payphone.get_depnm( fac.depcd, '3' ) as depNm 
			, fac.accdepcd, DECODE( payphone.get_depnm( fac.depcd, '3' ) , null, payphone.get_depnm( fac.depcd, '4' ), payphone.get_depnm( fac.depcd, '3' ) ) as accDepNm 
			, fac.ktdepcd, payphone.get_ktdepcdnm(fac.ktdepcd) as ktDepNm, fac.upktdepcd 
			, fac.area as area , arm.areanm as areaNm, arm.areausr, ur.usrname as asraUsrNm, arm."call" as asrUsrPhone 
			, fac.phonemgrno as phoneMgrNo 
			, fac.phoneknd as phoneKnd, ( select prnm from payphone.bibsici where lcd = '0628' and scd = fac.phoneknd ) as phoneKndNm 
			, fac.phgb as phGb, ( select prnm from payphone.bibsici where lcd = '0291' and scd = fac.phgb ) as phGbNm 
			, fac.bldknd as bldKnd, ( select prnm from payphone.bibsici where lcd = '0271' and scd = fac.bldknd ) as bldkKndNm 
			, fac.recvind as recvInd, ( select prnm from payphone.bibsici where lcd = '0915' and scd = fac.recvind ) as recvIndNm 
			, fac.factgb, ( select prnm from payphone.bibsici where lcd = '0278' and scd = fac.factgb ) as factGbNm 
			, fac.booserno as booSerNo, fac.army_nm as armyNm , boo.boomgrno as booMgrNo, boo.boocon
			, ( select prnm from payphone.bibsici where lcd = '0250' and scd = boo.boocon ) as booConNm 
			, boo.booknd, ( select prnm from payphone.bibsici where lcd = '0248' and scd = boo.booknd ) as booKndNm 
			, boo.boodoorind, ( select prnm from payphone.bibsici where lcd = '0286' and scd = boo.boodoorind ) as booDoorIndNm 
			, boo.booblddt, bld.road_amt, bld.elec_amt 
			, boo.litest1, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest1 ) as liTest1Nm
			, boo.litest2, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest2 ) as liTest2Nm 
			, boo.litest3, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest3 ) as liTest3Nm 
			, boo.etvoltcd, ( select prnm from payphone.bibsici where lcd = '0266' and scd = boo.etvoltcd ) as etVoltCdNm 
			, boo.etinbld as etInBld , boo.tpinbld as tpInBld 
			, boo.remorsn, ( select prnm from payphone.bibsici where lcd = '0262' and scd = boo.remorsn ) as booRemoRsnNm 
			, bld.bldplcno, bld.bldplcnm 
			, bld.bldgb, ( select prnm from payphone.bibsici where lcd = '0244' and scd = bld.bldgb ) as bldGbNm 
			, bld.bldloc3, ( select prnm from payphone.bibsici where lcd = '2049' and scd = bld.bldloc3 ) as bldLoc3SmaNm 
			, bld.bldloc1, ( select prnm from payphone.bibsici where lcd = '0246' and scd = bld.bldloc1 ) as bldLoc1Nm 
			, bld.bldloc2, ( select prnm from payphone.bibsici where lcd = '0247' and scd = bld.bldloc2 ) as bldLoc2Nm
			, bld.bldzip as bldZip , bld.bldadr1 as bldAdr1 , bld.bldadr2 as bldAdr2, '' as rodadr, bld.gpsx, bld.gpsy 
			,bld.roadaddr as roadaddr 
			, boo.clcyl, ( select prnm from payphone.bibsici where lcd = '0256' and scd = boo.clcyl ) as clCylNm 
			, boo.sdcyl, ( select prnm from payphone.bibsici where lcd = '0259' and scd = boo.sdcyl ) as sdCylNm 
			, boo.retcyl, ( select prnm from payphone.bibsici where lcd = '0257' and scd = boo.retcyl ) as retCylNm 
			, bld.land_pr, bld.auto_yn, bld.pp_etcfac 
			, substr( bld.pp_etcfac, 1, 1 ) as bldAed , substr( bld.pp_etcfac, 3, 1 ) as bldAir 
			, substr( bld.pp_etcfac, 5, 1 ) as bldBye , substr( bld.pp_etcfac, 7, 1 ) as bldWiFi
			, 'admin'
			, fac.exmhod, bld.elec_yn, bld.elec_num, bld.road_yn, bld.road_name, bld.elec_depnm, bld.pp_clusr
			, fac.boounino, fac.custzip, fac.custadr1, fac.custadr2, fac.custcall, fac.custtradnm
			, fac.gdgb, fac.gdtype, fac.gdcd
		from payphone.pt_factmt_h fac
		left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino
		left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno and fac.uniind = bld.uniind
		left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind = fac.uniind and arm.depcd = fac.depcd and area_use ='Y'
		left outer join payphone.bimastercf ur on ur.usrcd = arm.areausr
        where fac.unino in 
		  (select unino from payphone.pt_factmt_h
     		 where opdt like '20200312'||'%'
     		 and opflag ='I'
     		 minus
     		 select unino from payphone.pt_factmthist
     		 where opflag ='I'
     		 minus
     		 select unino from payphone.pt_factmt_h
	         where opdt like '20200312'||'%'
	         and opflag ='U')

	         select * from payphone.pt_factmt_h pfh  where opdt  like '20200312%' and opflag  ='I'
	         
	         select * from pt_factmthist pf  where 
	         unino in (select unino from payphone.pt_factmt_h	 where opdt like '20200312'||'%' and opflag ='I')
     and opflag ='U' and unino  ='1319872';
     
    
    select to_char(current_date-1,'yyyymmdd')||'%';
    
   
   select unino from payphone.pt_factmt_h
     		 where opdt like '20200513'||'%'||'%'
     		 and opflag ='I'
     		 minus
     		 select unino from payphone.pt_factmthist
     		 where opflag ='I'
     		 minus
     		 select unino from payphone.pt_factmt_h
	         where opdt like '20200513'||'%'
	         and opflag ='U'
	         
	         select * from payphone.pt_factmthist pf  
	              where unino in (select unino from payphone.pt_factmt_h	 where opdt like to_char(current_date-1,'yyyymmdd')||'%' and opflag ='I')
     and blddt  like to_char(current_date-1,'yyyymmdd')||'%' and  sttdt  like to_char(current_date-1,'yyyymmdd')||'%' and lstdt like '99991231%' and (opflag  ='U' or opflag ='I')
     
     select * from payphone.pt_factmthist pf  where 	
     (
   
     select * 
	from payphone.pt_factmt fac
		left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino
		left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno and fac.uniind = bld.uniind
		left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind = fac.uniind and arm.depcd = fac.depcd  and area_use ='Y'
		left outer join payphone.bimastercf ur on ur.usrcd = arm.areausr
        where
		(
        (fac.unino in (select unino from payphone.pt_factmt_h where opdt like '20200513'||'%' and opflag ='U'))
	     or ((fac.depcd,fac.uniind,fac.area) in (select depcd,uniind,area from payphone.pt_areamt_h where opdt like '20200513'||'%' group by depcd,uniind,area))
	     or (fac.boounino in  (select boounino from payphone.pt_boothmt_h where opdt like '20200513'||'%' group by boounino))
	     or (fac.bldplcno in (select bldplcno from payphone.pt_bldplc_h  where substring(opdt,9,4) != '0159' and opdt like '20200513'||'%'))
	     ) and unino ='1320023';
	     
	     select * from payphone.pt_factmt_h  pf where 1=1 and unino ='1300139'
	     
	     select * from payphone.pt_factmthist where fact_telno  in ( '005303261541', '003305523706')
	     
	     -- 005303261541, 003305523706
	     
	     select * from payphone.pt_factmt pf where unino ='1319151'
	     
	     
	     select * from payphone.tb_user_password tup  where lastdt ='20200602'
	     
	select * from payphone.icis_rcv_hist irh where be_svc_no  in ('005303261541') -- ,'005308121541','005303261541','003305523706'
	
	
	select * from t_tel@oraguard 
	
	select * from payphone.rt_tel rt where pn in ('005303261541','003305523706')
	
	
	select * from rt_Tel@oraguard where pn ='005303261541'
	
	select * from pt_bldplc pb  where bldplcnm  like '강북초등학교%'
	
	select * from payphone.pt_factmt pf  where bldplcno ='2019040148'
	
	select * from payphone.bibsici b where lcd  ='2075'
	
		select
    	    group_id as groupId
    	    ,menu_id as menuId
    	    ,menu_nm as groupNmKr
    	from payphone.tb_menu
    		where
    		"level" ='0' group by group_id , menu_id ,menu_nm order by menu_id
	
    		
    		select * from rt_Tel@oraguard
    		
    		select * from tb_menu tm 
	
    		
    		select * from 
    		
    		select
				tm."level" as level,
				tm.group_id as groupId,
				tm.menu_id as menuId,
				tm.menu_nm as menuNm,
				tm.menu_url as menuUrl,
				tm.sort_no as sortNo,
				tm.up_menu_id as upMenuId,
				tm.use_yn as useYn,
				tm.crt as crt
			from
				payphone.tb_menu tm 
    		--SN00000206
    		
groupId
menuId
menuNm
menuUrl
sortNo
upMenuId
useYn
crt


   	select
    	    group_id as groupId
    	    ,menu_id as menuId
    	    ,menu_nm as groupNmKr
    	    ,level as level
    	from payphone.tb_menu
    		where 1=1
    		
    		select * from tb_user_group tug 
    		
    		select * from payphone.pt_bldplc pb  where bldplcnm like '%국민학교%'
    		
    		 select * from payphone.tc_cpmsmt tc where tc.tel_no  ='003107219535'
           
           
           selec
           
           -- 0031 721 9535
           
           
           select * from payphone.tb_repair where gojang_tel ='003107219535'
           
           select 
           
           	select * from pg_stat_activity
    where query like '%proc_change_pt_factm%';
   
   select * from payphone.pt_bldplc pb
           
           select * from t_jubsu@oracpms where gojang_tel ='0317219535' and rev_Date like '20200604%'
           
           
           
           select * from payphone.bibsici b where lcd  like '0238%'

           select * from tc_cpmsmt@oracpms where tel_no = '003107219535'
           
           select * from tc_fault@oracpms where tel_no = '003107219535'
           
           --1^0031*0721*9535^30310_E920060416211000020000000000000000

select * from TC_FAULTREP@oracpms where tel_no ='003107219535' and fault_dtm like '20200604%'

select * from tc_jubsu@oracpms where 




select a.rev_date,a.rev_time,a.jubsu_no,a.jumgumja_id,(select c.usrname from bimastercf c where c.usrcd =a.jumgumja_id) jumgumja_des,a.hochul_tel,a.suri_cd,a.suri_des, a.wan_date,a.wan_time,a.hochul_date, a.hochul_time,wanro_flag,hochul_gb FROM t_jubsu@oracpms a
          where a.rev_date  >= to_char(current_date-7,'YYYYMMDD')
          minus
         select rev_date,rev_time,jubsu_no,jumgumja_id,jumgumja_des,hochul_tel,suri_cd,suri_des, wan_date,wan_time,hochul_date, hochul_time,wanro_flag,hochul_gb FROM tb_repair
          where rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2'
          
          select * from TC_FAULTREP@oracpms where st_keypad ='1' and  st_crdread='1'
          
          
          select * from payphone.bimastercf b where usrname ='금상훈'
          
          select * from payphone.biitmastercf b2 where usrname  ='이영근'
          
          select * from payphone.tb_user_password tup where usrcd  ='03843'
          
         select * from tb_ttcpmsdd tt where telno ='006209566791' and cpmsdt  like '202005%';

select * from tb_ttcpmsdd tt where telno ='006209566791' and cpmsdt  like '202005%';

select * from pt_ttcpmsdd@oracpms where telno ='006209566791' and cpmsdt  like '202005%';

select * from pt_ttcobalance pt where 


select * from user_source where text like '%tc_fee%'

PROC_GETGUARD_CLDT

select * from tc_month_v tmv where tel_no ='006209566791'


select * from payphone.bibsici b ;-- where (lcd ='2076');

select * from payphone.tb_menu tm where use_yn ='Y' and "level"  != '0' and group_id  != 'SN00000700'

select * from pg_catalog.pg_stat_user_tables where schemaname  ='payphone'

zold_pt_close

select
	        lcd
	        ,scd
	        ,prnm
	        ,remark 
 from 
        (
            select 
                lcd as lcd
                , case when char_length(scd)  <  4 then lpad(scd, 4, '0') else scd end as scd
                , prnm as prnm
			    , remark as remark   
 from bibsici  
 where lcd = '0000' 
        ) b  
 where 1=1      
        order by scd asc
        
        select * from payphone.bibsici b where lcd = '0000' and scd ='000'
        
        
        B00001013700
        
        SN00000400
        
        
        select act_code , can_flag ,proc_gubun from payphone.icis_rcv_hist irh where be_svc_no ='005308111758'
        
        select * from payphone.pt_areamt pa where 
        call ='01035579989'
        
        select * from biintmt b where depcd ='Q010'
        
        
         update payphone.pt_bldplc set bldadr1 = replace(bldadr1,'국민학교','초등학교') where  bldadr1 like '%국민학교%';
        
        update payphone.pt_bldplc set  bldplcnm = replace(bldplcnm,'국민학교','초등학교') where bldplcnm  like '%국민학교%'; 
        
       select * from payphone.tc_cpmsmt tc 
       
       select fact_telno , sttdt ,e ,exmhod from payphone.pt_factmthist pf 
       
       select unino from 
       (select unino ,fact_telno , exmhod from payphone.pt_factmthist group by  unino ,fact_telno , exmhod)
       having  count(unino ) > 1 
       group by unino ;
      
      select unino ,fact_telno , exmhod from payphone.pt_factmthist where unino ='0'
      
      select unino ,fact_telno , exmhod from payphone.pt_factmthist group by  unino ,fact_telno , exmhod
      
      -- update payphone.pt_factmthist  set exmhod = '' where exmhod is null;
      
      select * from payphone.pt_factmthist pf where exmhod ='' and sttdt > '20190501';
     
     
     update payphone.pt_bldplc set lstdt  =  to_char(now(), 'yyyymmddhh24miss')  where bldplcno  in
     (select bldplcno from payphone.pt_bldplc_h pbh where opdt  like '20200615%' and bldadr1  like '%국민학교%')

     select  from payphone.pt_bldplc pb
     
     select * from payphone.tb_attachfile ta ;
     
         select to_char(now(), 'yyyymmddhh24miss') 
         
         
     
         select * from payphone.pt_bldplc where bldplcno  in
         
     (select * from payphone.pt_bldplc_h pbh where opdt  like '20200615%' and bldadr1  like '%국민학교%')
     
     
     select  file_nm as 파일명, count(file_nm)  from payphone.tb_attachfile ta where file_gb ='plc' and del_yn ='N'
     and uniqno in (select bldplcno from payphone.pt_boothmt pb2 where retcyl ='072') group by  file_nm
     
select bldplcno from payphone.pt_boothmt pb2 where retcyl ='072'
     
select gpsx , gpsy from payphone.pt_bldplc pb where bldplcno in (select bldplcno from payphone.pt_factmt pf where unino ='994967');

select * from payphone.tb_repairset tr 

select unino from payphone.pt_factmt pf where fact_telno ='005306210943'
     -- file_31hm6t4h-877q-z6pn-31iu5r49u2j2_20191217111835.png

select * from pt_ttcpmsdd@oracpms   where telno ='006103350449'; 

select * from tb_maintain tm where jungtel ='003107215187' and jungdt  like '20200617%'


select * from sms_msg@oraguard where sentdate like '20200617%'

select * from tb_smartpush ts where senddt  like '20200618%'


select * from payphone.icis_rcv_hist irh where be_svc_no in ('003109110227')
--003109111430,'003109111660','003306310987','006305811545','006308611545', '006308611545','006308411544'


-- 003109111430 6월 01일 해지 003109111660 6월 01일 해지 003306310987 시설이 존재함 006305811545 시설이 존재함  006308411544 시설이 존재함  006308611545 시설이 존재


select * from payphone.tb_maintain tm where tm.jungtel ='003107211305' and jungid ='99999'

select * from 

proc_getcpms_t_jubsu

select * from payphone.tb_smartpush ts 


proc_getcpms_pt_ttcpmsdd_day

select to_char(current_date-1,'YYYYMMDD');

	delete FROM payphone.tb_smartpush where substring(regdt,1,8) <= to_char(current_date - 7 , 'yyyymmdd');

proc_ins_del_pt_factmt

proc_batch_pt_factmthist


select * from payphone.tb_user_password tup where usrcd ='02217'


select * from tc_cpmsmt@oracpms tc where tel_no ='000203221285'

select * from pt_Factmt@oracpms where unino ='1300427'

000203221285

005104417217

000203228423
005106310751

-- 0031-0881-5912

select * from payphone.pt_factmt where fact_telno ='000203228423'

select * from pt_Factmt@oracpms where tel_no ='000203228423'


select * from pt_factmt  where unino ='961305'


select payphone.get_depnm(updepcd,'2' ),payphone.get_depnm(depcd,3), payphone.get_phonegb_prnm(phoneknd),fact_telno,payphone.get_bldplcnm(bldplcno ) from payphone.pt_factmt pf where unino in
(
select unino from tc_cpmsmt@oracpms
where unino in (select unino from pt_factmt@oracpms
where status ='1')
and remove_ox ='2' )

and 

select * from pt_Factmt@oracpms where tel_no ='000203221285'

 

select unino ,remove_dt, remove_ox, tel_no from tc_cpmsmt@oracpms where unino in (
select unino from payphone.pt_factmt pf where uniind ='1'
minus 
select unino from payphone.tc_cpmsmt tc where remove_ox ='1'
)

select * from payphone.pt_factmt_h pfh where 

select unino, remove_ox from payphone.tc_cpmsmt 
minus 



select * from tc_cpmsmt@oracpms where unino ='1320241'

select * from payphone.pt_factmthist pf  where unino ='1320241'

select  unino, remove_ox, remove_dt  from payphone.tc_cpmsmt tc where unino ='5441'

select  unino, remove_ox, remove_dt  from tc_cpmsmt@oracpms where unino ='5441'


select * from user_source where text like '%remove_ox%'

PROC_CHANGE_PT_FACTMT


	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	and uniind ='1'
	minus	
	select unino,area,areausr from tc_cpmsmt@oracpms
	
	select bldplcno ,bldplcnm ,gpsx ,gpsy from payphone.pt_bldplc pb where uniind ='2';
	
	
	select unino,fact_telno,phoneknd from pt_factmt where  uniind ='1' and phoneknd not in ('024','0233','0232','0231') and lstdt like to_char(current_date,'YYYYMMDD') || '%' 
	and unino 
	in (
		select unino from pt_factmt_h where opflag = 'R' and opdt like to_char(current_date,'YYYYMMDD') || '%' 
	   )
	   
	   select * from payphone.tb_maintain tm where jungtel in (select fact_telno from payphone.pt_factmt pf where uniind ='2');
	   
	   
	update tc_cpmsmt@oracpms a set a.area = b.area , a.areausr = b.areausr
	from (
	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	and uniind ='1'
	minus	
	select unino,area,areausr from tc_cpmsmt@oracpms) B
	where A.unino = b.unino;

    GET DIAGNOSTICS retrow = ROW_COUNT;
	call payphone.proc_payphone_tb_joblog('proc_change_pt_factmt()','1','payphone.pt_areamt(u)','tc_cpmsmt@oracpms', workday, workday, retrow);

	update tc_cpmsmt@oracpms a set a.remove_ox = 1 , a.remove_dt = null , a.phoneknd = b.phoneknd
	from (
	select unino,fact_telno,phoneknd from pt_factmt where  uniind ='1' and phoneknd not in ('024','0233','0232','0231') and lstdt like workday || '%' 
	and unino 
	in (
		select unino from pt_factmt_h where opflag = 'R' and opdt like workday || '%' 
	   )
	) B
	where A.unino = b.unino;


    GET DIAGNOSTICS retrow = ROW_COUNT;
	call payphone.proc_payphone_tb_joblog('proc_change_pt_factmt()','1','payphone.pt_factmt_h(R)','tc_cpmsmt@oracpms', workday, workday, retrow);


	 UPDATE TC_CPMSMT@oracpms A
	    SET A.UPDEPCD = B.UPDEPCD,
			A.DEPCD = B.DEPCD,
	        A.KTDEPCD = B.KTDEPCD,
	        A.AREA = B.AREA,
	        A.AREAUSR =B.AREAUSR,
	        A.BLDPLCNO = B.BLDPLCNO,
			A.PHONEKND = B.PHONEKND
	    from
	(SELECT unino,BLDPLCNO,updepcd,TEL1||TEL2||TEL3 TEL_NO,phoneknd,depcd,ktdepcd,area,areausr FROM PT_FACTMT@oracpms
	WHERE uniind ='1'
	AND status ='1'
	AND factgb='1'
	AND UNINO IN (SELECT unino FROM TC_CPMSMT@oracpms)
	--AND DEPCD LIKE PV_DEP||'%'
	MINUS
	SELECT unino,BLDPLCNO,updepcd,TEL_NO,phoneknd,depcd,ktdepcd,area,areausr FROM TC_CPMSMT@oracpms) B
	WHERE  A.TEL_NO = B.TEL_NO;
	--WHERE DEPCD LIKE PV_DEP||'%';

	GET DIAGNOSTICS retrow = ROW_COUNT;
	call payphone.proc_payphone_tb_joblog('proc_change_pt_factmt()','1','PT_FACTMT@oracpms','tc_cpmsmt@oracpms', workday, workday, retrow);

SELECT updepcd, tel_no, unino, unino_stat, depcd, phoneknd, ktdepcd
		, area, areausr, bldplcno, instusr, remousr, tel_id, sw_ver
		, prod_co, prod_dt, curinf_dtm, curinf_ord, curinf_err_id
		, coinfull_ox, coinfull_dtm, coinfull_cnt, coinfull_amt, coinfull_rate
		, faultrep_dtm, fault_ox, fault_dtm
		, st_power, st_line, st_coinmach, st_boxout, st_keypad, st_crdread, st_coinslot, st_handset
		, ms_memory, ms_ctc, ms_feeerr, ms_readcon, ms_readacc, st_display, st_modem, st_voiceinf, st_looflel
		, rmsend_state, rmsend_err_id, rmload_dtm, rmacep_dtm, remove_ox, remove_dt
		, curexc_dtm, curcard_dtm, curbox_amt
		, second_dtm, second_ord, second_ox, second_err_id, second_stop
		, faultinf_dtm, rep_dtm, feeunit_seq, cpms_lstdt, cpms_lstusr
		, res1, res2, res3, res4, res5, res6, res7, res8
		, old_updepnm, old_depnm, old_ktdepnm, old_phonekndnm, old_exmhodnm
		, old_bldplcnm, old_blddt, old_care, old_areausr, old_areausrnm
		, old_remove_ox, old_remove_dt, acccnt_dtm, gubun
	FROM TC_CPMSMT_V@oracpms
	minus
	select updepcd, tel_no, unino, unino_stat, depcd, phoneknd, ktdepcd
		, area, areausr, bldplcno, instusr, remousr, tel_id, sw_ver
		, prod_co, prod_dt, curinf_dtm, curinf_ord, curinf_err_id
		, coinfull_ox, coinfull_dtm, coinfull_cnt, coinfull_amt, coinfull_rate
		, faultrep_dtm, fault_ox, fault_dtm
		, st_power, st_line, st_coinmach, st_boxout, st_keypad, st_crdread, st_coinslot, st_handset
		, ms_memory, ms_ctc, ms_feeerr, ms_readcon, ms_readacc, st_display, st_modem, st_voiceinf, st_looflel
		, rmsend_state, rmsend_err_id, rmload_dtm, rmacep_dtm, remove_ox, remove_dt
		, curexc_dtm, curcard_dtm, curbox_amt
		, second_dtm, second_ord, second_ox, second_err_id, second_stop
		, faultinf_dtm, rep_dtm, feeunit_seq, cpms_lstdt, cpms_lstusr
		, res1, res2, res3, res4, res5, res6, res7, res8
		, old_updepnm, old_depnm, old_ktdepnm, old_phonekndnm, old_exmhodnm
		, old_bldplcnm, old_blddt, old_care, old_areausr, old_areausrnm
		, old_remove_ox, old_remove_dt, acccnt_dtm, gubun 
	from payphone.tc_cpmsmt
	
	select count(*)from TC_ERR_REPORT where report_dtm like '20200622%';
	
select fact_telno from 
payphone.pt_factmt pf where fact_telno  in
('003103726891'
,'000208110070'
,'003103559462'
,'006200148709'
,'000207012168'
,'003205060851'
,'000202524638'
,'000303112648'
,'000208410257'
,'000206620031'
,'003108210258'
,'003108210258'
,'000107510754'
,'000203228443'
,'000203221285'
,'000203221285'
,'003200822864'
,'003100878092'
,'003104416368'
,'006103536828')

select *  from tc_cpmsmt@oracpms tc where tel_no in (
--'003103726891'
'000208110070'
--,'003103559462'
,'006200148709'
--,'000207012168'
--,'003205060851'
,'000202524638'
,'000303112648'
,'000208410257'
,'000206620031'
--,'003108210258'
--,'003108210258'
,'000107510754'
,'000203228443'
,'000203221285'
,'000203221285'
,'003200822864'
,'003100878092'
--,'003104416368'
--,'006103536828'
)


--000207012168 003103559462 003103726891 003104416368 003108210258 003205060851 006103536828

select * from payphone.pt_factmthist pf where fact_telno ='000204447956'

select * from tc_cpmsmt@oracpms where tel_no ='000203183297'

select * from payphone.pt_factmt pf where fact_telno ='000203183297'

select remove_ox from tc_cpmsmt@oracpms  where tel_no ='003103220674'

select * from pt_factmt@oraktlpt where tel1= '0031' and tel2 ='0322' and tel3 ='0674'

select * from pt_factmt where  ktdepcd= 'K07010' and fact_telno ='003103220674';


select * from tc_factmt where 

select * from pt_bldplc pb where uniind ='1' and gpsy ='';


select * from payphone.tb_maintain tm where jungtel in (select fact_telno from payphone.pt_factmt pf where ktdepcd ='G15020') and jungid !='01039';

--000207618352

select * from bimastercf b where usrcd ='02320'

select * from payphone.pt_areamt pa  where depcd ='Q330' and uniind ='1' and area

select * from bitelmt b where depnm like '여의도%';

select * from tb_ttcpmsdd tt where telno  ='004302605239'

select * from pt_ttcpmsdd@oracpms tt where telno ='004308779137'

delete from pt_ttcpmsdd_q@oracpms  where telno ='004302605239' and cpmsdt ='20200622'

select * from pt_ttcobalance pt 

tc_month_v

select * from bimastercf b2 where usrname like '강동호';

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
		when remodt > '20200624235959' then ''
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
			yyyymm between substr('20200601000000', 1, 14) and substr('20200624235959', 1, 14)
			and UPDEPCD = NVL('H000', UPDEPCD)
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
				count(*)
			from
				tc_cpmssave
			where
				(save_dtm between '20200601000000' and '20200624235959')
				or (close_date >= '20200601000000'
				and save_dtm <= '20200601000000')
				) sa
		where
			(tc.remodt >= substr('20200601000000', 1, 8)
			or tc.remodt is null )
			and tc.TEL_NO like '%%%' || '%'
			and tc.UPDEPCD = NVL('H000', tc.UPDEPCD)
			and tc.DEPCD = NVL('H020', tc.DEPCD)
			and tc.KTDEPCD = NVL('', tc.KTDEPCD)
			and tc.AREA = NVL('', tc.AREA)
			and tc.AREAUSR = NVL('', tc.AREAUSR)
			and tc.unino = sa.unino(+)
			and tc.blddt <= TO_CHAR(LAST_DAY(TO_DATE(substr('20200601000000', 1, 8), 'YYYYMMDD')), 'YYYYMMDD'))
	group by
		updepcd, tel_no )
where
	TEL_NO like '%%%' || '%'
	and DEPCD = NVL('H020', DEPCD)
	and PHONEKND = NVL('', PHONEKND)
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
			UPDEPCD, '0' depcd, '0' ktdepcd, '0' BLDPLCNO, '0' areausr, '0' area, TEL_NO, '0' phoneknd, ' ' REMODT, SUM(CITY_AMT) CITY_AMT, SUM(OTCT_AMT) OTCT_AMT, SUM(WORD_AMT) WORD_AMT, SUM(T114_AMT) T114_AMT, SUM(DOWN_AMT) DOWN_AMT, SUM(TOTAL_AMT) TOTAL_AMT, SUM(AMOUNT) AMOUNT, SUM(etc_amt) etc_amt, ' ' scd, ' ' dsec
		from
			tc_month_v
		where
			yyyymm between substr('20200601000000', 1, 14) and substr('20200624235959', 1, 14)
			and UPDEPCD = NVL('H000', UPDEPCD)
			and TEL_NO like '%%%' || '%'
		group by
			UPDEPCD, TEL_NO
		   
	  	 select * from user_source where text like '%tc_month_v%';
	  	 
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
			from  payphone.pt_factmt a,
			(
			    select updepcd,  tel_no, phoneknd, area, areausr, sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
			    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
			    sum(b.total_amt) total_amt
 from payphone.tc_month_v b 
 where  1=1      
 and b.yyyymm between '20200601'
 and '20200624'
			    group by updepcd,  tel_no, phoneknd, area, areausr
			) b ,
 (select unino
 from payphone.tc_cpmssave 
			where 1=1 and
			(save_dtm BETWEEN '20200624'||'000000' AND '20200624'||'235959')
			        or
			(close_date 
	                     >=  '20200624'||'000000' AND save_dtm  <=  '20200624'||'000000')
			)  c
			where 1=1
 and a.fact_telno = b.tel_no(+)
 and a.unino = c.unino(+)
 and (
			 a.REMODT  >=  '20200601' or
			   a.REMODT is null or a.REMODT ='')
 and total_amt  <=   '60'::NUMERIC
		group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd
		
		
	select *
		from payphone.pt_ttcobalance
		where 1=1
 and upDepCd = 'H000'
 and ssdt = '20200622'
 and ktdepcd in ('K04000','K09001')
    
    
    select * from user_source where text like '%tb_ttcossdd%'
    
    PROC_GETKTLPT_PT_TTCOSSDD_DAY
    
    
    select 
            *
 from tb_ttcossdd
 where 1=1
 and upDepCd = 'H000'  
 and ssdt between '20200622'
 and '20200622'
 and replace(telno, '-', '') like '%' || replace('', '-', '') || '%'
 and ktdepcd ='K04000'
 
 
 select * from pt_ttcobalance@oraktlpt where 1=1
 and upDepCd = 'H000'
 and ssdt = '20200622'
 and ktdepcd in ('K04000','K09001')
 
 
    select 
            *
 from pt_ttcossdd@oraktlpt
 
 
 PROC_GETKTLPT_PT_TTCOSSDD_DAY
 
 where 1=1
 and upDepCd = 'H000'  
 and ssdt between '20200622'
 and '20200622'
 and replace(telno, '-', '') like '%' || replace('', '-', '') || '%'
 
 
 
 	select * FROM KTLPT.PT_TTCOSSDD@oraktlpt
	where 1=1
	and SSDT like'202006%' ;

select ssdt ,


delete from 

select * from  pt_ttcossdd_I@oraktlpt where ssdt like '20200608%'

select * from tb_ttcossdd where ssdt like '20200608%'  and pp_flag ='I'

select * from pt_tt

	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, reserved2 from payphone.tb_ttcossdd where 1=1
	and SSDT between '20200601' and '20200624' and pp_flag ='H'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, reserved2
	FROM pt_ttcossdd_H@oraktlpt where 1=1
	and SSDT between '20200601' and '20200624'
	
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, reserved2
	FROM pt_ttcossdd_I@oraktlpt where 1=1
	and SSDT between '20200601' and '20200624'
	minus 
		select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, reserved2 from payphone.tb_ttcossdd where 1=1
	and SSDT between '20200601' and '20200624' and pp_flag ='I'
	;


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
		when remodt > '20200624235959' then ''
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
			yyyymm between substr('20200601000000', 1, 14) and substr('20200624235959', 1, 14)
			and UPDEPCD = NVL('H000', UPDEPCD)
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
				(save_dtm between '20200601000000' and '20200624235959')
				or (close_date >= '20200601000000'
				and save_dtm <= '20200601000000')) sa
		where
			(tc.remodt >= substr('20200601000000', 1, 8)
			or tc.remodt is null )
			and tc.TEL_NO like '%%%' || '%'
			and tc.UPDEPCD = NVL('H000', tc.UPDEPCD)
			and tc.DEPCD = NVL('H020', tc.DEPCD)
			and tc.KTDEPCD = NVL('', tc.KTDEPCD)
			and tc.AREA = NVL('', tc.AREA)
			and tc.AREAUSR = NVL('', tc.AREAUSR)
			and tc.unino = sa.unino(+)
			and tc.blddt <= TO_CHAR(LAST_DAY(TO_DATE(substr('20200601000000', 1, 8), 'YYYYMMDD')), 'YYYYMMDD'))
	group by
		updepcd, tel_no )
where
	TEL_NO like '%%%' || '%'
	and DEPCD = NVL('H020', DEPCD)
	and PHONEKND = NVL('', PHONEKND)
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
	KTDEPCD
-- delete from payphone.TB_TTCOSSDD where (ssdt,depcd,accdepcd,ktdepcd,telno) in (select ssdt,depcd , accdepcd, ktdepcd,replace(telno,'-','') as telno
 and ktdepcd ='K04000'
 

 -- 003205050644 003205050644
 
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
                  and log_dtm between '20200601' and '20200625'
             and amt_minus  >=   '100'::NUMERIC
 
             
             
             select substring( to_char(current_date-1,'YYYYMMDD'),1,6);
             
 delete from   payphone.tb_ttcossdd where (ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1) in          
 (select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1 from payphone.tb_ttcossdd where 1=1
	and SSDT between '20200601' and '20200624' and pp_flag ='H'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1
	FROM pt_ttcossdd_H@oraktlpt where 1=1
	and SSDT between '20200601' and '20200624')
	
	select * from pt_ttcossdd@oraktlpt tt where reserved2 is not null
	
	
select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1 from payphone.tb_ttcossdd where 1=1
	and SSDT between  substring( to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and to_char(current_date-1,'YYYYMMDD') and pp_flag ='H'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1
	FROM pt_ttcossdd_H@oraktlpt where 1=1
	and SSDT between  substring( to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and to_char(current_date-1,'YYYYMMDD')
	
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1 from payphone.tb_ttcossdd where 1=1
	and SSDT between  substring( to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and to_char(current_date-1,'YYYYMMDD') and pp_flag ='I'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1
	FROM pt_ttcossdd_I@oraktlpt where 1=1
	and SSDT between  substring( to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and to_char(current_date-1,'YYYYMMDD')
	
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1 from payphone.tb_ttcossdd where 1=1
	and SSDT between  substring(  to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and  to_char(current_date-1,'YYYYMMDD') and pp_flag ='G'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1
	FROM pt_ttcossdd_G@oraktlpt where 1=1
	and SSDT between  substring(  to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and  to_char(current_date-1,'YYYYMMDD')
	
	
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1 from payphone.tb_ttcossdd where 1=1
	and SSDT between  substring(  to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and  to_char(current_date-1,'YYYYMMDD') and pp_flag ='O'
	minus 
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1
	FROM pt_ttcossdd_O@oraktlpt where 1=1
	and SSDT between substring(  to_char(current_date-1,'YYYYMMDD'),1,6) || '01' and  to_char(current_date-1,'YYYYMMDD')
	
	

	INSERT INTO payphone.TB_TTCOSSDD
	(ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1,  PP_FLAG)
	
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, 'Q'
	FROM pt_ttcossdd_Q@oraktlpt where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD')  and to_char(current_date-1,'YYYYMMDD')
	minus 
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, pp_flag from payphone.tb_ttcossdd where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD') and to_char(current_date-1,'YYYYMMDD') and pp_flag ='Q'
	
	select * from pt_ttcossdd@oraktlpt tt where telno ='0033-0653-5287' and ssdt like '202006%'
	
	SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, reserved2, 'Q'
	FROM pt_ttcossdd_q@oraktlpt
	select * from tb_ttcossdd tt where ssdt like '20200619%'
	
	select * from payphone.biintmt b where depcd ='Q330'
	
	select * from  pt_ttcossdd@oraktlpt tt  where ssdt like '20200619%' and depcd ='Q330'
	
	-- 강릉 
	
	commit;
	
	
	
	select ktdepcd,ssdt,amount,lstdt from pt_ttcobalance@oraktlpt pt where ssdt like '20200619%' and depcd ='Q330'
	
	
	select depcd ,ktdepcd,ssdt,amount,lstdt from payphone.pt_ttcobalance pt where ssdt like '20200619%' and depcd ='Q330'
	
SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, 'I'
	FROM pt_ttcossdd_I@oraktlpt where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD')  and to_char(current_date-1,'YYYYMMDD')
	minus 
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, pp_flag from payphone.tb_ttcossdd where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD') and to_char(current_date-1,'YYYYMMDD') and pp_flag ='I';


SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, 'G'
	FROM pt_ttcossdd_G@oraktlpt where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD')  and to_char(current_date-1,'YYYYMMDD')
	minus 
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, pp_flag from payphone.tb_ttcossdd where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD') and to_char(current_date-1,'YYYYMMDD') and pp_flag ='G';


SELECT ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, replace(telno,'-',''), tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, 'O'
	FROM pt_ttcossdd_O@oraktlpt where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD')  and to_char(current_date-1,'YYYYMMDD')
	minus 
	select ssdt, newchk, depcd, boxno, "year", mon, "day", ktdepcd, telno, tel1, tel2, tel3
	, collectcnt, phongb, coin500, coin100, coin50, coin10, amount, bldplcno, unino
	, area, areausr, gubun, accdepcd, updepcd, ssplc, lstdt, lstusr, reserved1, pp_flag from payphone.tb_ttcossdd where 1=1
	and SSDT between  to_char(current_date-8,'YYYYMMDD') and to_char(current_date-1,'YYYYMMDD') and pp_flag ='O';


select * from user_source where text like '%tc_month_v%'
		
		

PROC_GETGUARD_CLDT

PROC_BATCH_GETCPMS_TCMONTHV

SELECT yyyymm, updepcd, tel_no, phoneknd, city_amt,
	otct_amt, word_amt, t114_amt, down_amt, amount,
	etc_amt, total_amt, area, areausr
	FROM tc_month_v@oracpms 
	where 1=1
	and substr(yyyymm,1,8) = '20200628';
	
select yyyymm from payphone.tc_month_v tmv 


		select * from pt_factmt pf where fact_telno ='003104272436'
		
		select
                                get_depnm(a.updepcd,2) upDepNm,
                                get_depnm(a.depcd,3) depNm,
                                get_ktdepcdnm(a.ktdepcd) ktDepNm,
                                a.remodt,
                                --get_area(a.depcd,a.uniind,a.area) areaNm,
                                --get_areausr(a.depcd,a.uniind,a.area) areaUsr,
                                a.fact_telno as Tel_No,
                                --get_phonegb_prnm(a.phoneknd) prNm,
                                --get_bldplcnm(a.bldplcno) bldPlcNm,
                                sum(b.city_amt) cityAmt,
                                sum(b.otct_amt) otctAmt,
                                sum(b.word_amt) wordAmt,
                                sum(b.t114_amt) t114Amt,
                                sum(b.down_amt) downAmt,
                                sum(b.amount) amount,
                                sum(b.etc_amt) etcAmt,
                                sum(b.total_amt) totalAmt
                                from  (select updepcd, depcd,ktdepcd,uniind, area, unino,fact_telno, phoneknd,bldplcno, remodt, accdepcd from pt_factmthist pf where sttdt <=  '20200601' and lstdt >= '20200601' and uniind ='1') a,
                                (
                                select b.updepcd,  b.tel_no, b.phoneknd, sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
                                    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
                                    sum(b.total_amt) total_amt
                                    from tc_month_v  b 
									where 1=1 
                                    and b.yyyymm between '20200601' and '20200629'
                                    group by b.updepcd,  b.tel_no, b.phoneknd
                                ) b ,
                                (select unino
                                  from tc_cpmssave 
                                where 1=1 and (save_dtm BETWEEN '20200629'||'000000' AND '20200629'||'235959')
                                        or
                                (close_date >=  '20200629'||'000000' AND save_dtm  <=  '20200629'||'000000')
                                )  c
                                where 1=1
                                and A.DEPCD ='H020'
                                and a.fact_telno = b.tel_no(+)
                                and a.unino = c.unino(+)                     
                                and (a.REMODT  >=  '20200601' or  a.REMODT is null or a.REMODT ='')
                                and total_amt  <=   '60'
                     group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd, a.remodt;
                    
                    select * from pt_factmt pf where fact_telno ='000220688796'
                     
                    select updepcd, depcd,ktdepcd,uniind, area, unino,fact_telno, phoneknd,bldplcno, remodt, accdepcd from pt_factmthist pf where sttdt <=  '20200601' and lstdt >= '20200601' and uniind ='1'
                    
                    select unino, fact_telno from pt_factmthist pf where sttdt <=  '20200601' and lstdt >= '20200601' and uniind ='1'
                    minus select unino, fact_telno  from payphone.pt_factmt pf2 where uniind ='1'
                    
                    select * from pt_factmt pf where uniind ='1'
                    

                    
select * from icis_rcv_hist@oraktlpt irh where be_svc_no in ('003102567205',
'004302310986',
'000203731395',
'005105544032',
'005105320146',
'006407842196',
'004106818037',
'006107250464',
'006107250465',
'005506420881',
'005506470166'
)

select * from pt_factmt pf where uniind ='3'

select * from rt_tel@oraguard rt where pn in ('000203731395',
'003107610970',
'000208981540',
'000208098211',
'000208098212',
'003109819826',
'003102567205',
'005105320146',
'005105544032',
'005506420881',
'005506470166',
'004106818037',
'004103551275',
'004103551296',
'004302310986',
'006107250464',
'006107250465',
'006407842196'
)

select * from pt_factmt@oraktlpt where tel1 ='0002' and tel2='0373' and tel3 ='1395'


select
	get_depnm(a.updepcd, 2) upDepNm,
	get_depnm(a.depcd, 3) depNm,
	get_ktdepcdnm(a.ktdepcd) ktDepNm,
	get_area(a.depcd, a.uniind, a.area) areaNm,
	get_areausr(a.depcd, a.uniind, a.area) areaUsr,
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
from
	pt_factmt a,
	(
	select
		tel_no, sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt, sum(b.word_amt) word_amt, sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt, sum(b.total_amt) total_amt
	from
		payphone.tc_month_v b
	where
		1 = 1
		and b.yyyymm between '20200601' and '20200629'
	group by
		tel_no ) b ,
	(
	select
		unino
	from
		payphone.tc_cpmssave
	where
		1 = 1
		and (save_dtm between '20200629' || '000000' and '20200629' || '235959')
		or (close_date >= '20200629' || '000000'
		and save_dtm <= '20200629' || '000000') ) c
where
	1 = 1
	and a.fact_telno = b.tel_no(+)
	and a.unino = c.unino(+)
	and ( a.REMODT >= '20200601'
	or a.REMODT is null
	or a.REMODT = '')
	and a.updepcd like 'G000' || '%'
	and a.depcd like 'G210' || '%'
	and total_amt <= '100'::numeric
group by
	a.updepcd,
	a.depcd,
	a.ktdepcd,
	a.fact_telno ,
	a.phoneknd,
	a.bldplcno,
	a.uniind,
	a.area,
	a.accdepcd
	
	select * from fi_asset fa 
	
	select
	fa.cd_asset as cdAsset ,
	fa.nm_asset as nmAsset ,
	fa.depcd as depCd ,
	payphone.get_depnm(fa.depcd, '3') as depNm ,
	fa.nm_size as nmSize ,
	fa.nm_model as nmModel ,
	fa.nm_note as nmNote ,
	dt_pur as dtPur ,
	substring(dt_pur, 1, 4) as year
from
	payphone.fi_asset fa
where
	1 = 1
	and fa.cd_company = '1000'
	and fa.tp_asset = '27120'
	and coalesce(fa.nm_note, '미사용') in ('미사용', '미설치')
	and fa.depcd = 'I030'
order by
	substring(fa.dt_pur, 1, 4),
	fa.cd_asset
	
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
left outer join payphone.fi_asset aa on aa.cd_asset=fas.cd_asset
where 1=1
and fdb.st_asset not in ('4','5')
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
and aa.cd_asset is null

select * from user_source where text like '%refep_fi_asset%'

PROC_GETERP_FI_ASSET

PROC_CHANGE_PT_FACTMT

PROC_ERPUPDATE_FI_ASSET

PROC_AUTOTERMINATE_FACTMT

update payphone.fi_asset a set a.depcd = b.depcd
from
(

select cd_asset, cd_mngdept,(select depCD from payphone.biintmt where org_cd = cd_mngdept) DEPCD from payphone.fi_asset

select org_cd,depcd,depnm from payphone.biintmt b where useflag ='Y' and deptreecnt  in (1,2,3,4)

minus
select cd_asset,DEPCD from payphone.fi_asset

) b

where a.cd_asset = b.cd_asset;

PROC_ERPUPDATE_FI_ASSET

PROC_GETERP_FI_ASSET


refep_fi_dpbase

select * from 'neoe.fi_asset'

SELECT * FROM FI_BIZCAR@oraerp;

SELECT * FROM FI_BIZCAR_V@oraerp;

select * from fi_asset@tds_erp


 --  QUERY PLAN                                                                        
----------------------------------------------------------------------------------------------------------------------------------------------------------
 Update on public.emp  (cost=100.00..300.71 rows=669 width=118)
   Remote SQL: UPDATE public.emp SET sal = $2 WHERE ctid = $1
   ->  Nested Loop  (cost=100.00..300.71 rows=669 width=118)
         Output: emp.empno, emp.ename, emp.job, emp.mgr, emp.hiredate, (emp.sal * '1.1'::double precision), emp.comm, emp.deptno, emp.ctid, salgrade.ctid
         Join Filter: ((emp.sal > (salgrade.losal)::double precision) AND (emp.sal < (salgrade.hisal)::double precision)) ->  Foreign Scan on public.emp  (cost=100.00..128.06 rows=602 width=112)
               Output: emp.empno, emp.ename, emp.job, emp.mgr, emp.hiredate, emp.sal, emp.comm, emp.deptno, emp.ctid
               Remote SQL: SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, ctid FROM public.emp FOR UPDATE
         ->  Materialize  (cost=0.00..35.55 rows=10 width=14)
               Output: salgrade.ctid, salgrade.losal, salgrade.hisal
               ->  Seq Scan on public.salgrade  (cost=0.00..35.50 rows=10 width=14)
                     Output: salgrade.ctid, salgrade.losal, salgrade.hisal
                     Filter: (salgrade.grade = 3)

select * from FI_BIZCAR@oraerp


select * from FI_BIZTRIP@oraerp

SELECT cd_bizcar 차량코드,DT_USE 사용일자, CD_MNGDEPT 사용부서, NO_MNGEMP 사번, NUM_MILEACC 주행거리, NUM_ENDACC 총주행거리 FROM FI_BIZTRIP@oraerp; 

 -- create foreign table datawrap_test2 (id int, name varchar(50)) server oracle options (schema 'SYSTEM', table 'DATAWRAP');
/*create foreign table fi_bizcar (CD_COMPANY varchar(7),cd_pc varchar(7), cd_bizcar varchar(20),NM_BIZCAR varchar(40), 
NM_BIZNO varchar(40),
NM_MODEL varchar(40),
CD_MNGDEPT varchar(12),
NO_MNGEMP varchar(10),
CD_FIXACCT varchar(10),
CD_ASSET varchar(20),
NM_ASSET varchar(40),
DT_PUR varchar(8),
AM_PUR number,
TP_RENT varchar(1),
YN_INSUR varchar(1),
YN_USE varchar(1),
DTS_INSERT varchar(14),
ID_INSERT varchar(15),
DTS_UPDATE varchar(14),
ID_UPDATE varchar(15),
TP_BIZ varchar(4),
NM_NOTE varchar(500),
DT_DUE  varchar(8))
server oraerp
options (table 'fi_bizcar')*/

SELECT cd_bizcar 차량코드,DT_USE 사용일자, CD_MNGDEPT 사용부서, NO_MNGEMP 사번, NUM_MILEACC 주행거리, NUM_ENDACC 총주행거리 FROM FI_BIZTRIP; 

select * from payphone.fi_biztrip;


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


create foreign table fi_biztrip_temp (
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
options (table 'fi_biztrip_temp')


--create foreign table datawrap_test2 (id int, name varchar(50)) server oracle options (schema 'SYSTEM', table 'DATAWRAP');

create foreign table fi_bizcar_temp (CD_COMPANY varchar(7),cd_pc varchar(7), cd_bizcar varchar(20),NM_BIZCAR varchar(40), 
NM_BIZNO varchar(40),
NM_MODEL varchar(40),
CD_MNGDEPT varchar(12),
NO_MNGEMP varchar(10),
CD_FIXACCT varchar(10),
CD_ASSET varchar(20),
NM_ASSET varchar(40),
DT_PUR varchar(8),
AM_PUR number,
TP_RENT varchar(1),
YN_INSUR varchar(1),
YN_USE varchar(1),
DTS_INSERT varchar(14),
ID_INSERT varchar(15),
DTS_UPDATE varchar(14),
ID_UPDATE varchar(15),
TP_BIZ varchar(4),
NM_NOTE varchar(500),
DT_DUE  varchar(8))
server oraerp
options (table 'fi_bizcar_temp')

select * from payphone.pt_areamt pa where 

SELECT cd_bizcar 차량코드,nm_bizcar 차량명칭, nm_bizno 차량번호, nm_model 모델명, (select depCD from payphone.biintmt where org_cd = cd_mngdept) 관리부서, no_MNGEMP 관리자, DT_PUr 도입일자, AM_PUR 도입금액,DT_DUE 만료일자,yn_insur 보험가입유무,yn_use 사용유무,id_update 마지막업데이트시간,id_update 마지막작업자, dts_insert 입력시간,id_insert 입력자  
FROM FI_BIZCAR; 

SELECT cd_bizcar 차량코드,DT_USE 사용일자, CD_MNGDEPT 사용부서, NO_MNGEMP 사번, NUM_MILEACC 주행거리, NUM_ENDACC 총주행거리 FROM FI_BIZTRIP; 

SELECT cd_bizcar 차량코드,nm_bizcar 차량명, nm_bizno 차량번호, nm_model 차종, cd_mngdept 관리부서, no_MNGEMP 관리자, DT_PUr 취득일자, AM_PUR 취득금액,DT_DUE 만기일자,tp_rent,yn_insur 보험가입유무,yn_use 사용유무,id_update 마지막업데이트시간,id_update 마지막작업자, dts_insert 입력시간,id_insert 입력자  
FROM FI_BIZCAR; 

select * from payphone.bimastercf b where usrcd ='admi2'

create foreign table foreign_test (test varchar(10), use varchar(1))
server oraerp
options (table 'foreign_test')

insert into payphone.foreign_test values ('1','1');

commit;

rt_Tel

select * from payphone.foreign_test;

select * from 
NEOE.FI_BIZCAR@tds_fdw

insert into payphone.pt_factmt  (unino,updepcd ,depcd,uniind,fact_telno,accdepcd,ktdepcd ,area, status,factgb, blddt ,lstdt, lstusr,custtradnm,usegb,fact_knd ) 
values (nextval('payphone.seq_pt_factmt'),'Q000','Q030','3','004103551296','Q030','Q06010','31','1','1','20200630',to_char(now(), 'YYYYMMDDhh24miss'),'99999', '주식회사 케이티','0','1' )

select * from biintmt b where depnm like '충남%'

select * from bitelmt b where depnm  like '당진%'

select * from payphone.pt_areamt pa where depcd ='Q030' and uniind ='3'

select can_flag from icis_rcv_hist irh where be_svc_no ='004107512142'

update payphone.pt_factmt a set 
a.updepcd = b.updepcd 
from  rt_tel@oraguard b 
where 

select  updepcd ,depcd1, '3', pn, ktdepcd, depcd2, coalesce ((SELECT area FROM   payphone.PT_AREAMT	WHERE  DEPCD = depcd1 
		AND    UNIIND = '3'
		AND    areausr =id
		and	   area_use = 'Y'),'01'),'1', '1', '20200630',to_char(now(), 'YYYYMMDDhh24miss') ,'99999','주식회사 케이티','0','1'  from rt_tel@oraguard where pn in ('003102567205',
										'004302310986',
										'000203731395',
										'005105544032',
										'005105320146',
										'006407842196',
										'004106818037',
										'006107250464',
										'006107250465',
										'005506420881',
										'005506470166',
										'003109819826'
										) 

										
										
										select * from payphone.pt_factmt pf where uniind ='3'
										
										select * from payphone.bimastercf b where usrcd ='99999'
										
/*
insert into payphone.pt_factmt 
            ( unino     , depcd      , uniind      , fact_telno      
            , ktdepcd         
            , upktdepcd       
            , accdepcd        
            , updepcd         
            , area            
            , status          
            , bldplcno        
            , exmhod          
            , factgb          
            , phonemgrno      
            , phoneknd        
            , boounino        
            , booserno        
            , phgb            
            , bldknd          
            , lstusr          
            , recvind         
            , blddt           
            , lstdt           
            , custzip       
            , custadr1     
            , custadr2     
            , custcall     
            , custtradnm   
            , gdgb         
            , gdcd         
            , pausedt      
            , pausersn     
            , intcallind   
            , subspt_content
            , sbtdt        
            , bldhdt       
            , usegb       
            , army_nm
            , fact_knd
            ) values          
            ( 
            nextval('payphone.seq_pt_factmt')
            , 'H060'               
            , '3'              
            , '003106551205'           
            , 'K14000'             
            , 'K14000'           
            , 'H060'            
            , 'H000'             
            , '01'                
            , '1'              
            , NULL            
            , NULL              
            , '1'                    
            , NULL          
            , '15'            
            , 0            
            , 1            
            , NULL                
            , '02'              
            , '99999'              
            , NULL             
            , '20200629'               
            , to_char(now(), 'YYYYMMDDhh24miss')               
            , NULL         
            , NULL
            , NULL
            , NULL
            , '주식회사 케이티'
            , NULL
            , NULL
            , NULL
            , NULL
            , NULL
            , NULL
            , NULL
            , NULL
            , '0'
            , NULL
            , '1'
            )
            */

            select  unino           
            , depcd           
            , uniind          
            , fact_telno      
            , ktdepcd         
            , upktdepcd       
            , accdepcd        
            , updepcd         
            , area            
            , status          
            , bldplcno        
            , exmhod          
            , factgb          
            , phonemgrno      
            , phoneknd        
            , boounino        
            , booserno        
            , phgb            
            , bldknd          
            , lstusr          
            , recvind         
            , blddt           
            , lstdt           
            , custzip       
            , custadr1     
            , custadr2     
            , custcall     
            , custtradnm   
            , gdgb         
            , gdcd         
            , pausedt      
            , pausersn     
            , intcallind   
            , subspt_content
            , sbtdt        
            , bldhdt       
            , usegb       
            , army_nm
            , fact_knd from pt_factmt pf 
            
            
            
select * from bimastercf b where usrname  ='이용직'

select * from user_source where text like '%bimastercf%'

PROC_GETHR_BIMASTERCF

/*PROC_GETHR_BIMASTERCF*/

SELECT usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	FROM payphone.vw_mergehr_bimastercf

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
UNION all

select * from biintmt b where depcd ='Q005'

 SELECT vw_payphone_bimastercf.usrcd,
    vw_payphone_bimastercf.usrname,
    vw_payphone_bimastercf.depcd,
    vw_payphone_bimastercf.dephighcd,
    vw_payphone_bimastercf.bsnind,
    vw_payphone_bimastercf.gubun,
    to_char(sysdate, 'yyyymmddhh24miss'::character varying) AS lstdt,
    replace(vw_payphone_bimastercf.hp_no::text, '-'::text, ''::text) AS hp_no
   FROM vw_payphone_bimastercf @ orahr(usrcd character varying(10), usrname character varying(40), depcd character varying(50), dephighcd character varying(50), bsnind character(1), gubun numeric, lstdt character varying(14), hp_no character varying(4000))
  where depcd like '%Q005%';
	
 
 select * from biintmt b where depcd like '%000%' and deptreecnt in(1,2,3,4)
 
 select * from biintmt where depnm like '%%'
 
 select * from tb_smartpush ts where ((substring(senddt, 9, 6 ) < '090000') or (substring(senddt, 9, 6 ) > '180000')) 
 
 
 select pf.unino         as uniNo            
             , pf.depcd         as depCd            
             , pf.uniind        as uniind           
             , pf.fact_telno    as factTelNo        
             , substring(pf.fact_telno, 1,4) as svcNo1
             , substring(pf.fact_telno, 5,4) as svcNo2
             , substring(pf.fact_telno, 9,4) as svcNo3
             , pf.ktdepcd as ktDepCd       
             , pf.upktdepcd     as upKtDepCd        
             , pf.accdepcd      as accDepCd         
             , pf.updepcd       as depHighCd        
             , coalesce(pf.area, '')          as area             
             , coalesce(pf.status, '')        as status           
             , pf.bldplcno      as bldPlcNo         
             , coalesce(pf.exmhod, '')        as exMhod           
             , pf.factgb        as factGb           
             , pf.phonemgrno    as phoneMgrNo       
             , pf.phonemgrno    as bfAsset       
             , pf.phoneknd      as phoneKnd         
             , pf.boounino      as booUniNo         
             , pf.booserno      as booSerNo         
             , coalesce(pf.phgb, '')          as phGb             
             , coalesce(pf.bldknd, '')        as bldKnd           
             , pf.lstusr        as lstUsr           
             , coalesce(pf.recvind, '')       as recvInd          
             , pf.blddt         as bldDt            
             , pf.lstdt         as lstDt            
             , coalesce(pf.remorsn, '') as remoRsn  
             , coalesce(pf.remodt, '')  as remoDt   
             , pf.custzip       as custZip      
             , pf.custadr1      as custAdr1     
             , pf.custadr2      as custAdr2     
             , pf.custcall      as custCall     
             , case
                when (pf.custtradnm is null or pf.custtradnm = '') 
 and (irh.be_addr_ref is not null
 and irh.be_addr_ref != '') then irh.be_addr_ref
                when (pf.custtradnm is null or pf.custtradnm = '') 
 and (irh.be_addr_ref is  null or irh.be_addr_ref = '') then irh.be_cust_name
               else pf.custtradnm end as custTradNm 
             , pf.gdgb          as gdGb         
             , pf.gdcd          as gdCd         
             , payphone.get_gdbasmst_gdnm('1', pf.gdcd) as gdNm
             , pf.pausedt       as pauseDt      
             , pf.pausersn      as pauseRsn     
             , coalesce(pf.intcallind, '')    as intCallInd   
             , pf.subspt_content as subSptContent   
             , pf.sbtdt         as sbtDt        
             , case
                when irh.endResvDate is null or irh.endResvDate = ''
                then irh.strResvDate else irh.endResvDate
               end        as bldHDt 
             , coalesce(pf.usegb, '')         as useGb        
             , pf.army_nm       as armyNm
             , irh.phoneknd     as terminalCd
             , irh.can_flag     as canFlag
             , irh.tid
             , irh.act_code     as actCode
             , irh.proc_gubun   as procGubun         
 from payphone.pt_factmt pf
             , 
 (select be_svc_no1||be_svc_no2||be_svc_no3 as tel
                     , be_svc_no1
                     , be_svc_no2
                     , be_svc_no3
                     , ktDepCd
                     , rcver_emp_name
                     , be_addr
                     , be_addr_no
                     , be_addr_ho
                     , phoneknd
                     , can_flag
                     , tid
                     , act_code
                     , proc_gubun
                     , substring(end_completed_resv_date_hh, 1, 8) as endResvDate
                     , substring(str_completed_resv_date_hh, 1, 8) as strResvDate
                     , be_cust_name
                     , be_addr_ref
 from payphone.icis_rcv_hist
 where 1=1
 and tid = '20003HX04172391'
 and can_flag = '0'
              ) irh
 where 1=1
 and pf.fact_telno = irh.tel
 and pf.fact_telno = '006305356403'
 and pf.uniind = '3' 
 and pf.status   <>   '2'
                 
                select * from icis_rcv_hist irh where tid ='20003HX04172391'
                  
                  
                  select * from payphone.pt_factmthist pf where fact_telno ='005107245733'
                  
                  
                  
                 
        
          
         
          
         
        select
	pf.unino as uniNo ,
	pf.depcd as depCd ,
	pf.uniind as uniind ,
	pf.fact_telno as factTelNo ,
	substring(pf.fact_telno, 1, 4) as svcNo1 ,
	substring(pf.fact_telno, 5, 4) as svcNo2 ,
	substring(pf.fact_telno, 9, 4) as svcNo3 ,
	pf.ktdepcd as ktDepCd ,
	pf.upktdepcd as upKtDepCd ,
	pf.accdepcd as accDepCd ,
	pf.updepcd as depHighCd ,
	coalesce(pf.area, '') as area ,
	coalesce(pf.status, '') as status ,
	pf.bldplcno as bldPlcNo ,
	coalesce(pf.exmhod, '') as exMhod ,
	pf.factgb as factGb ,
	pf.phonemgrno as phoneMgrNo ,
	pf.phonemgrno as bfAsset ,
	pf.phoneknd as phoneKnd ,
	pf.boounino as booUniNo ,
	pf.booserno as booSerNo ,
	coalesce(pf.phgb, '') as phGb ,
	coalesce(pf.bldknd, '') as bldKnd ,
	pf.lstusr as lstUsr ,
	coalesce(pf.recvind, '') as recvInd ,
	pf.blddt as bldDt ,
	pf.lstdt as lstDt ,
	coalesce(pf.remorsn, '') as remoRsn ,
	coalesce(pf.remodt, '') as remoDt ,
	pf.custzip as custZip ,
	pf.custadr1 as custAdr1 ,
	pf.custadr2 as custAdr2 ,
	pf.custcall as custCall ,
	case
		when (pf.custtradnm is null
		or pf.custtradnm = '')
		and (irh.be_addr_ref is not null
		and irh.be_addr_ref != '') then irh.be_addr_ref
		when (pf.custtradnm is null
		or pf.custtradnm = '')
		and (irh.be_addr_ref is null
		or irh.be_addr_ref = '') then irh.be_cust_name
		else pf.custtradnm
	end as custTradNm ,
	pf.gdgb as gdGb ,
	pf.gdcd as gdCd ,
	payphone.get_gdbasmst_gdnm('1', pf.gdcd) as gdNm ,
	pf.pausedt as pauseDt ,
	pf.pausersn as pauseRsn ,
	coalesce(pf.intcallind, '') as intCallInd ,
	pf.subspt_content as subSptContent ,
	pf.sbtdt as sbtDt ,
	case
		when irh.endResvDate is null
		or irh.endResvDate = '' then irh.strResvDate
		else irh.endResvDate
	end as bldHDt ,
	coalesce(pf.usegb, '') as useGb ,
	pf.army_nm as armyNm ,
	irh.phoneknd as terminalCd ,
	irh.can_flag as canFlag ,
	irh.tid ,
	irh.act_code as actCode ,
	irh.proc_gubun as procGubun
from
	payphone.pt_factmt pf ,
	(
	select
		be_svc_no1 || be_svc_no2 || be_svc_no3 as tel , be_svc_no1 , be_svc_no2 , be_svc_no3 , ktDepCd , rcver_emp_name , be_addr , be_addr_no , be_addr_ho , phoneknd , can_flag , tid , act_code , proc_gubun , substring(end_completed_resv_date_hh, 1, 8) as endResvDate , substring(str_completed_resv_date_hh, 1, 8) as strResvDate , be_cust_name , be_addr_ref
	from
		payphone.icis_rcv_hist
	where
		1 = 1
		and tid = '19087EU02392791'
		and can_flag = '0' ) irh
where
	1 = 1
	and pf.fact_telno = irh.tel
	and pf.fact_telno = '000209631541'
	and pf.uniind = '3'
	and pf.status <> '2'
         
          
          
         select * from payphone.pt_factmt pf where fact_telno ='006107260997'
         
         select coalesce(b.dephighcd, '') as depHighCd
             , coalesce(b.depcd, '') as depCd
             , b.new_ktdepcd as ktDepCd
             , a.rcver_emp_name as empName
             , a.be_addr||' '||be_addr_no||'-'||be_addr_ho as addr
             , a.be_svc_no1 as svcNo1
             , a.be_svc_no2 as svcNo2
             , a.be_svc_no3 as svcNo3
             , a.phoneknd as terminalCd
             , a.can_flag as canFlag
             , a.tid
             , a.act_code as actCode
             , a.be_cust_name as custTradNm
             , coalesce(a.switch_cd, '') as switchCd        
             , coalesce(a.exmhod, '') as exMhod             
             , uniind
             , a.proc_gubun as procGubun
             , a.be_addr_ref as addrRef
             , substring(rcv_date, 1, 8) as sbtDt        
             , case when end_completed_resv_date_hh = '' or end_completed_resv_date_hh is null 
                    then substring(str_completed_resv_date_hh, 1, 8) else substring(end_completed_resv_date_hh, 1, 8) 
               end as bldHDt 
             , '1' as status
          from
            payphone.icis_rcv_hist a
            , (
            select az.depnm as depnm
                 , bz.dephighcd as dephighcd
                 , bz.depcd as depcd
                 , az.ktdepcd as new_ktdepcd
                 , az.dsktcd2 as dsktcd
 from payphone.bitelmt az, payPhone.biintmt bz
 where az.depcd = bz.depcd
 and bz.deptreecnt = '3'
            ) b 
 where a.ktdepcd = b.dsktcd(+)
 and tid = '18354HO03853191'
 and can_flag = '0'
 
 
     select *
          from payphone.pt_factmt
         where status <> '2'
           and fact_telno = '005107245733'
         limit 1
          
         
         select * from payphone.icis_rcv_hist irh where be_svc_no ='005107245733';
         
       select * from payphone.tb_repair tr where gojang_tel  =  '005507599154';
       
       --626
       
        select * from payphone.tb_repair tr where rev_date like '20200626%'; -- and gojang_tel ='005507599154';
        
        select * from payphone.tb_maintain tm where jungtel ='005507599154';
        
       select telno
		       , telGb
		       , gojangDes
		       , bldaddr
		       , revCd
		       , rev_seq
		       , faultrep_dtm
		       , unino
		       , bldplcno
		       , bldgps
		       , gps_y
		       , gps_x
		       , tel_gb
		       , tel_desc
		       , rn
		       , cnt1
		  from (
		       select a.jungtel as telno
		              , d.tel_gb as telGb
		              , decode(d.gojang_des,null,d.gojang_des,'[고장]'||d.gojang_des|| ' ' )|| '[정비]'||a.jungdes  as gojangDes 
		              , c.bldplcnm bldaddr
		              , d.rev_cd as revCd
		              , nvl(d.rev_seq, 0) rev_seq
		              , nvl(d.rev_date|| d.rev_time, a.jungdt) as faultrep_dtm
		              , b.unino
		              , b.bldplcno
		              , c.gpsx as bldgps
		              , c.gpsy as gps_y
		              , c.gpsx as gps_x
		              , d.tel_gb
		              , decode(b.uniind, '1', (select prnm from bibsici t where t.lcd = '0242' and t.scd = b.phoneknd), '2', b.gdcd, '3', '1541') as tel_desc
		              , row_number() over (order by nvl(d.rev_date|| d.rev_time, a.jungdt)) as rn
		              , (select count(1) cnt from tb_maintain t where 1=1 and t.jungtel = a.jungtel and t.jung_entr_yn = 'Y') cnt1
		         from payphone.tb_maintain a
		              , payphone.pt_factmt b
		              , payphone.pt_bldplc c
		              , payphone.tb_repair d
		        where 1=1
		          and a.jungtel = b.fact_telno
		          and b.bldplcno = c.bldplcno(+)
		          and a.rev_seq = d.rev_seq(+)
		          and a.updepcd = 'I000'
		          and a.depcd = 'I080'
		          and a.jungty = 'Q'
		          and b.fact_knd = '1'
		          and (d.wanro_flag = '0' or d.wanro_flag is null)
		       		)
				 where 1=1
				   and cnt1 = 0
				 order by rn
				 limit 50::numeric
				offset (1::numeric-1) * 50::numeric
				
				t003204421035
				
				select * from fi_asset fa where cd_asset  like 'T003204421035%'
				
				00883 jdh00883!
				
				select * from payphone.pt_factmt pf  where fact_telno ='admi2	'
				
				select * from payphone.pt_factmt pf  where fact_telno ='005103355395'
				
				
			insert
	into
	payphone.tc_cpmssave ( updepcd, depcd, accdepcd, save_dtm, unino, gb, scd, "desc", close_date, lstusr, lstdt )
values ( 'I000', 'I040', 'I040', '20200702000000', '57518', '1', '120002', '전기단선', '20200710000000', '99999', to_char(now(), 'YYYYMMDDhh24miss') )

select * from payphone.tc_cpmssave tc where unino ='57518'

select "area" from payphone.pt_areamt pa 


select "desc" from payphone.tc_cpmssave tc 

select prnm from payphone.bibsici b where 1=1 and lcd ='1200' and scd ='03'

alter table payphone.tc_cpmssave alter column unino type numeric;

select * from tb_smartotp ts where telno ='01026425400';

select * from tb_user_password tup where usrcd ='02577';

select * from fi_asset fa where cd_asset like 'B00000%';

select nm_size from fi_asset fa where cd_asset like 'B%' and tp_asset = '27120' group by nm_size;

select * from payphone.pt_factmt pf where lstdt ='20200630103020';

select * from t_acc_ks;

select fact_telno from payphone.pt_factmt pf where phoneknd ='061'

SELECT REV_DATE FROM t_acc_ks@ora;



select * from fi_biztrip fb

select * from payphone.pt_factmt pf  where fact_telno  ='000205810478';

select fb.cd_bizcar, fb.nm_bizcar,fb.nm_bizno, fb.nm_model, fb.yn_use,fb.no_mngemp, fb2.dt_use, num_startacc, num_endacc, num_mileacc
from fi_bizcar fb , (select cd_bizcar,substring(dt_use , 1, 6) as dt_use, min(num_startacc) as num_startacc, max(num_endacc) as num_endacc, sum(num_mileacc)  as num_mileacc
from fi_biztrip fb  group by cd_bizcar, dt_use) fb2 where fb.cd_bizcar =fb2.cd_bizcar(+) 


create foreign table FI_BIZCARAMT
('CD_BIZCAR' varcher(40),
'YYYYMM' varcher(6),
'NUM_MILEACC' numeric,
'NUM_ENDACC' numeric,
'RENT_AMT' numeric,
'OIL_AMT' numeric,
'ADD_AMT' numeric,
'INS_AMT' numeric,
'ETC_AMT' numeric)
server oraerp
options (table 'FI_BIZCARAMT')

SELECT * FROM FI_BIZCARAMT@oraerp where yyyymm ='202004'; 

select  PROC_INS_FI_BIZCARAMT('202004');

select dblink_exec('oraerp','begin PROC_INS_FI_BIZCARAMT(''202004''); end;');

PROC_INS_FI_BIZCARAMT;


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
	                 AND FA.FACT_TELNO =  '003109815437'   -- 전화번호 (콤보 선택시) 
	              ) B
	        WHERE 1=1
 	       ) C
	 WHERE 1=1 
	 ORDER BY UNIIND, RN
	 LIMIT '50'::NUMERIC
	OFFSET ('1'::NUMERIC-1) * '50'::numeric
	
	select * from pt_bldplc pb where bldplcno ='2013050103'
	
 select * from payphone.pt_bldplc pb where bldplcnm  like '%수정마을%';
 

   SELECT DISTINCT CASE 
	              			WHEN SUBSTRING(TELNO, 1, 2) = '02' THEN '0002' || DECODE(LENGTH(TELNO), 9, '0' || SUBSTRING(TELNO, 3), 10, SUBSTRING(TELNO, 3), SUBSTRING(TELNO, 3))
	                        ELSE '0' || SUBSTRING(TELNO, 1, 3) || DECODE(LENGTH(TELNO), 10, '0' || SUBSTRING(TELNO, 4), 11, SUBSTRING(TELNO, 4), SUBSTRING(TELNO, 4))
	                     END TELNO -- 전화번호
	                     , REV_DATE
	                FROM T_CLEARING@ORAGUARD A
	               WHERE 1=1
	                 AND REV_DATE >= TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '000000'
	                 AND REV_DATE <= TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '235959'
	                 
	                 select * from t_clearing@ORAGUARD where TELNO ='0319815437';
	                 
	                
	                 select * from t_clearing@ORAGUARD where TELNO ='0319815437';
	             	
	                 
	                select * from payphone.bimastercf b where usrname like '안경주';
	                
	               
	               
	SELECT *
	FROM vw_mergehr_bimastercf@orahr;
	
select * from payphone.biintmt b  where dephighcd  ='1000' and useflag ='Y';

	select * from payphone.bimastercf b   where usrname like '%관리자%';

	

	select 
            nvl(depcd , ' ') as depCd
            ,nvl(depnm , ' ') as depNm
 from payphone.biintmt
 where deptreecnt in ('1','2')
 and useflag = 'Y'
 and substr(depcd, 2, 5) = '000'
 and depcd not in ('K000')
        order by depcd, depnm

:select nvl(lcd,' ') as lcd   
            , nvl(scd,' ') as scd   
            , nvl(prnm, ' ') as prnm  
 from payphone.bibsici     
 where 1=1
 and lcd = '1110'
                    order by scd, prnm asc

                    
                    select * from payphone.biintmt b where dephighcd ='H000'
                    
                    
                    
                    select * from payphone.icis_rcv_hist irh where uniind ='3' and wo_type ='B5' and  be_svc_no ='005403711541'
                    
                    -- 
                    
                    