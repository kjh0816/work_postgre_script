select depcd,uniind ,area from payphone.pt_areamt pa 
where area_use ='Y'
group by depcd,uniind ,area
having count(*) > 1;


select b.cd_asset, a.depcd from payphone.fi_asset b,(select depcd, org_cd from payphone.biintmt where deptreecnt in ('3','1','2')) a
where a.org_cd = b.cd_mngdept
minus
select cd_asset,DEPCD from payphone.fi_asset

select org_cd, count(*) from payphone.biintmt 
where  deptreecnt in ('3','1','2')
group by org_cd having  count(*) > 1;


select * from biintmt b where depnm like '%남원%';

select * from biintmt b where depnm like '%영주%';

select * from biintmt b where depcd = 'I252';
005406358627
005406358626
select * from pt_factmt where fact_telno = '005406358627';

select * from pt_factmt where depcd = 'I252' and ;



select a.jungsn as jungSn
             , get_bibsici_prnm('2066',c.uniind) as uniind
             , a.junggb as jungGb
             , get_depnm(c.updepcd, '2') as upDepCdNm,c.updepcd
             , get_depnm(c.depcd, '3') as depCdNm,c.depcd
             , get_ktdepcdnm(c.ktdepcd) as ktDepCdNm,c.ktdepcd
             -- , get_usrname(a.jungid) as jungNm
             , get_usrname(c.areausr) as jungNm,c.areausr
             , get_phonegb_prnm(c.phoneknd) as phoneKnd,c.phoneknd
             , a.jungtel as jungTel
             , c.bldplcnm as bldPlcNm
             , b.revDate
             , b.gojang_des as gojangDes
             , a.jungdt as jungDate
             , coalesce(a.jungty, '') as jungTy
             , coalesce(a.jungcd, '') as jungCd
             , a.jungdes as jungDes
             , get_usrname(a.lstusr) as usrName
             , case
                when a.jungdt >= to_char(now()-4, 'YYYYMMDD') then 'Y'
                else 'N'
               end as canFlag
             , case
                when a.jungid = 'admi2' then 'Y'
                else 'N'
               end as usrCanFlag
             , a.rev_seq as revSeq
             , a.jung_entr_yn as jungEntrYn
             , case when
 (select count(1) cnt
 from payphone.tb_attachfile t
 where t.uniqno = a.jungsn::text
 and t.file_gb = 'mnt'
 and t.del_yn = 'N') > 0 then 'O' else 'X' end mnt_cnt
                 , get_bibsici_prnm('0244',a.bldgb) as bldGb
 from payphone.tb_maintain a
               left join
 (select rev_date||rev_time as revDate
                     , gojang_des
                     , rev_seq
 from payphone.tb_repair
 where 1=1
 and rev_date   <=   '20220209'||'235959'
 and rev_date   >=   '20220201'||'000000'
                )b
               on a.rev_seq = b.rev_seq
               left join
                       payphone.pt_factmthist c
                on a.jungtel = c.fact_telno
 and a.updepcd = c.updepcd
 and c.sttdt   <=   substring(a.jungdt,1,8)
 and c.lstdt   >=   substring(a.jungdt,1,8)
 where 1=1
 and a.jungtel like '%'||'005506340790'||'%'
 and a.jungdt   <=   '20220209' ||'235959'
 and a.jungdt   >=   '20220201'||'000000'
         order by a.jungdt desc;
        
select * from payphone.pt_factmthist pf 
where fact_telno ='005506340790'

select fact_telno  from payphone.pt_factmt pf2 
minus
select fact_telno 
from pt_factmthist pf ;



select * from user_source where lower(text) like '%pt_factmthist%'

PROC_BATCH_PT_FACTMTHIST

PROC_UPDATE_PT_FACTMTHIST

		