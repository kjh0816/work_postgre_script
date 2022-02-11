




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
(		SELECT trim(b4.prnm)		FROM payphone.bibsici b4		WHERE b4.lcd = '0628'		AND b4.scd = l.phoneknd) 기종명,
log_desc 보고종류,
log_dtm 보고시간,
succ_ox 성공여부,
log_err_id 에러코드,
(SELECT c.ERR_NM FROM TC_ERR c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','정기','비정기') 정기비정기 
from payphone.tc_log L
where log_dtm like '20220105%';


select * from TC_ERR