drop table weekly_menu;
drop table Korean_menu;
drop table japanese_menu;
drop table plus_menu;

CREATE TABLE Weekly_Menu (
	Week_Key Number Primary Key NOT NULL,
	week_date date not NULL
);

CREATE TABLE Korean_Menu (
	K_Key	Number Primary Key NOT NULL,
	K_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);

CREATE TABLE Japanese_Menu (
	J_Key	Number Primary Key NOT NULL,
	J_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);

CREATE TABLE Plus_Menu (
	P_Key	Number  Primary Key NOT NULL,
	P_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);


insert into weekly_menu(week_key, week_date) values(1, sysdate);
insert into korean_menu(k_key, k_name, week_key) values(1, '감자', 1);
insert into korean_menu(k_key, k_name, week_key) values(2, '고구마', 1);
insert into Japanese_Menu(J_Key, J_name, week_key) values(1, '라멘', 1);
insert into Plus_Menu(P_key, P_name, week_key) values(1, '샐러드', 1);

select * from weekly_menu;

select to_char(w.week_date, 'dy'), k.k_name, j.j_name, p.p_name from weekly_menu w
    inner join korean_menu k
        on w.week_key = k.week_key
            inner join japanese_menu j
                on w.week_key = j.week_key
                    inner join plus_menu p
                        on w.week_key = p.week_key
                            where to_char(w.week_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd'); 
