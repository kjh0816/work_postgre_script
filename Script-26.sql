
-- 날짜, 본부, 지사, 사번, 담당자명, 콜센터-무인고장, 콜센터-자급고장, 콜센터-1541,cpms고장건수, 콜센터-무인처리, 콜센터 자급처리, 콜센터-1541처리, cpms처리, 정기점검, 집금횟수, 점검한시설수 
select 
rev_Date,
(select depnm from biintmt b where depcd = aaa.updepcd  and deptreecnt in ('2') group by depnm) as 본부,
(select depnm from biintmt b where b.depcd = aaa.depcd1  and deptreecnt in ('3') group by depnm)  as 지사 ,
hochul_id as 사번,
(select usrname from vw_mergehr_bimastercf vmb  where usrcd =  aaa.hochul_id  ) as 이름,
sum(callmu) as 콜센터무인고장,
sum(callja) as 콜센터자급고장,
sum(callone) as 콜센터일오사일고장,
sum(cpmsgo) as cpms고장,
sum(callmujung) as 콜센터무인처리,
sum(calljajung) as 콜센터자급처리,
sum(callonejung) as 콜센터일오사일처리,
sum(callcpmsjung) as cpms처리,
sum(cpmsghl) as cpms회복,
(sum(callcpmsjung) + sum(cpmsghl)) as 계,
sum(junggi) as 정기점검,
sum(jub) as 집금,
sum(jungsisal) as 점검한시설수
from (
select
rev_Date, updepcd, depcd1, hochul_id, 
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as callmu,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as callja,
0 as callone,
0 as cpmsgo,
0 as callmujung,
0 as calljajung,
0 as callonejung,
0 as callcpmsjung,
0 as cpmsghl,
0 as junggi,
0 as jub,
0 as jungsisal
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1' 
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='3'
--union all
--select
--rev_Date, updepcd, depcd1, hochul_id, 
--0,
--0,
--0,
--1,
--0,
--0,
--0,
--0,
--0,
--0,
--0,
--0,
--0
--from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='5'
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='2'
union all
select
rev_Date, updepcd, depcd1, hochul_id, 
0,
0,
0,
0,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'1',1,0) as callwanmu,
decode((select uniind from pt_factmthist  where opflag != 'F' and fact_telno = gojang_tel and   sttdt  <= rev_date and lstdt >= rev_date group by uniind),'2',1,0) as callwanja,
0,
0,
0,
0,
0,
0
from tb_repair tr where rev_date between '20210101' and '20210531' and rev_cd ='1' 
and( wanro_flag is not null or wanro_flag != '0') 
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='3' 
and ( wanro_flag is not null or wanro_flag != '0')
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='2' and lstusr != '30000'
and ( wanro_flag is not null or wanro_flag != '0') 
union all
select
rev_Date,
updepcd,
depcd1,
hochul_id,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0
from tb_repair where rev_date between '20210101' and '20210531' and rev_cd ='2' and lstusr = '30000'
and ( wanro_flag is not null or wanro_flag != '0') 
union all
select 
substring(jungdt,1,8) dt,
A.updepcd, 
A.depcd,
A.areausr,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0 from PAYPHONE.TB_MAINTAIN_SCHEDULE B left outer join pt_factmthist A on A.unino = B.unino and sttdt <= substring(jungdt, 1,8) and lstdt >= substring(jungdt, 1,8)
where jungdt between '20210101'|| '000000' and '20210531'|| '235959'
union all
select cpmsdt as dt,
(select dephighcd from biintmt b where depcd = tb.depcd  and deptreecnt in ('1','2','3','4')) as updepcd,
depcd,
areausr,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
0
from tb_ttcpmsdd tb where cpmsdt between '20210101' and '20210531'  group by cpmsdt,(select dephighcd from biintmt b where depcd = tb.depcd and useflag ='Y' and deptreecnt in ('1','2','3','4')),depcd,areausr,telno
union all
select  dt,
tm.updepcd,
tm.depcd,
areausr,   
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1
from 
(select substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel
from tb_maintain tm  where substring(jungdt, 1,8) between '20210101' and '20210531'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel) tm
) aaa group by rev_date ,updepcd, depcd1 , hochul_id order by rev_date,updepcd, depcd1 , hochul_id asc ;

select * from tb_maintain_schedule tms ; 

select * from tb_repair tr where rev_date like '20210111' and hochul_id is null;

select unino from tb_maintain_schedule tms2 where jungdt like '20210114%' 
minus
select unino from pt_factmthist pf where unino in (
select unino from tb_maintain_schedule tms where jungdt like '20210114%')
and lstdt >= '20210114' and sttdt <= '20210114';

select * from pt_factmthist pf where  unino in (49895
) and opflag ='D';

select * from pt_areamt pa where "call" ='01034511551';

select * from bimastercf b where usrcd ='02505';

select jungtel from tb_maintain tm where jungdt like '20210503%' and jungid ='01667' group by jungtel ;

select ST_Transform(ST_GeomFromText('POINT('||gpsy||' '|| gpsx ||')', 4326), 2097) from (
select row_number() over(partition by jungtel order by substring(tm.jungdt, 1,8) desc) rn,substring(tm.jungdt, 1,8) dt, updepcd, depcd, jungid as areausr, jungtel,gpsx, gpsy 
from tb_maintain tm  where substring(jungdt, 1,8) between '20210420' and '20210420' and jungid ='02169'
group by substring(tm.jungdt, 1,8), tm.updepcd, tm.depcd,jungid, jungtel, junggb,gpsx, gpsy)
where rn =1;


select substring(tm.jungdt, 1,8), updepcd,depcd, jungtel, junggb from tb_maintain tm  where substring(jungdt, 1,8) between '20210503' and '20210503' and jungid ='01667' group by substring(tm.jungdt, 1,8), updepcd,depcd,jungtel, junggb;

select * from tb_cosscpmsmm tc; 

select * from tb_ttcossdd tt  where ssdt between '20210101' and '20210530'; 

select * from tb_ttcpmsdd where cpmsdt left outer join (select ssdt, hdepcd, telno, ) between '20201220' and '20210530' ;

select 1/100 *800;

select round( 555/800 * 100);

select unino, ssdt, updepcd, depcd, accdepcd , area, areausr, bldplcno, telno, coin500, coin100, coin50, coin10, (coin500 + coin100 + coin50 + coin10) as coin_sum,
round( (coin500 + coin100 + coin50 + coin10) /800 * 100 ) as persent, amount from tb_ttcossdd tt  where ssdt between '20210101' and '20210530' order by round( (coin500 + coin100 + coin50 + coin10) /800 * 100 )  desc;



select depcd, area, username, count(1) from (

 select 
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) updepcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) depcd,  pf.area,
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as username,
              round(avg(coin500)), round(avg(coin100)), round(avg(coin50)), round(avg(coin10)), round(avg(amount)) 
              ,round((avg(coin500) + avg(coin100) + avg(coin50) + avg(coin10)) / 8)
              ,COUNT(1)
             from pt_factmt pf left outer join  tb_ttcossdd tt on pf.unino = tt.unino where  ssdt between '20150101' and '20210630'         
             group by pf.updepcd, pf.depcd, pf.uniind,  pf.area
            
             ) group by depcd, area,username having count(1) >1;
            
            
 select 
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) 본부,
             -- pf.updepcd, pf.depcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) 지사, 
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as 담당자
               ,round(avg(coin500)) as "500원", round(avg(coin100)) as "100원", round(avg(coin50)) as "50원", round(avg(coin10)) as "10원", round(avg(amount)) as 평균금액 
              ,round((avg(coin500) + avg(coin100) + avg(coin50) + avg(coin10)) / 8) as 충만률
              from pt_factmt pf left outer join tb_ttcossdd tt on pf.unino = tt.unino 
              where  ssdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.area 
          
             select updepcd, depcd, area from tb_ttcossdd where  areausr = '01219' and ssdt between '20150101' and '20210630' group by updepcd, depcd, area ;
           
           select depcd, area from pt_factmt pf where uniind ='1' group by depcd, area;
          
          select get_area_usrname('I030','1','02') ;
          
         select * from bimastercf b where usrname ='정태홍';
         
          select * from biintmt b where depnm like '동부산%'
          
          select usrname from bimastercf b where usrname in ('강동호',
'안상철',
'정태홍',
'조을선',
'최영철')
           
           select * from bimastercf b where gubun = '2'; 
            
             select  ssdt,
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) updepcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) depcd,
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as username,
              pf.fact_telno , coin500, coin100, coin50, coin10, amount
              ,round(((coin500) + (coin100) + (coin50) + (coin10)) / 8)
             from pt_factmt pf, tb_ttcossdd tt where
             pf.fact_telno = replace(tt.telno,'-','')  and ssdt between '20150101' and '20210630'
             and pf.fact_telno = '006102426835' and ssdt ='20210518'
             order by ssdt
            ;
            
           select * from tb_ttcossdd tt where ssdt  = '20210518' and telno ='006102426835';
           
          select * from pt_factmt pf where 
          
            select fact_telno from pt_factmt pf where uniind ='1';
            
            select * 
            from tb_ttcossdd tt where ssdt between '20160101' and '20210630' and ssdt ='20180109' and telno ='0002-0482-0559';

select * from tb_ttcpmsdd tt where unino ='958560' and cpmsdt between '20210421' and '20210518';

select * from tb_ttcossdd tt where unino = '958560' and ssdt like '2021%'

select * from payphone.tmp_bimastercf tb 
 where usrcd like 'sg%'; 

https://mpp.ktlinkus.com:1443/mobile/mlogin/login.do
sg123 / ktlsg123!

select * from payphone.tb_user_password tup where usrcd ='sg123';

select coinfull_rate, round(avg(coinfull_amt)), round(avg(coinfull_cnt)), count(1) from tc_cpmsmt tc group by coinfull_rate order by coinfull_rate 

select * from tb_ttcossdd tt ;

select elec_amt, road_amt from pt_bldplc pb where bldplcno ='0000002565'; 


select * from bldplc_temp_amt bta; 

select * from pt_ttcobalance pt where ssdt ='20210518' and depcd ='O030' and accdepcd ='O030';

select * from tb_ttcpmsdd;

select * from tb_ttcpmsdd where cpmsdt between '20150101' and '20210630';

select updepcd, depcd, tel_no from tc_cpmsmt tc; 

select  (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) updepcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) depcd,
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as username --,
              --pf.fact_telno , round(avg(amount)), round(avg(amount)/739)
                from pt_factmt pf 
              left outer join tb_ttcpmsdd tt on pf.unino = tt.unino where  cpmsdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.area ;  
              
             
             
select  (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) updepcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) depcd,
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as username ,
               round(avg(amount)), round(avg(amount)/739)
               from pt_factmt pf 
              left outer join tb_ttcpmsdd tt on pf.unino = tt.unino where  cpmsdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.area ;
              
              
             minus
              select 
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) 본부,
             -- pf.updepcd, pf.depcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) 지사, 
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as 담당자
              from pt_factmt pf left outer join tb_ttcossdd tt on pf.fact_telno = replace(tt.telno,'-','') and tt.updepcd = pf.updepcd and tt.depcd = pf.depcd and tt.area = pf.area
              where  ssdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.area ;
             
             select * from bimastercf b where usrname = '김승하' ; 3 02871
            
            select * from tb_ttcossdd tt where depcd ='H020' and areausr ='02871' and ssdt between '20150101' and '20210630'; 
           
            select 
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) 본부,
             -- pf.updepcd, pf.depcd,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) 지사, 
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as 담당자
              from pt_factmt pf left outer join tb_ttcossdd tt on pf.fact_telno = replace(tt.telno,'-','') and tt.updepcd = pf.updepcd and tt.depcd = pf.depcd and tt.area = pf.area
              where  ssdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.area ;
            
            select * from pt_areamt pa where areausr ='02871';
             
           
                     
 select 
              (select depnm from biintmt b where b.depcd = pf.updepcd and deptreecnt in ('2')) 본부,
              pf.updepcd, pf.depcd, pf.area,
              (select depnm from biintmt b where b.depcd = pf.depcd and deptreecnt in ('3')) 지사, 
              get_area_usrname(pf.depcd, pf.uniind, pf.area) as 담당자, pf.fact_telno 
               ,round(avg(coin500)) as "500원", round(avg(coin100)) as "100원", round(avg(coin50)) as "50원", round(avg(coin10)) as "10원", round(avg(amount)) as 평균금액 
              ,round((avg(coin500) + avg(coin100) + avg(coin50) + avg(coin10)) / 8) as 충만률
              from pt_factmt pf left outer join tb_ttcossdd tt on pf.unino = tt.unino 
              where  ssdt between '20150101' and '20210630'
              group by pf.updepcd, pf.depcd, pf.uniind,  pf.fact_telno , pf.area ;
              
             select get_area_usrname('H020','1','06');
            
            select unino from tb_ttcossdd tt where tt.areausr ='02871'and ssdt between '20210101' and '20210630'; 
            
            select * from pt_factmt pf where unino ='980390'
             
                     select * from pt_factmt pf where pf.depcd ='H020' and uniind ='1'