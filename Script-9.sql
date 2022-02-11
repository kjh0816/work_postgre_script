select * from neoe.NEOE.FI_TB_TAXDOWN2 ftt where CD_COMPANY like 'TEST' and  YMD_WRITE like '202009%'
 and SELL_NO_BIZ ='1208200052';

-- 전기요금 -- 
-- 이지영 대리님 만약 오면 이거 컴퍼니 를 TEST로 변경하면 된다
select * from neoe.NEOE.FI_TB_TAXDOWN2 ftt where  CD_COMPANY like '1000' and  YMD_WRITE like '202010%'
 and SELL_NO_BIZ ='1208200052' and SELL_NM_CORP  ='한국전력공사';

select * from neoe.NEOE.fi_dpbase where st_asset not in ('4','5') and cd_company = '1000' and CD_ASSET in (select CD_ASSET from NEOE.NEOE.FI_ASSET fa where cd_company = '1000'  and tp_asset in ('27110', '27120', '27520', '27522') and NM_NOTE is null );-- where cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');

select * from NEOE.NEOE.fi_dpbase  where cd_asset in ('A20190800018','A20190800020','A20190800021','A20190800023');


select * from NEOE.NEOE.FI_DPBASE fd where CD_ASSET ='A20190800022';

select * from NEOE.NEOE.FI_ASSET fa where CD_ASSET ='A20190800022'; 

-- 증발된 자산 company test로 변경
--update NEOE.NEOE.FI_ASSET set
--CD_COMPANY = 'TEST'
--where cd_company = '1000'  and cd_asset in ('A20201200007'); 


select * from NEOE.NEOE.FI_DOCU fb where dt_acct like '202108%' and DT_WRITE > '20210901'; 


SELECT 
DOCU.CD_BIZCAR, 0 num_mileacc,0 num_endacc,
sum(DECODE(DOCU.CD_ACCT,'42107050',DOCU.AM_DR,0)) RENT_AMT,
sum(DECODE(DOCU.CD_ACCT,'42116020',DOCU.AM_DR,'42116030',DOCU.AM_DR,0)) OIL_AMT,
sum(DECODE(DOCU.CD_ACCT,'42108080',DOCU.AM_DR,0)) ADD_AMT,
sum(DECODE(DOCU.CD_ACCT,'42112040',DOCU.AM_DR,0)) INS_AMT,
sum(DECODE(DOCU.CD_ACCT,'42107050',0,'42108080',0,'42112040',0,DOCU.AM_DR)) ETC_AMT
FROM	NEOE.FI_DOCU@KTLERP DOCU
INNER JOIN NEOE.FI_BIZACCTJO@KTLERP JO 
ON		JO.CD_COMPANY = DOCU.CD_COMPANY AND JO.CD_ACCT = DOCU.CD_ACCT
WHERE	DOCU.CD_COMPANY = '1000'
AND DOCU.DT_ACCT LIKE AV_YYYYMM||'%'
AND		DOCU.TP_DRCR = '1'
AND		(DOCU.CD_BIZCAR IS NOT NULL AND DOCU.CD_BIZCAR <> ' ')
AND		DOCU.ST_DOCU = '2' 
group by DOCU.CD_BIZCAR
UNION ALL
SELECT cd_bizcar,SUM(num_mileacc) num_mileacc,MAX(num_endacc) num_endacc ,0 RENT_AMT,0 OIL_AMT,0 ADD_AMT,0 INS_AMT,0 ETC_AMT
FROM NEOE.FI_BIZTRIP@KTLERP
WHERE	CD_COMPANY = '1000'
AND DT_USE LIKE AV_YYYYMM||'%'
GROUP BY cd_bizcar)
GROUP BY cd_bizcar);

-- 

 select * from payphone.fi_bizcaramt_mng;

SELECT cd_bizcar,SUM(num_mileacc) num_mileacc,MAX(num_endacc) num_endacc ,0 RENT_AMT,0 OIL_AMT,0 ADD_AMT,0 INS_AMT,0 ETC_AMT
FROM neoe.NEOE.FI_BIZTRIP
WHERE	CD_COMPANY = '1000'
AND DT_USE LIKE  '202108%' and CD_BIZCAR like '영남%'
GROUP BY cd_bizcar;

select * from NEOE.NEOE.FI_BIZTRIP where DT_USE like '202108%' and CD_BIZCAR like '영남%';