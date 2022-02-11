select * from tc_cpmssave_ora tco; 

select * from pt_areamt pa;

get_usrname

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
			    where  1=1
	                  and b.yyyymm between '20210501' and '20210628'
			    group by tel_no
			) b ,
			(select unino from payphone.tc_cpmssave_ora 
			where 1=1 and
			(save_dtm BETWEEN '20210628'||'000000' AND '20210628'||'235959')
			        or
			(close_date 
	                     >=  '20210628'||'000000' AND save_dtm  <=  '20210628'||'000000')
			)  c
			where 1=1
			 and a.fact_telno = b.tel_no(+)
			 and a.unino = c.unino(+)
			 and (
			 a.REMODT  >=  '20210601' or
			   a.REMODT is null or a.REMODT ='')
			 and total_amt  <=   '50000'::numeric
			 and a.fact_telno like '003108460149'|| '%'
		group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd;
		
	select * from 
	
	select unino from payphone.tc_cpmssave_ora 
			where 1=1 and
			((save_dtm BETWEEN '20210628'||'000000' AND '20210628'||'235959')
			        or
			(close_date 
	                     >=  '20210628'||'000000' AND save_dtm  <=  '20210628'||'000000'))
	                     and unino 
			
	
	
			    select   tel_no,  sum(b.city_amt) city_amt, sum(b.otct_amt) otct_amt,
			    sum(b.word_amt) word_amt,sum(b.t114_amt) t114_amt, sum(b.down_amt) down_amt, sum(b.amount) amount, sum(b.etc_amt) etc_amt,
			    sum(b.total_amt) total_amt from payphone.tc_month_v b 
			    where  1=1
	                  and b.yyyymm between '20210601' and '20210628'
			    group by tel_no;
			
			   
			   select * from user_source where text like '%t_log_des_v%';
			   
			  
			  PROC_BATCH_GETCPMS_TCMONTHV
			  
			  PROC_GETGUARD_CLDT;
			  
			 SELECT yyyymm, updepcd, tel_no, phoneknd, city_amt,
	otct_amt, word_amt, t114_amt, down_amt, amount,
	etc_amt, total_amt, area, areausr
	FROM tc_month_v@oracpms 
	where 1=1
	and substr(yyyymm,1,8) = '202106';

			 SELECT yyyymm, updepcd, tel_no, phoneknd, city_amt,
	otct_amt, word_amt, t114_amt, down_amt, amount,
	etc_amt, total_amt, area, areausr
	FROM tc_month_v@oracpms  where tel_no ='003108460149';

select * from tc_cpmssave_ora tco where unino ='977784';

select * from tc_month_v tmv where tel_no ='003108460149';
			  

select
        log_dtm logDtm, 
        get_depnm(updepcd,2) upDepNm,
        get_depnm(depcd,3) depNm,
        get_ktdepcdnm(ktdepcd) ktDepNm,
        (select usrname from payphone.bimastercf where usrcd = areausr) as areaUsr,
        tel_no as factTelNo,
        get_phonegb_prnm(phoneknd) prNm,
        bldplcnm as bldPlcNm,
        amt amt,
        pre_amt as preAmt,
        amt_minus as minusAmt,
        pre_log_dtm as preLogDtm,
        log_err_id logErrId,
        pre_err_id preErrId,
        description description
      from payphone.t_log_des_v
        where 1=1
          and log_dtm between '20210601' and '20210628'
          and amt_minus  >=   '0'::numeric;
          
         
          select
 (select depnm
 from payphone.biintmt
 where depcd = a.updepcd
 and deptreecnt in ('1','2','3','4')) upDepNm,
 (select depnm
 from payphone.biintmt
 where depcd = a.depcd
 and deptreecnt in ('1','2','3','4')) depNm,
 (select depnm
 from payphone.bitelmt
 where ktdepcd = a.ktdepcd) ktDepNm,
                        (SELECT MIN(AREANM)     FROM payphone.PT_AREAMT WHERE DEPCD = a.depcd AND UNIIND = a.uniind AND AREA = a.area
 and area_use = 'Y') areaNm,
 (select usrname
 from payphone.bimastercf
 where usrcd =
 (select areausr
 from payphone.pt_areamt pa WHERE DEPCD = a.depcd AND UNIIND = a.uniind AND AREA = a.area
 and area_use = 'Y' )) areaUsr,
                        a.fact_telno as factTelNo,
 (select prnm
 from payphone.bibsici
 where lcd = '0242'
 and scd = a.phoneknd) prNm,
 (select bldplcnm
 from payphone.pt_bldplc
 where bldplcno = a.bldplcno) bldPlcNm,
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
                            sum(b.total_amt) total_amt
 from payphone.tc_month_v b
 where  1=1
 and b.yyyymm between '20210601'
 and '20210628'
                            group by tel_no
                        ) b ,
 (select unino
 from payphone.tc_cpmssave_ora
                        where 1=1 and
 (save_dtm BETWEEN '20210628'||'000000' AND '20210628'||'235959')
                                or
                        (close_date
                             >=  '20210628'||'000000' AND save_dtm  <=  '20210628'||'000000')
                        )  c
                        where 1=1
 and a.fact_telno = b.tel_no(+)
 and a.unino = c.unino(+)
 and a.updepcd like 'G000' || '%'
 and a.depcd   like 'G210'|| '%'
 and a.area   like '07' || '%'
 and (

                         a.REMODT  >=  '20210601' or
                           a.REMODT is null or a.REMODT ='')
 and total_amt  <=   '50000'::NUMERIC
                group by a.updepcd, a.depcd, a.ktdepcd, a.fact_telno ,  a.phoneknd,a.bldplcno, a.uniind,a.area, a.accdepcd;

               
--               select pb.elec_amt, pb.road_amt, bta.elec_amt, bta.road_amt from pt_bldplc pb, bldplc_temp_amt bta where pb.bldplcno = bta.bldplcno ; 
--               
--              update pt_bldplc pb set
--              pb.elec_amt = bta.elec_amt, 
--              pb.road_amt = bta.road_amt 
--              from  bldplc_temp_amt bta where pb.bldplcno =bta.bldplcno ;
              
               
               
               select bldplcno from pt_factmt pf where fact_telno ='000207414639'
               
               select * from pt_bldplc pb where bldplcno ='2013100104';
              
             
             
             select count(1) from tb_ttcossdd tt; 
              
              select * from tc_cpmsmt tc where coinfull_rate = '50'; 
             
             select * from tb_ttcpmsdd tt where ; 
              
              select * from tb_ttcpmsdd tt; 
             
             select * from tc_cpmsmt tc where coinfull_rate =70;
               
            select * from 
            
            select * from tc_