select payphone.proc_change_pt_factmt();
/*
SQL Error [21000]: ERROR: more than one row returned by a subquery used as an expression
  Where: SQL statement "update pt_factmt@oraktlpt a set a.area = b.area , a.areausr = b.areausr
	from (
	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	minus
	select unino,area,areausr from pt_factmt@oraktlpt) B
	where A.unino = b.unino"
PL/pgSQL function proc_change_pt_factmt() line 219 at SQL statement

*/


update pt_factmt@oraktlpt a set a.area = b.area , a.areausr = b.areausr
	from (
	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	minus
	select unino,area,areausr from pt_factmt@oraktlpt) B
	where A.unino = b.unino;
	

select a.unino,a.area, (select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
	from payphone.pt_factmt a
	where status ='1'
	
	minus
	select areausr from pt_factmt@oraktlpt;
	

select * from payphone.biintmt b where depcd ='H220'

select depcd, uniind,area, count(area) from pt_areamt pa where area_use ='Y' group by depcd ,uniind ,area having count(area) > 1 ; 

select * from pt_areamt pa where depcd ='I030' and area_use ='Y';

select depcd , count(1) from biintmt b where 1=1 and deptreecnt in (1,2,3,4) and useflag ='Y' group by depcd;


 

select cd_asset 자산코드,
(select depnm from payphone.biintmt b where b.depcd =  (select dephighcd from payphone.biintmt b where b.depcd = c.depcd and deptreecnt in (1,2,3,4) and useflag ='Y' group by dephighcd) and deptreecnt in (1,2,3,4) and useflag ='Y' group by depnm) 본부,
(select depnm from payphone.biintmt b where b.depcd = c.depcd and deptreecnt in (1,2,3,4) and useflag ='Y' group by depnm) 지사 ,nm_asset 자산명, nm_model 모델, nm_note 비고, used_yn  사용유무
          from payphone.fi_asset c
         where 1=1
           and cd_company = '1000'   
                and tp_asset = '27110'
                and dts_insert like '2021%';
         
       select st_asset from fi_asset fa where cd_asset in ('A20201200007');
       
      
      select * from neoe.neoe.fi_asset;
      
     
     delete from payphone.pt_tt_muin_jageup where ssdt like '202012';
     
    
select * from (SELECT fas.cd_asset
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
)  where cd_asset = 'A20201200007'
	
	union all
(

delete from payphone.fi_asset where cd_asset = 'A20201200007';

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
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')

);

select * from refep_fi_dpbase where cd_asset  in ('A20201200007');



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
	and aa.cd_asset is null;
	

select * from pt_tt_muin_jageup where ssdt like '202012';


select * from pt_factmt pf where depcd ='I210' and uniind ='2' and area = '02';



select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
            , uniind
            , orgCdUsrcd
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
                ,
 (select org_cd
 from biintmt b2
 where depcd = a.depcd
 and deptreecnt in ('1','2','3','4'))|| usrcd as orgCdUsrcd
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
 and a.uniind = '2'
            ) userInfo;
           
select * from pt_factmt pf where fact_telno ='005407638177';

select * from bimastercf b where usrcd ='01746';

select * from bimastercf b where usrname like '김철규';

select * from tb_smartotp ts where telno ='01051107971'; 

select * from tb_loginlog tl where login_usr ='02204' and login_dt  like '20210126%';

select * from tb_user_password tup where usrcd ='02204';


select * from pt_factmt pf  where fact_telno  ='005303417109';

select * from bimastercf b where usrcd ='02831';


select * from tb_maintain tm where jungtel = '004302835264'; 02435

select * from tb_repair tr where gojang_tel = '004302835264' and rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2'; 

select * from user_source where text like '%wanro_flag%';

PROC_GETGUARD_T_JUBSU;

select * from t_jubsu@oraguard where gojang_tel = '0432835264';

PROC_GETGUARD_T_JUBSU_MIG;

PROC_SETGUARD_T_JUBSU_TRIGUPDATE;

PROC_CHANGE_PT_FACTMT;

select proc_change_pt_factmt();

nsert into KTLPT.PT_AREAMT@oraktlpt 
    (depcd,uniind, area, areausr,areanm,call1,call2,call3,accdepcd,updepcd,reserved1,lstdt,lstusr)
   (select A.depcd,A.uniind,A.area,A.areausr,A.areanm,substring(b.call,1,3) call1,substring(b.call,4,4) CALL2, substring(b.call,8,4) CALL3,A.accdepcd,A.updepcd,A.RESERVED1,A.lstdt,A.LSTUSR 
	from payphone.pt_areamt A,	
	(select depcd,uniind,area,areausr,areanm,decode(call,'',null,call) as call,accdepcd,updepcd,lstdt from payphone.pt_areamt
	where area_use ='Y'
	minus
	select depcd,uniind,area,areausr,areanm,decode(call1||call2||call3,'',null,call1||call2||call3),accdepcd,updepcd,lstdt from pt_areamt@oraktlpt
	) B
	where A.DEPCD=B.depcd and A.UNIIND=B.uniind and A.AREA=B.area and A.AREAUSR=B.areausr and a.area_use ='Y')
	
select depcd,uniind,area,areausr,areanm,decode(call,'',null,call) as call,accdepcd,updepcd,lstdt from payphone.pt_areamt
	where area_use ='Y' and depcd ='I030';
	

select * from pt_factmt pf  where fact_telno ='005202490658';

select a.rev_date,a.rev_time,a.jubsu_no,a.jumgumja_id,(select c.usrname from bimastercf c where c.usrcd =a.jumgumja_id) jumgumja_des,a.hochul_tel,a.suri_cd,a.suri_des, a.wan_date,a.wan_time,a.hochul_date, a.hochul_time,wanro_flag,hochul_gb FROM t_jubsu@oracpms a
          where a.rev_date  >= to_char(current_date-7,'YYYYMMDD')
          minus
         select rev_date,rev_time,jubsu_no,jumgumja_id,jumgumja_des,hochul_tel,suri_cd,suri_des, wan_date,wan_time,hochul_date, hochul_time,wanro_flag,hochul_gb FROM tb_repair
          where rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2';
          
         select * from pg_stat_activity
    where query ='select payphone.proc_change_pt_factmt()';
    
   
   select * from pt_factmt pf where fact_telno ='004305323864';
   
  select * from pt_boothmt pb where boounino ='373295';
  
 select * from pt_bldplc pb  where bldplcno  ='2017090125';
 
 select fac.unino as unino , fac.updepcd as upDepCd , fac.depcd as depCd 
			, fac.accdepcd as accDepCd , fac.ktdepcd as ktDepCd , fac.area as area 
            , arm.areanm as areaNm, arm.areausr as asraUsr, ur.usrname as asraUsrNm, arm."call" as asrUsrPhone,fac.depcd||fac.area as areaCd
			, fac.phonemgrno as phoneMgrNo , fac.phonemgrno as oldPhoneMgrNo 
			, fac.fact_telno as factTelNo , fac.phoneknd as phoneKnd , fac.phgb as phGb , fac.exmHod as exmHod
			, fac.blddt as bldDt , fac.bldknd as bldKnd , fac.recvind as recvInd 
			, fac.factgb as factGb , fac.booserno as booSerNo , fac.remodt as remoDt , fac.remorsn as remoRsn 
			, tot.totamt  as beMonPrt 
			-- , payphone.get_muintotamt( fac.unino, to_char(( current_date - interval '1 months' ), 'YYYYMM' )) as beMonPrt 
			, fac.army_nm as armyNm , boo.boomgrno as booMgrNo , boo.boounino as booUnino 
			, boo.boounino as oldBooUnino , boo.boocon as booCon 
			, ( select prnm from payphone.bibsici where lcd = '0250' and scd = boo.boocon ) as booConNm 
			, ( select prnm from payphone.bibsici where lcd = '0248' and scd = boo.booknd ) as booKndNm
			, ( select prnm from payphone.bibsici where lcd = '0286' and scd = boo.boodoorind ) as booDoorIndNm 
			, boo.booblddt as booBldDt , bld.road_amt as roadAmt , bld.elec_amt as elecAmt 
			, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest1 ) as liTest1Nm 
			, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest2 ) as liTest2Nm
			, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest3 ) as liTest3Nm 
			, ( select prnm from payphone.bibsici where lcd = '0266' and scd = boo.etvoltcd ) as etVoltCdNm 
			, boo.etinbld as etInBld , boo.tpinbld as tpInBld 
			, ( select prnm from payphone.bibsici where lcd = '0262' and scd = boo.remorsn ) as booRemoRsnNm 
			, bld.bldplcno as bldPlcNo , bld.bldplcnm as bldPlcNm 
            , (select prnm from payphone.bibsici where lcd = '2049' and scd = cap.soc_fact) as socFact 
			, ( select prnm from payphone.bibsici where lcd = '0244' and scd = bld.bldgb ) as bldGbNm 
			, ( select prnm from payphone.bibsici where lcd = '0246' and scd = bld.bldloc1 ) as bldLoc1Nm  
			, ( select prnm from payphone.bibsici where lcd = '0247' and scd = bld.bldloc2 ) as bldLoc2Nm 
			, bld.bldzip as bldZip , bld.bldadr1 as bldAdr1 , bld.bldadr2 as bldAdr2 
			, bld.gpsx as gpsX , bld.gpsy as gpsY 
			, ( select prnm from payphone.bibsici where lcd = '0256' and scd = boo.clcyl ) as clCylNm 
			, bld.pp_clusr as ppClusr 
			, ( select prnm from payphone.bibsici where lcd = '0259' and scd = boo.sdcyl ) as sdCylNm 
			, ( select prnm from payphone.bibsici where lcd = '0257' and scd = boo.retcyl ) as retCylNm 
			, bld.land_pr as landPr , bld.auto_yn as autoYn , bld.pp_etcfac as ppEtcFac 
			, substr( bld.pp_etcfac, 1, 1 ) as bldAed , substr( bld.pp_etcfac, 3, 1 ) as bldAir 
			, substr( bld.pp_etcfac, 5, 1 ) as bldBye , substr( bld.pp_etcfac, 7, 1 ) as bldWiFi 
			, fac.status
			, fac.cashBoxKey
			, ( select prnm from payphone.bibsici where lcd = '0291' and scd = fac.phgb ) as phgbNm
			, fac.chkDt as chkDt
			from payphone.pt_factmt fac
			left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino
			left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno -- and fac.uniind=bld.uniind
			left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind=fac.uniind and arm.depcd=fac.depcd and arm.area_use = 'Y' and arm.area_to ='99991231' 
			left outer join payphone.bimastercf ur on ur.usrcd=arm.areausr
            left outer join payphone.pt_cap cap on bld.bldzip = cap.bldzip and  cap.depcd  = fac.depcd 
            left outer join (
               select SUM(totamt) as totamt,unino,uniind from payphone.pt_tt_muin_jageup where ssdt in (select MAX(ssdt) from payphone.pt_tt_muin_jageup)  group by unino, uniind
            ) tot on tot.unino = fac.unino and tot.uniind ='1'
			where 1=1
			and fac.uniind = '1'
			and fac.fact_knd = '1'
			and fac.status = '1'
			and fac.fact_telno  = '004305323864';
			
		select * from pt_cap;
		
	delete from tb_maintain tm where lstusr is null; 
	
select * from pt_factmt pf where fact_telno ='005307515068';

select * from biintmt b where depcd ='I210';


select * from pt_factmt_h pf  where fact_telno ='003306372180';


select * from pt_factmt pf where fact_telno ='003306519807';

select * from pt_factmt_h pf where fact_telno ='003306372180';

0033-0632-2780 0033-0653-9866

select * from pt_factmt pf;

select * from pt_factmt pf  where fact_telno  ='003306322780';

select * from icis_rcv_hist irh where rcv_date like '20210223%' and be_svc_no  in ('003306322780','003306539866');


select * from user_source where text like '%tc_cpmsmt%';

PROC_CHANGE_PT_FACTMT

PROC_GETCPMS_TC_CPMSMT;


select * from pt_factmt pf  where boounino = '34969';

select * from fi_asset fa where cd_asset ='B000011802905';

select * from fi_asset fa where cd_asset like 'B%' and tp_asset ='27120';

select * from pt_boothmt pb where boomgrno = 'B000011802905'; 

select * from fi_asset fa where 1=1 and fa.tp_asset = '27110'
                and (coalesce(fa.nm_model,'미사용') in ('미사용','미설치') or coalesce(fa.nm_note,'미사용') in ('미사용','미설치'));

select * from refep_fi_asset rfa  where cd_asset ='B000015125104';

select * from pt_bldplc pb where bldplcno ='0000118029';

select * from user_source where text like '%proc_geterp%';

select PROC_GETERP_FI_ASSET();

-- 20200921135959 03861

-- B000015125104

select * from bimastercf b where usrcd  ='03861';

select * from fi_asset fa2 where cd_asset  in (
select cd_asset from fi_asset fa group by cd_asset having count(cd_asset )  > 1);

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
	
select * from tb_repair where gojang_tel ='000208763241';


  select area from pt_factmt pf where uniind ='3' and fact_telno = '003207610306';

select * from tb_maintain tm where jungtel = '000208763241';

select bldplcno from pt_factmt pf where uniind ='2' group by bldplcno 
;

select * from pt_bldplc pb where uniind ='2'; 

select * from pt_bldplc pb where bldplcno in (
select bldplcno from pt_factmt pf  where fact_telno ='000208763241');

select
	area ,
	usrCd ,
	usrName ,
	depHighCd ,
	depCd ,
	accDepCd ,
	areaCd ,
	uniind ,
	orgCdUsrcd
from
	(
	select
		a.area , a.areausr as usrCd , '[' || decode(uniind, '1', '무인', '2', '자급', '3', '1541')|| ']' || areanm as usrName , a.updepcd as depHighCd , a.depcd as depCd , a.accdepcd as accDepCd , a.depcd || a.area areaCd , a.uniind uniind , (
		select
			org_cd
		from
			biintmt b2
		where
			depcd = a.depcd
			and deptreecnt in ('1', '2', '3', '4'))|| usrcd as orgCdUsrcd
	from
		pt_areamt a, (
		select
			usrcd, usrname
		from
			payphone.bimastercf
		where
			bsnind = '1') b
	where
		a.areausr = b.usrcd
		and a.area_use = 'Y'
		and a.uniind = '3' ) userInfo
		where depcd = 'H220' ;
		
	select * from bimastercf b where usrcd ='02976'
	
	select * from biintmt b  where depnm like '인천지사';
	

 select a.unino,       -- 고유번호
               a.updepcd,     -- 본부
               a.depcd,       -- 지사
               a.ktdepcd,     -- 전화국
               a.fact_telno as factTelNo, -- 전화번호
               coalesce(a.phonemgrno, '') as phoneMgrNo, -- 자산번호
               coalesce(a.phonemgrno, '') as oldPhoneMgrNo, -- 원자산번호
               a.depcd || a.area as area,  -- 구역(담당자)
               a.custcall,    -- 시설연락처(고객의 연락처)
               a.blddt,       -- 설치일자
               a.bldknd,      -- 설치구분
               a.remodt,      -- 철거일자
               a.remorsn,     -- 철거사유
               a.boounino,    -- 부스고유번호
               c.boomgrno,    -- 부스자산번호
               c.booknd,      -- 부스기종
               c.booblddt,    -- 부스 설치일자
               a.phoneknd,    -- 전화기종
               a.usegb,       -- 시설소유(0901)
               a.army_nm    as armyNm, -- 군부대
               a.custtradnm,  -- 고객상호명
               a.bldplcno,    -- 설치장소번호
               b.gpsy || ', ' || b.gpsx as gpspoint, -- GPS(설치장소)
               b.bldzip,      -- 우편번호(설치장소)
               b.bldadr1,     -- 기본주소(설치장소)
               b.bldadr2,     -- 상세주소(설치장소)
               b.bldplcnm,    -- 설치장소명(설치장소)
               a.status       -- 사용구분
         
 from payphone.pt_factmt  a,
               payphone.pt_bldplc  b,
               payphone.pt_boothmt c
        
 where a.uniind = 3           -- 1541
          
 and a.fact_knd = '1'
          
 and a.bldplcno = b.bldplcno(+)
          
 and a.boounino = c.boounino(+)
          
          
 and a.updepcd = 'H000'   -- 본부
          
          
          
 and a.depcd   = 'H220'   -- 지사
          
   
 
 -- A20200700343
 
 select * from fi_asset fa where cd_asset ='A20200700343';
          
select * from pt_boothmt pb where boomgrno ='A20200700343';

select * from biintmt b where depcd = 'G240';
          



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
	and aa.cd_asset is null;
	


select fa.cd_asset as cdAsset
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
 and fa.tp_asset = '27120'  
 and coalesce(replace(fa.nm_note,'',null),'미사용') in ('미사용','미설치')
 and fa.depcd = 'G240'
 and fa.cd_asset ='A20200700343'
         order by substring(fa.dt_pur, 1, 4), fa.cd_asset
         
         
        select decode(fa.nm_note,'',null) from payphone.fi_asset fa
 where 1=1 and fa.depcd = 'G240';

select * from fi_asset fa where cd_asset in ('A20200700343');
 
select * from refep_fi_asset rfa where cd_asset in ('A20200700343');

select * from refep_fi_dpbase rfd  where cd_asset in ('A20200700025','A20200700041','A20200700343');

select * from bimastercf b where usrcd ='03791';


				select cd_asset, cd_company,st_asset, ym_dpasset,
				row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
				from payphone.refep_fi_dpbase;
				
			
			
	select fas.cd_asset,fas.cd_mngdept,fas.nm_size,nm_note from payphone.refep_fi_asset fas
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
		and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	minus    
	select cd_asset,cd_mngdept,nm_size ,nm_note 
	from payphone.fi_asset
	
	update fi_asset set
	nm_note = '미사용'
	where cd_asset = 'A20200700343'
;

update refep_fi_asset set
nm_note = '미사용'
where cd_asset  = 'A20200700343';

update pt_factmt pf  set 
lstdt = to_char(now(),'yyyymmddhh24miss') 
where fact_telno in ('005405366378','005405340822','005405321399','000203930149','003205615893');

SELECT
			         CASE
			         	WHEN fac.blddt BETWEEN '20210325' AND '20210325' THEN '신규'
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
--			<!-- 	LEFT OUTER JOIN ( SELECT boounino, count(boounino) AS cnt
--								  FROM pt_factmt
--								  WHERE status = '1' 
--								  	AND fact_knd = '2'
--								  GROUP BY boounino
--								) atm 
--					ON atm.boounino = fac.boounino -->
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20210325' AND '20210325'
				and fac. fact_telno in ('005405366378','005405340822','005405321399','000203930149','003205615893');

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
			         	WHEN fac.blddt BETWEEN '20210325' AND '20210325' THEN '신규'
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
--			<!-- 	LEFT OUTER JOIN ( SELECT boounino, count(boounino) AS cnt
--								  FROM pt_factmt
--								  WHERE status = '1' 
--								  	AND fact_knd = '2'
--								  GROUP BY boounino
--								) atm 
--					ON atm.boounino = fac.boounino -->
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20210325' AND '20210325'
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
--				<!-- LEFT OUTER JOIN ( SELECT boounino, count(boounino) AS cnt
--								  FROM pt_factmt
--								  WHERE status = '1' 
--								  	AND fact_knd = '2'
--								  GROUP BY boounino
--								) atm 
--					ON atm.boounino = fac.boounino -->
				WHERE 1=1
					AND fac.uniind = '1'
					AND fac.opflag = 'D'
					AND fac.lstdt IS NOT NULL
					AND fac.bldloc1 <> '52'and fac.bldzip NOT IN ('24139','17511')
					AND substr(fac.lstdt, 0, 8) BETWEEN '20210325' AND '20210325'
					)
				ORDER BY fact_telno, lstdt desc;
 
			
			select * from biintmt b where dephighcd ='I210';
			-- I210 동대구 
		
		   select * from biintmt where depcd like 'I100';
		   
		  select * from pt_boothmt pb  where boounino  in (
		  select boounino from pt_factmt pf  where ktdepcd  = 'I06010');
		  
		 select boounino from pt_factmt pf  where ktdepcd  = 'I06010';
		 
		 select boounino from pt_factmt pf  where ktdepcd  = 'I06010';
		
		 select * from pt_bldplc pb  where bldplcno in (select bldplcno from pt_factmt pf  where ktdepcd  = 'I06010');
		 
		select * from pt_bldplc where bldplcno in (
		 select bldplcno from pt_boothmt pb  where boounino  in (
		  select boounino from pt_factmt pf  where ktdepcd  = 'I06010')
		  );
		  
		 
		 select * from tb_repair tr where gojang_tel  = '003209335947';
		select * from tb_maintain tm  where jungtel = '003209335947' and jungdt like '20210331%'; 
	
	select * from tb_loginlog tl where login_usr  = '01409' and login_dt  like '20210331%'; 
		
		 select * from bimastercf b where usrname  = '최영철'; 
		 
		select * from user_source where text like '%jubsu@oracpms%';
	
	PROC_GETGUARD_T_JUBSU
	
	proc_getcpms_tc_cpmsmt;
	
	PROC_SETGUARD_T_JUBSU_TRIGUPDATE;
		
	PROC_GETGUARD_T_JUBSU_TEMP
	PROC_GETCPMS_T_JUBSU;
	


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
					 and b.fact_knd = '1'
					-- and c.ft_use = '1'
					 and (a.wanro_flag = '0' or a.wanro_flag is null)
                        and b.fact_telno   = '003209335947'
				) a
				where req_cnt = 0
			) b
			; 
			
		select * from tb_repair where gojang_tel   = '003209335947' and rev_date like '20210331%';
		
	select * from pt_factmt pf where fact_telno  = '003209335947' and fact_knd = '1';
	

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
		 				,  a.rev_seq
					  from payphone.tb_repair a, payphone.PT_FACTMT b
					 left outer join payphone.pt_bldplc c on b.bldplcno = c.bldplcno
					 where 1=1
					 and a.gojang_tel = b.fact_telno
					 and b.fact_knd = '1'
					-- and c.ft_use = '1'
					 and (a.wanro_flag = '0' or a.wanro_flag is null)
                        and b.fact_telno   = '003209335947';
			
				
			select * from tb_repairset tr ;
			
			select * from tb_maintain where jungtel ='003209335947';
		
		select get_suricd(10);
	
	select to_date('20210331143702','yyyymmddhh24miss');
	
	select *
	from payphone.bibsici
	where lcd = '2057' and scd=10;

select * from tb_repair where suri_cd ='32001' and rev_date  ='20210331';
		
update T_JUBSU@oracpms set


select rev_seq, suri_cd, suri_des, wan from tb_repair tr  where rev_seq in (
130355, 130399)

select * from tb_repair tr  where rev_seq  in (
select rev_seq from tb_maintain tm where jungdt like '20210331%' and rev_seq != 0) and wanro_flag = '0';

			select * from tb_maintain where rev_seq ='130355';

update payphone.tb_repair
           set lstdt = to_char(now(), 'YYYYMMDDhh24miss')
             , lstusr = '01189'
             , wan_date = substring('20210331100131', 1, 8)
             , wan_time = substring('20210331100131', 9, 6)
             , suri_cd = get_suricd('10')
             , suri_des = '표준정비'
             ,wanro_flag = '2'
         where rev_seq = '130355'
         
         ;
        
         select * from pg_available_extensions where name like '%tds%';
         
        
        select * from user_source where text like '%biitmastercf%';
       
       select * from biitmastercf b ;

  select * from    tmp_bimastercf where usrcd  ='admin';
      
       vw_mergehr_bimastercf
       select * from bimastercf b2 where usrcd = 'admin' ;
       
       PROC_GETHR_BIMASTERCF
        
       
       CREATE OR REPLACE VIEW payphone.vw_mergehr_bimastercf
AS SELECT biitmastercf.usrcd,
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
UNION ALL
 SELECT vw_payphone_bimastercf.usrcd,
    vw_payphone_bimastercf.usrname,
    vw_payphone_bimastercf.depcd,
    vw_payphone_bimastercf.dephighcd,
    vw_payphone_bimastercf.bsnind,
    vw_payphone_bimastercf.gubun,
    to_char(sysdate, 'yyyymmddhh24miss'::character varying) AS lstdt,
    replace(vw_payphone_bimastercf.hp_no::text, '-'::text, ''::text) AS hp_no
   FROM vw_payphone_bimastercf @ orahr(usrcd character varying(10), usrname character varying(40), depcd character varying(50), dephighcd character varying(50), bsnind character(1), gubun numeric, lstdt character varying(14), hp_no character varying(4000))
UNION ALL
 SELECT tb_admin.usrcd,
    tb_admin.usrname,
    tb_admin.depcd,
    tb_admin.dephighcd,
    tb_admin.bsnind,
    to_number(tb_admin.gubun::text) AS gubun,
    tb_admin.lstdt,
    tb_admin.hp_no
   FROM tb_admin;
   
  update tb_admin ta set
  ta.hp_no = '01031380455',
  lstdt = to_char(now(),'yyyymmddhh24miss')
  where usrcd ='admin'
  ; 
  
 select * from pt_areamt pa where "call" ='01028709800';
 
select * from bimastercf b where usrcd = '00933';

select * from pt

select * from tb_repair tr;


select * from tb_loginlog tl where login_dt like '20210416%' and login_usr  = '00933'; 

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
                     and a.updepcd  = 'O000'     
                     and a.depcd1    = 'O220' 
					 and a.jumgumja_id = '00933'
					 and b.fact_knd = '1'
					-- and c.ft_use = '1'
					 and (a.wanro_flag = '0' or a.wanro_flag is null) 
					 	and rev_cd = '2'
				) a
				where req_cnt = 0
			) b
			order by rn
			; 
			
		select * from cpms 고장 