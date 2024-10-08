-- 1. 대여별, 구매별 각각 가격이 비싼 영화부터 가져오시오.
select m.*, pr.purchaserental_choose, um.usage_price from movie m 
	inner join usage_method um
		on m.movie_id = um.movie_id
			inner join purchase_rental pr
				on pr.purchaseRental_id = um.purchaseRental_id
					order by pr.purchaserental_choose desc, um.usage_price desc;

-- 2. '라미란' 배우가 출연한 영화를 가져오시오.
select a.actor_name, m.* from movie m
    inner join Actor_list al 
        on m.movie_id = al.movie_id
            inner join Actor a 
                on al.actor_id = a.actor_id
    where a.ACTOR_NAME = '라미란';

-- 3. '김성훈' 감독이 제작한 영화를 가져오시오.
select * from movie m
    inner join director_list dl 
        on m.movie_id = dl.movie_id
            inner join director d 
                on dl.director_id = d.director_id
    where d.DIRECTOR_NAME = '김성훈';

-- 4. 더빙 영화를 가져오시오.
select * from movie 
    where dubbed_available = 'TRUE';

-- 5. 별점 8.0 이상 받은 영화를 가져오시오.
select * from movie
    where rating >= 8.0
        order by rating; 

-- 6. 감상평이 없는 영화를 가져오시오. ******************************************************************************
select * from movie
    where movie_id not in (select m.movie_id from movie m
        inner join usage_method um
            on m.movie_id = um.movie_id
                inner join comments c
                    on um.USAGEMETHOD_ID = c.USAGEMETHOD_ID
                        group by m.movie_id);
                        
-- 7. 등록된 50개의 영화중 가장 많은 영화에 참여한 배우를 가져오시오.
select * from 
    (select a.actor_name from actor a
        inner join actor_list al
            on a.ACTOR_ID = al.ACTOR_ID
                inner join movie m
                    on m.movie_id = al.movie_id
                        group by a.actor_name
                            order by count(*) desc)
                                where rownum = 1;
                                
-- 8. 좋아요(하트) 50개 이상이면서 15세 관람가 이상인 영화들을 가져오시오.            
select * from movie 
    where heart >= 50 and age_rating in('15세 관람가', '청소년 관람불가'); 

-- 9. 러닝타임이 120분 미만인 영화를 가져오시오.
SELECT *
    FROM movie
        WHERE running_time < 120;

-- 10. 감상평 중 싫어요를 가장 많이 받은(누적) 영화를 가져오시오.
select title, (select max(c.dislikes_count) from movie m
    inner join usage_method u
        on u.movie_id = m.movie_id
            inner join comments c
                on c.usagemethod_id = u.usagemethod_id) as max_dislikes_count
from movie m
    inner join usage_method u
        on u.movie_id = m.movie_id
            inner join comments c
                on c.usagemethod_id = u.usagemethod_id 
                    where c.dislikes_count = (select max(c.dislikes_count) from movie m
                                                inner join usage_method u
                                                    on u.movie_id = m.movie_id
                                                        inner join comments c
                                                            on c.usagemethod_id = u.usagemethod_id);

-- 11. 대여와 구매를 모두 가능한 영화를 가져오시오.  
select m.title from movie m
	inner join usage_method um
		on m.movie_id = um.movie_id
			inner join purchase_rental pr
				on pr.purchaserental_id = um.purchaserental_id
                     group by m.title
                        having count(m.title) = 2
                            order by m.title;


-- 12. 랭킹 순위가 가장 많이 오른 영화와 랭킹 순위가 가장 많이 떨어진 영화를 가져오시오.   **************************************************************   
select 
title, 
(select max(r.change_rank) from movie m
     inner join ranking r
        on m.movie_id = r.movie_id) as rank
from movie m
    inner join ranking r
        on m.movie_id = r.movie_id
            where r.change_rank = (select max(r.change_rank) from movie m
                                   inner join ranking r
                                   on m.movie_id = r.movie_id)
union all
select 
title, 
(select min(r.change_rank) from movie m
     inner join ranking r
        on m.movie_id = r.movie_id) as rank
from movie m
    inner join ranking r
        on m.movie_id = r.movie_id
            where r.change_rank = (select min(r.change_rank) from movie m
                                   inner join ranking r
                                   on m.movie_id = r.movie_id);


-- 가장 많이 랭킹 순위가 오른 영화
select m.title, r.change_rank from movie m
    inner join ranking r
        on m.movie_id = r.movie_id
            where r.change_rank = (select max(change_rank) from ranking)
union all
-- 가장 많이 랭킹 순위가 떨어진 영화
select m.title, r.change_rank from movie m
inner join ranking r
    on m.movie_id = r.movie_id
        where r.change_rank = (select min(change_rank) from ranking);


