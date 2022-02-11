
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
	from payphone.tc_cpmsmt_ft
minus
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
	FROM TC_CPMSMT_V@oracpms;
	


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
	FROM tc_cpmsmt_ft 
	union
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
	from tc_cpmsmt@oracpms tc; 
 ;

		update  payphone.tc_cpmsmt set
			remove_ox ='2',
			remove_dt = to_char(now(),'YYYYMMDD') 
		where unino not in (select unino from tc_cpmsmt_v@oracpms) 
		and remove_ox != '2';
		
	tc_cpmsmt
	
	select payphone.proc_getcpms_tc_cpmsmt();
	
CREATE FOREIGN TABLE payphone.tc_cpmsmt_ft (
   updepcd varchar(4) NOT NULL,
	tel_no varchar(12) NOT NULL,
	unino numeric NOT NULL,
	unino_stat varchar(2) NULL,
	depcd varchar(4) NULL,
	phoneknd varchar(4) NULL,
	ktdepcd varchar(6) NULL,
	area varchar(4) NULL,
	areausr varchar(5) NULL,
	bldplcno varchar(10) NULL,
	instusr varchar(5) NULL,
	remousr varchar(5) NULL,
	tel_id varchar(5) NULL,
	sw_ver varchar(30) NULL,
	prod_co varchar(30) NULL,
	prod_dt varchar(8) NULL,
	curinf_dtm varchar(14) NULL,
	curinf_ord varchar(4) NULL,
	curinf_err_id varchar(3) NULL,
	coinfull_ox varchar(1) NULL DEFAULT '0'::character varying,
	coinfull_dtm varchar(14) NULL,
	coinfull_cnt numeric(6) NULL,
	coinfull_amt numeric(10) NULL,
	coinfull_rate numeric(6) NULL,
	faultrep_dtm varchar(14) NULL,
	fault_ox varchar(1) NULL DEFAULT '0'::character varying,
	fault_dtm varchar(14) NULL,
	st_power bpchar(1) NULL DEFAULT '0'::bpchar,
	st_line bpchar(1) NULL DEFAULT '0'::bpchar,
	st_coinmach bpchar(1) NULL DEFAULT '0'::bpchar,
	st_boxout bpchar(1) NULL DEFAULT '0'::bpchar,
	st_keypad bpchar(1) NULL DEFAULT '0'::bpchar,
	st_crdread bpchar(1) NULL DEFAULT '0'::bpchar,
	st_coinslot bpchar(1) NULL DEFAULT '0'::bpchar,
	st_handset bpchar(1) NULL DEFAULT '0'::bpchar,
	ms_memory bpchar(1) NULL DEFAULT '0'::bpchar,
	ms_ctc bpchar(1) NULL DEFAULT '0'::bpchar,
	ms_feeerr bpchar(1) NULL DEFAULT '0'::bpchar,
	ms_readcon bpchar(1) NULL DEFAULT '0'::bpchar,
	ms_readacc bpchar(1) NULL DEFAULT '0'::bpchar,
	st_display bpchar(1) NULL DEFAULT '0'::bpchar,
	st_modem bpchar(1) NULL DEFAULT '0'::bpchar,
	st_voiceinf bpchar(1) NULL DEFAULT '0'::bpchar,
	st_looflel bpchar(1) NULL DEFAULT '0'::bpchar,
	rmsend_state varchar(1) NULL,
	rmsend_err_id varchar(3) NULL,
	rmload_dtm varchar(14) NULL,
	rmacep_dtm varchar(14) NULL,
	remove_ox varchar(1) NULL,
	remove_dt varchar(8) NULL,
	curexc_dtm varchar(14) NULL,
	curcard_dtm varchar(14) NULL,
	curbox_amt numeric(10) NULL,
	second_dtm varchar(14) NULL,
	second_ord varchar(1) NULL,
	second_ox varchar(1) NULL,
	second_err_id varchar(3) NULL,
	second_stop varchar(1) NULL DEFAULT '1'::character varying,
	faultinf_dtm varchar(14) NULL,
	rep_dtm varchar(14) NULL,
	feeunit_seq varchar(2) NULL,
	cpms_lstdt varchar(14) NULL,
	cpms_lstusr varchar(5) NULL,
	res1 varchar(20) NULL,
	res2 varchar(20) NULL,
	res3 varchar(20) NULL,
	res4 varchar(20) NULL,
	res5 varchar(20) NULL,
	res6 varchar(20) NULL,
	res7 varchar(20) NULL,
	res8 varchar(20) NULL,
	old_updepnm varchar(10) NULL,
	old_depnm varchar(10) NULL,
	old_ktdepnm varchar(10) NULL,
	old_phonekndnm varchar(10) NULL,
	old_exmhodnm varchar(10) NULL,
	old_bldplcnm bpchar(20) NULL,
	old_blddt timestamp NULL,
	old_care bpchar(10) NULL,
	old_areausr bpchar(5) NULL,
	old_areausrnm bpchar(10) NULL,
	old_remove_ox varchar(1) NULL,
	old_remove_dt varchar(8) NULL,
	acccnt_dtm varchar(14) NULL,
	gubun bpchar(1) null
	)
SERVER oracpms
OPTIONS (table 'TC_CPMSMT');


select * from TC_CPMSMT@oracpms;

select * from icis_rcv_hist where rcv_Date like '20210420%';

select * from pt_ttcobalance pt where depcd ='I230' and ssdt like '2021%' and ktdepcd ='M06000'; 

select * from user_source where text like '%DTM%';


PROC_GETKTLPT_PT_TTCOSSDD_DAY;

select * from dtm_calendar dc  ; 


PROC_BATCH_TB_MAINTAIN_SCHEDULE;