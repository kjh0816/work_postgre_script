

select        log_dtm logDtm,         get_depnm(updepcd,2) upDepNm,        get_depnm(depcd,3) depNm,        get_ktdepcdnm(ktdepcd) ktDepNm,         (select usrname from payphone.bimastercf where usrcd = areausr) as areaUsr,        tel_no as factTelNo,        get_phonegb_prnm(phoneknd) prNm,        bldplcnm as bldPlcNm,        amt amt,        pre_amt as preAmt,        amt_minus as minusAmt,        pre_log_dtm as preLogDtm,        log_err_id logErrId,        pre_err_id preErrId,        description description      from payphone.t_log_des_v        where 1=1                             and log_dtm between '20220101' and '20220105'                                                                                     and amt_minus  >=   '0'::NUMERIC

select * from payphone.t_log_des_v;

select * from payphone.vw_tc_cpmssave_ora;


select
	(
	select
		depnm
	from
		payphone.biintmt
	where
		depcd = a.updepcd
		and deptreecnt in ('1', '2', '3', '4')) upDepNm,
	(
	select
		depnm
	from
		payphone.biintmt
	where
		depcd = a.depcd
		and deptreecnt in ('1', '2', '3', '4')) depNm,
	(
	select
		depnm
	from
		payphone.bitelmt
	where
		ktdepcd = a.ktdepcd) ktDepNm,
	(
	select
		MIN(AREANM)
	from
		payphone.PT_AREAMT
	where
		DEPCD = a.depcd
		and UNIIND = a.uniind
		and AREA = a.area
		and area_use = 'Y') areaNm,
	(
	select
		usrname
	from
		payphone.bimastercf
	where
		usrcd = (
		select
			areausr
		from
			payphone.pt_areamt pa
		where
			DEPCD = a.depcd
			and UNIIND = a.uniind
			and AREA = a.area
			and area_use = 'Y' )) areaUsr,
	a.fact_telno as factTelNo,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0242'
		and scd = a.phoneknd) prNm,
	(
	select
		bldplcnm
	from
		payphone.pt_bldplc
	where
		bldplcno = a.bldplcno) bldPlcNm,
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
		tel_no,
		sum(b.city_amt) city_amt,
		sum(b.otct_amt) otct_amt,
		sum(b.word_amt) word_amt,
		sum(b.t114_amt) t114_amt,
		sum(b.down_amt) down_amt,
		sum(b.amount) amount,
		sum(b.etc_amt) etc_amt,
		sum(b.total_amt) total_amt
	from
		payphone.tc_month_v b
	where
		1 = 1
		and b.yyyymm between '20220101' and '20220105'
	group by
		tel_no ) b ,
	(
	select
		unino
	from
		payphone.tc_cpmssave_ora
	where
		1 = 1
		and (save_dtm between '20220105' || '000000' and '20220105' || '235959')
			or (close_date >= '20220105' || '000000'
				and save_dtm <= '20220105' || '000000') ) c
where
	1 = 1
	and a.fact_telno = b.tel_no(+)
	and a.unino = c.unino(+)
	and ( a.REMODT >= '20220101'
		or a.REMODT is null
		or a.REMODT = '')
	and total_amt <= '50000'::numeric
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

select
	(
	select
		depnm
	from
		payphone.biintmt
	where
		depcd = A.updepcd
		and deptreecnt in ('1', '2', '3', '4')) upDepNm,
	(
	select
		depnm
	from
		payphone.biintmt
	where
		depcd = A.depcd
		and deptreecnt in ('1', '2', '3', '4')) depNm,
	(
	select
		depnm
	from
		payphone.bitelmt
	where
		ktdepcd = A.ktdepcd) ktDepNm,
	(
	select
		MIN(AREANM)
	from
		payphone.PT_AREAMT
	where
		DEPCD = A.depcd
		and UNIIND = B.uniind
		and AREA = A.area
		and area_use = 'Y') areaNm,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0242'
		and scd = A.phoneknd) prNm,
	B.fact_telno factTelNo,
	(
	select
		bldplcnm
	from
		payphone.pt_bldplc
	where
		bldplcno = A.bldplcno) bldPlcNm,
	A.curinf_dtm curInfDtm,
	A.CURINF_ORD curInfOrd,
	(
	case
		when TRIM(A.CURINF_ORD) = '고장' then decode(A.ST_POWER, '1', '전원 ', '')|| decode(A.ST_LINE, '1', '선로 ', '')|| decode(A.ST_COINMACH, '1', '주화처리장치 ', '')|| decode(A.ST_BOXOUT, '1', '금고통이탈 ', '')|| decode(A.ST_KEYPAD, '1', '키패드 ', '')|| decode(A.ST_CRDREAD, '1', '카드리더 ', '')|| decode(A.ST_COINSLOT, '1', '주화투입구 ', '')|| decode(A.ST_HANDSET, '1', '송수화기 ', '')|| decode(A.MS_MEMORY, '1', '메모리오류 ', '')|| decode(A.MS_CTC, '1', 'CTC ', '')|| decode(A.MS_FEEERR, '1', '요금이상 ', '')|| decode(A.MS_READCON, '1', '판독연속 ', '')|| decode(A.ST_DISPLAY, '1', '표시부 ', '')|| decode(A.ST_MODEM, '1', '모뎀 ', '')|| decode(A.ST_VOICEINF, '1', '음성안내 ', '')|| decode(A.ST_LOOFLEL, '1', '루프계전기 ', '')
		when TRIM(A.CURINF_ORD) = '충만' then '갯수:' || TO_CHAR(A.COINFULL_CNT)|| ' 금액:' || TO_CHAR(A.COINFULL_AMT, '999,999')|| ' 율:' || TO_CHAR(A.COINFULL_RATE)|| '%'
		when TRIM(A.CURINF_ORD) = '교체' then '금액:' || TO_CHAR(A.CURBOX_AMT, '999,999')
	end ) as curInfDes,
	decode(A.coinfull_amt, null, '', A.coinfull_amt) coinFullAmt,
	decode(A.coinfull_rate, null, '', 0, '', A.coinfull_rate || '%') coinFullRate,
	(
	case
		when TRIM(A.REMOVE_OX) = '0' then '미등록'
		when TRIM(A.REMOVE_OX) = '1' then '사용중'
		when TRIM(A.REMOVE_OX) = '2' then '해지'
		when TRIM(A.REMOVE_OX) = '3' then '철거'
	end ) as removeNm,
	A.sw_ver swVer,
	A.prod_co prodCo,
	A.prod_dt prodDt,
	C.save_dtm saveDtm,
	C.close_date closeDate,
	C.dsec as "desc"
from
	payphone.TC_CPMSMT A,
	payphone.PT_FACTMT B,
	payphone.vw_tc_cpmssave_ora C
where
	A.REMOVE_OX not in ('2', '3')
	and A.unino = C.unino(+)
	and C.save_dtm(+) <= to_char(current_date, 'YYYYMMDD')|| '%'
	and C.close_date(+) >= to_char(current_date, 'YYYYMMDD')|| '%'
	and A.CURINF_DTM >= to_char(current_date, 'YYYYMMDD')|| '%'
	and A.UNINO = B.UNINO(+)
	and A.CURINF_DTM is not null
order by
	A.CURINF_DTM
	
	
	
	
	
	SELECT
TEL_NO
, LOG_DTM 
, PHONEKND 
, UPDEPCD 
, DEPCD 
, KTDEPCD 
, AREA 
, AREAUSR 
, LOG_DESC 
, SUCC_OX 
FROM 
payphone.TC_LOG tl;
	
--	oracle cpms db에 접속하기
	
	-- 서버를 생성(=DB 링크 생성) FDW는 필수
	CREATE SERVER oracpms
	FOREIGN DATA WRAPPER oci_dblink
	OPTIONS (connstr '//10.100.1.16:1521/CPMS')
	
	-- 서버에 유저를 맵핑한다.
	
	CREATE USER MAPPING
	FOR public
	SERVER oracpms
	OPTIONS (user 'ktlcpms', obfuscated_password 'zvC+9BX7aCqC22PTOkT9qA==')
	
	

	
--	drop table payphone.tc_log;
	
	-- foreign table 생성 (정상적으로 연결되었다면, 해당 테이블 아이콘에 녹색 연결 아이콘이 생긴다.)
	
	CREATE FOREIGN TABLE payphone.tc_log (
	seq numeric NOT NULL,
	tel_no varchar(12) NULL,
	log_dtm varchar(14) NULL,
	phoneknd varchar(4) NULL,
	updepcd varchar(4) NULL,
	depcd varchar(4) NULL,
	ktdepcd varchar(6) NULL,
	area varchar(4) NULL,
	areausr varchar(5) NULL,
	log_desc varchar(4) NULL,
	succ_ox varchar(1) NULL,
	log_err_id varchar(4) NULL,
	log_gubun varchar(1) NULL,
	"package" varchar(300) NULL,
	lstdt varchar(14) NULL,
	lstusr varchar(5) NULL,
	res1 varchar(20) NULL,
	res2 varchar(20) NULL
)
SERVER oracpms
OPTIONS (table 'tc_log');