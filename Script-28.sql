select * from pt_factmt pf where uniind ='2';    

-- 본부, 지사 , 지점, 구역, kt전화국, 전화번호, 설치일자, 설치유형, 고객우편번호, 고객주소, 고객 전화번호, 고객상호명, 상품코드, 교환방식, 착신허용, 국제전화, 소유구분, 청약일, 설치희망일
                                                                                             

select gdgb as gdGb     
             , gdcd as gdCd     
             , gdnm as gdNm     
             , modno as modNo   
 from payphone.pt_gdbasmst
 where 1=1
 and gdgb = 1;
 
   select nvl(lcd,' ') as lcd   
            , nvl(scd,' ') as scd   
            , nvl(prnm, ' ') as prnm  
 from payphone.bibsici    
 where 1=1
 and lcd = '0901'
             
             
             
             
             
             
             
             
             
             
             
             
             
             
            
             
                    order by scd, prnm asc
                    
                    
                     select 
            area
            , usrCd
            , usrName
            , depHighCd
            , depCd
            , accDepCd
            , areaCd
       
 from (
        select
        '' as area
        ,a.areausr as usrCd
        , b.usrName as usrName
        , a.updepcd as depHighCd
        , a.depcd as depCd
        ,'' as accDepCd
        ,'' as areaCd
       
 from payphone.pt_areamt a,
        (
            select
                usrcd,
                usrname
            from
                payphone.bimastercf
            where
                bsnind = '1') b
            where 1=1
            and a.area_use='Y'
            and a.areausr = b.usrcd
            group by  a.updepcd,a.depcd,a.areausr,b.usrName
        ) userInfo;
        
       
       SELECT get_depnm(a.updepcd, 2) as updepcd,
               get_depnm(a.depcd, 3)   as depcd,
               get_ktdepcdnm(a.ktdepcd) as ktdepcd,
               get_usrname(a.areausr)   as areausr,
               get_bibsici_prnm('0242', a.phoneknd) as phoneknd,
               tel_no                   as telno,
               get_bldplcnm(a.bldplcno) as bldplcno,
               curinf_dtm               as curinfDtm
          FROM PAYPHONE.TC_CPMSMT A
         WHERE curinf_dtm   <   '20210817'
           AND remove_ox = '1'
           and unino not in (select unino from tc_cpmssave_ora where '20210817' between substr(save_dtm,1,8) and substr(close_date,1,8))
           ;
           
          select * from tc_cpmssave_ora;
          
         select substr(save_dtm,1,8) from tc_cpmssave_ora where '20210817' between substr(save_dtm,1,8) and substr(close_date,1,8);
         
        
        
        select 
	 	 rn
	 	 , 	unino
	 	 , updepcd
	 	 , depcd
	 	 ,ktdepcd
	 	 ,areausr
	 	 ,phoneknd
	 	 ,tel_no
	 	 ,bldplcno
	 	 ,curinf_dtm
	 	 ,coalesce(gpspoint, '') AS gpspoint
	 	 from 
	 	 (
	 	select 
				unino,
				(select depnm1 from payphone.biintmt where depcd = a.updepcd and deptreecnt::int = 2 and useflag='Y') as updepcd, 
		       (select depnm1 from payphone.biintmt where depcd = a.depcd and deptreecnt::int = 3 and useflag='Y') as depcd,  
		       (select depnm from payphone.bitelmt where ktdepcd = a.ktdepcd) as ktdepcd, 
		       (select usrname from payphone.bimastercf where usrcd = a.areausr) as areausr, 
		       (select prnm from payphone.bibsici where lcd = '0242' and scd = a.phoneknd) as phoneknd, 
		       tel_no, 
		       (select bldplcnm from payphone.pt_bldplc where bldplcno = a.bldplcno) as bldplcno,
		       (select concat(gpsx, gpsy) from payphone.pt_bldplc where bldplcno = a.bldplcno) as gpspoint,
		       curinf_dtm 
		       ,row_number() over (order by  curinf_dtm  ) as rn
		  from payphone.tc_cpmsmt a
		  where curinf_dtm <  '20210816'  || '000000'
		   and updepcd  = 'G000'        
		   and depcd    = 'G260'         
		   --and areausr  = '99998'    
		   and a.remove_ox ='1'
		   and a.unino not in (select unino from tc_cpmssave_ora where '20210816' between substr(save_dtm,1,8) and substr(close_date,1,8) 
		   and updepcd  = 'G000'        
		   and depcd    = 'G260'       
		   )
		   ) a 
		order by rn
		limit '50'::numeric
		offset ('1'::numeric-1)*'50'::numeric;
		
	select * from tc_cpmssave_ora where '20210816' between substr(save_dtm,1,8) and substr(close_date,1,8)
	and updepcd  = 'G000'        
		   and depcd    = 'G260'       
		   ;
	
		  
		  select 
			count(1)		 
 from payphone.tc_cpmsmt a
		where curinf_dtm <  '20210816'  || '000000'
 and updepcd  = 'G000'        
 and depcd    = 'G260'            
 --and areausr  = '99998'    
 and a.remove_ox ='1' 
 and a.unino not in 
 (select unino
 from tc_cpmssave_ora
 where '20210816' between substr(save_dtm,1,8)
 and substr(close_date,1,8)
 and updepcd  = 'G000'
 and depcd = 'G260');
 
 select 
	 	 rn
	 	 , 	unino
	 	 , updepcd
	 	 , depcd
	 	 ,ktdepcd
	 	 ,areausr
	 	 ,phoneknd
	 	 ,tel_no
	 	 ,bldplcno
	 	 ,curinf_dtm
	 	 ,coalesce(gpspoint, '') AS gpspoint
	 	 from 
	 	 (
	 	select 
				unino,
				(select depnm1 from payphone.biintmt where depcd = a.updepcd and deptreecnt::int = 2 and useflag='Y') as updepcd, 
		       (select depnm1 from payphone.biintmt where depcd = a.depcd and deptreecnt::int = 3 and useflag='Y') as depcd,  
		       (select depnm from payphone.bitelmt where ktdepcd = a.ktdepcd) as ktdepcd, 
		       (select usrname from payphone.bimastercf where usrcd = a.areausr) as areausr, 
		       (select prnm from payphone.bibsici where lcd = '0242' and scd = a.phoneknd) as phoneknd, 
		       tel_no, 
		       (select bldplcnm from payphone.pt_bldplc where bldplcno = a.bldplcno) as bldplcno,
		       (select concat(gpsx, gpsy) from payphone.pt_bldplc where bldplcno = a.bldplcno) as gpspoint,
		       curinf_dtm 
		       ,row_number() over (order by  curinf_dtm  ) as rn
		  from payphone.tc_cpmsmt a
		  where curinf_dtm <  '20210817'  || '000000'
		   and updepcd  = 'G000'        
		   and depcd    = 'G210'         
		   --and areausr  = '99998'    
		   and a.remove_ox ='1'
		   and a.unino not in (select unino from tc_cpmssave_ora where '20210817' between substr(save_dtm,1,8) and substr(close_date,1,8) and updepcd  = 'G000' and depcd = 'G260')		   ) a 
		order by rn
	--	limit '50'::numeric
	--	offset ('1'::numeric-1)*'50'::numeric
;

SELECT get_depnm(a.updepcd, 2) as updepcd,
               get_depnm(a.depcd, 3)   as depcd,
               get_ktdepcdnm(a.ktdepcd) as ktdepcd,
               get_usrname(a.areausr)   as areausr,
               get_bibsici_prnm('0242', a.phoneknd) as phoneknd,
               tel_no                   as telno,
               get_bldplcnm(a.bldplcno) as bldplcno,
               curinf_dtm               as curinfDtm
          FROM PAYPHONE.TC_CPMSMT A
         WHERE curinf_dtm   <   '20210817'
           AND remove_ox = '1' 
           AND unino not in (
           						select unino from tc_cpmssave_ora where '20210817' between substr(save_dtm,1,8) and substr(close_date,1,8)
           					);
           					
           				
           				 SELECT get_depnm(a.updepcd, 2) as updepcd,
               get_depnm(a.depcd, 3)   as depcd,
               get_ktdepcdnm(a.ktdepcd) as ktdepcd,
               get_usrname(a.areausr)   as areausr,
               get_bibsici_prnm('0242', a.phoneknd) as phoneknd,
               tel_no                   as telno,
               get_bldplcnm(a.bldplcno) as bldplcno,
               curinf_dtm               as curinfDtm
          FROM PAYPHONE.TC_CPMSMT A
         WHERE curinf_dtm   <   '20210817'  || '000000'
           AND updepcd  = 'G000'
           AND depcd  = 'G210'
           AND remove_ox = '1' 
           AND unino not in (
           						select unino from tc_cpmssave_ora where '20210817' between substr(save_dtm,1,8) and substr(close_date,1,8)
						          AND updepcd  = 'G000'
						          AND depcd  = 'G210'
           					);
           					
           				
           				select * from pt_bldplc pb where ft_use = 0;  
           				
           			
           			select * from pt_factmt pf;
           			
           		select unino, elec_yn, elec_amt,elec_num  from pt_factmthist pf where sttdt 
           		like '2021%' group by unino, elec_yn, elec_amt,elec_num ;
           		
           	
           	select ft_use,
elec_yn,
elec_amt,
elec_num,
road_yn,
road_amt,
road_name,
elec_depnm,
bldloc3,
land_pr,
pay_cl,
sta_date,
end_date,
auto_yn from pt_bldplc pb where ft_use = 0;  


select elec_yn as "전기 점용료 납부 구분", elec_amt as "전기료 납부금액", elec_num as "수용가번호", elec_depnm as "전기료 납부기관", road_yn as "도로점용료 구분", road_amt as "도로점용료 금액", road_name as "도로점용료 납부기관", pay_cl as "납부주기", sta_date as "점용시작일", end_date as "점용종료일" from pt_bldplc pb;

select elec_yn as "전기 점용료 납부 구분", elec_amt as "전기료 납부금액", elec_num as "수용가번호", elec_depnm as "전기료 납부기관" from pt_bldplc pb; 

 select road_yn as "도로점용료 구분", road_amt as "도로점용료 금액", road_name as "도로점용료 납부기관", pay_cl as "납부주기", sta_date as "점용시작일", end_date as "점용종료일" from pt_bldplc pb;
 
select * from ill_tel_use where tel_date like '2020%';

select fact_telno from pt_factmt pf group by fact_telno having count(fact_telno) > 1;


select * from pt_factmt pf where fact_telno ='005402540871';

select * from pt_factmt@oraktlpt where tel1 ='0054' and tel2='0254' and tel3='0871'; 


select * from user_source where text like '%pt_factmthist%';


select road from pt_factmthist pf; 

select * from bimastercf b where usrcd ='admi2';


ALTER TABLE payphone.pt_factmt_h ADD elec_num varchar(30) NULL;
ALTER TABLE payphone.pt_factmt_h ADD elec_depnm varchar(30) NULL;
ALTER TABLE payphone.pt_factmt_h ADD elec_amt numeric NULL;
ALTER TABLE payphone.pt_factmt_h ADD elec_date timestamp NULL;
ALTER TABLE payphone.pt_factmt_h ADD elec_usr varchar(5) NULL;
ALTER TABLE payphone.pt_factmt_h ADD road_amt numeric NULL;
ALTER TABLE payphone.pt_factmt_h ADD road_num varchar(30) NULL;
ALTER TABLE payphone.pt_factmt_h ADD road_date timestamp NULL;
ALTER TABLE payphone.pt_factmt_h ADD road_usr varchar(5) NULL;
ALTER TABLE payphone.pt_factmt_h ADD road_depnm varchar(30) NULL;

COMMENT ON COLUMN payphone.pt_factmt_h.elec_depnm IS '전기료 납부기관';
COMMENT ON COLUMN payphone.pt_factmt_h.elec_num IS '전기료 수용가번호';
COMMENT ON COLUMN payphone.pt_factmt_h.elec_usr IS '전기료 등록자';
COMMENT ON COLUMN payphone.pt_factmt_h.elec_date IS '전기료등록일자';
COMMENT ON COLUMN payphone.pt_factmt_h.elec_amt IS '전기료';
COMMENT ON COLUMN payphone.pt_factmt_h.road_amt IS '도로점용료';
COMMENT ON COLUMN payphone.pt_factmt_h.road_num IS '도로점용료 수용가번호';
COMMENT ON COLUMN payphone.pt_factmt_h.road_date IS '도로점용료 등록일자';
COMMENT ON COLUMN payphone.pt_factmt_h.road_usr IS '도로점용료 등록자';
COMMENT ON COLUMN payphone.pt_factmt_h.road_depnm IS '도로점용료 납부기관';

	-- Pt_Factmt
ALTER TABLE payphone.pt_factmt ADD elec_num varchar(30) NULL;
ALTER TABLE payphone.pt_factmt ADD elec_depnm varchar(30) NULL;
ALTER TABLE payphone.pt_factmt ADD elec_amt numeric NULL;
ALTER TABLE payphone.pt_factmt ADD elec_date timestamp NULL;
ALTER TABLE payphone.pt_factmt ADD elec_usr varchar(5) NULL;
ALTER TABLE payphone.pt_factmt ADD road_amt numeric NULL;
ALTER TABLE payphone.pt_factmt ADD road_num varchar(30) NULL;
ALTER TABLE payphone.pt_factmt ADD road_date timestamp NULL;
ALTER TABLE payphone.pt_factmt ADD road_usr varchar(5) NULL;
ALTER TABLE payphone.pt_factmt ADD road_depnm varchar(30) NULL;


COMMENT ON COLUMN payphone.pt_factmt.elec_depnm IS '전기료 납부기관';
COMMENT ON COLUMN payphone.pt_factmt.elec_num IS '전기료 수용가번호';
COMMENT ON COLUMN payphone.pt_factmt.elec_usr IS '전기료 등록자';
COMMENT ON COLUMN payphone.pt_factmt.elec_date IS '전기료등록일자';
COMMENT ON COLUMN payphone.pt_factmt.elec_amt IS '전기료';
COMMENT ON COLUMN payphone.pt_factmt.road_amt IS '도로점용료';
COMMENT ON COLUMN payphone.pt_factmt.road_num IS '도로점용료 수용가번호';
COMMENT ON COLUMN payphone.pt_factmt.road_date IS '도로점용료 등록일자';
COMMENT ON COLUMN payphone.pt_factmt.road_usr IS '도로점용료 등록자';
COMMENT ON COLUMN payphone.pt_factmt.road_depnm IS '도로점용료 납부기관';


	-- Pt_factmthist
ALTER TABLE payphone.pt_factmthist ADD elec_date timestamp NULL;
ALTER TABLE payphone.pt_factmthist ADD elec_usr varchar(5) NULL;
ALTER TABLE payphone.pt_factmthist ADD road_num varchar(30) NULL;
ALTER TABLE payphone.pt_factmthist ADD road_date timestamp NULL;
ALTER TABLE payphone.pt_factmthist ADD road_usr varchar(5) NULL;


COMMENT ON COLUMN payphone.pt_factmthist.elec_usr IS '전기료 등록자';
COMMENT ON COLUMN payphone.pt_factmthist.elec_date IS '전기료등록일자';
COMMENT ON COLUMN payphone.pt_factmthist.road_num IS '도로점용료 수용가번호';
COMMENT ON COLUMN payphone.pt_factmthist.road_date IS '도로점용료 등록일자';
COMMENT ON COLUMN payphone.pt_factmthist.road_usr IS '도로점용료 등록자';


select unino,  from pt_Factmt pf left outer join pt_bldplc pb on pf.bldplcno = pb.bldplcno where pf.uniind ='1';

update pt_factmt pt set
 pt.elec_amt = pb.elecamt,
 pt.elec_num = pb.elec_num,
 pt.elec_depnm = pb.elec_depnm,
 pt.road_amt = pb.roadamt,
 pt.road_depnm = pb.road_name
from
(select pb.bldplcno,  ((elec_amt)/ cnt) as elecamt, elec_num, elec_depnm,  ((road_amt)/ cnt) as roadamt, road_name from pt_bldplc pb , (select  bldplcno ,count(bldplcno) as cnt from pt_factmt pf where uniind ='1' group by bldplcno) pf
where pb.bldplcno = pf.bldplcno) pb
where pt.bldplcno = pb.bldplcno

select  bldplcno ,count(bldplcno) from pt_factmt pf where uniind ='1' and bldplcno = '0000160185' group by bldplcno ;

select road_amt from pt_bldplc pb where bldplcno in (
select bldplcno from pt_factmt pf where road_amt  = 3600000);

select bldplcno, elec_amt, elec_num, elec_depnm, road_amt, road_name,(select count(1) from pt_factmt pf where uniind ='1' and pf.bldplcno = pb.bldplcno) from pt_bldplc pb where uniind ='1'; 


select * from icis_rcv_hist irh where tid in ('212528U558675A1','212528Q55867491','212528X55867691','212528Y55867891','212528Y55867891'); 

select connect_terminal_2 from icis_rcv_hist irh where rcv_date like '202109%' group by connect_terminal_2;



select * from bimastercf b where group_nm_en ='BranchOffice' and usrcd ='02983';

select * from bimastercf b where usrcd ='02983';

select * from tb_user_group tug; 

select * from pt_factmt pf where fact_telno ='003204210795';

        select * from pt_factmt pf where updepcd ='G000' and uniind ='1' and fact_telno ='003108850912';
        
       select * from pt_bldplc pb where bldplcno ='0000037595';
       
      select connect_terminal_2, phoneknd ,TRAN_FLAG_1 , tran_flag_4 from icis_rcv_hist irh where rcv_date like '202110%' and connect_terminal_2 > '5' ;
      
     
     
     
     
     select pf.fact_telno ,pf.phoneknd,
(select b.cd2 from bibsici b where b.lcd ='0242' and b.scd =pf.phoneknd),
get_bibsici_prnm('0242',pf.phoneknd),pb.bldgb,get_bibsici_prnm('0244',pb.bldgb),decode(pf.exmhod,'01','1','02','1','0'),decode(pf.exmhod,'01','보편','02','보편','수익') from payphone.pt_factmt pf ,payphone.pt_bldplc pb
where pf.bldplcno = pb.bldplcno
and pf.uniind ='1';

select * from bibsici b where b.lcd ='0242' ;

select payphone.proc_batch_pt_factmthist();

select * from pt_factmthist pf; 

select  payphone.proc_batch_pt_factmthist_mul2('20210924');

     
    
    select phoneknd, connect_terminal_2 from icis_rcv_hist irh where rcv_date like '20210928%' ;
    
   select * from tc_cpmsmt_ft tcf where tel_no ='003105360730'; 1319899
   
  select * from pt_factmthist pf where fact_telno = '006202224512';
  
 select tel_id, res5 from tc_cpmsmt_ft tcf where tel_no ='003105360730'; --  [00000006.42109281010^033*242*5255^700024] 
 
 select * from pt_factmt@oracpms pf where tel_no  ='003105360730';   
 

     
     select elec_num from pt_factmt where uniind = '1' and elec_num is not null;
     
    select road_num from pt_factmt pf where road_num is not null;
    
   
   delete from tb_ttcpmsdd tt where telno in ('004302319946','004302319529', '004302384326') and cpmsdt  ='20211012';
   
 select * from pt_ttcpmsdd_q@oraktlpt where telno in ('004302319946','004302319529', '004302384326') and cpmsdt  ='20211012';
  
 select  from pt_ttcpmsdd@oraktlpt;
 
select phoneknd from pt_factmt pf where phoneknd in ('0231','0232','0233');

select phoneknd from pt_factmt pf where phoneknd in ('04');


update 
icis_rcv_hist irh set
phoneknd = '061'
where connect_terminal_2 ='9' and rcv_date like '2021%';

select * from
icis_rcv_hist irh
where connect_terminal_2 ='9' and rcv_date like '2021%';

select * from pt_factmt pf where fact_telno ='000208715108';

select decode('','',null) from dual;


delete from tb_maintain tm where jungtel ='003107219535' and jungid ='admi2';

select connect_terminal_2, phoneknd from icis_rcv_hist irh where rcv_date like '2021101917%';

select * from icis_rcv_hist irh where uniind  ='1' and act_code ='B5' and proc_gubun ='00' and exmhod ='05' order by rcv_date desc;

select exmhod from icis_rcv_hist irh group by exmhod ;


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
 and can_flag = '0'
 ;
 
select exmhod from pt_factmt pf where uniind ='1' ;

select * from pt_tt_muin_jageup ptmj 



select * from icis_rcv_hist irh where ; 


select pf.unino                 as uniNo            
             , pf.updepcd               as depHighCd        
             , pf.depcd                 as depCd            
             , pf.ktdepcd               as ktDepCd          
             , coalesce(pf.depcd||pf.area, '')    as area   
             , pf.fact_telno            as factTelNo        
             , pf.blddt                 as bldDt            
             , pf.gdcd                  as gdCd             
             , payphone.get_gdbasmst_gdnm('1', pf.gdcd) as gdNm
             , coalesce(pf.exmhod, '')  as exMhod           
             , coalesce(pf.recvind, '') as recvInd          
             , coalesce(pf.intcallind, '') as intCallInd    
             , coalesce(pf.usegb, '')   as useGb            
             , pf.status                as status
             , coalesce(pf.remodt, '')  as remoDt           
             , coalesce(pf.remorsn, '') as remoRsn          
             , ''                       as bfMonthAmt
             , pf.custtradnm            as custTradNm       
             , pf.custcall              as custCall         
             , pf.custzip               as custZip          
             , pf.custadr1              as custAdr1         
             , pf.custadr2              as custAdr2         
             , pf.sbtdt                 as sbtDt            
             , pf.bldhdt                as bldHDt           
             , pf.bldamt                as bldAmt           
             , pf.bondamt               as bondAmt          
             , pf.subspt_content        as subSptContent    
             ,arm.areausr as asraUsr
 from payphone.pt_factmt pf
          left outer join payphone.pt_areamt arm on arm.area = pf.area
 and arm.uniind=pf.uniind
 and arm.depcd=pf.depcd
 and arm.area_use = 'Y'
 and arm.area_to ='99991231' 
          left outer join payphone.bimastercf ur on ur.usrcd=arm.areausr
 where 1=1
 and pf.uniind = '2' 
 and pf.status = '1' 
 and pf.fact_knd = '1';

 

select * from "pt_factmtUniind2";
select depcd from biintmt b where depnm ; 

select * from pt_areamt pa where  uniind ='2' and area_use = 'Y';

select * from "pt_factmtUniind2" pfu; 

select areanm ,area from pt_areamt pa where areanm  in (select substring(usrcd ,5) from "pt_factmtUniind2")  and uniind ='2' and area_use = 'Y'

select * from bibsici b where lcd ='0915'; 
select * from pt_factmt pf where uniind ='2';
select * from pt_gdbasmst pg where gdnm like 'YH%'; 

--create table pt_factmt_ja2 as

delete from pt_factmt pf where uniind ='2';

select * from pt_Factmt_ja2;

insert into pt_factmt select * from pt_factmt_ja2;

select * from self_uniind2 where depcd = '강북지사' and area = '강북04';

update "pt_factmtUniind2" a set
a.depcd = b.depcd ,
a.updepcd = b.updepcd,
a.accdepcd = b.accdepcd,
a.usrcd = b.area
from
(
select 
(select depcd from biintmt b where depnm = uniind_temp_null_point.updepcd and deptreecnt = 2) updepcd,
(select depcd from biintmt b where depnm = uniind_temp_null_point.depcd and deptreecnt = 3 and useflag = 'Y') depcd,
(select depcd from biintmt b where depnm = uniind_temp_null_point.accdepcd and deptreecnt in (3,4) and useflag = 'Y') accdepcd,
(select  area from pt_areamt pa where uniind ='2' and areanm = uniind_temp_null_point.area 
and depcd = (select depcd from biintmt b where depnm = uniind_temp_null_point.depcd and deptreecnt = 3 and useflag = 'Y')
and area_use ='Y' group by area) area,
fact_telno
from uniind_temp_null_point) b
where a.fact_telno = b.fact_telno

update uniind_temp_null_point set 
area = '강북02'
where area ='강동1구'

select
(select  area from pt_areamt pa where uniind ='2' and areanm = self_uniind2.area 
and depcd = (select depcd from biintmt b where depnm = self_uniind2.depcd and deptreecnt = 3 and useflag = 'Y')
and area_use ='Y' group by area)
from self_uniind2;

select * from uniind_temp_null_point utnp where fact_telno ='003108213399'; 

select area from pt_areamt pa where uniind = '2' and area_use ='Y' group by area;
select area from self_uniind2 su; 

select * from pt_areamt pa where uniind ='2' and area_use = 'Y' ; 

select * from pt_factmt_ja2 pfj; 

insert into pt_factmt (unino, updepcd, depcd, accdepcd, area, fact_telno, blddt, bldknd, custzip, custadr1, custcall ,custtradnm, gdcd, recvind_ja, intcallind, usegb, sbtdt, bldhdt , uniind, status)
select 
nextval('payphone.seq_pt_factmt'), 
updepcd,
depcd,
accdepcd ,
usrcd,
fact_telno,
blddt,
bldknd,
cuztzip,
custadr1,
custcall,
custtradnm,
coalesce((select gdcd from pt_gdbasmst where gdnm = "pt_factmtUniind2".gdcd and  gdgb ='1' group by gdcd), "pt_factmtUniind2".gdcd),
(select scd from bibsici b where lcd ='0915' and prnm ="pt_factmtUniind2".recvind_ja ),
(select scd from bibsici b where lcd ='0916' and prnm ="pt_factmtUniind2".intcallind ),
(select scd from bibsici b where lcd ='0901' and prnm ="pt_factmtUniind2".usegb),
replace(sbtdt,'-',''),
replace(bldhdt,'-',''),
2,
1
from "pt_factmtUniind2";

update "pt_factmtUniind2" pfu set 
gdcd ='DPT01'
where gdcd ='DP-2000타';

select * from pt_gdbasmst where   gdnm ='DP-2000타' and  gdgb ='1' ;

(select fact_telno from "pt_factmtUniind2" where usrcd is null);

select * from "pt_factmtUniind2";


select * from pt_factmt pf where uniind = '2' and fact_telno ='003304359803';

select * from pt_areamt pa where uniind ='2' and area_use ='Y' and depcd = 'G210'; 



select * from bimastercf b where usrcd in ('01085', '02555');

select * from "pt_factmtUniind2";

select * from self_uniind2 where fact_telno in (select fact_telno from "pt_factmtUniind2" where usrcd is null);

update "pt_factmtUniind2" a set
a.usrcd = b.area
from 
(select '0'||area as area,fact_telno from self_uniind2 su where depcd ='창원지사') b
where a.fact_telno = b.fact_telno;


select be_svc_no from icis_rcv_hist irh where proc_gubun = '11';


select * from pt_factmt_ja2 pfj; 

select * from pt_factmt pf where uniind = '2';

update pt_factmt a set
a.ktdepcd = b.ktdepcd,
a.upktdepcd  = b.upktdepcd,
a.lstdt = to_char(now(),'YYYYMMDDHH24MISS') 
from
(select ktdepcd, upktdepcd, depcd from bitelmt b where useflag ='Y') b
where 
a.depcd = b.depcd
and a.uniind = '2';

update pt_factmt set 
booserno = '0',
boounino = '0'
where uniind = '2';

select * from pt

select ktdepcd, upktdepcd, depcd from bitelmt b where useflag ='Y'; 


select * from icis_rcv_hist irh where proc_gubun ='11';

-- 전화번호(be_svc_no), 오더(act_code), 수신일(rcv_date), 접속단말유형2(connect_Terminal_2), 처리구분1 (tran_flag_1),처리구분4 (tran_flag_4), 처리여부(proc_gubun);


select pf.unino, pf.fact_telno, pf.unino, pf.phoneknd, pf.exmhod, pb.bldgb from pt_factmt pf left outer join pt_bldplc pb on pf.bldplcno = pb.bldplcno ; 

select * from pt_factmt pf where fact_telno ='005407418305';

select * from pt_factmthist pf where fact_telno = '005407418305';

select * from (
select * from 
(select be_svc_no, act_code, rcv_date, connect_terminal_2,tran_flag_1, tran_flag_4, proc_gubun from icis_rcv_hist irh
where rcv_date like '20211027%') a left outer join 
(select pf.unino, pf.fact_telno, pf.unino, pf.phoneknd, pf.exmhod, pb.bldgb from pt_factmt pf left outer join pt_bldplc pb on pf.bldplcno = pb.bldplcno) b 
on a.be_svc_no = b.fact_telno  ) ;


-- 전화번호에 대한 것이어야하나..
-- cos의 현재 상태와 payphone을 비교

select * from (
select pf.unino, pf.fact_telno, b.be_svc_no from
pt_factmt pf left outer join
(
select be_svc_no, phoneknd, connect_terminal_2,tran_flag_1, tran_flag_4, rcv_date, proc_gubun from
icis_rcv_hist irh where ( be_svc_no ,rcv_date) in
(
select be_svc_no, MAX(rcv_date) from icis_rcv_hist irh2  group by be_svc_no 
) 
and
act_code != 'A3' and proc_gubun ='11') b on pf.fact_telno = b.be_svc_no
)
where be_svc_no is null;
;


select pf.unino, pf.fact_telno, b.be_svc_no from
pt_factmt pf left outer join
(
select be_svc_no, phoneknd, connect_terminal_2,tran_flag_1, tran_flag_4, rcv_date, proc_gubun from
icis_rcv_hist irh where ( be_svc_no ,rcv_date) in
(
select be_svc_no, MAX(rcv_date) from icis_rcv_hist irh2  group by be_svc_no 
) 
and
act_code != 'A3' and proc_gubun ='11') b on pf.fact_telno = b.be_svc_no where fact_telno ='003103324958';
;



select pf.unino, pf.fact_telno, pf.uniind, pf.phoneknd, pf.exmhod, pb.bldgb from pt_factmt pf left outer join pt_bldplc pb on pf.bldplcno = pb.bldplcno;


select * from icis_rec_chk irc; 

insert into icis_rec_chk
select
irh.be_svc_no, irh.act_code, irh.phoneknd , irh.connect_terminal_2, irh.tran_flag_1, irh.tran_flag_4, irh.rcv_date, irh.proc_gubun,
pf.unino,pf.fact_telno, pf.uniind, pf.phoneknd, pf.exmhod, pf.bldgb, to_char(now(), 'YYYYMMDDHH24MISS') 
from
(
select be_svc_no, act_code ,phoneknd, connect_terminal_2,tran_flag_1, tran_flag_4, rcv_date, proc_gubun from
icis_rcv_hist irh where ( be_svc_no ,rcv_date) in
(
select be_svc_no, MAX(rcv_date) from icis_rcv_hist irh2  group by be_svc_no 
) 
and
act_code != 'A3') irh
left outer join 
(select pf.unino, pf.fact_telno, pf.uniind, pf.phoneknd, pf.exmhod, pb.bldgb from pt_factmt pf left outer join pt_bldplc pb on pf.bldplcno = pb.bldplcno) 
pf
on irh.be_svc_no = pf.fact_telno;



select proc_gubun from icis_rcv_hist irh where be_svc_no ='003103324958';

select * from pt_factmt pf where fact_telno ='003103324958';

select be_svc_no, count(be_svc_no) from
icis_rcv_hist irh where ( be_svc_no ,rcv_date) in
(
select be_svc_no, MAX(rcv_date) from icis_rcv_hist irh2  group by be_svc_no 
) and act_code = 'A3'   and proc_gubun ='11' group by be_svc_no ;

call payphone.proc_getcpms_tc_cpmsmt();

select payphone.proc_getcpms_tc_cpmsmt();

select * from tb_maintain tm where jungtel ='003108586480' and jungdt like '202110%'; 

proc_batch_tb_maintain_schedule

select * from pt_factmt pf where fact_telno ='003108586480';

select * from tb_maintain_schedule where unino = '1021640' and ;


			
    select depcd,area,retcyl,cnt from (
	select A.DEPCD,A.AREA,get_retcyl(a.boounino) retcyl,COUNT(*) cnt		
	from PT_FACTMT A, pt_bldplc B		
	where A.BLDPLCNO = B.bldplcno
	and get_retcyl(a.boounino)='301'
	and a.uniind ='1'
	and a.depcd like 'G210'
	and a.area like '04' 
	and a.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))	
	group by A.DEPCD,A.AREA,get_retcyl(a.boounino));
	
select unino  from TB_MAINTAIN_SCHEDULE 
	where jungdt is not null
	and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd');

select * from TB_MAINTAIN_SCHEDULE;

select * from user_source where text like '%tb_maintain_schedule%';

PROC_BATCH_TB_MAINTAIN_SCHEDULE

 select ymd,sum(da) da from (		
		SELECT YMD,1 DA FROM DTM_CALENDAR	
		WHERE YMD BETWEEN trunc(sysdate)  AND LAST_DAY(sysdate )	
		AND MINUS_DD ='1'	
		MINUS	
		SELECT A.YMD,DECODE(B.WORK_CD,'AD10',1,0.5) FROM DTM_CALENDAR A,	
		(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY	
		where (STA_YMD between trunc(sysdate)  and LAST_DAY(sysdate )	
		or END_YMD between trunc(sysdate)  and LAST_DAY(sysdate ))	
		and EMP_NO ='02555') B	
		WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD)
		group by ymd;
		
	select * from DTM_CALENDAR;
	
 		select ymd,sum(da) da from (		
		SELECT YMD,1 DA FROM DTM_CALENDAR	
		WHERE YMD BETWEEN trunc(sysdate)  AND LAST_DAY(sysdate )	
		AND MINUS_DD ='1'	
		MINUS	
		SELECT A.YMD,DECODE(B.WORK_CD,'AD10',1,0.5) FROM DTM_CALENDAR A,	
		(select EMP_NO,STA_YMD,END_YMD,WORK_CD from DTM_DAILY_APPL_PAY	
		where (STA_YMD between trunc(sysdate)  and LAST_DAY(sysdate )	
		or END_YMD between trunc(sysdate)  and LAST_DAY(sysdate ))	
		and EMP_NO ='02555') B	
		WHERE YMD BETWEEN B.STA_YMD AND B.END_YMD)
		group by ymd;
		
	
	select SEQ_TB_MAINTAIN_SCHEDULE.NEXTVAL,unino,to_char(list_b.YMD,'yyyymmdd'),list_a.retcyl,SYSDATE from (			         
	         select rownum rnum,unino,bldplcno,ordr from (		
			select d.UNINO,d.BLDPLCNO,e.ORDR
			from PT_FACTMT d, pt_bldplc e
			where d.BLDPLCNO = e.bldplcno
			and get_retcyl(d.boounino) =list_a.retcyl
			and d.AREA = list_a.area
			and d.DEPCD = list_a.depcd
			and d.uniind ='1'
			and d.unino not in (select unino  from TB_MAINTAIN_SCHEDULE 
								where jungdt is not null
				 			and schdt between to_char(sysdate,'yyyymm')||'01' and to_char(last_day(sysdate),'yyyymmdd'))
			order by 3))
		;
		
	
			SELECT boo.retcyl
		FROM pt_factmt AS fac
		LEFT OUTER JOIN pt_boothmt AS boo
		ON fac.boounino = boo.boounino
		WHERE fac.unino = '1021640'
		LIMIT 1;
		
	
	
	
	select  from pt_factmt@oraktlpt pf where uniind = '1'; 
	


	select * from pt_factmt pf where uniind = '2' and status ='1'
	
	;
	

select * from user_source where text like '%pt_factmt@oraktlpt%';

select * from pt_factmt_h pf where uniind ='2' and opdt like '20211028%';


PROC_INS_DEL_PT_FACTMT;

  
 
      select cd_asset,nm_model,nm_note 
     from  fi_asset 
     where lstdt like to_char(now(),'yyyymmdd') || '%' 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
 select * from biintmt b where depcd like 'H%' and deptreecnt in (1,2,3,4);
 

select area from pt_factmt pf where uniind = '2' and depcd ='H040' group by area;



select * from pt_factmt pf where custcall like '%동%'; 


select * from icis_rec_chk irc where proc_gubun ='11';



select COUNT(distinct CUSTcall) 
from payphone.pt_factmt
where uniind ='2'
and status ='1'
and length(CUSTcall) >= 7
and (custadr1 is not null or custadr1!=''); 



select * from tb_loginlog tl where login_ip  ='10.10.160.1'; 

delete from tb_repair tr where gojang_tel ='005108531402' and rev_date ='20211104';

select * from user_source where text like '%tb_repair%';

PROC_CHANGE_PT_FACTMT


PROC_GETGUARD_T_JUBSU_MIG;

select * from fi_asset fa where cd_asset ='A20190800022'; 

select * from refep_fi_asset rfa where cd_asset = 'A20190800022'; 


	select fas.cd_asset,fas.cd_mngdept,fas.nm_size from payphone.refep_fi_asset fas
		left outer join 
		(
		select cd_asset, cd_company,st_asset, ym_dpasset from 
			(
				select cd_asset, cd_company,st_asset, ym_dpasset,
				row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
				from payphone.refep_fi_dpbase
			)
		where rowidx ='1'
		)
	fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset not in ('4','5')
		and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	minus    
	select cd_asset,cd_mngdept,nm_size 
	from payphone.fi_asset;



select cd_asset,cd_mngdept,nm_size from payphone.refep_fi_asset where 
cd_asset = 'A20190800022'; 


			select cd_asset, cd_company,st_asset, ym_dpasset,
			row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
			from payphone.refep_fi_dpbase where cd_asset = 'A20190800022';
			
		
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
	left outer join payphone.fi_asset aa on aa.cd_asset=fas.cd_asset and aa.cd_company=fas.cd_company
	where 1=1
	and fdb.st_asset not in ('4','5')
	and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	and aa.cd_asset is null
	and fas.cd_asset  = 'A20190800022';
	;
	

	select fas.cd_asset,fas.cd_mngdept,fas.nm_size, fas.nm_model, fas.nm_note from payphone.refep_fi_asset fas
		left outer join 
		(
		select cd_asset, cd_company,st_asset, ym_dpasset from 
			(
				select cd_asset, cd_company,st_asset, ym_dpasset,
				row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
				from payphone.refep_fi_dpbase
			)
		where rowidx ='1'
		)
	fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset not in ('4','5')
		and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
	minus    
	select cd_asset,cd_mngdept,nm_size, nm_model, nm_note 
	from payphone.fi_asset;

select * from 

select cd_asset, nm_asset, nm_note, nm_model from payphone.refep_fi_asset fas where cd_company = '1000' and cd_asset ='A20190800022';

select * from pt_boothmt pb where boomgrno = 'A20190800022';

select * from user_source where text like '%oraerp%';

select cd_asset,nm_model,nm_note 
     from  fi_asset 
     where lstdt like to_char(now(),'yyyymmdd') || '%' 
     MINUS
     select cd_asset,nm_model,nm_note from fi_asset@oraerp;
     
    select * from fi_asset where depcd = '';
    


  
   select * from fi_asset fa where cd_asset ='A20190800022';
   
  select fas.cd_asset,fas.cd_mngdept,fas.nm_size, nm_note from payphone.refep_fi_asset fas
		left outer join 
		(
		select cd_asset, cd_company,st_asset, ym_dpasset from 
			(
				select cd_asset, cd_company,st_asset, ym_dpasset,
				row_number() over(partition by cd_asset,cd_company order by ym_dpasset desc ) as rowidx
				from payphone.refep_fi_dpbase
			)
		where rowidx ='1'
		)
	fdb on fdb.cd_asset=fas.cd_asset and fdb.cd_company=fas.cd_company
	where fdb.st_asset not in ('4','5')
		and fas.cd_company = '1000' and fas.tp_asset in ('27110', '27120', '27520', '27522')
		and fas.nm_note = ''
		minus
	select cd_asset,cd_mngdept,nm_size, nm_note from fi_asset	
		
		
		select * from tb_user_password tup where usrcd ='02855';
		
	
	select * from bimastercf b where usrcd ='02855';
	
select accdepcd
 from payphone.pt_factmt
 where fact_telno='004205419991'
 and status='1'
 
 delete from tb_maintain tm where jungid ='admi2';
 
select * from tb_repair tr;

select * from user_source where text like '%rt_jubsu%';

SELECT rev_date, rev_time, '3', 'guard.rt_jubsu'
		, case when (substring(gojang_tel,1,2)='02') then 
			(case when length(gojang_tel)=10 then (trim(to_char(substring(gojang_tel,1,2)::int,'0000')) || substring(gojang_tel,3,4) || substring(gojang_tel,7,4))
				else (trim(to_char(substring(gojang_tel,1,2)::int,'0000')) || trim(to_char(substring(gojang_tel,3,3)::int,'0000')) || substring(gojang_tel,6,4)) end)
		else (
			case when length(gojang_tel)=10 then (trim(to_char(substring(gojang_tel,1,3)::int,'0000')) || trim(to_char(substring(gojang_tel,4,3)::int,'0000')) || substring(gojang_tel,7,4))
			when length(gojang_tel)=11 then (trim(to_char(substring(gojang_tel,1,3)::int,'0000')) || substring(gojang_tel,4,3) || substring(gojang_tel,7,4))
			else gojang_tel end
			) 
		end gojang_tel
		, jubsu_no, updepcd, updepcd_des, depcd1, depcd1_des, ktdepcd, ktdepcd_des
		, sldepcd, sldepcd_des, depcd2, depcd2_des, gojang_cd, singo_gb
		, rev_id, rev_des, singoja_tel, memo, jumgumja_id, jumgumja_des
		, hochul_id, hochul_des, hochul_tel, hochul_date, hochul_time
		, tel_gb, tel_desc, as_gb, gojang_des, wan_flag, sulchi_jangso
		, hochul_gb, sulchi_date, chamgo, "inout", uniind, cti_callkey
		, suri_cd, suri_des, wan_date, wan_time, wanro_flag, ijang_time
		, to_char(now(),'YYYYMMDDHH24mmss'), rev_id
	FROM rt_jubsu@oraguard
	where 1=1 -- where wanro_flag = '0'
--	and jubsu_no not in (select jubsu_no from payphone.tb_repair where rev_date = to_char(current_date,'YYYYMMDD') and rev_cd='3')
	and rev_date = to_char(current_date,'YYYYMMDD');
	
	select * from payphone.tb_repair where rev_date = to_char(current_date,'YYYYMMDD') and rev_cd='1';

select * from 

	select count(*)  from pg_stat_activity
    where query ='select payphone.proc_getcpms_t_jubsu()';
    
   
     select 
			rn
			 ,UNINO
			 ,BLDPLCNO
	 	 	, TELNO
	 	 	, BLDGPS
	 	 	, gps_y
	 	 	, gps_x
	 	 	, faultrep_dtm
	 	 	, bldaddr
	 	 	, TEL_GB
	 	 	, TEL_DESC
	 	 	, gojangDes
	 	 	, revCd
	 	 	, rev_seq
			from 
			(
				select 
					 UNINO
					 ,BLDPLCNO
			 	 	, TELNO
			 	 	, BLDGPS
			 	 	, gps_y
			 	 	, gps_x
			 	 	, faultrep_dtm
			 	 	, bldaddr
			 	 	, TEL_GB
			 	 	, coalesce(TEL_DESC, '') as TEL_DESC
			 	 	, gojangDes
		 			, row_number() over (order by  faultrep_dtm  ) as rn
					, revCd
					, rev_seq
				from 
				(
					select 
					   gojang_tel as TELNO            -- 고장전화번호  
					   ,tel_gb as telGb                    -- 전화기종코드
					   ,gojang_des as gojangDes            -- 고장내역
					   ,sulchi_jangso as bldaddr      	-- 전화위치(설치장소)          
					   ,rev_cd  as revCd
					   , rev_seq 
					   , rev_date || rev_time as faultrep_dtm
					   ,(select prnm from payphone.BIBSICI where lcd = '2053' and scd = rev_cd) as revNm --접수분류
						, b.unino
						, b.bldplcno
						, c.gpsx as BLDGPS
						, gpsy as gps_y
						, gpsx as gps_x
						, a.TEL_GB -- 전화기종코드
		 				, a.TEL_DESC  -- 전화기종
		 				, (select count(1) cnt from payphone.tb_maintain m where m.rev_seq = a.rev_seq) req_cnt -- 정비의뢰 건수
					  from payphone.tb_repair a, payphone.PT_FACTMT b
					 left outer join payphone.pt_bldplc c on b.bldplcno = c.bldplcno
					 where 1=1
					 and a.gojang_tel = b.fact_telno
					 and a.updepcd  = 'I000'       
                     and a.depcd1    = 'I000'
					 and a.jumgumja_id = '02207'
				--	 and b.fact_knd = '1'
					-- and rev_cd in ('1','3') 
					 	) a
				where req_cnt = 0
			) b
			order by rn; 
			
		select * from tb_repair tr where gojang_tel = '005309510124';
		
	--delete 
	
	delete from tb_maintain tm  where jungid ='03824';
	
select * from tb_attachfile ta where lst_dt like '20211215%'; 

ㄴㄷ



select * from pt_bldplc pb where bldplcnm like '%모란지사%';