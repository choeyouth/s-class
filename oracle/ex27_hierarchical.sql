/*

    ex27_hierarchical.sql
    - 오라클 전용 쿼리
    - 레코드의 관계가 서로 상하 수직 관계인 경우에 사용한다 . 
    - 자기 참조를 하는 테이블에서 사용
    - 자바(= 트리구조)
    
    tblSelf 
    홍사장 
        - 김부장 
            - 박과장
                - 최대리   
                    - 정사원 
        - 이부장   
           
    

*/

create table tblComputer (
    seq number primary key,                         --식별자(PK)
    name varchar2(50) not null,                     --부품명
    qty number not null,                            --수량
    pseq number null references tblComputer(seq)    --부모부품(FK)
);

insert into tblComputer values (1, '컴퓨터', 1, null);

insert into tblComputer values (2, '본체', 1, 1);
insert into tblComputer values (3, '메인보드', 1, 2);
insert into tblComputer values (4, '그래픽카드', 1, 2);
insert into tblComputer values (5, '랜카드', 1, 2);
insert into tblComputer values (6, 'CPU', 1, 2);
insert into tblComputer values (7, '메모리', 2, 2);

insert into tblComputer values (8, '모니터', 1, 1);
insert into tblComputer values (9, '보호필름', 1, 8);
insert into tblComputer values (10, '모니터암', 1, 8);
insert into tblComputer values (14, '모니터클리너', 1, 8);

insert into tblComputer values (11, '프린터', 1, 1);
insert into tblComputer values (12, 'A4용지', 100, 11);
insert into tblComputer values (13, '잉크카트리지', 3, 11);

select * from tblComputer;

-- 직원 명단 + 상사 번호(X) > 상사 이름
-- (자식)부품 명단 + 부모 부품명

select 
    c2.name as 부품명,
    c1.name as 부모부품명
from tblComputer c1                 --부모부품
    right outer join tblComputer c2       --자식부품
        on c1.seq = c2.pseq;


/*
    
    계층형 쿼리
    1. start with절
    2. connect by절
    3. 의사 컬럼
        a. prior: 자신과 연관된 부모 레코드를 참조하는 가상 컬럼
        b. level
    

*/

select
    seq as 번호,
    lpad(' ', ((level-1) * 5)) || name as 부품명,
    prior name as 부모부품명,
    level, --세대 수
    connect_by_root name,
    connect_by_isleaf,
    sys_connect_by_path(name, '→')
from tblComputer  
    --start with seq = 1  --최상위 레코드(루트 레코드)
    --start with pseq is null 
      start with seq = (select seq from tblComputer where name = '컴퓨터') 
        connect by prior seq = pseq;  --부모와 자식을 연결하는 조건절(조인)


select
    lpad(' ', (level-1) * 2) || name, 
    department
from tblSelf
    start with super is null
        connect by prior seq = super;

