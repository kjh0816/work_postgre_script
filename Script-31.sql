-- 2022-02-11
-- 02-09�� ������ INSERT��
-- pt_factmt���� �����ϴ� �����Ͱ� pt_fatmthist���� �������� �ʴ� ������ ������ �߻��ؼ�, ��� ���� ���� �ҷ������� �ʴ� ������ �߻��ߴ�.
-- ������ �Ʒ� ������ ������Ѽ� pt_factmthist�� �����͸� �־����.
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
--			, road_num, elec_usr, elec_date, road_usr, road_date) -- �ű� �߰�
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
--			, fac.road_num, fac.elec_usr, fac.elec_date, fac.road_usr, fac.road_date -- �ű� �߰�
--		from payphone.pt_factmt fac
--		left outer join payphone.pt_boothmt boo on fac.boounino = boo.boounino
--		left outer join payphone.pt_bldplc bld on fac.bldplcno = bld.bldplcno and fac.uniind = bld.uniind
--		left outer join payphone.pt_areamt arm on arm.area = fac.area and arm.uniind = fac.uniind and arm.depcd = fac.depcd  and area_use ='Y'
--		left outer join payphone.bimastercf ur on ur.usrcd = arm.areausr
--        where
--		fac.fact_telno  in ('005404428721','005506340790');

-- 2022-02-10
-- ù�� ���� �м� �� �ι�° ���� �ϼ����Ѻ���
-- �ؼ�: (1)�� ��Ʈ������ ��ȸ�� �������� ������ �����ߴµ�, (1)�����δ�(group by Ư����) depnm�� �׷����� ���� �� �̿ܿ��� �˻��� �� ���´�.
--      where (�׷����� ���� Į����) in ((1)��������)�� ���� ������ ���������� ������ ��.
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


-- �ؼ�: area, depcd, uniind�� �������� ��ȸ���� ��, �ش� 3���� ������ ������ �ο찡 1�� �̻� �����ϴ� ������ ��ȸ�Ѵ�.
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
-- ���̿�ü��� �λ簳�� ���� ��ȸ���� �ʴ� ����

select * from bibsici where lcd = '0242';
select * from pt_bldplc;
select * from tc_month_v;

select * from bimastercf where usrcd = '00938';

-- ����/���� > ���� ���� ��ȸ > 

-- ��ġ ���ν��� ����
-- ������ ���� �ִ� ��ġ: ����Ŭ �������� ����ȭ
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

-- �� ���ư��� �ִ� ��ġ: ERP �ڻ� ����ȭ
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

SELECT * FROM payphone.PT_AREAMT where areanm = 'ȭõ1';



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

		
-- �׳� ����
select * from pt_factmt;
select * from tc_month_v;
-- (2) �������� ���� �۵��� ����
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
-- CPMS �ݾ� ���� ��û

select * from tb_ttcpmsdd tt where amount = '6150' and lstdt like '20220203%' and TELNO = '004105316495';


--delete from tb_ttcpmsdd tt where amount = '6150' and lstdt like '20220203%' and TELNO = '004105316495';




		 
		 

-- 2022-02-07
-- �������翡 ���������� �ִµ�, �������� ������ �����Ѵ�. 


select * from pt_areamt;
select * from biintmt where  depnm like '%����%' and chgtime like '20220203%';

select * from biintmt where  depnm like '%����%';

select * from biintmt where  depcd = 'O058';

--update biintmt
--set depcd = 'O058',
--dephighcd = 'O050'
--where depcd = 'O026';

-- ���������� depcd = O050 , ���������� depcd = O020 , 

select * from biintmt where  dephighcd = 'O050';

select * from biintmt where depcd = 'O020';




-- 2022-02-04
-- * ���� �� �ϴ� ������ȭ ��ġ
-- (1) ERP �ڻ� ����ȭ
proc_geterp_fi_asset()

select * from fi_asset;

select * from refep_fi_asset;

-- (2) ����Ŭ ���� ���� ����ȭ
select proc_change_pt_factmt();

select * from pt_factmt where custcall like '%���ϻ�%';

select * from pt_factmt
where fact_telno = '003204319585';


select * from pt_areamt;



-- depcd(����), uniind(��� ����), area�� ������ ����ũ�ؾ� �ϴµ� ���� ���� ��ȸ�ȴ�.
select
get_depnm (depcd,'3')
, *
from pt_areamt
where (area, depcd ,uniind) in (
select b.area, b.depcd ,b.uniind  from pt_areamt b 
where b.area_use ='Y'
group by b.area, b.depcd ,b.uniind 
having count(*) > 1); 

-- area�� �ٲٷ��Ѵ�. > pt_areamt������ 2���� ���е�����, pt_factmt������ ������ �� ���� ������ �츮�� ������ �� ����.
-- H110 = ��������  / H150 = ��������  / I080 = �泲����  / O020 = ��������


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
	select * from pt_areamt where areanm like '%����5��%';

select * from user_source where text like '%areausr%';

select * from bimastercf where usrcd = '02669';
GET_AREANM
-- TEST ��
select * from biitmastercf where usrname = '�Ǽ���';


select * from biitmastercf;

select * from bimastercf where usrcd = '03760';

02483

select * from biitmastercf where usrname = '������';

update biitmastercf 
set callno2 = '4921',
callno3 = '9810'
where usrname = '������';




-- * ����� �����ͷ� ���� �Ļ� ������ Ȯ��
-- (1) CPMS
select * from pt_factmt where depcd like 'H15%' and lstdt like '20220204%';

-- (2) ���
select * from pt_factmthist;

proc_getktlpt_pt_ttcossdd_day()

select * from tb_ttcossdd;

select * from pt_ttcobalance;

-- ���� �������� �Ǵ��ϴ� ������ bitelmt �� �����ϴ� depcd�� ��꿡�� �ִ���, cpms���� �ִ����ε� cpms���� �ִµ� ��꿡�� ����.
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


-- �Ʒ� ������ ������� ����Ǵ��� �˾ƺ��� �ʹ�.
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
	o.org_cd , o.branch_nm depnm,replace(replace(o.branch_nm,'����'),'�����') depnm1
	 from orm_branch@orahr o
    where  sysdate between o.sta_ymd and o.end_ymd
    and o.org_cd in (select org_cd from orm_org_c@orahr where sysdate between sta_ymd and end_ymd and org_nm not like '(��%')
minus 
select depcd, dephighcd, org_cd, depnm, depnm1 from payphone.biintmt
where deptreecnt  = '4'
		)
) c
where b.depcd = c.depcd 
and b.deptreecnt  = '4';


�����ڵ� ���� �ڷ� ����
insert into payphone.biintmt
( depcd, dephighcd, org_cd, depnm, depnm1, useflag, chgtime, deptreecnt, lstusr, lstdt )
select depcd, dephighcd, org_cd, depnm, depnm1, 'Y' useflag,to_char(sysdate,'yyyymmddhh24miss') chgtime ,'4' deptreecnt,'admin' lstusr,to_char(sysdate,'yyyymmddhh24miss') lstdt from (
select o.branch_cd depcd, (select h.old_org_cd from orm_org_c@orahr h where h.org_cd =o.org_cd and sysdate between h.sta_ymd and h.end_ymd) dephighcd,
	o.org_cd , o.branch_nm depnm,replace(replace(o.branch_nm,'����'),'�����') depnm1
	 from orm_branch@orahr o
    where  sysdate between o.sta_ymd and o.end_ymd
    and o.org_cd in (select org_cd from orm_org_c@orahr where sysdate between sta_ymd and end_ymd and org_nm not like '(��%')
minus 
select depcd, dephighcd, org_cd, depnm, depnm1 from payphone.biintmt
);


  

-- biintmt ���̺� ������ ����: useflag�� N���� �ٲٰ�, ����ϴ� ����� depnm, depnm1�� ()�ȿ� �־��ش�.
-- 1) ����õ���� (�Ϸ�)
-- 2) ��������  (�Ϸ�)
-- 3) ��������  (�Ϸ�)
-- 4) ��������  
-- 5) ��������  
-- 6) ��õ����  
-- 7) ��������


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

       
--select * from biintmt where depnm like '%���%';

select distinct(depnm) from biintmt where depnm not like '%(%)%';

select * from biintmt where depnm like '%����%'; 

-- ���� ���������� ���� ��� �ڵ� Q000 , ���� ��� �ڵ尡 H150(��������)���� �ٲ������� �ʳ�

-- ���簡 �������翡 ���ؼ� ������ �ž��� ������ ��õ, ���ְ� �����õ��� �ʴ� ����
-- ��õ���� �׽�Ʈ�Ѵ�.
-- depcd�� Q310�� ���� 2���� �����µ�, useflag�� �ݴ�� ���ִ�.
-- (1) useflag�� �����غ���.

select * from biintmt 
where depcd = 'Q310'
and lstdt like '20220203%';



select * from biintmt where depcd = 'H154';

-- (2) depcd, dephighcd, deptreecnt�� �����Ѵ�. depcd: Q310 > H154  / dephighcd: Q000 > H150  / deptreecnt: 3 > 4  (3�� ���������� ������ 4��)
-- (2)�� �����ε�, ��������� dephighcd�� deptreecnt �� �������ָ� �ȴ�. ���Ͽ� ���缭 depcd �� �������� ���� ������, ���� ���� deptreecnt �� ���� ��� ���̴� ���� �ִ�.
-- (2)�� ������ �ƴϿ���. hr���� �߰��ϸ� �װ��� payphone���� �����Ǵ� ��. ����, ������ depcd �� ���� �� �ִٸ�, ��ġ�� ���鼭 payphone�� ���� ���� ����� �ȴ�.
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





select * from biintmt where depnm like '%����%';

select * from biintmt where depnm like '%��õ%';

select * from biintmt where depcd = 'Q310';

select * from biintmt where depcd = 'Q000';

select * from biintmt where depnm like '%����%'; -- H150 (��������)

select * from bitelmt where depnm like '%����%';

select * from biintmt where depnm like '%����%';

--select * from biintmt where depnm like '%(%)%' and useflag = 'Y';

--select * from biintmt where depnm like '%����%';












-- 1) ����� ���� ���̺�
select * from tb_user_group;

-- 2) bimastercf �� depcd �� biintmt�� depcd�� ��ġ�ϴ� biintmt�� depnm �� �ҷ��´�.
select * from biintmt;

-- bimastercf�� group_nm_en Į���� ���� vw_group_list(view)���� level�� �����´�.
select * from bimastercf;

select * from vw_group_list;



-- ���� ��

-- bitelmt ���̺� (��ȭ�� ���� ���� ��ȸ ��)
bitelmt 
-- ktdepcd(KT����ڵ�)=��ȭ�� �ڵ�
-- depnm = ��ȭ����
-- depnm1 = ��Ī ��ȭ����
-- dsktcd2 = KT ��ȭ�� �ڵ� (R�� ����)
-- centerdepcd = ���� �ڵ� (as accDepNm)
-- org_cd = ���� �ڵ�(hr�� orm_branch ���̺� org_cd)

-- biintmt ���̺�
biintmt

select dsktcd2 from bitelmt;

get_depnm()

select * from biintmt where depcd like 'O1%';

select depnm from biintmt where dephighcd like 'O1%';

select * from biintmt where lstdt like '20220203%';

select * from bitelmit where lstdt like '20220203%';

select * from biintmt where org_cd like '%1857';

select * from bitelmt where lstdt like '20220203%';

select * from biintmt where depnm like '%��õ%';

select * from bitelmt where depnm like '%��õ%';

select * from bimastercf where usrcd = '02844';

select * from pt_factmt;

select * from pt_areamt where lstdt like '20220203%';
 

-- ���� ��, �߻��ϴ� Ʈ����
proc_update_bitelmt_h()

select * from bitelmt_h;

select table_name, status from user_triggers;


-- ������ ��ġ 
proc_gethr_orm_org_c()










-- ���� > ��ȭ�� �������� ���� ��, ���ν����� ���� ������ �ǳ�?
-- ���� ��, �Ʒ� ������ ����ȴ�.
update
	payphone.bitelmt
set
	lstusr = '99999' ,
	lstdt = to_char(now(), 'YYYYMMDDhh24miss') ,
	depcd = 'H020' ,
	centerdepcd = 'H020' ,
	depnm = '�ۿ�����' ,
	depnm1 = '��������' ,
	dsktcd2 = 'R00536' ,
	useflag = 'N'
where
	ktdepcd = 'K13001'


	-- ��ȸ ��
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
-- ���� ���̺�
	bitelmt
	biintmt
-- ��� ��, �Ʒ� �ڵ尡 ����ȴ�.
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


-- ����ڷ�� cpms���� payphone���� �Ϻ� batch�� ���� �Ѿ�´�.
-- �Ʒ� function�� ����ż� �Ѿ�´�.
-- (1) ���ó�¥�� �����ؼ� �־��.
-- (2) return 0, commit���� ������ joblog�� �� ����
-- (3) �Ű����� ���� �����غ���.
-- ����) ����� �����ϴ°�? ()

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

-- ��� > ���ں� ����ڷ� ��ȸ���� ���ں� ����ڷ�� ��ȸ�� �Ǵµ� �ϰ� ����ڷ�� ��ȸ���� �ʴ� ����
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
-- (���ݾ� + �����ܰ�)�� 0�̸� 0, 0�� �ƴ� ��쿡�� (�Աݾ��� (���ݾ� + �����ܰ�)�� ���� �� x100)
decode((AMOUNT + lastdaymoney), 0, 0, ((SUBTOT / (AMOUNT + lastdaymoney)) * 100 ) ) as balancePer
-- SUBTOT = ���� �ܾ�




-- ���ں� ����ڷḦ �ҷ����� �ڵ�(�̰� ����� �Ǵµ� ���� �ڵ尡 ����� �� ��)
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






-- 11, 12�� �����͸� �־���Ѵ�.
select * from TB_TTCPMSDD where cpmsdt = '20220112'
group by depcd;
 


-- 328,421
select count(*) from refep_fi_dpbase rfd where (select count(cd_asset) from refep_fi_dpbase rfd) = (select count(cd_company) from refep_fi_dpbase rfd);



select cd_asset, cd_company,st_asset, ym_dpasset,
row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
from payphone.refep_fi_dpbase


-- job�� ����� �� ����ؾ��Ѵ�.
proc_payphone_tb_joblog

select * from tb_joblog where log_dt like '20220114%' and log_nm like 'proc_getcpms_pt_ttcpmsdd%';

fi_asset

proc_geterp_fi_asset()

-- Į��  , 

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



�����غ��� 11�ϳ� ��ħ�� 10���� ���� �Ǿ����Ű�
11���ڰ� ������ �ȵǾ��ڳ׿�
12���� ���� ���� ���� �Ǵ°ǵ� �߸� �����ȵ� �ϳ׿� (2022-01-13)

�Լ� ��ü�� ���� ��(date-1)�� 

select * from user_source where text like '%TB_TTCPMSDD%';


PROC_GETHR_ORM_ORG_C

PROC_GETHR_BIMASTERCF





select to_char(current_date - 1, 'YYYYMMDD');





payphone.ic irc

����  (�����̸�: depnm / )
���� 
��ȭ��(����)
����
����(�����)
��ȭ��ȣ
����
���� ����
���� �ð�
���� ����
���� �ڵ�
���� / ������

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

select updepcd ����,
get_depnm(updepcd,'2')  ���θ�,
depcd ����, 
get_depnm(depcd,'3')  �����,
ktdepcd ��ȭ��,
get_ktdepcdnm(ktdepcd)  ��ȭ����,
area ����,
get_areanm(depcd,'1',area) ������,
areausr �����,
get_area_usrname(depcd,'1',area) �����,
tel_no ��ȭ��ȣ,
phoneknd ����,
get_phonegb_prnm(phoneknd) ������,
log_desc ��������,
log_dtm ����ð�,
succ_ox ��������,
log_err_id �����ڵ�,
(SELECT c.ERR_NM FROM TC_ERR@ORACPMS c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','����','������') ��������� 
from payphone.tc_log L
where log_dtm like '20220105%';







select updepcd ����,
(select b.depnm from biintmt b where b.depcd = l.updepcd and b.deptreecnt='2')  ���θ�,
depcd ����, 
(select b.depnm from biintmt b where l.depcd = b.depcd and b.deptreecnt='3')   �����,
ktdepcd ��ȭ��,
(select b2.depnm from payphone.bitelmt b2 where b2.ktdepcd =l.ktdepcd)  ��ȭ����,
area ����,
(select pa.areanm from pt_areamt pa  where pa.depcd = l.depcd and pa.uniind  = '1' and pa.area = l.area AND    area_use = 'Y') ������,
areausr �����,
(select b3.usrname from bimastercf b3  where b3.usrcd = l.areausr) �����,
tel_no ��ȭ��ȣ,
phoneknd ����,
(		SELECT trim(b4.prnm)
		FROM payphone.bibsici b4
		WHERE b4.lcd = '0628'
		AND b4.scd = l.phoneknd) ������,
log_desc ��������,
log_dtm ����ð�,
succ_ox ��������,
log_err_id �����ڵ�,
(SELECT c.ERR_NM FROM TC_ERR@ORACPMS c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','����','������') ��������� 
from payphone.tc_log L
where log_dtm like '20220105%';



SELECT * FROM TC_ERR@ORACPMS;
	



	
	