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
			         	WHEN fac.blddt BETWEEN '20201028' AND '20201029' THEN '신규'
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
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201028' AND '20201029'
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
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201028' AND '20201029' )
					where lstdt 
		ORDER BY fact_telno, lstdt desc
		
		
		
		 SELECT
			         CASE
			         	WHEN fac.blddt BETWEEN '20201028' AND '20201029' THEN '신규'
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
					 , fac.lstdt
					 , boo.lstdt 
					 , bld.lstdt 
				FROM pt_factmt fac
			 	INNER JOIN pt_boothmt boo 
			 		ON fac.boounino = boo.boounino
				INNER JOIN pt_bldplc bld 
					ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511')
				WHERE 1=1
					AND fac.uniind = '1' 
					AND fac.fact_knd = '1'
					AND (
					(substr(fac.lstdt, 0, 8) BETWEEN '20201028' AND '20201029')
					or 
					(substr(boo.lstdt, 0, 8) BETWEEN '20201028' AND '20201029')
					or
					(substr(bld.lstdt, 0, 8) BETWEEN '20201028' AND '20201029')
					)
					;
					
					--and fac.lstdt = '20201029170236'
					
					
					
					
					select * from pt_factmt fac	INNER JOIN pt_boothmt boo 
			 		ON fac.boounino = boo.boounino
				INNER JOIN pt_bldplc bld 
					ON fac.bldplcno = bld.bldplcno
						AND bld.bldloc1 <> '52'and bld.bldzip NOT IN ('24139','17511') 
						where fac.unino in (select unino from pt_factmt_h pfh where opdt ='20201029170236') and fac.fact_knd ='1' and fac.uniind ='1'
					AND substr(fac.lstdt, 0, 8) BETWEEN '20201028' AND '20201029'
					
					
					select * from pt_bldplc pb where
					
				/*	
					update pt_factmt pf  set 
					lstdt = to_char(now(),'yyyymmddhh24miss') 
					where
					 bldplcno  in (
					select  bldplcno from pt_bldplc_h pbh where opdt like '20201021103940%' and pp_etcfac is null and opflag ='U' and uniind ='1' group by bldplcno)
					and lstdt  < '20201021000000';
				*/
					
					select * from 
				
					--create table pt_Factmt20201029 as select * from pt_factmt pf; 4354
					
					select * from pt_factmt_h pfh where opdt ='20201029170236';
					
				select * from pt_Factmt20201029 		where
					 bldplcno  in (
					select  bldplcno from pt_bldplc_h pbh where opdt like '20201021103940%' and pp_etcfac is null and opflag ='U' and uniind ='1' group by bldplcno)
					and lstdt  < '20201021000000';
				
				
				
					--20201021103940 20201016015903 20201015015903
					
				select pp_etcfac from pt_bldplc_h pb  where opdt ='20201009015903'; 
			
			
			select * from payphone.pt_factmt pf  where fact_telno in ('004307319185', '005509640263','003205412052')
			
				
			select * from payphone.pt_factmthist pf  where fact_telno ='005509640263'
			
			select * from pt_factmt@oraktlpt where unino ='82741';
		
		select * from tc_cpmsmt@oracpms tc where tel_no in ('004307319185', '005509640263','003205412052')
			
		select * from tc_err_report ter where tel_no ='005509640263';
			
	select * from tc_cpmsmt@oracpms where tel_no = '005509640263';
			

select * from bimastercf tb  where usrcd ='sg123';

select * from tmp_bimastercf b2 where usrcd ='sg123';

PROC_GETHR_BIMASTERCF

	select count(*) into retrow from payphone.tmp_bimastercf;


	SELECT usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	FROM payphone.vw_mergehr_bimastercf;

	SELECT usrcd, usrname, depcd, dephighcd, bsnind, gubun, lstdt, hp_no
	FROM payphone.vw_mergehr_bimastercf;

select * from user_source where text like '%tb_admin%';

select * from tb_user_password tup where usrcd ='sg123';
--01099205858 General

select * from tb_admin ta; 

select * from bimastercf b3  where usrcd ='sg123';

select * from tb_smartpush ts where usrcd ='sg123';

select * from sms_msg@oraguard where hochul_id ='sg123';

 SELECT tb_admin.usrcd,
    tb_admin.usrname,
    tb_admin.depcd,
    tb_admin.dephighcd,
    tb_admin.bsnind,
    to_number(tb_admin.gubun::text) AS gubun,
    tb_admin.lstdt,
    tb_admin.hp_no
   FROM tb_admin;

 SELECT vw_payphone_bimastercf.usrcd,
    vw_payphone_bimastercf.usrname,
    vw_payphone_bimastercf.depcd,
    vw_payphone_bimastercf.dephighcd,
    vw_payphone_bimastercf.bsnind,
    vw_payphone_bimastercf.gubun,
    to_char(sysdate, 'yyyymmddhh24miss'::character varying) AS lstdt,
    replace(vw_payphone_bimastercf.hp_no::text, '-'::text, ''::text) AS hp_no
   FROM vw_payphone_bimastercf @ orahr(usrcd character varying(10), usrname character varying(40), depcd character varying(50), dephighcd character varying(50), bsnind character(1), gubun numeric, lstdt character varying(14), hp_no character varying(4000))

   	
   select * from fi_asset fa; -- 자산목록
  
  select * from refep_fi_asset rfa ;
 
 select phonemgrno from payphone.pt_factmt pf; 
   
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
          
          
          select * from payphone.fi_asset fa where cd_asset  ='A20190800010';
          
         select * from fi_bizcar_mant;
        
         select * from payphone.fi_bizcaramt_mng fbm  where yyyymm = '202010'; 
        
        
        jobGetErpFiBizCarAmt
        
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
			  	                    and yyyymm between '202001'
 and '202011'
	                 			  group by cd_bizcar
 		) fbm
 	where fb.cd_bizcar = fbm.cd_bizcar(+)
 and fb.cd_bizcar  = fibm.cd_bizcar(+);
         
select * from tb_user_password tup  where usrcd ='admi2';

select payphone.proc_getcpms_tc_cpmsmt();


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
	from payphone.tc_cpmsmt;
	
select * from dba_db_links;



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
and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522'));

select phonemgrno cd_asset,get_bldplcnm(bldplcno) nm_note,fact_telno nm_model from payphone.pt_factmt
where phonemgrno is not null
and phonemgrno !=''
union all
select boomgrno cd_asset,get_bldplcnm(bldplcno) nm_note,bldplcno nm_model from payphone.pt_boothmt
where boomgrno is not null
and boomgrno !=''
and status ='1';

select * from fi_asset fa2 where cd_asset  in
(select phonemgrno from pt_factmt pf where phonemgrno != '' and phonemgrno is not null
minus 
select cd_asset from fi_asset fa ); 

select phonemgrno from pt_factmt pf where phonemgrno != '' and phonemgrno is not null
minus 
select cd_asset from fi_asset fa 
