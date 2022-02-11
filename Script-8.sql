SELECT * FROM pg_stat_activity ORDER BY query_start ASC;


  update  payphone.tb_repair a set a.jumgumja_id = b.jumgumja_id, a.jumgumja_des=b.jumgumja_des, a.hochul_tel = b.hochul_tel, a.suri_cd = b.suri_cd, a.suri_des = b.suri_des, a.wan_date = b.wan_date, a.wan_time= b.wan_time, 
            a.hochul_date = b.hochul_date , a.hochul_time = b.hochul_time, a.wanro_flag = b.wanro_flag , a.hochul_gb = b.hochul_gb  
    from (select a.rev_date,a.rev_time,a.jubsu_no,a.jumgumja_id,(select c.usrname from bimastercf c where c.usrcd =a.jumgumja_id) jumgumja_des,a.hochul_tel,a.suri_cd,a.suri_des, a.wan_date,a.wan_time,a.hochul_date, a.hochul_time,wanro_flag,hochul_gb FROM t_jubsu@oracpms a
          where a.rev_date  >= to_char(current_date-7,'YYYYMMDD')
          minus
         select rev_date,rev_time,jubsu_no,jumgumja_id,jumgumja_des,hochul_tel,suri_cd,suri_des, wan_date,wan_time,hochul_date, hochul_time,wanro_flag,hochul_gb FROM tb_repair
          where rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2') b
    where a.jubsu_no = b.jubsu_no and a.rev_date= b.rev_date and a.rev_time = b.rev_time
    and a.rev_date  >= to_char(current_date-7,'YYYYMMDD') and rev_cd ='2';
    
   
   select * from payphone.pt_boothmt pb where status ='1' and boounino  in (select boounino from payphone.pt_factmt pf where uniind ='1')
   
   select * from user_source where text like '%fi_asset%'
   
   PROC_ERPUPDATE_FI_ASSET
   
  PROC_AUTOTERMINATE_FACTMT 
  
  PROC_CHANGE_PT_FACTMT
  
  
  
 select cd_asset,nm_model,nm_note 
     from  fi_asset 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
     
    select * from payphone.pt_bldplc pb2  where bldplcno  in(
    select  bldplcno from payphone.pt_boothmt pb where boomgrno in
    (select cd_Asset from
   ( select cd_asset ,nm_note from 
(
/*select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
*/
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1'
)
minus
select cd_asset ,nm_note from REFEP_fi_asset ) where nm_note is null
)
)

select * from payphone.pt_factmt pf where boounino in (
select boounino from pt_boothmt pb where boomgrno in  (select cd_Asset from
   ( select cd_asset ,nm_note from 
(
select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1'
)
minus
select cd_asset ,nm_note from REFEP_fi_asset ) where nm_note is null
))

select * from pt_factmt pf where bldplcno ='0000026475'

select * from pt_boothmt pb where bldplcno ='0000026475'

select * from  fi_asset_T@oraerp 

     select cd_asset,nm_model,nm_note 
     from  fi_asset 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;

select cd_asset,nm_note, nm_model from refep_fi_asset rfa where cd_asset ='B201706010902'

select fact_telno ,bldplcno, get_bldplcnm(bldplcno),uniind from payphone.pt_factmt pf where phonemgrno ='T004202716105'

select * from pt_bldplc pb where bldplcno ='2009123806'


select * from refep_fi_asset where nm_size like '°õ%'

select * from refep_fi_dpbase rfd where 

SELECT fas.cd_asset
	FROM payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	
	
	
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
	and fas.cd_asset ='T006102873045'
	
	select fas.cd_asset,fas.cd_mngdept,fas.nm_size from payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
minus    
select cd_asset,cd_mngdept,nm_size 
from payphone.fi_asset
	
	select * from fi_asset fa where cd_asset ='T006102873045'
	
	select * from refep_fi_asset rfa where cd_asset ='T006102873045'
	
	select proc_geterp_fi_asset();
	

	

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

select * from fi_asset fa where cd_asset like 'A2019060000%' and tp_asset in ('27110', '27120', '27520', '27522');
	
	select * from payphone.refep_fi_asset rfa where cd_asset ='A20190600005'
	
	select * from payphone.refep_fi_dpbase rfd where cd_asset like 'A20190600001';



update payphone.fi_asset a set a.cd_mngdept = b.cd_mngdept , a.nm_size = b.nm_size  ,a.depcd =''
from (select fas.cd_asset,fas.cd_mngdept,fas.nm_size from payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
minus    
select cd_asset,cd_mngdept,nm_size 
from payphone.fi_asset) b
where a.cd_asset = b.cd_asset;

select * from (select fas.cd_asset,fas.cd_mngdept,fas.nm_size from payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
where fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
minus    
select cd_asset,cd_mngdept,nm_size 
from payphone.fi_asset)


update payphone.fi_asset a set a.depcd = b.depcd
from
(select cd_asset,(select depCD from payphone.biintmt where org_cd = cd_mngdept) DEPCD from payphone.fi_asset
minus
select cd_asset,DEPCD from payphone.fi_asset
) b
where a.cd_asset = b.cd_asset;

select * from payphone.refep_fi_asset 
where cd_asset in (
SELECT fas.cd_asset
	FROM payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522'));



delete from payphone.fi_asset
where cd_asset in (
SELECT fas.cd_asset
	FROM payphone.refep_fi_asset fas
	left outer join payphone.refep_fi_dpbase fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522'));
	

select * from payphone.tb_user_password tup where usrcd ='admi2'