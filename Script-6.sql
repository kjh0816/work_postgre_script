
-- db 세션조회
select * from pg_stat_activity

select * from tb_ttcossdd tt 
where telno ='000226623718'

select * from tb_ttcpmsdd tt where telno ='000226623718' and cpmsdt  like '202009%';

select 43160 - 21730


select * from pt_ttcobalance pt where ssdt like '20200908%' and depcd ='H040'

select * from payphone.fi_asset fa 


select * from fi_asset@oraerp where cd_asset ='A20200700003';


      select fa.cd_asset as cdAsset
      
      
      select * from pt_gis_etc;
     
     
 select * from 
             , fa.nm_asset as nmAsset
             , fa.depcd as depCd
             , payphone.get_depnm(fa.depcd, '3') as depNm
             , fa.nm_size as nmSize
             , fa.nm_model as nmModel
             , fa.nm_note as nmNote
             , dt_pur as dtPur
             , substring(dt_pur, 1, 4) as year
          from payphone.fi_asset fa
         where 1=1
           and fa.cd_company = '1000'   
                and fa.tp_asset = '27110'
                and (coalesce(fa.nm_model,'미사용') in ('미사용','미설치') or coalesce(fa.nm_note,'미사용') in ('미사용','미설치'))
                
                select * from 
           
                
                select count(1) from payphone.fi_bizcaramt_mng fbm where cd_bizcar ='영남_진주_83도2027' and yyyymm ='202005'
                
                
                select * from payphone.tb_maintain tm where  jungdt like '20200922%' and jungtel ='006106821781'
 
                select * from t_jubsu@oracpms where gojang_tel ='0616821781' and rev_date like '202009%';

               select * from tb_smartpush ts where 
               
               
               -- 대무자 - 
               
               select * from tb_maintain tm where 
               
               -- ktl02575! 02575
               
               
               
               select * from sms_msg@oraguard where msg like '%여수종화%';
              -- 01026231759
              -- 010-2623-1759
              
              select * from t_jubsu
              
               select * from payphone.bimastercf b where hp_no ='01026231759'
               
               
               select * from payphone.tb_repair tr where 
               
              select jumgumja_id from payphone.tb_repair tr where gojang_tel ='006106419231' and rev_date ='20200922'
              
              select * from payphone.
              
               	
              proc_getcpms_tc_cpmsmt
              
              select * from user_source where text like '%t_jubsu@oracpms%';
              
             PROC_GETCPMS_T_JUBSU
             
             PROC_GETGUARD_T_JUBSU_TEMP
             
             PROC_GETGUARD_T_JUBSU
             
             PROC_CHANGE_PT_FACTMT
             
              select payphone.proc_change_pt_factmt();
             
             select payphone.proc_fi_asset_update();
            
                 insert into fi_asset_T@oraerp (cd_asset, nm_model,nm_note)    
     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
             
    select 
    
            --  error diagnosed by Net8 when connecting to an agent
    		-- org.jkiss.dbeaver.model.sql.DBSQLException: SQL Error [25000]: ERROR: OCI error: ORA-28545: error diagnosed by Net8 when connecting to an agent
			-- Unable to retrieve text of NETWORK/NCR message 65535
			-- ORA-02063: preceding 2 lines from KTLERP
         
    select * from biintmt b where depcd ='Q310';
    
   select * from payphone.pt_areamt_h pah  where 1=1 and depcd ='G230' and opdt like '20200929%' and uniind ='1' order by opdt ;
  
   select count(1) from
    	payphone.pt_areamt
    	where 1=1 
    	and depcd ='G230'
    	and area = '13'
    	and uniind = '1'
    	and  area_use = 'N'
  
  select * from payphone.bimastercf b where usrcd ='01314';
   
             select * from fi_asset fa ;
             
             proc_fi_asset_update
             
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
					   ,(select prnm from payphone.BIBSICI where lcd = '2053' and scd = rev_cd) as revNm --접수분류
						, b.unino
						, b.bldplcno
						, c.gpsx as BLDGPS
						, gpsy as gps_y
						, gpsx as gps_x
						, a.TEL_GB -- 전화기종코드
		 				, a.TEL_DESC  -- 전화기종
		 				, (select count(1) cnt from payphone.tb_maintain m where m.rev_seq = a.rev_seq) req_cnt -- 정비의뢰 건수
					  from payphone.tb_repair a, payphone.PT_FACTMT b
					 left outer join payphone.pt_bldplc c on b.bldplcno = c.bldplcno
					 where 1=1
					 and a.gojang_tel = b.fact_telno
                   --  and b.bldplcno = c.bldplcno
                     and a.updepcd  = #{dephighcd}        
                     and a.depcd1    = #{depcd} 
					 and a.jumgumja_id = #{usrcd}
					 and b.fact_knd = '1'
					-- and c.ft_use = '1'
					 
					 
					 
					 
					 CREATE OR REPLACE PROCEDURE payphone.proc_fi_asset_update()
 SECURITY DEFINER
AS $procedure$
DECLARE
 /*==============================================================================
 -- Source :pt_factmt, pt_bldplc, pt_boothmt 
 -- Target : fi_asset
 -- Date : 2020.09.18
 -- Desc : erp 설치장소 정합
 ==============================================================================*/
pg record;
retrow int;
 workday text;
begin
 select to_char(current_date,'YYYYMMDD') into workday;

for pg in (select cd_asset ,nm_note from 
(select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
)
minus
select cd_asset ,nm_note from fi_asset) loop
update fi_asset set nm_note  = pg.nm_note
where cd_asset  = pg.cd_asset;
end loop;

 GET DIAGNOSTICS retrow := ROW_COUNT;
 call payphone.proc_payphone_tb_joblog('payphone.proc_fi_asset_update()','1','payphone.pt_factmt','payphone.fi_asset', workday, workday, retrow);
 
-- RETURN retrow;
END;

$procedure$
 LANGUAGE plpgsql
;



proc_getcpms_pt_ttcpmsdd_day


select
		    get_depnm( substr( a.depcd, 1, 1 )|| '000', '2' ) as bonbu, 
		    get_depnm( a.depcd, '3' ) as jisa,
		  --  get_depnm( a.accdepcd, '4' ) as jijum,
		    get_ktdepcdnm1( a.ktdepcd ) as ktName,
		    a.telno as factTelno,
		    get_phonegb_prnm( b.phongb ) as gijong, --기종
		    get_bldplcnm( a.bldplcno ) as place, --설치장소
		    get_boxno( a.unino ) as boxNo, --통번호
		    b.ssdt as ssdt, -- 사산일자
		    b.cpmsdt as cpmsdt, -- cpms전송일자
		    b.sscollectcnt as ssCount, --사산회수
		    b.cpcollectcnt as cpCount, --cpms회수
		    nvl( b.cpmscard, 0 ) as cpmsCard, 
		    nvl( b.cpmscoin , 0 ) as cpmsCoin,
		    nvl( b.cpmsamount , 0 ) as cpmsTotal, --cpms집금금액
		    nvl( b.ssfee, 0 ) as sasanaek, --사신집금액
		    decode( sign( nvl( b.ssfee, 0 ) - nvl( b.cpmsamount, 0 ) + 1 ), 1 , nvl( b.ssfee, 0 ) - nvl( b.cpmsamount, 0 )) as plusaek, --차액(+)
		    decode( sign( nvl( b.ssfee, 0 ) - nvl( b.cpmsamount, 0 )), - 1 , nvl( b.ssfee, 0 ) - nvl( b.cpmsamount, 0 )) as minusaek,  --차액(-)
		    ( nvl( b.ssfee, 0 ) - ( nvl( b.cpmsamount, 0 ) )) as sasanminus,
		    case when nvl( b.cpmsamount, 0 ) > b.ssfee then '부족금발생' else '' end as minusnaeyuk, --부족금여부
		    decode( sign( nvl( b.ssfee, 0 ) - nvl( b.cpmsamount, 0 ) + 999 ), - 1 , '분석 대상' ) as bunsukdaesan,
		    a.unino as unino,
		    get_area( a.depcd, '1', a.area ) as guyuk, --구역
		    get_area_usrname( a.depcd, '1', a.area ) as damdangja, --담당자
		    case
		        when ( sscollectcnt = cpcollectcnt
		        and sign( b.cpmsamount - b.ssfee ) = 0 ) then '정상'
		        when ( sscollectcnt = cpcollectcnt
		        and sign( b.cpmsamount - b.ssfee ) =- 1 ) then '사산금액많음'
		        when ( sscollectcnt = cpcollectcnt
		        and sign( b.cpmsamount - b.ssfee ) = 1 ) then '사산금액부족'
		        when ( sign( sscollectcnt - cpcollectcnt ) = 1
		        and sign( b.cpmsamount - b.ssfee ) =- 1 ) then '사산금액많음'
		        when ( sign( sscollectcnt - cpcollectcnt ) = 1
		        and sign( b.cpmsamount - b.ssfee ) = 1 ) then '사산금액부족'
		        when ( sign( sscollectcnt - cpcollectcnt ) = 1
		        and sign( b.cpmsamount - b.ssfee ) = 0 ) then '사산횟수많음'
		        when ( sign( sscollectcnt - cpcollectcnt ) =- 1
		        and sign( b.cpmsamount - b.ssfee ) =- 1 ) then '사산금액많음'
		        when ( sign( sscollectcnt - cpcollectcnt ) =- 1
		        and sign( b.cpmsamount - b.ssfee ) = 1 ) then '사산금액부족'
		        when ( sign( sscollectcnt - cpcollectcnt ) =- 1
		        and sign( b.cpmsamount - b.ssfee ) = 0 ) then 'cpms횟수많음'
		        else '오류자료'
		    end as sasanyubu --대사내역
		from
		    (
		      select depcd, ktdepcd, telno, unino, area, bldplcno from 
		        (
		        select
		         depcd,
		        --depcd as accdepcd ,
		        ktdepcd
			        ,tel1||tel2||tel3 as telno 
		        ,unino ,area ,bldplcno
	                from pt_factmt@oraktlpt 
		        where 1=1
                    and substr(depcd,1,1) like substr( 'G000' || '%' , 1, 1 )|| '%'
                    and depcd = 'G230'
                   -- and phongb != '02' 
                   -- and phongb != '04'
                   --   and uniind = '1'
                group by depcd
                --, accdepcd
                , ktdepcd, telno, unino, area, bldplcno 
                )
		    ) a,
		    (
			    select
			        MAX(ssdt) as ssdt,
			        MAX(cpmsdt) as cpmsdt,
			        sum( sscollectcnt ) as sscollectcnt,
			        sum( cpcollectcnt ) as cpcollectcnt,
			        sum( cpmscard ) as cpmscard,
			        sum( cpmscoin ) as cpmscoin,
			        sum( cpmsamount ) as cpmsamount,
			        sum( ssfee ) as ssfee,
			        unino,
			        max( phongb ) as phongb
			    from
			        (
			        select
			            ssdt,
			            '' as cpmsdt,
			            1 as sscollectcnt,
			            0 as cpcollectcnt,
			            0 as cpmscard,
			            0 as cpmscoin,
			            0 as cpmsamount,
			            amount as ssfee,
			            unino,
			            phongb
	                    from pt_ttcossdd@oraktlpt
			        where
	                    1=1
	                    and SSDT between '20200901' and '20200923'
	                    and updepcd like substr( 'G000' || '%' , 1, 1 )|| '%'
	                    and depcd = 'G230'
			            and phongb != '02' 
			            and phongb != '04'
			    union all
		        select
		            '' as ssdt,
		            cpmsdt||hhmmss as cpmsdt ,
		            0 as sscollectcnt,
		            1 as cpcollectcnt,
		            ( citycardfee + outcitycardfee + worldcardfee + cardfee114 + cityicfee + outcityicfee + worldicfee + icfee114 ) as cpmscard,
		            ( citycoinfee + outcitycoinfee + worldcoinfee + coinfee114 + downcoin ) as cpmscoin,
		            amount as cpmsamount,
		            0 as ssfee,
		            unino,
		            decode( phongb, '06', '07', phongb ) phongb
		        from
                        pt_ttcpmsdd@oracpms
		        where
                    1=1
                    and cpmsdt||hhmmss between substring('20200901000000000',1,8)||substring('20200901000000000',9,6) and substring('20200923163826000',1,8)||substring('20200923163826000',9,6)
                    and depcd like substr( 'G000' || '%' , 1, 1 )|| '%'
                    and depcd = 'G230'
		            and phongb != '02'
		            and phongb != '04' 
                )
		    group by unino 
            ) b 
		where
		    1 = 1
		    and   a.unino = b.unino
            --	and a.unino ='1010168'
		    and (a.telno like '%' || '000209006944' || '%')
		order by a.ktdepcd, damdangja
		         
		-- 000203187659
                 
	               select * from pt_factmthist pf where unino ='1010168'
	               
		    select
			        MAX(ssdt) as ssdt,
			        MAX(cpmsdt) as cpmsdt,
			        sum( sscollectcnt ) as sscollectcnt,
			        sum( cpcollectcnt ) as cpcollectcnt,
			        sum( cpmscard ) as cpmscard,
			        sum( cpmscoin ) as cpmscoin,
			        sum( cpmsamount ) as cpmsamount,
			        sum( ssfee ) as ssfee,
			        unino,
			        max( phongb ) as phongb
			    from
			        (
			        select
			            ssdt,
			            '' as cpmsdt,
			            1 as sscollectcnt,
			            0 as cpcollectcnt,
			            0 as cpmscard,
			            0 as cpmscoin,
			            0 as cpmsamount,
			            amount as ssfee,
			            unino,
			            phongb
	                    from pt_ttcossdd@oraktlpt
			        where
	                    1=1
	                    and SSDT between '20200901' and '20200923'
	                    and updepcd like substr( 'G000' || '%' , 1, 1 )|| '%'
	                    and depcd = 'G230'
			            and phongb != '02' 
			            and phongb != '04'
			    union all
		        select
		            '' as ssdt,
		            cpmsdt||hhmmss as cpmsdt ,
		            0 as sscollectcnt,
		            1 as cpcollectcnt,
		            ( citycardfee + outcitycardfee + worldcardfee + cardfee114 + cityicfee + outcityicfee + worldicfee + icfee114 ) as cpmscard,
		            ( citycoinfee + outcitycoinfee + worldcoinfee + coinfee114 + downcoin ) as cpmscoin,
		            amount as cpmsamount,
		            0 as ssfee,
		            unino,
		            decode( phongb, '06', '07', phongb ) phongb
		        from
                        pt_ttcpmsdd@oracpms
		        where
                    1=1
                    and cpmsdt||hhmmss between substring('20200901000000000',1,8)||substring('20200901000000000',9,6) and substring('20200923163826000',1,8)||substring('20200923163826000',9,6)
                    and depcd like substr( 'G000' || '%' , 1, 1 )|| '%'
                    and depcd = 'G230'
		            and phongb != '02'
		            and phongb != '04' 
                )
		    group by unino 
		    
		    
		    select * from pt_factmt pf where fact_telno ='000209006944'
            
		    
		    select * from pt_factmt where ktdepcd ='G07010' and status ='1';
		    
		   select ktdepcd from pt_factmt pf where depcd ='G230' group by ktdepcd;
		   
		  select * from payphone.biintmt b where depcd ='G231'
		  
		  
		  select * from pt_Factmt where boounino ='372684';
		  
		 select get_depnm(depcd ,3),decode(uniind,1,'무인',2,'자급','1541') ,get_bldplcnm(bldplcno),fact_telno, phonemgrno from pt_factmt pf2 where phonemgrno in
		 (select phonemgrno from pt_factmt pf where (phonemgrno is not null and phonemgrno != '') 
		 minus 
		 select cd_asset from fi_asset fa)
		 
		 
		 select * from 
		 (select get_depnm(depcd ,3), boounino,(select decode(uniind,1,'무인',2,'자급','1541') from pt_factmt pf where boounino = pb2.boounino group by uniind ) ,booknd , get_bldplcnm(bldplcno) bldplcnm,boomgrno from pt_boothmt pb2 where boomgrno in
		(select boomgrno from pt_boothmt pb  where (boomgrno is not null and boomgrno != '') 
		 minus 
		 select cd_asset from fi_asset fa) 
		 ) where bldplcnm is null
		 
		 select * from fi_asset fa where cd_asset ='B000014083309'
		 
		 select get_depnm(depcd ,3),decode(uniind,1,'무인',2,'자급','1541') ,get_bldplcnm(bldplcno),fact_telno, phonemgrno  from pt_factmt pf where boounino in (
		 select boounino from pt_boothmt pb3 where bldplcno in
		 (select bldplcno from pt_boothmt pb
		 minus 
		 select bldplcno from pt_bldplc pb2 )
		 )
		 
		 select get_depnm(depcd ,3), boounino,(select decode(uniind,1,'무인',2,'자급','1541') from pt_factmt pf where boounino = pb2.boounino group by uniind ) ,booknd , get_bldplcnm(bldplcno) bldplcnm,boomgrno from pt_boothmt pb2 where boomgrno in
		(select boomgrno from pt_boothmt pb  where (boomgrno is not null and boomgrno != '') and status !='0'
		 minus 
		 select cd_asset from fi_asset fa) 
		
		 (select bldplcno from pt_boothmt pb 
		 minus 
		 select bldplcno from pt_bldplc pb2)
		 
		 select * from pt_boothmt pb where status ='0'
		 
		 
		 
		  select uniind
           ,boo.boounino  as booUniNo
           ,coalesce(boo.boomgrno, '')  as OldBooMgrNo 
           ,coalesce(boo.boomgrno, '')  as booMgrNo
           ,'' as check  
           ,boo.updepcd as upDepCd   
           ,boo.depcd as depCd   
           ,boo.accdepcd as accDepCd   
           
           
           ,boo.boocon as booCon  
           ,boo.booknd as booKnd    
           ,boo.boodoorind as booDoorInd   
           ,boo.booblddt booBldDt      
           ,plc.bldplcno as bldPlcNo 
           ,plc.bldplcnm as bldPlcNm 
           ,plc.pp_clusr    as ppClusr -- 청소담당자코드
           ,boo.booroofknd as booRoofKnd   
           ,boo.bscgb as bscGb   
           ,boo.status as status   
           ,boo.retcyl as retCyl   
           ,boo.clcyl as clCyl   
           ,boo.sdcyl as sdCyl    
           ,boo.litest1 as liteSt1    
           ,boo.litest2 as liteSt2      
           ,boo.litest3 as liteSt3      
           ,boo.etvoltcd as etVoltCd     
           ,boo.etinbld as etInBld     
           ,boo.tpinbld as tpInBld     
           ,boo.remodt as remoDt    
            
           ,boo.remorsn as remoRsn   
           
           , (case when fac.bcnt>0 then '사용중' else '미사용' end) useFlag 
   ,case when (SELECT count(1) cnt FROM payphone.tb_attachfile t WHERE t.uniqno = boo.bldplcno AND t.file_gb = 'plc' and del_yn = 'N') > 0 then 'O' else 'X' end attach_cnt
 from payphone.pt_boothmt boo
    -- inner join payphone.pt_bldplc plc on boo.bldplcno = plc.bldplcno
    left outer join payphone.pt_bldplc plc on boo.bldplcno = plc.bldplcno
    left outer join (
        select boounino, count(*) as bcnt
       
 from payphone.pt_factmt
       
 where status = '1' 
        group by boounino
    ) fac on fac.boounino = boo.boounino
        
 where  1 = 1
	--	
 and    boo.bldplcno = plc.bldplcno
		
 and    boo.status = '1'
		  
		
 and    boo.updepcd = 'G000'
		  



		  
        
 and    boo.depcd = 'G210'
          
          
          
 select * from payphone.pt_factmt pf where boounino in (
       )
          
      select boounino from payphone.pt_boothmt pb where status ='0'       
          
          delete from payphone.pt_boothmt pb where status ='0'
          
          
         select * from refep_fi_dpbase rfd ;
         
        
        select * from payphone.icis_rcv_hist irh where be_svc_no in ('006103620927' ,'006107510212', '006103620927')
        
        
        
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
 and tid = '16362DX03316491'
 and can_flag = '0'
 
   select fact_telno as factTelNo
 from payphone.pt_factmt
 where status   <>   '2'
 and fact_telno = '006103620927'
         limit 1
         
         
         select * from payphone.pt_factmt pf where fact_telno = '006103620927';
         
        
        
          select 
            nvl(depcd , ' ') as depCd
            , nvl(depnm , ' ') as depNm
            , useflag as useFlag
 from payphone.biintmt
 where deptreecnt = '2'
 and substr(depcd, 4, 1) = '0'
 and depcd not in ('K000')
 and useflag = 'Y'
        order by useflag desc, depcd, depnm
        
        
        
        
        select pf.unino         as uniNo         
             , pf.depcd         as depCd          
             , pf.uniind        as uniind         -- 03 사업구분 -->
             , pf.fact_telno    as factTelNo        -- 04 전화번호 -->
             , substring(pf.fact_telno, 1,4) as svcNo1
             , substring(pf.fact_telno, 5,4) as svcNo2
             , substring(pf.fact_telno, 9,4) as svcNo3
             , pf.ktdepcd as ktDepCd       -- 05 관할전화국코드 -->
             , pf.upktdepcd     as upKtDepCd        -- 06 상위전화국코드 -->
             , pf.accdepcd      as accDepCd         -- 07 관할센터(지점) -->
             , pf.updepcd       as depHighCd        -- 08 상위기관 -->
             , coalesce(pf.area, '')          as area             -- 09 구역 -->
             , coalesce(pf.status, '')        as status           -- 10 사용구분(2미사용,1사용) -->
             , pf.bldplcno      as bldPlcNo         -- 11 설치장소관리번호 -->
             , coalesce(pf.exmhod, '')        as exMhod           -- 12 교환방식[0264] -->
             , pf.factgb        as factGb           -- 13 시설구분[0278] -->
             , pf.phonemgrno    as phoneMgrNo       -- 14 시설자산번호 -->
             , pf.phonemgrno    as bfAsset       -- 14 시설자산번호 -->
             , pf.phoneknd      as phoneKnd         -- 15 전화기기종[0242] -->
             , pf.boounino      as booUniNo         -- 16 부스관리번호 -->
             , pf.booserno      as booSerNo         -- 18 부스전화기순번??????????????? -->
             , coalesce(pf.phgb, '')          as phGb             -- 19 불법통화방지장치[0291] -->
             , coalesce(pf.bldknd, '')        as bldKnd           -- 20 설치유형[0271] -->
             , pf.lstusr        as lstUsr           -- 21 최종입력자 -->
             , coalesce(pf.recvind, '')       as recvInd          -- 22 무인착신여부 lcd=0915 -->
             , pf.blddt         as bldDt            -- 23 설치일자 -->
             , pf.lstdt         as lstDt            -- 24 최종입력일 -->
             , coalesce(pf.remorsn, '') as remoRsn  -- 철거/해지사유[0908],[0262] -->
             , coalesce(pf.remodt, '')  as remoDt   -- 철거 해지 일자 -->
             -- , pf.factgb        as factGb -->       -- 1(1: 전화기 기존데이터에 1로 되어있음.1이 아닌 자급은 존재하지 않음.) / -->
             , pf.custzip       as custZip      -- 고객우편번호 -->
             , pf.custadr1      as custAdr1     -- 고객주소 -->
             , pf.custadr2      as custAdr2     -- 고객주소 상세 -->
             , pf.custcall      as custCall     -- 고객전화번호 -->
             , case
                when (pf.custtradnm is null or pf.custtradnm = '') 
                 and (irh.be_addr_ref is not null and irh.be_addr_ref != '') then irh.be_addr_ref
                when (pf.custtradnm is null or pf.custtradnm = '') 
                 and (irh.be_addr_ref is  null or irh.be_addr_ref = '') then irh.be_cust_name
               else pf.custtradnm end as custTradNm -- 고객상호명 -->
             , pf.gdgb          as gdGb         -- 물자구분(자급상품:1) -->
             , pf.gdcd          as gdCd         -- 물자코드 -->
             , payphone.get_gdbasmst_gdnm('1', pf.gdcd) as gdNm
             , pf.pausedt       as pauseDt      -- 일시정지 일자 -->
             , pf.pausersn      as pauseRsn     -- 일시정지 사유 -->
             -- , pf.bldamt        as bldAmt       자급시설 설치비(0937) -->
             -- , pf.bondamt       as bondAmt      자급시설 보증금(0938) -->
             , coalesce(pf.intcallind, '')    as intCallInd   -- 자급시설 국제전화(0916) -->
             , pf.subspt_content as subSptContent   -- 자급시설 메모 -->
             , pf.sbtdt         as sbtDt        -- 자급시설 청약일자 -->
             , case
                when irh.endResvDate is null or irh.endResvDate = ''
                then irh.strResvDate else irh.endResvDate
               end        as bldHDt -- 자급시설 설치희망일자 -->
             , coalesce(pf.usegb, '')         as useGb        -- 소유구분(0901) -->
             , pf.army_nm       as armyNm
             -- , irh.ktDepCd      as ktdepcd -->
             -- , irh.be_addr||' '||irh.be_addr_no||'-'||irh.be_addr_ho as addr -->
             -- , a.be_svc_no -->
             -- , irh.be_svc_no1   as svcNo1 -->
             -- , irh.be_svc_no2   as svcNo2 -->
             -- , irh.be_svc_no3   as svcNo3 -->
             -- , a.bld_addr_cd 처리장소코드 -->
             , irh.phoneknd     as terminalCd
             , irh.can_flag     as canFlag
             , irh.tid
             , irh.act_code     as actCode
             , irh.proc_gubun   as procGubun
          from payphone.pt_factmt pf
             , (select be_svc_no1||be_svc_no2||be_svc_no3 as tel
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
                  and tid = '16362DX03316491'
 and can_flag = '0'     ) irh
         where 1=1
           and pf.fact_telno = irh.tel
           and pf.fact_telno ='006103620927'
           and pf.uniind ='3'
           
           
           
         
         
         
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
                     and tid = '16362DX03316491'
 and can_flag = '0'
 
 -- 정비유형[2057] : 다이얼[1]/송수기케이스[2]/송수기코드[3]/송수화갑[4]/주화처리부[5]/전원회로[6]
--/제어회로[7]/통화회로[8]/교통리더기[9]/카드리더기[10]/인입선(전화)[11]/인입선(전기)[12]
--/기타 부품[13]/부스[14]/기타(배선 등)[15]/시험통화[16]/고객반환[17]/TOK[18]
-- 정비종류[2056] : 정비[M]/교체[R]/I 점검

 교통리더기 점검 
 다이엘 점검
 
select * from bibsici b where lcd ='2056';

select * from payphone.tb_maintain tm where 
 jungdt like '20200915%' and accdepcd ='O050'
 and jungtel in (select fact_telno from payphone.pt_factmt pf where depcd ='O050' and area ='02' and uniind ='1')
 order by jungdt; 
 
 select * from tb_repair tr where gojang_tel ='006107535862';

select * from payphone.bimastercf b where usrcd ='01457';
 
select * from payphone.pt_factmt pf where fact_telno ='006107535862';

select * from payphone.pt_areamt pa where area ='02' and depcd ='O050' and area_use ='Y' and uniind ='1';

select * from payphone.biintmt b where depcd ='O050'

select * from pt_factmt pf  where boounino  in (
select boounino from pt_boothmt pb  where booknd ='715'
);

select * from bibsici b where scd ='715'

SELECT boounino, count(boounino) AS cnt
								  FROM pt_factmt
								  WHERE status = '1' 
								  	AND fact_knd = '2'
								  GROUP BY boounino
								
								  
								  
select * from user_source where text like '%자동호출%';		




PROC_GETGUARD_SMS
-- SMS_INTERFACE
PROC_GETGUARD_SMS


SELECT DISTINCT ON (fact_telno)
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
			         	WHEN fac.blddt BETWEEN '20200101' AND '20201019' THEN '신규'
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
						AND bld.bldloc1  <>  '52'and bld.bldzip NOT IN ('24139','17511')
	/*			LEFT OUTER JOIN ( SELECT boounino, count(boounino) AS cnt
								  FROM pt_factmt
								  WHERE status = '1' 
								  	AND fact_knd = '2'
								  GROUP BY boounino
								) atm 
					ON atm.boounino = fac.boounino*/
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20200101' AND '20201019'
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
--				LEFT OUTER JOIN ( SELECT boounino, count(boounino) AS cnt
--								  FROM pt_factmt
--								  WHERE status = '1' 
--								  	AND fact_knd = '2'
--								  GROUP BY boounino
--								) atm 
--					ON atm.boounino = fac.boounino
				WHERE 1=1
					AND fac.uniind = '1'
					AND fac.opflag = 'D'
					AND fac.lstdt IS NOT NULL
					AND fac.bldloc1  <>  '52'and fac.bldzip NOT IN ('24139','17511')
					AND substr(fac.lstdt, 0, 8) BETWEEN '20200101' AND '20201019' )
		ORDER BY fact_telno, lstdt desc
		
		
		select * from payphone.pt_boothmt pb where booknd  ='624'; 
		
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
	                 AND STTDT <= '20201019'
	                 AND LSTDT >= '20201001';
		 
	
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
	                 AND STTDT <= '20201019'
	                 AND LSTDT >= '20201001'
		 
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
	          AND B.REV_DATE >= '20201001'
	          AND B.REV_DATE <= '20201019'
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
	          AND B.JUNGDT >= '20201001' || '000000'
	          AND B.JUNGDT <= '20201019' || '235959'
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
	          AND B.SCHDT >= SUBSTR('20201019', 1, 6) || '01'
	          AND B.SCHDT <= SUBSTR('20201019', 1, 6) || '99'
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
	          AND A.REV_DATE >= '20201001'
	          AND A.REV_DATE <= '20201019'
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
	       , TEL_GB_NM;
	       
	       
	       
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
	                 AND STTDT <= '20201019'
	                 AND LSTDT >= '20201001' )
	        WHERE 1=1
	          AND RN = 1
	          and UPDEPCD is null;
	       
	         
	         
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
	                 AND STTDT <= '20201019'
	                 AND LSTDT >= '20201001' and updepcd is null;
	                
	                select * from payphone.pt_factmthist pf  where updepnm  is null;
	                 
	               
	               update payphone.pt_factmthist a set 
	               updepnm = (select depnm from  payphone.biintmt b where depcd = a.depcd and deptreecnt in (1,2,3,4))
	               where updepnm is null;
	               
	               select dephighcd, from payphone.biintmt b where depcd  in (select depcd from payphone.pt_factmthist pf  where updepcd  is null) and deptreecnt in (1,2,3,4);
	               
	                select * from pt_factmt pf where unino ='1320353';
	                
	               select * from biintmt b where depcd ='G240';
	               
	               select * from fi_asset fa where cd_asset ='20190800018';
	               
	              
	              SELECT DISTINCT ON (fact_telno)
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
			         	WHEN fac.blddt BETWEEN '20201001' AND '20201021' THEN '신규'
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
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511')	WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201001' AND '20201021'
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
					AND fac.bldloc1 <>'52'and fac.bldzip NOT IN ('24139','17511')
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201001' AND '20201021' )
		ORDER BY fact_telno, lstdt desc
		
		
		
		SELECT
			         CASE
			         	WHEN fac.blddt BETWEEN '20201001' AND '20201021' THEN '신규'
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
					 , decode(substr(bld.pp_etcfac, 1, 1), 'N', 'N',null, 'N', 'Y') AS bldaed
					 , decode(boo.booknd, '715', 'Y', 'N') AS booelc
					 , substr(fac.lstdt, 0, 8) AS lstdt
				FROM pt_factmt fac
			 	INNER JOIN pt_boothmt boo 
			 		ON fac.boounino = boo.boounino
				INNER JOIN pt_bldplc bld 
					ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511')	WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201001' AND '20201021';
					
				select fac.fact_telno, fac.bldplcno, bld.bldplcno ,decode(substr(bld.pp_etcfac, 1, 1), 'N', 'N', 'Y') ,substr(bld.pp_etcfac, 1, 1) from pt_factmt fac INNER JOIN pt_bldplc bld 
				ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511') ;
						
					
				select * from pt_bldplc pb where bldplcno 	='2008015143';
				
			select bldaed from pt_factmthist pf; 
			
		
		select * from payphone.pt_bldplc pb where pp_etcfac is;
		
	select * from payphone.pt_bldplc pb; 'N|N|N|N'
	
	
	update payphone.pt_bldplc set
		pp_etcfac = 'N|N|N|N'
	where pp_etcfac is null; 
	


select * from payphone.fi_bizcar fb 


CREATE FOREIGN table tc_err_report (
SEQ numeric(10),
TEL_NO VARCHAR(12),
CID_NO VARCHAR(12),
UNINO numeric,
REPORT_DTM VARCHAR(14),
LOG_DESC VARCHAR(10),
SUCC_OX VARCHAR(1),
LOG_ERR_ID VARCHAR(3),
LOG_GUBUN VARCHAR(1),
RES1  VARCHAR(50),
RES2  VARCHAR(20)
)
SERVER oracpms OPTIONS (table 'TC_ERR_REPORT');



select * from payphone.tc_err;


select * from tc_err_report;



SELECT GET_DEPNM(A.UPDEPCD,2)           UPDEPNM1,  
       GET_DEPNM(A.DEPCD, 3)            DEPNM1,    
       get_area_usrname(A.depcd ,1,A.AREAUSR)              USRNM1,    
       NVL(GET_bibsici_PRNM('0628', A.PHONEKND),'미등록')          PHONEKND1, 
       A.TEL_NO               TELNO, 
       GET_BLDPLCNM( A.BLDPLCNO) BLDPLCNM1, 
       GET_DEPNM(B.UPDEPCD,2)           UPDEPNM2, 
       GET_DEPNM(B.DEPCD, 3)            DEPNM2, 
       get_area_usrname(B.depcd, 1 ,B.AREAUSR)              USRNM2, 
       NVL(GET_bibsici_PRNM('0628', B.PHONEKND),'미등록')          PHONEKND2, 
       B.CID_NO               CIDNO, 
       GET_BLDPLCNM(B.BLDPLCNO) BLDPLCNM2, 
       A.REPORT_DTM       REPORT_DTM, 
       A.LOG_DESC, A.SUCC_OX, A.ERR_NM, A.LOG_GUBUN 
 FROM  (SELECT NVL(A.UPDEPCD, '-') UPDEPCD, 
              NVL(A.DEPCD, '-')   DEPCD, 
              NVL(A.AREAUSR, '-') AREAUSR, 
              NVL(A.AREA, '-')    AREA, 
              NVL(A.KTDEPCD, '-')     KTDEPCD, 
              NVL(A.PHONEKND, '-') PHONEKND, 
              NVL(A.BLDPLCNO, '-') BLDPLCNO, 
              B.TEL_NO, B.REPORT_DTM, 
              DECODE(B.LOG_ERR_ID, '17', '3', NVL(A.REMOVE_OX,'0')) STATUS, 
              B.CID_NO, B.SEQ, B.LOG_DESC, B.SUCC_OX, C.ERR_NM, B.LOG_GUBUN 
       FROM   TC_CPMSMT A, TC_ERR_REPORT B, 
              TC_ERR C 
       WHERE  A.TEL_NO(+) = B.TEL_NO 
       AND    A.UNINO(+) = B.UNINO 
       AND    B.REPORT_DTM BETWEEN '20201022000000' AND '20201022235959' 
       AND    B.LOG_ERR_ID = NVL('', B.LOG_ERR_ID) 
       AND    B.LOG_ERR_ID = C.ERR_ID(+) 
       AND    B.LOG_ERR_ID = '18') A, 
      (SELECT NVL(A.UPDEPCD, '-') UPDEPCD, 
              NVL(A.DEPCD, '-')   DEPCD, 
              NVL(A.AREAUSR, '-') AREAUSR, 
              NVL(A.AREA, '-')     AREA, 
              NVL(A.KTDEPCD, '-')     KTDEPCD, 
              NVL(A.PHONEKND, '-') PHONEKND, 
              NVL(A.BLDPLCNO, '-') BLDPLCNO, 
              B.TEL_NO, B.REPORT_DTM, 
              DECODE(B.LOG_ERR_ID, '17', '3', NVL(A.REMOVE_OX,'0')) STATUS, 
              B.CID_NO, B.SEQ, B.LOG_DESC, B.SUCC_OX, C.ERR_NM, B.LOG_GUBUN 
       FROM   TC_CPMSMT A,          
	            TC_ERR_REPORT B,      
              TC_ERR C              
       WHERE  A.TEL_NO(+) = B.CID_NO 
       AND    B.REPORT_DTM BETWEEN '20201022000000' AND '20201022235959' 
       AND    B.LOG_ERR_ID = C.ERR_ID(+) 
       AND    B.LOG_ERR_ID ='18' ) B--IN ('3','5','6','17','18','51','52')) B 
WHERE  A.SEQ = B.SEQ 
AND    A.TEL_NO = B.TEL_NO 
AND    A.CID_NO = B.CID_NO 
AND    A.REPORT_DTM = B.REPORT_DTM 
AND   (A.UPDEPCD = NVL('',A.UPDEPCD) 
 OR    B.UPDEPCD = NVL('',B.UPDEPCD)) 
AND   (A.DEPCD = NVL('',A.DEPCD) 
 OR    B.DEPCD = NVL('',B.DEPCD)) 
AND   (A.KTDEPCD = NVL('',A.KTDEPCD) 
 OR    B.KTDEPCD = NVL('',B.KTDEPCD)) 
AND   (A.AREAUSR = NVL('',A.AREAUSR) 
 OR    B.AREAUSR = NVL('',B.AREAUSR)) 
AND   (A.AREA = NVL('',A.AREA) 
 OR    B.AREA = NVL('',B.AREA)) 
AND   (A.PHONEKND = NVL('', A.PHONEKND) 
 OR    B.PHONEKND = NVL('', B.PHONEKND)) 
 AND   ( A.TEL_NO LIKE '%%%' or b.cid_no like '%%%' )  
ORDER BY  A.UPDEPCD, A.DEPCD, A.AREAUSR, A.PHONEKND,A.REPORT_DTM;


SELECT NVL(A.UPDEPCD, '-') UPDEPCD, 
              NVL(A.DEPCD, '-')   DEPCD, 
              NVL(A.AREAUSR, '-') AREAUSR, 
              NVL(A.AREA, '-')    AREA, 
              NVL(A.KTDEPCD, '-')     KTDEPCD, 
              NVL(A.PHONEKND, '-') PHONEKND, 
              NVL(A.BLDPLCNO, '-') BLDPLCNO, 
              B.TEL_NO, B.REPORT_DTM, 
              DECODE(B.LOG_ERR_ID, '17', '3', NVL(A.REMOVE_OX,'0')) STATUS, 
              B.CID_NO, B.SEQ, B.LOG_DESC, B.SUCC_OX, C.ERR_NM, B.LOG_GUBUN 
       FROM   TC_CPMSMT A, TC_ERR_REPORT B, 
              TC_ERR C 
       WHERE  A.TEL_NO(+) = B.TEL_NO 
       AND    A.UNINO(+) = B.UNINO 
       AND    B.REPORT_DTM BETWEEN '20201022000000' AND '20201022235959' 
       AND    B.LOG_ERR_ID = NVL('', B.LOG_ERR_ID) 
       AND    B.LOG_ERR_ID = C.ERR_ID(+) 
       AND    B.LOG_ERR_ID = '18';
       
      
      SELECT NVL(A.UPDEPCD, '-') UPDEPCD, 
              NVL(A.DEPCD, '-')   DEPCD, 
              NVL(A.AREAUSR, '-') AREAUSR, 
              NVL(A.AREA, '-')     AREA, 
              NVL(A.KTDEPCD, '-')     KTDEPCD, 
              NVL(A.PHONEKND, '-') PHONEKND, 
              NVL(A.BLDPLCNO, '-') BLDPLCNO, 
              B.TEL_NO, B.REPORT_DTM, 
              DECODE(B.LOG_ERR_ID, '17', '3', NVL(A.REMOVE_OX,'0')) STATUS, 
              B.CID_NO, B.SEQ, B.LOG_DESC, B.SUCC_OX, C.ERR_NM, B.LOG_GUBUN 
       FROM   TC_CPMSMT A,          
	            TC_ERR_REPORT B        
       WHERE  A.TEL_NO(+) = B.CID_NO 
       AND    B.REPORT_DTM BETWEEN '20201022000000' AND '20201022235959' 
       AND    B.LOG_ERR_ID = C.ERR_ID(+) 
       AND    B.LOG_ERR_ID ='18' ;
       
      select * from tc_cpmsmt tc where tel_no ='006205148759';
      
     select pf.updepcd, pf.depcd, pf.area, pf.uniind, ter.CID_NO, ter.REPORT_DTM, ter.SEQ, ter.LOG_DESC, ter.SUCC_OX,
     (select ERR_NM from tc_err te where te.err_id = ter.LOG_ERR_ID) as err_nm
     from payphone.pt_factmt pf, TC_ERR_REPORT ter
     where pf.fact_telno = ter.CID_NO
    and ter.REPORT_DTM BETWEEN '20201019000000' AND '20201022235959'
   	and ter.log_err_id = '18'; 
 --  and LOG_ERR_ID ='18' ; 
     
  (select pf.updepcd, pf.depcd, pf.area, pf.uniind, ter.tel_no from  TC_ERR_REPORT ter, payphone.pt_factmt pf where ter.tel_no  = pf.fact_telno
    and ter.REPORT_DTM BETWEEN '20201019000000' AND '20201022235959'
   	and ter.log_err_id = '18')
   
   	select 	
   		A.REPORT_DTM,
   		payphone.get_depnm(B.updepcd,2),
   		payphone.get_depnm(B.depcd,3),
   		get_area_usrname(B.depcd, 1, B.area),
   		A.tel_no,
   		payphone.get_depnm(A.updepcd,2),
   		payphone.get_depnm(A.depcd,3),
   		get_area_usrname(A.depcd, 1, A.area),
   		COALESCE(GET_bibsici_PRNM('0628', A.PHONEKND),'미등록') as phonekndnm,
   		A.CID_NO,
   		payphone.get_bldplcnm(A.bldplcno) as bldplcnm,
   		--A.SEQ,
   		A.LOG_DESC,
   		A.SUCC_OX,
   		A.err_nm from
   	(
   		select
   			ter.tel_no,
   			pf.updepcd,
   			pf.depcd,
   			pf.area,
   			pf.uniind,
   			pf.phoneknd,
   			pf.bldplcno,
   			ter.CID_NO,
   			ter.REPORT_DTM,
   			ter.SEQ,
   			ter.LOG_DESC,
   			ter.SUCC_OX,
     		(select	ERR_NM from tc_err te where te.err_id = ter.LOG_ERR_ID) as err_nm
     	from payphone.pt_factmt pf, TC_ERR_REPORT ter
     	where pf.fact_telno = ter.CID_NO
    	and ter.REPORT_DTM BETWEEN '20201001000000' AND '20201022235959'
   		and ter.log_err_id = '18') A
   		left outer join 
   	(
   		select
   			pf.updepcd,
   			pf.depcd,
   			pf.area,
   			pf.uniind,
   			ter.tel_no,
   			ter.REPORT_DTM,
   			ter.SEQ
   		from TC_ERR_REPORT ter, payphone.pt_factmt pf
   		where ter.tel_no  = pf.fact_telno
    	and ter.REPORT_DTM BETWEEN '20201001000000' AND '20201022235959'
   		and ter.log_err_id = '18'
   		) B on A.tel_no = B.tel_no
   		and A.REPORT_DTM = B.REPORT_DTM
   		and A.SEQ = B.SEQ
   		where A.UPDEPCD ='H000'
   		order by A.REPORT_DTM desc, A.UPDEPCD, A.DEPCD, A.area, A.PHONEKND;
   
   select * from tc_err_report ter where REPORT_DTM BETWEEN '20201001000000' AND '20201022235959';
  
  select * from pt_factmt pf where phonemgrno ='A20190800020'
   
  select (ROW_NUMBER() OVER()) AS ROWNUM,* from fi_asset fa where cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');
 
 
 select * from fi_asset fa where cd_asset like 'A%'; 
  
 select * from pt_boothmt pb where boomgrno ='A20190800020';

 


 select * from pt_factmthist pf where boomgrno  ='A20190800020';
  
select * from biintmt b where depcd ='G230'
  
  select * from fi_asset where cd_asset ='A20190800023';
  
 
  select * from fi_asset fa where nm_note =''
 
  
  select * from refep_fi_asset rfa where cd_asset ='A20190800020';
  
  select * from payphone.pt_boothmt pb where boomgrno ='A20190800018';
  



select cd_asset ,nm_note,nm_model from 
(select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note,fact_telno nm_model from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note,bldplcno nm_model from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1'
)
minus
select cd_asset ,nm_note,nm_model from REFEP_fi_asset;


select * from REFEP_fi_asset;

     insert into fi_asset_T@oraerp (cd_asset, nm_model,nm_note)    
     
     
     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
 
  select * from tc_log;
--   O000	O020	02083	05	O02000	031	0000082694	000234716949	20201022045617	1	006205148759	3	RF사용	X	전화번호 미일치                                   	2
 
 select * from refep_fi_asset rfa where cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');
 
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
	)
	--refep_fi_dpbase
	fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	left outer join payphone.fi_asset aa on aa.cd_asset=fas.cd_asset and aa.cd_company=fas.cd_company
	where 1=1
	and fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	and aa.cd_asset is null;
	--and fas.cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');

select * from refep_fi_dpbase rfd where cd_asset ='B000000085807';

select * from  payphone.fi_asset where cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');

(select cd_asset, cd_company,st_asset  from payphone.refep_fi_dpbase );

select cd_asset, cd_company,st_asset, ym_dpasset, row_idx from ()

select cd_asset, cd_company,st_asset, ym_dpasset from 
(select cd_asset, cd_company,st_asset, ym_dpasset, row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx from payphone.refep_fi_dpbase) where rowidx ='1'

select * from refep_fi_dpbase rfd where cd_asset ='A20190800018';

select cd_asset, cd_company,st_asset, ym_dpasset from 
		(
			select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase
		)
		where rowidx ='1' and st_asset in (4,5);
		
		select * from fi_asset fa where cd_asset ='A20190800020';
		
	select * from refep_fi_dpbase rfd where st_asset in (4);
	
select * from fi_asset fa where cd_asset ='A20190800023';

SELECT fas.cd_asset
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
	where fdb.st_asset in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
union all
(select cd_asset from payphone.fi_asset
minus
select fas.cd_asset from payphone.refep_fi_asset fas
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
where fdb.st_asset not in ('4','5')
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522'))


select * from payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')

select cd_asset from payphone.fi_asset
minus
select fas.cd_asset from payphone.refep_fi_asset fas
	left outer join 
	(
		select cd_asset, cd_company,st_asset, ym_dpasset from 
		(
			select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase
		)
		where rowidx ='1'
	)
	fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522');


select fas.cd_asset,fas.cd_mngdept,fas.nm_size from payphone.refep_fi_asset fas
	left outer join (
		select cd_asset, cd_company,st_asset, ym_dpasset from 
		(
			select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase
		)
		where rowidx ='1'
	) fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
minus    
select cd_asset,cd_mngdept,nm_size 
from payphone.fi_asset

select cd_asset,(select depCD from payphone.biintmt where org_cd = cd_mngdept) DEPCD from payphone.fi_asset
minus
select cd_asset,DEPCD from payphone.fi_asset


select proc_geterp_fi_asset();



	call payphone.proc_fi_asset_update();

   --  insert into fi_asset_T@oraerp (cd_asset, nm_model,nm_note)    
     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
     
    
select cd_asset ,nm_note,nm_model from 
(
	select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note,fact_telno nm_model from payphone.pt_factmt
	where phonemgrno is not null
	and phonemgrno !=''
	union all
	select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note,bldplcno nm_model from payphone.pt_boothmt
	where boomgrno is not null
	and boomgrno !=''
	and status ='1'
)
minus
select cd_asset ,nm_note,nm_model from REFEP_fi_asset

select cd_asset ,nm_note,nm_model from 
(select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note,fact_telno nm_model from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note,bldplcno nm_model from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1'
)
minus
select cd_asset ,nm_note,nm_model from REFEP_fi_asset

select * from fi_asset fa where dts_update is not null;

select dts_update from payphone.refep_fi_asset rfa where dts_update is not null  and cd_company = '1000' and tp_asset in ('27110', '27120', '27520', '27522');


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

select
to_char(now(), 'yyyymmddhh24miss');

select * from fi_asset fa where dts_update like '20201026%'

     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     where dts_update like to_char(now(),'yyyymmdd') || '%' 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
     
    
    select * from fi_asset fa where cd_asset in 
    (
    select cd_asset from ( 
    select cd_asset ,nm_note,nm_model from 
(select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note,fact_telno nm_model from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note,bldplcno nm_model from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1'
)
minus
select cd_asset ,nm_note,nm_model from REFEP_fi_asset
)
)

select * from fi_asset fa 


     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     where lstdt like to_char(now(),'yyyymmdd') || '%' 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
     
    select * from pt_bldplc pb where bldplcno in 
    (select bldplcno from pt_factmt) and pp_etcfac is null;
    
   
   select * from payphone.pt_boothmt pb where boomgrno ='A20190800018';
   
  
  select * from bimastercf where usrname like 'sg%';
 
  
  select * from biitmastercf b where 
  
  select * from user_source where text like '%bimastercf%'
  
  
  PROC_GETHR_BIMASTERCF
  
  
  select lstdt from payphone.fi_asset fa; 