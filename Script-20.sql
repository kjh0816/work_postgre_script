select * from tb_user_password tup where usrcd ='99999';

select * from tb_user_password tup where usrcd ='99997';

 select * from bimastercf b where usrcd ='99997';

select * from pt_factmt pf; 

select lcd, scd, prnm
 from payphone.bibsici
 where lcd ='2057'
           union all
       select lcd, scd, prnm
 from payphone.bibsici
 where lcd ='2071';
 
select * from tb_maintain tm;

select * from tb_repair tr where ;

select * from tb_maintain tm where rev_seq  in (
select rev_seq from tb_repair tr); 

select * from pt_factmt pf; 

select * from 

INSERT INTO payphone.tb_maintain
		( jungdt  
		, jungtel 
		, depcd
		, accdepcd  
		, updepcd
		, junggb  
		, jungty 
		, jungcd  
		, jungid  
		, jungdes 
		, rev_seq 
		, lstusr
		, gpsx
		, gpsy
		, jung_entr_yn
		, jungsn
		, bldgb
		,unino
		)  
		VALUES(
		to_char(now() , 'YYYYMMDDHH24MISS'),
		'003107215187',
		'F040' ,
		(select accdepcd from payphone.pt_factmt where fact_telno='003107215187' and status='1'),
		'F000',
		'R', 
		'M',
		'1', 
		'99999',
		'',
'0'::int,
'99999', 
'0', 
'0', '', '605391'::int,
		  		 '2' 
		 '1009147'
		  		  );
		  		  
		  		 select * from tb_maintain tm where jungdt  like '20210702%';
		  		 
		  		
		  		select * from tc_fee@oracpms;
		  		
		  	select * from tb_ttcpmsdd tt2 order by cpmsdt  desc;  
		  	
		 select * from tb_repair tr where rev_cd ='5';
		
		update tb_repair set
		wanro_flag = null
		
		
		select * from tb_repair tr ;
		
		   select 
	   rn,
	   rev_cd, rev_date, rev_des, memo, rev_seq
	   from 
	   (
		  select 
		       rev_cd, rev_date, rev_des, memo, rev_seq,
		       row_number() over (order by  lstdt desc  ) as rn
		 from 
		  (
		   select 
		       rev_cd, to_char(to_date(rev_date ||rev_time,'YYYYMMDDHH24MISS'),'YYYY/MM/DD HH24:MI:SS') as rev_date, rev_des, memo, lstdt, rev_seq
	     from payphone.tb_repair a
	     where  1 = 1
	     and updepcd  = 'G000'        
         and depcd1    = 'G260'  
         and rev_cd = '5'
         and jumgumja_id = '99998' 	           
	     and (wanro_flag = '0' or wanro_flag is null)
		  ) a
		 ) b
		order by rn
--        limit '50'::numeric
--        offset ('1'::numeric-1)*'50'::numeric;
--        
       select 
               count(*) cnt
         
 from 
          (
           select 
               rev_cd, rev_date, rev_time, rev_des, memo
           
 from payphone.tb_repair a
           
 where  1 = 1
           
 and updepcd  = 'G000'        
           
 and depcd1    = 'G260'  
           
 and rev_cd = '5'
           
 and jumgumja_id = '99998'             
           
 and (wanro_flag = '0' or wanro_flag is null) 
          ) a;
          
         ;
         
        
        select * from pt_factmt pf; 
        
       select * from pt_bldplc pb; 
       
      select * from pt_boothmt pb; 
      
     select * from tb_user_password tup where usrcd ='99999'; 
     
    
     SELECT 
			a.usrcd as usrCd
			, a.usrname as usrName
            , case when a.dephighcd   <>   '1600'
 and i.deptreecnt = '2' then a.dephighcd else a.depcd end as depCd
			, a.deplvl as depLvl
			, a.dephighcd as depHighCd
			, a.bsnind as bsnInd
			, a.gubun as gubun
			, a.hp_no as hpNo
			, a.lstusr as lstUsr
			, a.lstdt as lstDt
			, b.errcnt as errCnt
			, b.usrpwd as usrPwd
			, b.cretdt as cretDt
			, b.editdt as editDt
			, b.lastdt as lastDt
			, a.group_nm_en groupNmEn
			, i.deptreecnt as depTreeCnt
		    , c.distuse as distUse
		    , c.distmeter as distMeter
		    , c.agreuse as agreUse
		    , c.agregroup as agreGroup
            , nvl(d.area, '') as area
		FROM payphone.bimastercf AS a
		LEFT OUTER JOIN payphone.tb_user_password AS b ON a.usrcd = b.usrcd 
        LEFT OUTER JOIN payphone.biintmt AS i ON a.depcd = i.depcd AND i.deptreecnt IN ('1', '2', '3', '4')
        LEFT OUTER JOIN 
 (select depcd, areausr, area
 from payphone.pt_areamt
 where area_use = 'Y'
 and area_to = '99991231'
 and uniind = '1') d on a.depcd = d.depcd AND a.usrcd = d.areausr
        , payphone.tb_repairset c
		WHERE a.usrcd = '99998'
		limit 1;
		
	
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
          
 and pf.fact_knd = '1'
            
          
 and pf.updepcd = 'G000'
            
            
          
 and pf.depcd = 'G230';
 
select * from pt_elec_tax pet ;

select * from pt_factmt pf; 



select * from pt_bldplc pb; 

select * from pt_factmt pf where depcd = 'G260';

select * from biintmt b where depcd ='G260';

select * from pt_factmt_h pfh; 


select prnm from bibsici b where lcd ='2080';


select fact_telno from pt_factmt_h pfh  group by fact_telno having count(fact_telno) > 1;

select * from
payphone.pt_factmt_h;


ALTER TABLE payphone.pt_factmt_h ADD elec_num varchar(30) NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.elec_num IS '전기료 수용가번호';

ALTER TABLE payphone.pt_factmt_h ADD elec_depnm varchar(30) NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.elec_depnm IS '전기료 납부기관';

ALTER TABLE payphone.pt_factmt_h ADD road_amt numeric NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.road_amt IS '도로점용료';

ALTER TABLE payphone.pt_factmt_h ADD road_num varchar(30) NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.road_num IS '도로점용료 수용가번호';

ALTER TABLE payphone.pt_factmt_h ADD elec_date timestamp NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.elec_date IS '전기료등록일자';

ALTER TABLE payphone.pt_factmt_h ADD road_date timestamp NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.road_date IS '도로점용료 등록일자';


ALTER TABLE payphone.pt_factmt_h ADD elec_usr varchar(5) NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.elec_usr IS '전기료 등록자';


ALTER TABLE payphone.pt_factmt_h ADD road_usr varchar(5) NULL;
COMMENT ON COLUMN payphone.pt_factmt_h.road_usr IS '도로점용료 등록자';


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

select * from pt_factmt pf where uniind ='1' and updepcd ='G000';

select * from bimastercf b where usrcd ='99997';


select el from
pt_Factmthist;


select * from payphone.pt_factmthist where 1=1
--                 and unino = #{value}
                 and opflag not in ('R','D')
                 order by histsn desc,lstdt desc;
                 
                
                        select unino, depcd, blddt, uniind, fact_telno
          , ktdepcd, upktdepcd, accdepcd, updepcd, area
          , '1',  bldplcno, exmhod
          , factgb, null, phoneknd, boounino, booserno
          , phgb, bldknd, custzip, custadr1, custadr2
          , custcall, custtradnm,gdgb,gdtype,gdcd
          , to_char(now(), 'yyyymmddhh24miss'::text)
          , recvind, army_nm, '1', bldamt
          , bondamt, recvind_ja, intcallind, subspt_content
          , bldhdt
          from payphone.pt_factmthist where 1=1
          --and unino = #{unino}
          and opflag ='R'
         order by histsn desc,sttdt desc,lstdt desc
         
         
         ;
         
        select * from pt_factmt pf where updepcd ='G000' and uniind ='1' and fact_telno ='003108850912';
        
       --0031-0791-8379
       
       
       select * from icis_rcv_hist irh con;
       
      
      select * from test;