




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
(		SELECT trim(b4.prnm)		FROM payphone.bibsici b4		WHERE b4.lcd = '0628'		AND b4.scd = l.phoneknd) ������,
log_desc ��������,
log_dtm ����ð�,
succ_ox ��������,
log_err_id �����ڵ�,
(SELECT c.ERR_NM FROM TC_ERR c where c.err_id = l.log_err_id) ERR_NM,
decode(log_gubun,'1','����','������') ��������� 
from payphone.tc_log L
where log_dtm like '20220105%';


select * from TC_ERR