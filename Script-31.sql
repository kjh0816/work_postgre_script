-- 2022-02-11
-- 02-09에 실행한 INSERT문
-- pt_factmt에는 존재하는 데이터가 pt_fatmthist에는 존재하지 않는 기이한 현상이 발생해서, 기관 정보 등이 불러와지지 않는 문제가 발생했다.
-- 강제로 아래 쿼리를 실행시켜서 pt_factmthist에 데이터를 넣어줬다.
--INSERT INTO payphone.pt_factmthist
--(			unino, uniind, fact_telno, blddt, remodt, remorsn, remorsnnm, sttdt, lstdt, status
--			, opflag, updepcd, updepnm, depcd, depnm, accdepcd, accdepnm, ktdepcd, ktdepnm, upktdepcd
--			, area, areanm, areausr, asrausrnm, asrausrphone, phonemgrno, phoneknd, phonekndnm, phgb, phgbnm
--			, bldknd, bldkndnm, recvind, recvindnm, factgb, factgbnm, booserno, army_nm, boomgrno, boocon
--			, booconnm, booknd, bookndnm, boodoorind, boodoorindnm, booblddt, road_amt, elec_amt, litest1, litest1nm
--			, litest2, litest2nm, litest3, litest3nm, etvoltcd, etvoltcdnm, etinbld, tpinbld, booremorsn, booremorsnnm
--			, bldplcno, bldplcnm, bldgb, bldgbnm, bldloc3, bldloc3nm, bldloc1, bldloc1nm, bldloc2, bldloc2nm
--			, bldzip, bldadr1, bldadr2, rodadr, gpsx, gpsy, roadaddr,clcyl, clcylnm, sdcyl
--			, sdcylnm , retcyl, retcylnm, land_pr, auto_yn, pp_etcfac, bldaed, bldair, bldbye, bldwifi
--			, lstusr, exmhod, elec_yn, elec_num, road_yn, road_name, elec_depnm, pp_clusr, boounino, custzip
--			, custadr1, custadr2, custcall, custtradnm, gdgb, gdtype, gdcd
--			, road_num, elec_usr, elec_date, road_usr, road_date) -- 신규 추가
--select fac.unino, fac.uniind, fac.fact_telno, fac.blddt, fac.remodt, fac.remorsn
--			, ( select prnm from bibsici where lcd in ( '0908', '0262' ) and scd = fac.remorsn ) as remoRsnNm 
--			, to_char(current_date-1,'yyyymmdd')  as sttdt, '99991231' as lstdt, fac.status
--			, 'U' as opflag, fac.updepcd, payphone.get_depnm( fac.updepcd, '2' ) as upDepNm, fac.depcd, payphone.get_depnm( fac.depcd, '3' ) as depNm 
--			, fac.accdepcd, DECODE( payphone.get_depnm( fac.depcd, '3' ) , null, payphone.get_depnm( fac.depcd, '4' ), payphone.get_depnm( fac.depcd, '3' ) ) as accDepNm 
--			, fac.ktdepcd, payphone.get_ktdepcdnm(fac.ktdepcd) as ktDepNm, fac.upktdepcd 
--			, fac.area as area , arm.areanm as areaNm, arm.areausr, ur.usrname as asraUsrNm, arm."call" as asrUsrPhone 
--			, fac.phonemgrno as phoneMgrNo 
--			, fac.phoneknd as phoneKnd, ( select prnm from payphone.bibsici where lcd = '0628' and scd = fac.phoneknd ) as phoneKndNm 
--			, fac.phgb as phGb, ( select prnm from payphone.bibsici where lcd = '0291' and scd = fac.phgb ) as phGbNm 
--			, fac.bldknd as bldKnd, ( select prnm from payphone.bibsici where lcd = '0271' and scd = fac.bldknd ) as bldkKndNm 
--			, fac.recvind as recvInd, ( select prnm from payphone.bibsici where lcd = '0915' and scd = fac.recvind ) as recvIndNm 
--			, fac.factgb, ( select prnm from payphone.bibsici where lcd = '0278' and scd = fac.factgb ) as factGbNm 
--			, fac.booserno as booSerNo, fac.army_nm as armyNm , boo.boomgrno as booMgrNo, boo.boocon
--			, ( select prnm from payphone.bibsici where lcd = '0250' and scd = boo.boocon ) as booConNm 
--			, boo.booknd, ( select prnm from payphone.bibsici where lcd = '0248' and scd = boo.booknd ) as booKndNm 
--			, boo.boodoorind, ( select prnm from payphone.bibsici where lcd = '0286' and scd = boo.boodoorind ) as booDoorIndNm 
--			, boo.booblddt, fac.road_amt, fac.elec_amt 
--			, boo.litest1, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest1 ) as liTest1Nm
--			, boo.litest2, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest2 ) as liTest2Nm 
--			, boo.litest3, ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest3 ) as liTest3Nm 
--			, boo.etvoltcd, ( select prnm from payphone.bibsici where lcd = '0266' and scd = boo.etvoltcd ) as etVoltCdNm 
--			, boo.etinbld as etInBld , boo.tpinbld as tpInBld 
--			, boo.remorsn, ( select prnm from payphone.bibsici where lcd = '0262' and scd = boo.remorsn ) as booRemoRsnNm 
--			, bld.bldplcno, bld.bldplcnm 
--			, bld.bldgb, ( select prnm from payphone.bibsici where lcd = '0244' and scd = bld.bldgb ) as bldGbNm 
--			, bld.bldloc3, ( select prnm from payphone.bibsici where lcd = '2049' and scd = bld.bldloc3 ) as bldLoc3SmaNm 
--			, bld.bldloc1, ( select prnm from payphone.bibsici where lcd = '0246' and scd = bld.bldloc1 ) as bldLoc1Nm 
--			, bld.bldloc2, ( select prnm from payphone.bibsici where lcd = '0247' and scd = bld.bldloc2 ) as bldLoc2Nm
--			, bld.bldzip as bldZip , bld.bldadr1 as bldAdr1 , bld.bldadr2 as bldAdr2, '' as rodadr, bld.gpsx, bld.gpsy 
--			,bld.roadaddr as roadaddr 
--			, boo.clcyl, ( select prnm from payphone.bibsici where lcd = '0256' and scd = boo.clcyl ) as clCylNm 
--			, boo.sdcyl, ( select prnm from payphone.bibsici where lcd = '0259' and scd = boo.sdcyl ) as sdCylNm 
--			, boo.retcyl, ( select prnm from payphone.bibsici where lcd = '0257' and scd = boo.retcyl ) as retCylNm 
--			, bld.land_pr, bld.auto_yn, bld.pp_etcfac 
--			, substr( bld.pp_etcfac, 1, 1 ) as bldAed , substr( bld.pp_etcfac, 3, 1 ) as bldAir 
--			, substr( bld.pp_etcfac, 5, 1 ) as bldBye , substr( bld.pp_etcfac, 7, 1 ) as bldWiFi
--			, fac.lstusr 
--			, fac.exmhod, bld.elec_yn, fac.elec_num, bld.road_yn, fac.road_depnm, fac.elec_depnm, bld.pp_clusr
--			, fac.boounino, fac.custzip, fac.custadr1, fac.custadr2, fac.custcall, fac.custtradnm
--			, fac.gdgb, fac.gdtype, fac.gdcd
--			, fac.road_num, fac.elec_usr, fac.elec_date, fac.road_usr, fac.road_date -- 신규 추가
--		from payphone.pt_factmt fac
--		left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino
--		left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno and fac.uniind = bld.uniind
--		left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind = fac.uniind and arm.depcd = fac.depcd  and area_use ='Y'
--		left outer join payphone.bimastercf ur on ur.usrcd = arm.areausr
--        where
--		fac.fact_telno  in ('005404428721','005506340790');

-- 2022-02-10
-- 첫재 쿼리 분석 후 두번째 쿼리 완성시켜보자
-- 해석: (1)번 파트만으로 조회가 가능하지 않을지 생각했는데, (1)만으로는(group by 특성상) depnm등 그룹으로 묶인 것 이외에는 검색할 수 없는다.
--      where (그룹으로 묶인 칼럼들) in ((1)서브쿼리)로 가교 역할을 시켜줌으로 가능한 것.
select
get_depnm (depcd ,'3')
, *
from pt_areamt
where (area, depcd ,uniind) in (
-- (1)
select b.area, b.depcd ,b.uniind  
from pt_areamt b 
where b.area_use ='Y'
group by b.area, b.depcd ,b.uniind 
having count(*) > 0
);


-- 해석: area, depcd, uniind의 조합으로 조회했을 때, 해당 3개의 조합이 동일한 로우가 1개 이상 존재하는 구역을 조회한다.
select b.area, b.depcd ,b.uniind  
from pt_areamt b 
where b.area_use ='Y'
group by b.area, b.depcd ,b.uniind 
having count(*) > 0;



select
get_depnm (a.depcd ,'4')
, b.deptreecnt, a.*
from pt_areamt a
join biintmt b
on a.depcd = b.depcd
where b.deptreecnt = '6';

select * from biintmt b ;


select depcd, blddt from pt_factmt
group by depcd, blddt
having count(*) > 1;


-- 2022-02-09
-- 저이용시설이 인사개편 이후 조회되지 않는 문제

select * from bibsici where lcd = '0242';
select * from pt_bldplc;
select * from tc_month_v;

select * from bimastercf where usrcd = '00938';

-- 정비/고장 > 정비 내역 조회 > 

-- 배치 프로시저 에러
-- 오류가 나고 있는 배치: 오라클 상태정보 동기화
select proc_change_pt_factmt();
--SQL Error [21000]: ERROR: more than one row returned by a subquery used as an expression
--  Where: SQL statement "update pt_factmt@oraktlpt a set a.area = b.area , a.areausr = b.areausr
--	from (
--	select a.unino,a.area,(select b.areausr from pt_areamt b where a.area=b.area and a.depcd = b.depcd and a.uniind = b.uniind and b.area_use ='Y') areausr
--	from payphone.pt_factmt a
--	where status ='1'
--	minus
--	select unino,area,areausr from pt_factmt@oraktlpt) B
--	where A.unino = b.unino"
--PL/pgSQL function proc_change_pt_factmt() line 219 at SQL statement

-- 안 돌아가고 있는 배치: ERP 자산 동기화
select proc_geterp_fi_asset();
--SQL Error [21000]: ERROR: more than one row returned by a subquery used as an expression
--  Where: SQL statement "update payphone.fi_asset a set a.depcd = b.depcd
--from
--(select cd_asset,(select depCD from payphone.biintmt where org_cd = cd_mngdept) DEPCD from payphone.fi_asset
--minus
--select cd_asset,DEPCD from payphone.fi_asset
--) b
--where a.cd_asset = b.cd_asset"
--PL/pgSQL function proc_geterp_fi_asset() line 82 at SQL statement


-- TEST
SELECT min(AREANM)	FROM payphone.PT_AREAMT;

SELECT * FROM payphone.PT_AREAMT where areanm = '화천1';



select areanm from payphone.PT_AREAMT;


-- (1)
select
			(select depnm from payphone.biintmt where depcd = a.updepcd and deptreecnt in ('1','2','3','4')) upDepNm,
			(select depnm from payphone.biintmt where depcd = a.depcd and deptreecnt in ('1','2','3','4')) depNm,
			(select depnm from payphone.bitelmt where ktdepcd = a.ktdepcd) ktDepNm,
			(SELECT MIN(AREANM)	FROM payphone.PT_AREAMT	WHERE DEPCD = a.depcd AND UNIIND = a.uniind AND AREA = a.area and area_use = 'Y') areaNm,
			(select usrname from payphone.bimastercf where usrcd = (select areausr from payphone.pt_areamt pa WHERE DEPCD = a.depcd AND UNIIND = a.uniind AND AREA = a.area and area_use = 'Y' )) areaUsr,
			a.fact_telno as factTelNo,
			(select prnm from payphone.bibsici where lcd = '0242' and scd = a.phoneknd) prNm,
			(select bldplcnm from payphone.pt_bldplc where bldplcno = a.bldplcno) bldPlcNm,
			sum(b.city_amt) cityAmt,
			sum(b.otct_amt) otctAmt,
			sum(b.word_amt) wordAmt,
			sum(b.t114_amt) t114Amt,
			sum(b.down_amt) downAmt,
			sum(b.amount) amount,
			sum(b.etc_amt) etcAmt,
			sum(b.total_amt) totalAmt
			from pt_factmt a,
			(
			    select   tel_no,  sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
			    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
			    sum(b.total_amt) total_amt from payphone.tc_month_v b
			    group by tel_no
			) b ,
			(select unino from payphone.tc_cpmssave_ora
			)  c
			group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd;

		
-- 그냥 연습
select * from pt_factmt;
select * from tc_month_v;
-- (2) 서버에서 실제 작동한 쿼리
 select
	(select depnm from payphone.biintmt where depcd = a.updepcd and deptreecnt in ('1', '2', '3', '4')) upDepNm,
	(select depnm from payphone.biintmt where depcd = a.depcd   and deptreecnt in ('1', '2', '3', '4')) depNm,
	(select depnm from payphone.bitelmt where ktdepcd = a.ktdepcd) ktDepNm,
	(select MIN(AREANM) from payphone.PT_AREAMT where DEPCD = a.depcd and UNIIND = a.uniind and AREA = a.area and area_use = 'Y') areaNm,
	(select usrname from payphone.bimastercf where 
		usrcd = (select areausr from payphone.pt_areamt pa where DEPCD = a.depcd and UNIIND = a.uniind and AREA = a.area and area_use = 'Y' )) areaUsr,
	a.fact_telno as factTelNo,
	(select prnm from payphone.bibsici where lcd = '0242' and scd = a.phoneknd) prNm,
	(select bldplcnm from payphone.pt_bldplc where bldplcno = a.bldplcno) bldPlcNm,
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
	(select tel_no,
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
		and b.yyyymm between '20220201' and '20220208'
	group by
		tel_no ) b ,
	(
	select
		unino
	from
		payphone.tc_cpmssave_ora
	where
		1 = 1
		and (save_dtm between '20220208' || '000000' and '20220208' || '235959')
			or (close_date >= '20220208' || '000000'
				and save_dtm <= '20220208' || '000000') ) c
where
	1 = 1
	and a.fact_telno = b.tel_no(+)
	and a.unino = c.unino(+)
	and ( a.REMODT >= '20220201'
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
	a.accdepcd;
		

-- 2022-02-08
-- CPMS 금액 삭제 요청

select * from tb_ttcpmsdd tt where amount = '6150' and lstdt like '20220203%' and TELNO = '004105316495';


--delete from tb_ttcpmsdd tt where amount = '6150' and lstdt like '20220203%' and TELNO = '004105316495';




		 
		 

-- 2022-02-07
-- 광주지사에 목포지점이 있는데, 전남지사 밑으로 들어가야한다. 


select * from pt_areamt;
select * from biintmt where  depnm like '%목포%' and chgtime like '20220203%';

select * from biintmt where  depnm like '%목포%';

select * from biintmt where  depcd = 'O058';

--update biintmt
--set depcd = 'O058',
--dephighcd = 'O050'
--where depcd = 'O026';

-- 전남지사의 depcd = O050 , 광주지사의 depcd = O020 , 

select * from biintmt where  dephighcd = 'O050';

select * from biintmt where depcd = 'O020';




-- 2022-02-04
-- * 동작 안 하는 공중전화 배치
-- (1) ERP 자산 동기화
proc_geterp_fi_asset()

select * from fi_asset;

select * from refep_fi_asset;

-- (2) 오라클 상태 정보 동기화
select proc_change_pt_factmt();

select * from pt_factmt where custcall like '%동암사%';

select * from pt_factmt
where fact_telno = '003204319585';


select * from pt_areamt;



-- depcd(지사), uniind(사업 구분), area의 조합이 유니크해야 하는데 여러 개가 조회된다.
select
get_depnm (depcd,'3')
, *
from pt_areamt
where (area, depcd ,uniind) in (
select b.area, b.depcd ,b.uniind  from pt_areamt b 
where b.area_use ='Y'
group by b.area, b.depcd ,b.uniind 
having count(*) > 1); 

-- area를 바꾸려한다. > pt_areamt에서는 2개가 구분되지만, pt_factmt에서는 구분할 수 없기 때문에 우리가 수정할 수 없다.
-- H110 = 강북지사  / H150 = 강원지사  / I080 = 경남지사  / O020 = 광주지사


-- 2022-02-07 TEST

select
	fac.unino as unino ,
	payphone.get_depnm(fac.updepcd,
	'2') as upDepNm ,
	payphone.get_depnm(fac.depcd,
	'3') as depNm ,
	decode( payphone.get_depnm(fac.depcd, '3') , null , payphone.get_depnm(fac.depcd, '4') , payphone.get_depnm(fac.depcd, '3') ) as accDepNm ,
	payphone.get_ktdepcdnm(fac.ktdepcd) as ktDepNm ,
	fac.area as area ,
	arm.areanm as areaNm,
	arm.areausr,
	ur.usrname as asraUsrNm,
	arm."call" as asrUsrPhone ,
	fac.phonemgrno as phoneMgrNo ,
	fac.fact_telno as factTelNo ,
	fac.phoneknd as phoneKnd ,
	fac.phgb as phGb ,
	fac.blddt as bldDt ,
	fac.bldknd as bldKnd ,
	fac.recvind as recvInd ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0242'
		and scd = fac.phoneknd
		) as phoneKndNm ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0291'
		and scd = fac.phgb
		) as phGbNm ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0271'
		and scd = fac.bldknd
		) as bldkKndNm ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0915'
		and scd = fac.recvind
		) as recvIndNm ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0278'
		and scd = fac.factgb) as factGbNm ,
	(
	select
		prnm
	from
		payphone.bibsici
	where
		lcd = '0265'
		and scd = fac.exmHod) as exmHod ,
	fac.booserno as booSerNo ,
	fac.remodt as remoDt ,
	(
	select
		prnm
	from
		bibsici
	where
		lcd in ('0908', '0262')
			and scd = fac.remorsn ) as remoRsnNm ,
	tot.totamt as beMonPrt
	-- ,payphone.get_muintotamt(fac.unino,to_char((current_date - interval '1 months'),'YYYYMM')) as beMonPrt                     ,fac.army_nm as armyNm                      ,boo.boomgrno as booMgrNo                     , ( select prnm from payphone.bibsici where lcd = '0250' and scd = boo.boocon) as booConNm                    , ( select prnm from payphone.bibsici where lcd = '0248' and scd = boo.booknd) as booKndNm                    , ( select prnm from payphone.bibsici where lcd = '0286' and scd = boo.boodoorind) as booDoorIndNm                    ,boo.booblddt as booBldDt                    ,( select prnm from payphone.bibsici where lcd = '0088' and scd = bld.road_yn) as roadYn                    ,fac.road_amt as roadAmt                    ,fac.road_depnm as roadName                    ,( select prnm from payphone.bibsici where lcd = '0087' and scd = bld.elec_yn) as elecYn                    ,fac.elec_amt as elecAmt                    ,fac.elec_depnm as elecDepNm                     ,fac.elec_num as elecNum                     , ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest1) as liTest1Nm                    , ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest2) as liTest2Nm                    , ( select prnm from payphone.bibsici where lcd = '0260' and scd = boo.litest3) as liTest3Nm                    , ( select prnm from payphone.bibsici where lcd = '0266' and scd = boo.etvoltcd) as etVoltCdNm                    ,boo.etinbld as etInBld                    ,boo.tpinbld as tpInBld                    , ( select prnm from payphone.bibsici where lcd = '0262' and scd = boo.remorsn) as booRemoRsnNm                    ,bld.bldplcno as bldPlcNo                    ,bld.bldplcnm as bldPlcNm                      ,  (select prnm from payphone.bibsici where lcd = '2049' and scd = cap.soc_fact) as socFact                     , ( select prnm from payphone.bibsici where lcd = '0244' and scd = bld.bldgb) as bldGbNm                    , ( select prnm from payphone.bibsici where lcd = '2049' and scd = substr(bld.bldloc3,0,1)||'00') as bldLoc3LagNm                    , ( select prnm from payphone.bibsici where lcd = '2049' and scd = substr(bld.bldloc3,0,2)||'0') as bldLoc3MidNm                    , ( select prnm from payphone.bibsici where lcd = '2049' and scd = bld.bldloc3 ) as bldLoc3SmaNm                    , ( select prnm from payphone.bibsici where lcd = '0246' and scd = bld.bldloc1 ) as bldLoc1Nm                     , ( select prnm from payphone.bibsici where lcd = '0247' and scd = bld.bldloc2 ) as bldLoc2Nm                     ,bld.bldzip as bldZip  ,bld.bldadr1 as bldAdr1 ,bld.bldadr2 as bldAdr2 ,bld.gpsy || ',' || bld.gpsx as gpsPoint                    , ( select prnm from payphone.bibsici where lcd = '0256' and scd = boo.clcyl ) as clCylNm                     ,bld.pp_clusr as ppClusr                    , ( select prnm from payphone.bibsici where lcd = '0259' and scd = boo.sdcyl ) as sdCylNm                     , ( select prnm from payphone.bibsici where lcd = '0257' and scd = boo.retcyl ) as retCylNm                     ,bld.land_pr as landPr                    ,bld.auto_yn as autoYn                    ,bld.pp_etcfac as ppEtcFac                    ,substr(bld.pp_etcfac,1,1) as bldAed                    ,substr(bld.pp_etcfac,3,1) as bldAir                    ,substr(bld.pp_etcfac,5,1) as bldBye                    ,substr(bld.pp_etcfac,7,1) as bldWiFi                    from payphone.pt_factmt fac                    left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino                    left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno and fac.uniind=bld.uniind                    left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind=fac.uniind and arm.depcd=fac.depcd and arm.area_use = 'Y'  and arm.area_to ='99991231'                     left outer join payphone.bimastercf ur on ur.usrcd=arm.areausr                    left outer join payphone.pt_cap cap on bld.bldzip = cap.bldzip and  cap.depcd  = fac.depcd 		            left outer join (		                select SUM(totamt) as totamt,unino,uniind from payphone.pt_tt_muin_jageup where ssdt in  (select MAX(ssdt) from payphone.pt_tt_muin_jageup)  group by unino, uniind 		            ) tot on tot.unino = fac.unino and tot.uniind ='1'                    where 1=1                                       -- and fac.bldplcno = bld.bldplcno -- and fac.uniind=bld.uniind                    and fac.uniind = '1'                    and fac.status = '1'                    and fac.fact_knd = '1' 

	
	select * from pt_factmt;
	select * from pt_areamt where areanm like '%진주5구%';

select * from user_source where text like '%areausr%';

select * from bimastercf where usrcd = '02669';
GET_AREANM
-- TEST 끝
select * from biitmastercf where usrname = '권성익';


select * from biitmastercf;

select * from bimastercf where usrcd = '03760';

02483

select * from biitmastercf where usrname = '김지후';

update biitmastercf 
set callno2 = '4921',
callno3 = '9810'
where usrname = '김지후';




-- * 변경된 데이터로 인한 파생 데이터 확인
-- (1) CPMS
select * from pt_factmt where depcd like 'H15%' and lstdt like '20220204%';

-- (2) 사산
select * from pt_factmthist;

proc_getktlpt_pt_ttcossdd_day()

select * from tb_ttcossdd;

select * from pt_ttcobalance;

-- 값이 정상인지 판단하는 기준은 bitelmt 에 존재하는 depcd가 사산에도 있는지, cpms에도 있는지인데 cpms에는 있는데 사산에는 없다.
select distinct(depcd) from bitelmt where depcd like 'H15%';

select * from bitelmt;

select * from biintmt;

select * from bimastercf;

 

















select a.unino,a.depcd, a.blddt, a.uniind, a.ktdepcd
			, a.upktdepcd, a.accdepcd, a.updepcd
			, a.area, payphone.get_area_usrid(a.DEPCD,a.UNIIND,a.AREA ) as AREAUSR, a.status,nvl(a.remodt,'') remodt
			, nvl(a.bldplcno,'') bldplcno,nvl(a.exmhod,'') exmhod , nvl(a.factgb,'') factgb
			, (case when a.phonemgrno is null then '0' when a.phonemgrno = '' then '0' else a.phonemgrno end) PHONEMGRNO			
			, a.phoneknd, nvl(a.bldknd,'') bldknd , nvl(a.phgb,'') phgb
			, a.LSTDT,a.LSTUSR
			, a.fact_telno, substring(a.fact_telno,1,4) TEL1
			, substring(a.fact_telno,5,4) TEL2, substring(a.fact_telno,9,4) TEL3
from payphone.pt_factmt a,
(select UNINO,LSTDT from payphone.pt_factmt
 minus
select UNINO,LSTDT from PT_FACTMT@oracpms ) c
where a.unino = c.unino
and a.uniind ='1';


-- 아래 쿼리가 어떤식으로 실행되는지 알아보고 싶다.
update payphone.biintmt b
set b.dephighcd  = c.dephighcd 
, useflag ='Y' 
, b.depnm = c.depnm
, b.depnm1 = c.depnm1
, b.org_cd = c.org_cd 
, chgtime = to_char(sysdate,'yyyymmddhh24miss')  
, lstusr = 'admin'
, lstdt = to_char(sysdate,'yyyymmddhh24miss')
from (
select depcd, dephighcd, org_cd, depnm, depnm1
	from (
select o.branch_cd depcd, (select h.old_org_cd from orm_org_c@orahr h where h.org_cd =o.org_cd and sysdate between h.sta_ymd and h.end_ymd) dephighcd,
	o.org_cd , o.branch_nm depnm,replace(replace(o.branch_nm,'지점'),'정비실') depnm1
	 from orm_branch@orahr o
    where  sysdate between o.sta_ymd and o.end_ymd
    and o.org_cd in (select org_cd from orm_org_c@orahr where sysdate between sta_ymd and end_ymd and org_nm not like '(구%')
minus 
select depcd, dephighcd, org_cd, depnm, depnm1 from payphone.biintmt
where deptreecnt  = '4'
		)
) c
where b.depcd = c.depcd 
and b.deptreecnt  = '4';


지점코드 없는 자료 삽입
insert into payphone.biintmt
( depcd, dephighcd, org_cd, depnm, depnm1, useflag, chgtime, deptreecnt, lstusr, lstdt )
select depcd, dephighcd, org_cd, depnm, depnm1, 'Y' useflag,to_char(sysdate,'yyyymmddhh24miss') chgtime ,'4' deptreecnt,'admin' lstusr,to_char(sysdate,'yyyymmddhh24miss') lstdt from (
select o.branch_cd depcd, (select h.old_org_cd from orm_org_c@orahr h where h.org_cd =o.org_cd and sysdate between h.sta_ymd and h.end_ymd) dephighcd,
	o.org_cd , o.branch_nm depnm,replace(replace(o.branch_nm,'지점'),'정비실') depnm1
	 from orm_branch@orahr o
    where  sysdate between o.sta_ymd and o.end_ymd
    and o.org_cd in (select org_cd from orm_org_c@orahr where sysdate between sta_ymd and end_ymd and org_nm not like '(구%')
minus 
select depcd, dephighcd, org_cd, depnm, depnm1 from payphone.biintmt
);


  

-- biintmt 테이블 데이터 변경: useflag를 N으로 바꾸고, 사용하는 기관은 depnm, depnm1은 ()안에 넣어준다.
-- 1) 동두천지점 (완료)
-- 2) 성북지점  (완료)
-- 3) 공주지점  (완료)
-- 4) 보령지점  
-- 5) 동해지점  
-- 6) 이천지점  
-- 7) 충주지점


select * from biintmt where depcd = '1600';
select * from biintmt where depcd = 'H000';
select * from biintmt where depcd = 'H150';
select * from biintmt where depcd = 'H151';



update biintmt set depnm = '('||depnm||')',depnm1 = '('||depnm1||')',useflag  ='N'
where useflag = 'Y'
and deptreecnt ='4';

select * from biintmt
where deptreecnt  ='4'
and useflag  ='Y'

;

       
--select * from biintmt where depnm like '%당산%';

select distinct(depnm) from biintmt where depnm not like '%(%)%';

select * from biintmt where depnm like '%동해%'; 

-- 현재 춘전지사의 상위 기관 코드 Q000 , 상위 기관 코드가 H150(강원지사)으로 바뀌어야하지 않나

-- 지사가 강원지사에 속해서 리스팅 돼야할 지점인 춘천, 원주가 리스팅되지 않는 문제
-- 춘천으로 테스트한다.
-- depcd가 Q310인 것이 2개가 나오는데, useflag가 반대로 돼있다.
-- (1) useflag를 스왑해본다.

select * from biintmt 
where depcd = 'Q310'
and lstdt like '20220203%';



select * from biintmt where depcd = 'H154';

-- (2) depcd, dephighcd, deptreecnt를 수정한다. depcd: Q310 > H154  / dephighcd: Q000 > H150  / deptreecnt: 3 > 4  (3인 강원지사의 하위인 4로)
-- (2)가 정답인데, 결과적으로 dephighcd와 deptreecnt 를 수정해주면 된다. 패턴에 맞춰서 depcd 를 수정해줄 수도 있으나, 만약 하위 deptreecnt 가 있을 경우 꼬이는 수가 있다.
-- (2)는 정답이 아니였다. hr에서 추가하면 그것이 payphone으로 연동되는 것. 만약, 동일한 depcd 를 가진 게 있다면, 배치가 돌면서 payphone의 기존 것을 덮어쓰게 된다.
select * from biintmt where depcd = 'Q310';

update biintmt 
set depcd = 'Q310'
, dephighcd = 'Q000'
, deptreecnt = '3'
, useflag = 'N'
where depcd = 'H154';



select * from biintmt 
where depcd = 'Q310'
and lstdt like '20220203%';





select * from biintmt where depnm like '%속초%';

select * from biintmt where depnm like '%춘천%';

select * from biintmt where depcd = 'Q310';

select * from biintmt where depcd = 'Q000';

select * from biintmt where depnm like '%강원%'; -- H150 (강원지사)

select * from bitelmt where depnm like '%강원%';

select * from biintmt where depnm like '%강원%';

--select * from biintmt where depnm like '%(%)%' and useflag = 'Y';

--select * from biintmt where depnm like '%보령%';












-- 1) 사용자 권한 테이블
select * from tb_user_group;

-- 2) bimastercf 의 depcd 가 biintmt의 depcd와 일치하는 biintmt의 depnm 을 불러온다.
select * from biintmt;

-- bimastercf의 group_nm_en 칼럼을 통해 vw_group_list(view)에서 level을 가져온다.
select * from bimastercf;

select * from vw_group_list;



-- 진행 중

-- bitelmt 테이블 (전화국 정보 관리 조회 시)
bitelmt 
-- ktdepcd(KT기관코드)=전화국 코드
-- depnm = 전화국명
-- depnm1 = 약칭 전화국명
-- dsktcd2 = KT 전화국 코드 (R로 시작)
-- centerdepcd = 본부 코드 (as accDepNm)
-- org_cd = 조직 코드(hr의 orm_branch 테이블 org_cd)

-- biintmt 테이블
biintmt

select dsktcd2 from bitelmt;

get_depnm()

select * from biintmt where depcd like 'O1%';

select depnm from biintmt where dephighcd like 'O1%';

select * from biintmt where lstdt like '20220203%';

select * from bitelmit where lstdt like '20220203%';

select * from biintmt where org_cd like '%1857';

select * from bitelmt where lstdt like '20220203%';

select * from biintmt where depnm like '%춘천%';

select * from bitelmt where depnm like '%춘천%';

select * from bimastercf where usrcd = '02844';

select * from pt_factmt;

select * from pt_areamt where lstdt like '20220203%';
 

-- 수정 시, 발생하는 트리거
proc_update_bitelmt_h()

select * from bitelmt_h;

select table_name, status from user_triggers;


-- 스프링 배치 
proc_gethr_orm_org_c()










-- 설정 > 전화국 관리에서 수정 시, 프로시저를 통해 수정이 되나?
-- 수정 시, 아래 쿼리가 실행된다.
update
	payphone.bitelmt
set
	lstusr = '99999' ,
	lstdt = to_char(now(), 'YYYYMMDDhh24miss') ,
	depcd = 'H020' ,
	centerdepcd = 'H020' ,
	depnm = '송우지점' ,
	depnm1 = '동의정부' ,
	dsktcd2 = 'R00536' ,
	useflag = 'N'
where
	ktdepcd = 'K13001'


	-- 조회 됨
select table_name, status from user_triggers;


select tgname, proname, prosrc
from pg_trigger
join pg_proc p on p.oid = tgfoid
where not tgisinternal
and tgrelid = 'bitelmt'::regclass;

select pg_get_triggerdef(t.oid) as "trigger declaration"
from pg_trigger t
where not tgisinternal
and tgrelid = 'bitelmt'::regclass;

proc_update_bitelmt_h
proc_backup_bitelmt_h
-- 관여 테이블
	bitelmt
	biintmt
-- 출력 시, 아래 코드가 실행된다.
	select
	'0' as check ,
	org.dephighcd as depHighCd ,
	tel.depcd as depCd ,
	tel.centerdepcd as accDepCd ,
	payphone.get_depnm(tel.centerdepcd,
	'4') accDepNm ,
	tel.ktdepcd as ktDepCd ,
	tel.depnm as depNm ,
	tel.depnm1 as depNm1 ,
	tel.dsktcd2 as dsktcd2 ,
	tel.useflag as useFlag
from
	payphone.bitelmt tel,
	payphone.biintmt org
where
	1 = 1
	and tel.depcd = org.depcd
	and org.dephighcd = 'G000'
	and tel.depcd = 'G210'
	and org.useflag = 'Y'
	and org.deptreecnt = 3
	and tel.depcd is not null
	and tel.useflag = 'Y'
order by
	tel.useflag desc

ktl02865

pt_ttcobalance

pt_ttcossdd

proc_getktlpt_pt_ttcossdd_day()

select 
replace(telno,'-','') as telno


-- 사산자료는 cpms에서 payphone으로 일별 batch를 통해 넘어온다.
-- 아래 function이 실행돼서 넘어온다.
-- (1) 오늘날짜로 실행해서 넣어본다.
-- (2) return 0, commit까지 했으나 joblog도 안 쌓임
-- (3) 매개인자 없이 실행해본다.
-- 질문) 사산은 매일하는가? ()

-- select proc_getktlpt_pt_ttcossdd_day();

select * from payphone.pt_ttcobalance
where upDepCd = 'H000'
and depCd = 'H020'
and ssdt = '20220125';

--INSERT INTO payphone.pt_ttcobalance(
--		depcd, accdepcd, ktdepcd, ssdt, amount, sendmoney, amounthab, sendmoneyhab, subtot
--		, jibcoin, jibcocard, jibmult, sisulcoin, sisulcocard, sisulmult, updepcd, ktdepcdname, lastdaymoney
--		, amountdayhab, sendmoneydayhab, lstdt, lstusr, reserved1, reserved2, jibtraf, jibcocareader, sisultraf, sisulcocareader
--		, save_amount, small_amount, save_sendmoney, small_sendmoney, save_amounthab, small_amounthab
--		, save_subtot, small_subtot, save_lastdaymoney, small_lastdaymoney, save_amountdayhab
--		, small_amountdayhab, save_sendmoneydayhab, small_sendmoneydayhab, save_sendmoneyhab
--		, small_sendmoneyhab, sms_amount, sms_sendmoney, sms_amounthab, sms_subtot, sms_lastdaymoney
--		, sms_amountdayhab, sms_sendmoneydayhab, sms_sendmoneyhab, mobile_amount, mobile_sendmoney
--		, mobile_amounthab, mobile_subtot, mobile_lastdaymoney, mobile_amountdayhab, mobile_sendmoneydayhab, mobile_sendmoneyhab
--	)
--	SELECT DEPCD, ACCDEPCD, KTDEPCD, SSDT, AMOUNT, SENDMONEY, AMOUNTHAB, SENDMONEYHAB, SUBTOT
--		, JIBCOIN, JIBCOCARD, JIBMULT, SISULCOIN, SISULCOCARD, SISULMULT, UPDEPCD, KTDEPCDNAME, LASTDAYMONEY
--		, AMOUNTDAYHAB, SENDMONEYDAYHAB, LSTDT, LSTUSR, RESERVED1, RESERVED2, JIBTRAF, JIBCOCAREADER, SISULTRAF, SISULCOCAREADER
--		, SAVE_AMOUNT, SMALL_AMOUNT, SAVE_SENDMONEY, SMALL_SENDMONEY, SAVE_AMOUNTHAB, SMALL_AMOUNTHAB
--		, SAVE_SUBTOT, SMALL_SUBTOT, SAVE_LASTDAYMONEY, SMALL_LASTDAYMONEY, SAVE_AMOUNTDAYHAB
--		, SMALL_AMOUNTDAYHAB, SAVE_SENDMONEYDAYHAB, SMALL_SENDMONEYDAYHAB, SAVE_SENDMONEYHAB
--		, SMALL_SENDMONEYHAB, SMS_AMOUNT, SMS_SENDMONEY, SMS_AMOUNTHAB, SMS_SUBTOT, SMS_LASTDAYMONEY
--		, SMS_AMOUNTDAYHAB, SMS_SENDMONEYDAYHAB, SMS_SENDMONEYHAB, MOBILE_AMOUNT, MOBILE_SENDMONEY
--		, MOBILE_AMOUNTHAB, MOBILE_SUBTOT, MOBILE_LASTDAYMONEY, MOBILE_AMOUNTDAYHAB, MOBILE_SENDMONEYDAYHAB, MOBILE_SENDMONEYHAB
--	FROM KTLPT.PT_TTCOBALANCE@oraktlpt
--		where SSDT != '20220124' and lstdt not like '20220124' || '%'
--and ssdt like '2022%';
--
--delete pt_ttcobalance
--	where SSDT != '20220124' and lstdt not like '20220124' || '%'
--and ssdt like '2022%';

-- 사산 > 일자별 사산자료 조회에서 일자별 사산자료는 조회가 되는데 일계 사산자료는 조회되지 않는 문제
SELECT * FROM pt_ttcobalance
where upDepCd = 'H000'
and depCd = 'H020'
and ssdt between '20220101' and '20220125';

select * from tb_joblog where log_nm = 'proc_getktlpt_pt_ttcossdd_day()' and log_dt like '20220125%';


select
	get_depnm(updepcd,
	'2') as upDepCdNm ,
	get_depnm(depcd,
	'3') as depCdNm ,
	decode(accdepcd, depcd, get_depnm(accdepcd, '3'), get_depnm(accdepcd, '4')) as accDepCdNm ,
	get_ktdepcdnm1(ktdepcd) as ktDepCdNm ,
	ssdt ,
	amount ,
	sendmoney as sendMoney ,
	lastdaymoney as lastDayMoney ,
	subtot as subTot ,
	amountdayhab as amountDayHab ,
	amounthab as amountHab ,
	sendmoneydayhab as sendMoneyDayHab ,
	sendmoneyhab as sendMoneyHab ,
	jibcoin as jibCoin ,
	jibcocard as jibCoCard ,
	sisulcoin as sisulCoin ,
	sisulcocard as sisulCoCard ,
	decode((AMOUNT + lastdaymoney), 0, 0, ((SENDMONEY / (AMOUNT + lastdaymoney)) * 100 ) ) as depositPer ,
	decode((AMOUNT + lastdaymoney), 0, 0, ((SUBTOT / (AMOUNT + lastdaymoney)) * 100 ) ) as balancePer
from
	payphone.pt_ttcobalance
where
	1 = 1
	and upDepCd = 'H000'
	and depCd = 'H020'
	and ssdt between '20220101' and '20220125'
order by
	depcd,
	accdepcd,
	ktdepcd,
	ssdt;

decode((AMOUNT + lastdaymoney), 0, 0, ((SENDMONEY / (AMOUNT + lastdaymoney)) * 100 ) ) as depositPer ,
-- (사산금액 + 전일잔고)가 0이면 0, 0이 아닌 경우에는 (입금액을 (사산금액 + 전일잔고)로 나눈 뒤 x100)
decode((AMOUNT + lastdaymoney), 0, 0, ((SUBTOT / (AMOUNT + lastdaymoney)) * 100 ) ) as balancePer
-- SUBTOT = 현재 잔액




-- 일자별 사산자료를 불러오는 코드(이건 출력이 되는데 위에 코드가 출력이 안 됨)
select
	get_depnm( substr( depcd,
	1,
	1 )|| '000',
	'2' ) as upDepCdNm ,
	get_depnm( depcd,
	'3' ) depCdNm ,
	decode(depcd , accdepcd, get_depnm( accdepcd, '3' ), get_depnm( accdepcd, '4' )) accDepCdNm ,
	get_ktdepcdnm1(ktdepcd) ktDepCdNm ,
	ssdt as ssdt ,
	area as area ,
	areausr as areaUsr ,
	get_usrname(areausr) as areaUsrNm ,
	boxno ,
	telno as telNo ,
	ssplc ,
	get_bibsici_prnm( '0628',
	phongb ) as phongbNm ,
	coin500 ,
	coin100 ,
	coin50 ,
	coin10 ,
	amount ,
	depCd ,
	accDepCd ,
	ktDepCd
from
	tb_ttcossdd
where
	1 = 1
	and upDepCd = 'H000'
	and depCd = 'H020'
	and ssdt between '20220101' and '20220125'
	and replace(telno, '-', '') like '%' || replace('', '-', '') || '%'
order by
	depcd,
	accdepcd,
	ssdt;






-- 11, 12일 데이터를 넣어야한다.
select * from TB_TTCPMSDD where cpmsdt = '20220112'
group by depcd;
 


-- 328,421
select count(*) from refep_fi_dpbase rfd where (select count(cd_asset) from refep_fi_dpbase rfd) = (select count(cd_company) from refep_fi_dpbase rfd);



select cd_asset, cd_company,st_asset, ym_dpasset,
row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
from payphone.refep_fi_dpbase


-- job이 실행된 걸 기록해야한다.
proc_payphone_tb_joblog

select * from tb_joblog where log_dt like '20220114%' and log_nm like 'proc_getcpms_pt_ttcpmsdd%';

fi_asset

proc_geterp_fi_asset()

-- 칼럼  , 

select * from fi_asset;

select * from fi_asset where dt_pur like '202110%';

select * from fi_asset where dts_update like '202110%';

select * from fi_asset where lstdt like '20220113%';



select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase
		where cd_asset is null;

select * from refep_fi_asset
where
cd_asset is null
and
cd_company = '1000'
and
tp_asset in ('27110', '27120', '27520', '27522')
and
st_asset not in ('4','5');

refep_fi_asset fas

proc_fi_asset_update

fi_asset

select PROC_GETCPMS_PT_TTCPMSDD('20220111', '20220112'); 







PROC_GETCPMS_PT_TTCPMSDD


PROC_GETCPMS_PT_TTCPMSDD_DAY



생각해보니 11일날 아침에 10일자 생성 되었을거고
11일자가 생성이 안되었겠네요
12일은 원래 내일 생성 되는건데 잘못 생성된듯 하네요 (2022-01-13)

함수 자체는 전날 것(date-1)을 

select * from user_source where text like '%TB_TTCPMSDD%';


PROC_GETHR_ORM_ORG_C

PROC_GETHR_BIMASTERCF





select to_char(current_date - 1, 'YYYYMMDD');





payphone.ic irc

본부  (본부이름: depnm / )
지사 
전화국(지점)
구역
구역(담당자)
전화번호
기종
보고 내용
보고 시간
성공 여부
에러 코드
정기 / 비정기

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
		ktdepcd = a.ktdepcd) ktDepNm
from
	pt_factmt a;

select updepcd 본부,
get_depnm(updepcd,'2')  본부명,
depcd 지사, 
get_depnm(depcd,'3')  지사명,
ktdepcd 전화국,
get_ktdepcdnm(ktdepcd)  전화국명,
area 구역,
get_areanm(depcd,'1',area) 구역명,
areausr 담당자,
get_area_usrname(depcd,'1',area) 사원명,
tel_no 전화번호,
phoneknd 기종,
get_phonegb_prnm(phoneknd) 기종명,
log_desc 보고종류,
log_dtm 보고시간,
succ_ox 성공여부,
log_err_id 에러코드,
(SELECT c.ERR_NM FROM TC_ERR@ORACPMS c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','정기','비정기') 정기비정기 
from payphone.tc_log L
where log_dtm like '20220105%';







select updepcd 본부,
(select b.depnm from biintmt b where b.depcd = l.updepcd and b.deptreecnt='2')  본부명,
depcd 지사, 
(select b.depnm from biintmt b where l.depcd = b.depcd and b.deptreecnt='3')   지사명,
ktdepcd 전화국,
(select b2.depnm from payphone.bitelmt b2 where b2.ktdepcd =l.ktdepcd)  전화국명,
area 구역,
(select pa.areanm from pt_areamt pa  where pa.depcd = l.depcd and pa.uniind  = '1' and pa.area = l.area AND    area_use = 'Y') 구역명,
areausr 담당자,
(select b3.usrname from bimastercf b3  where b3.usrcd = l.areausr) 사원명,
tel_no 전화번호,
phoneknd 기종,
(		SELECT trim(b4.prnm)
		FROM payphone.bibsici b4
		WHERE b4.lcd = '0628'
		AND b4.scd = l.phoneknd) 기종명,
log_desc 보고종류,
log_dtm 보고시간,
succ_ox 성공여부,
log_err_id 에러코드,
(SELECT c.ERR_NM FROM TC_ERR@ORACPMS c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','정기','비정기') 정기비정기 
from payphone.tc_log L
where log_dtm like '20220105%';



SELECT * FROM TC_ERR@ORACPMS;
	



	
	