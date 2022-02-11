select * from payphone.tb_user_password tup where usrcd ='99999'

select count(1) from payphone.fi_bizcaramt_mng fbm where cd_bizcar ='영남_진주_83도2027' and yyyymm ='202005'

select * from tb_msg tm 

fi_asset

select * from payphone.fi_bizcaramt_mng

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
			 and yyyymm between '202005'
 and '202005'
	                 			  group by cd_bizcar
 		) fbm
 	where fb.cd_bizcar = fbm.cd_bizcar(+)
 and fb.cd_bizcar  = fibm.cd_bizcar(+)
 
 	UPDATE payphone.tb_batch SET jobexecdt=to_char(now(), 'yyyymmddhh24miss'::text)
	WHERE jobclassid='jobGetchgptfactmt';
 

select * from tb_batch tb;

select * from payphone.tb_joblog tj ; 

select * from payphone.pt_boothmt pb where status ='0';


select phonemgrno,bldplcno, get_bldplcnm(bldplcno) from pt_factmt pf 
minus 

select cd_asset, nm_model, nm_note from fi_asset fa where cd_asset like 'T%' 

select * from pt_areamt_h pah  where opdt like '202009%'--where --opdt --like '20200929%'


 select fact_telno as factTelNo
 from payphone.pt_factmt
 where 1=1 --status   <>   '2'
 and fact_telno = '006103620927'
         limit 1
         
         
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
 
 
 select * from payphone.pt_bldplc pb where pp_etcfac is null;