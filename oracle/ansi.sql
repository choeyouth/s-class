commit;

-- ANSI SQL

-------------------------------------출결---------------------------------------
------------------------------------관리자--------------------------------------
-- 1. 특정 개설 과정을 선택하는 경우 모든 교육생의 출결을 조회 할 수 있다.
select s.name , a.attendancedate, ad.inTime, ad.outTime 
    from tblAttendance a
    inner join tblAttendDetail ad on ad.tblAttendance_id  = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
        where tblOpenCourse_id = 1;
                
        

-- 2. 출결 현황은 기간별(년,월,일)로 조회 할 수 있다.
select oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    from tblAttendance a
    inner join tblAttendDetail ad on ad.tblAttendance_id  = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
        where a.attendanceDate = '2023-03-03'; --조회를 원하는 날짜 
                
        

-- 3. 특정 과정별 출결 현황 조회시 (과정명, 출결날짜, 근태상황, 인원)을 출력 할 수 있다.
select oc.name as 과정명, a.attendancedate as 출결날짜, count(*) as 인원,
    count(case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1
    end) as 정상출석,
    count(case
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1
    end) as 지각,
    count(case
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
    end) as "지각/조퇴",
    count(case
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1
    end) as 조퇴,
    (count(*) 
        - count(case when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1 end) 
        - count(case when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1 
                     when  ad.id is null and sr.id is null then 1 end)
        - count(case when sr.tblAttendance_id = a.id then 1 end)) 
        - count(case
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
    end) 
    as 외출,
    count(case
        when sr.tblAttendance_id = a.id then 1
    end) as 병가,
    count(case
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1
        when  ad.id is null and sr.id is null then 1
    end) as 결석
    from tblAttendance a
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
    where oc.id = 1
        group by oc.name, a.attendancedate, oc.id
            order by 출결날짜;
            
            
            
-- 4. 특정 수강생별 개인 출결 현황 조회시 (수강생 이름, 출결날짜, 근태상황)을 출력 할 수 있다.
select s.name as 수강생명, a.attendancedate as 출결날짜, 
    case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then '정상'
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then '지각'
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then '조퇴'
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then '지각/조퇴'
        when sr.tblAttendance_id = a.id then '병가'
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then '결석'
        when  ad.id is null and sr.id is null then '결석'
        else '외출'
    end as 근태상황
    from tblAttendance a
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
    where s.id = 1;













-------------------------------------교사---------------------------------------
-- 0. 제약사항
-- 본인이 강의한 과정에 대한 출결만 조회할 수 있다.
-- 모든 출결 조회는 근태 상황을 구분할 수 있다. (정상, 지각, 조퇴, 외출, 병가, 기타)



-- 1. 수강생들의 출결 현황을 기간별(년, 월, 일) 조회할 수 있다.
select distinct oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    from tblTeacher t 
    inner join tblOpenSubject os on t.id = os.tblteacher_id
    inner join tblOpenCourse oc on os.tblOpenCourse_id = oc.id
    inner join tblAttendance a on a.tblOpenCourse_id = oc.id
    inner join tblAttendDetail ad on ad.tblAttendance_id  = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
        where t.id = 4 and a.attendanceDate between '2023-03-01' and '2023-03-31' --조회를 원하는 날짜
            order by a.attendanceDate;



-- 2. 특정 과정(과정명, 출결날짜, 근태상황, 인원)에 대한 출결 현황을 조회할 수 있다.
select distinct oc.name as 과정명, a.attendancedate as 출결날짜, count(*) as 인원,
    count(case when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1 end) as 정상출석,
    count(case when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1 end) as 지각,
    count(case when ad.inTime > '09:00:00' and  
                    ad.outTime < '18:00:00' and
                   (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
          end) as "지각/조퇴",
    count(case when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1 end) as 조퇴,
    (count(*) 
        - count(case when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1 end) 
        - count(case when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1 
                     when  ad.id is null and sr.id is null then 1 end)
        - count(case when sr.tblAttendance_id = a.id then 1 end)) 
        - count(case
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
    end) 
    as 외출,
    count(case when sr.tblAttendance_id = a.id then 1 end) as 병가,
    count(case when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1
               when  ad.id is null and sr.id is null then 1
          end) as 결석
    from tblTeacher t 
    inner join tblOpenSubject os on t.id = os.tblteacher_id
    inner join tblOpenCourse oc on os.tblOpenCourse_id = oc.id
    inner join tblAttendance a on a.tblOpenCourse_id = oc.id
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
        where t.id = 4 and oc.id = 1
            group by oc.name, a.attendancedate, oc.id, os.id
            order by 출결날짜;




-- 3. 특정 교육생(교육생 이름, 출결날짜, 근태상황)에 대한 출결 현황을 조회할 수 있다.
select s.name as 수강생명, a.attendancedate as 출결날짜,
    case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then '정상'
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then '지각'
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then '조퇴'
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then '지각/조퇴'
        when sr.tblAttendance_id = a.id then '병가'
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then '결석'
        when  ad.id is null and sr.id is null then '결석'
        else '외출'
    end as 근태상황
    from tblTeacher t 
    inner join tblOpenSubject os on t.id = os.tblteacher_id
    inner join tblOpenCourse oc on os.tblOpenCourse_id = oc.id
    inner join tblAttendance a on a.tblOpenCourse_id = oc.id
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
        where t.id = 4 and s.id = 1
            order by 출결날짜;





select * from tblOpenSubject;






-----------------------------------교육생---------------------------------------
-- 0. 제약사항
-- 다른 교육생의 현황은 조회할 수 없다.
-- 모든 출결 조회는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타) 


-- 1. 매일 출석을 기록해야 한다. 
-- 출근 1회, 퇴근 1회 기록한다.
-- 조퇴(18시 이전 퇴근 기록), 외출(출근, 퇴근 2회씩 기록) 중에 해당되는 사항이 있을 경우 기록한다. 
-- 병가 중에 해당되는 사항이 있을 경우 기록한다.

-- 출결
insert into tblAttendance(id, attendanceDate, tblStudent_id, tblOpenCourse_id) values (seqAttendance.nextVal, sysdate, 351, 16);

-- 출근
insert into tblAttendDetail(id, inTime, outTime, tblAttendance_id) values(seqAttendDetail.nextVal, '08:31:23', null, 32001);

-- 퇴근
update tblAttendDetail set outTime = '18:01:34' where tblAttendance_id = 32001;

-- 병가
insert into tblAttendance(id, attendanceDate, tblStudent_id, tblOpenCourse_id) values (seqAttendance.nextVal, sysdate, 351, 16);
insert into tblSickRecord(id, tblAttendance_id) values(seqSickRecord.nextVal, 32002);




-- 2. 매일 금일 출석을 조회할 수 있다. 
-- 금일 출석 현황에는 교육생 이름, 과정명, 날짜, 근태 상황이 포함된다.
select s.name, oc.name, a.attendanceDate,
    case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then '정상'
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then '지각'
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then '조퇴'
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then '지각/조퇴'
        when sr.tblAttendance_id = a.id then '병가'
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then '결석'
        when  ad.id is null and sr.id is null then '결석'
        else '외출'
    end as 근태상황
        from tblAttendance a
        inner join tblAttendDetail ad on a.id = ad.tblAttendance_id
        inner join tblStudent s on s.id = a.tblStudent_id
        inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
        full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
            where to_date(a.attendanceDate, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd')
                  and s.id = 266;

select * from tblAttendance;



-- 3. 본인의 출결 현황을 기간별(전체, 월, 일) 조회할 수 있다.
select distinct oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    from tblOpenCourse oc
    inner join tblAttendance a on a.tblOpenCourse_id = oc.id
    inner join tblAttendDetail ad on ad.tblAttendance_id  = a.id
    inner join tblStudent s on s.id = a.tblStudent_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
        where s.id = 24 and a.attendanceDate between '2023-03-01' and '2023-03-31' --조회를 원하는 날짜
            order by a.attendanceDate; 








---------------------------------뷰---------------------------------------------
drop view vwAttendState;

create or replace view vwAttendState 
as
select oc.id as 과정번호, oc.name as 과정명, a.attendancedate as 출결날짜, count(*) as 인원,
    count(case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1
    end) as 정상출석,
    count(case
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1
    end) as 지각,
    count(case
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
    end) as "지각/조퇴",
    count(case
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1
    end) as 조퇴,
    (count(*) 
        - count(case when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then 1 end) 
        - count(case when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then 1 end) 
        - count(case when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1 
                     when  ad.id is null and sr.id is null then 1 end)
        - count(case when sr.tblAttendance_id = a.id then 1 end)) 
        - count(case
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then 1
    end) 
    as 외출,
    count(case
        when sr.tblAttendance_id = a.id then 1
    end) as 병가,
    count(case
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then 1
        when  ad.id is null and sr.id is null then 1
    end) as 결석
    from tblAttendance a
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
        group by oc.name, a.attendancedate, oc.id
            order by 출결날짜;

select * from vwAttendState;








create or replace view vwStudentAtted
as
select s.name as 수강생명, a.attendancedate as 출결날짜, 
    case 
        when ad.inTime <= '09:00:00' and ad.outTime >= '18:00:00' then '정상'
        when ad.inTime > '09:00:00' and ad.outTime >= '18:00:00' then '지각'
        when ad.outTime < '18:00:00' and ad.inTime <= '09:00:00' then '조퇴'
        when ad.inTime > '09:00:00' and  
             ad.outTime < '18:00:00' and
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 then '지각/조퇴'
        when sr.tblAttendance_id = a.id then '병가'
        when (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 then '결석'
        when  ad.id is null and sr.id is null then '결석'
        else '외출'
    end as 근태상황
    from tblAttendance a
    full outer join tblAttendDetail ad on a.id = ad.tblAttendance_id
    inner join tblOpenCourse oc on oc.id = a.tblOpenCourse_id
    full outer join tblSickRecord sr on sr.tblAttendance_id = a.id
    inner join tblStudent s on s.id = a.tblStudent_id;

select * from vwstudentatted;

