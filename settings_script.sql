CREATE OR REPLACE PROCEDURE insert_default_settings(p_member_seq NUMBER) AS
BEGIN

    INSERT INTO theme (seq, theme, member_seq) VALUES (seqTheme.nextVal, 0, p_member_seq);
    
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '14', 1, p_member_seq);
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, 'Consolas', 2, p_member_seq);
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#1E1E1E', 3, p_member_seq); 
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#D4D4D4', 4, p_member_seq);   
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#608B4E', 5, p_member_seq); 
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#569CD6', 6, p_member_seq); 
    INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#CE9178', 7, p_member_seq); 
    
    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'sysout', 'System.out.println(${1});${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'trycatch', 'try {\n    ${1}\n} catch (${2:Exception} ${3:e}) {\n    ${4}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'tryfinally', 'try {\n    ${1}\n} finally {\n    ${2}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'main', 'public static void main(String[] args) {\n    ${0}\n}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'if', 'if (${1:condition}) {\n    ${2}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'else', 'else {\n    ${1}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'catch', 'catch (${1:Exception} ${2:e}) {\n    ${3}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'finally', 'finally {\n    ${1}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'switch', 'switch (${1:key}) {\n    case ${2:value}:\n        ${0}\n        break;\n    default:\n        break;\n}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'while', 'while (${1:condition}) {\n    ${2}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'dowhile', 'do {\n    ${0}\n} while (${1:condition});');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'for', 'for (int ${1:index} = 0; ${1:index} < ${2:array}.length; ${1:index}++) {\n    ${3}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'foreach', 'for (${1:Type} ${2:item} : ${3:collection}) {\n    ${0}\n}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'syserr', 'System.err.println(${1});${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'ifelse', 'if (${1:condition}) {\n    ${2}\n} else {\n    ${2}\n}${0}');    
    INSERT INTO template (seq, member_seq, keyword, code) VALUES (seqTemplate.nextVal, p_member_seq, 'ifelseif', 'if (${1:condition}) {\n    ${2}\n} else if (${3:condition}) {\n    ${4}\n} else {\n    ${5}\n}${0}');
    
    
END;
/

BEGIN
    insert_default_settings(29);
END;
/


CREATE OR REPLACE PROCEDURE switchTheme(
    theme IN NUMBER,
    member_seq IN NUMBER
)
AS
BEGIN
    IF theme = 1 THEN
        -- 전환: 다크 모드에서 라이트 모드
        UPDATE styleSetting SET value = '#FFFFFF' WHERE styleType_seq = 3 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#000000' WHERE styleType_seq = 4 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#3A7F25' WHERE styleType_seq = 5 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#001EF5' WHERE styleType_seq = 6 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#96261F' WHERE styleType_seq = 7 AND member_seq = member_seq;
    ELSIF theme = 0 THEN
        -- 전환: 라이트 모드에서 다크 모드
        UPDATE styleSetting SET value = '#1E1E1E' WHERE styleType_seq = 3 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#D4D4D4' WHERE styleType_seq = 4 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#608B4E' WHERE styleType_seq = 5 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#569CD6' WHERE styleType_seq = 6 AND member_seq = member_seq;
        UPDATE styleSetting SET value = '#CE9178' WHERE styleType_seq = 7 AND member_seq = member_seq;
    END IF;
END switchTheme;
/


BEGIN
    switchTheme(0, 1); -- 사용자 1에 대해 다크 모드에서 라이트 모드로 전환
END;
/

BEGIN
    switchTheme(1, 2); -- 사용자 2에 대해 라이트 모드에서 다크 모드로 전환
END;
/

select * from styleSetting where member_seq = 29;

commit;

update theme set theme = '1' where member_seq = 22;
update template set code = 'System.out.println(\\${1});\\${0}', keyword = 'sysout' where member_seq = '1';


select * from tabs;

select * from chatbot;
select * from member;
select * from team;
select * from memberTeam;
select * from theme;
select * from styleType;
select * from styleSetting;
select * from basicTemplate; 
select * from template;

update styleSetting set value = '#1E1E1E' where seq = 3;
commit;
rollback;

DELETE FROM template WHERE seq = 73;	

UPDATE styleSetting 
SET value = 
CASE 
WHEN styleType_seq = 1 THEN '16' 
WHEN styleType_seq = 2 THEN '나눔 고딕 코딩' 
END 
WHERE styleType_seq IN (1, 2) AND member_seq = '1';


UPDATE styleSetting 
SET value = 
CASE 
WHEN styleType_seq = 1 THEN '16' 
WHEN styleType_seq = 2 THEN '나눔 고딕 코딩' 
END 
WHERE styleType_seq IN (1, 2) AND member_seq = '1'; 
commit;

INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '14', 1, p_member_seq);
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, 'Consolas', 2, p_member_seq);

update styleSetting set value = 'Consolas' where styleType_seq = 2 and member_seq = 1;
update styleSetting set value = '16' where styleType_seq = 1 and member_seq = 1;

select * from styleSetting ss inner join styleType st on st.seq = ss.styleType_seq where category in ('fontSize', 'fontFamily') and member_seq = 1;
select ss.seq, ss.value, ss.member_seq, st.category from styleSetting ss inner join styleType st on st.seq = ss.styleType_seq where category in ('fontSize', 'fontFamily') and member_seq = 1;
select ss.seq, ss.value, ss.member_seq, ss.styleType_seq, st.category from styleSetting ss inner join styleType st on st.seq = ss.styleType_seq where category in ('fontSize', 'fontFamily') and member_seq = 1;
drop table styleSetting;
drop table styleType;
commit; 
select * from styleSetting;
SELECT * FROM styleType;
delete from styleSetting;
create sequence seqStyleSetting;
create sequence seqStyleType;


CREATE TABLE theme (
    seq NUMBER PRIMARY KEY,
    theme NUMBER DEFAULT 0 NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_theme_member
        FOREIGN KEY (member_seq) REFERENCES member(seq)
);

CREATE TABLE styleType (
    seq NUMBER PRIMARY KEY,
    category VARCHAR2(50) NOT NULL
);

CREATE TABLE styleSetting (
    seq NUMBER PRIMARY KEY,
    value VARCHAR2(100) NOT NULL,
    styleType_seq NUMBER NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_styleSetting_member
        FOREIGN KEY (member_seq) REFERENCES member(seq),
    CONSTRAINT fk_styleSetting_styleType
        FOREIGN KEY (styleType_seq) REFERENCES styleType(seq)       
);


CREATE TABLE basicTemplate (
    seq NUMBER NOT NULL,
    keyword varchar2(100) NOT NULL,
    code VARCHAR2(2000) NOT NULL
);


CREATE TABLE template (
    seq NUMBER NOT NULL,
    keyword varchar2(100) NOT NULL,
    code VARCHAR2(2000) NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_template_member
        FOREIGN KEY (member_seq) REFERENCES member(seq)
);

		select 
			ss.seq, ss.value, ss.member_seq, ss.styleType_seq, st.category 
		from styleSetting ss 
		inner join styleType st on st.seq = ss.styleType_seq 
		where category in ('fontSize', 'fontFamily') 
			and member_seq = 1;
  
UPDATE styleSetting
SET value = 
       CASE 
           WHEN styleType_seq = 3 THEN '#1E1E1E'
           WHEN styleType_seq = 4 THEN '#D4D4D4'
           WHEN styleType_seq = 5 THEN '#608B4E'
           WHEN styleType_seq = 6 THEN '#569CD6'
           WHEN styleType_seq = 7 THEN '#CE9178' 
       END
WHERE styleType_seq BETWEEN 3 AND 7 AND member_seq = '1';            
        
commit;        
          
select * from styleSetting;
            
select ss.seq, ss.value, ss.member_seq, ss.styleType_seq, st.category from styleSetting ss 
inner join styleType st on st.seq = ss.styleType_seq where category in ('fontSize', 'fontFamily') 
and member_seq = '1';

create sequence seqTheme;
INSERT INTO theme (seq, theme, member_seq) VALUES (seqTheme.nextVal, DEFAULT, 1);
commit;
create sequence seqStyleType;
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'fontSize');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'fontFamily');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editor.background');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editor.foreground');  
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'java.comment');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'java.keyword');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'java.String');

update styleType set category='java.string' where seq = 7;

delete from styleType;
delete from styleSetting;
select * from styleSetting;
rollback;
commit;

drop sequence seqStyleSetting;
create sequence seqStyleSetting;
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '14', 1, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, 'Consolas', 2, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#1E1E1E', 3, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#D4D4D4', 4, 1);   
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#608B4E', 5, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#569CD6', 6, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#CE9178', 7, 1); 


INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#FFFFFF', 3, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#000000', 4, 1);   
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#3A7F25', 5, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#001EF5', 6, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '#96261F', 7, 1); 
		select 
			ss.seq, ss.value, ss.member_seq, ss.styleType_seq, st.category 
		from styleSetting ss 
		inner join styleType st on st.seq = ss.styleType_seq 
		where st.seq between 3 and 7 
			and member_seq = 1;
commit;



create sequence seqBasicTemplate;
INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'sysout', 'System.out.println(${1});${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'trycatch', 'try {\n    ${1}\n} catch (${2:Exception} ${3:e}) {\n    ${4}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'tryfinally', 'try {\n    ${1}\n} finally {\n    ${2}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'main', 'public static void main(String[] args) {\n    ${0}\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'if', 'if (${1:condition}) {\n    ${2}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'else', 'else {\n    ${1}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'catch', 'catch (${1:Exception} ${2:e}) {\n    ${3}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'finally', 'finally {\n    ${1}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'switch', 'switch (${1:key}) {\n    case ${2:value}:\n        ${0}\n        break;\n    default:\n        break;\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'while', 'while (${1:condition}) {\n    ${2}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'dowhile', 'do {\n    ${0}\n} while (${1:condition});');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'for', 'for (int ${1:index} = 0; ${1:index} < ${2:array}.length; ${1:index}++) {\n    ${3}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'foreach', 'for (${1:Type} ${2:item} : ${3:collection}) {\n    ${0}\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'syserr', 'System.err.println(${1});${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'ifelse', 'if (${1:condition}) {\n    ${2}\n} else {\n    ${2}\n}${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'ifelseif', 'if (${1:condition}) {\n    ${2}\n} else if (${3:condition}) {\n    ${4}\n} else {\n    ${5}\n}${0}');




create sequence seqTemplate;
INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'sysout', 'System.out.println(${1});${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'trycatch', 'try {\n    ${1}\n} catch (${2:Exception} ${3:e}) {\n    ${4}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'tryfinally', 'try {\n    ${1}\n} finally {\n    ${2}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'main', 'public static void main(String[] args) {\n    ${0}\n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'if', 'if (${1:condition}) {\n    ${2}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'else', 'else {\n    ${1}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'catch', 'catch (${1:Exception} ${2:e}) {\n    ${3}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'finally', 'finally {\n    ${1}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'switch', 'switch (${1:key}) {\n    case ${2:value}:\n        ${0}\n        break;\n    default:\n        break;\n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'while', 'while (${1:condition}) {\n    ${2}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'dowhile', 'do {\n    ${0}\n} while (${1:condition});');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'for', 'for (int ${1:index} = 0; ${1:index} < ${2:array}.length; ${1:index}++) {\n    ${3}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'foreach', 'for (${1:Type} ${2:item} : ${3:collection}) {\n    ${0}\n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'syserr', 'System.err.println(${1});${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'ifelse', 'if (${1:condition}) {\n    ${2}\n} else {\n    ${2}\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'ifelseif', 'if (${1:condition}) {\n    ${2}\n} else if (${3:condition}) {\n    ${4}\n} else {\n    ${5}\n}${0}');





INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'class', 'public class ${1:ClassName} {\n\n    private ${2:Type} ${3:field};\n\n    public ${1:ClassName}(${2:Type} ${3:field}) {\n        this.${3:field} = ${3:field};\n    }\n\n    public ${2:Type} get${3:Field}() {\n        return ${3:field};\n    }\n\n    public void set${3:Field}(${2:Type} ${3:field}) {\n        this.${3:field} = ${3:field};\n    }\n\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'unittest', '@Test\npublic void ${1:testMethod}() {\n    // given\n    ${2:Setup code}\n\n    // when\n    ${3:Execution code}\n\n    // then\n    assert${4:Condition}(${5:Expected}, ${6:Actual});\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'gettersetter', 'public ${1:Type} get${2:Field}() {\n    return ${3:field};\n}\n\npublic void set${2:Field}(${1:Type} ${3:field}) {\n    this.${3:field} = ${3:field};\n}${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'lambda', '${1:collection}.stream()\n    .filter(${2:item} -> ${3:condition})\n    .forEach(${2:item} -> {\n        ${0} \n    });');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'switchenum', 'switch (${1:enumVariable}) {\n    case ${2:EnumValue1}:\n        ${0} \n        break;\n    case ${3:EnumValue2}:\n        \n        break;\n    default:\n        throw new IllegalArgumentException("Unexpected value: " + ${1:enumVariable});\n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'trywithresources', 'try (${1:ResourceType} ${2:resource} = new ${1:ResourceType}()) {\n    ${0} \n} catch (${3:ExceptionType} ${4:e}) {\n    ${5} \n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'jsonparse', 'ObjectMapper objectMapper = new ObjectMapper();\n${1:Type} ${2:variable} = objectMapper.readValue(${3:jsonData}, ${1:Type}.class);${0}');

commit;



create sequence seqMember;
-- drop sequence seqMember;
CREATE TABLE member (
	seq	number	primary key,
	id	varchar2(150) unique	NOT NULL,
	pw	varchar2(100)	NOT NULL,
	nick	varchar2(100) unique	NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	ing	number	DEFAULT 1	NOT NULL,
	color	number	DEFAULT 1	NOT NULL,
	oAuthType	number	DEFAULT 1	NOT NULL
);

create sequence seqTeam;
-- drop sequence seqTeam;
CREATE TABLE team (
	seq	number	primary key,
	teamName	varchar2(50)	NOT NULL,
	teamEx	varchar2(1000)	NULL,
	teamType	number	DEFAULT 2	NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL
);

create sequence seqProject;
-- drop sequence seqProject;
CREATE TABLE project (
	seq	number	primary key,
	projectName	varchar2(50)	NOT NULL,
	projectEx	varchar2(1000)	NULL,
	startDate	date	DEFAULT sysdate	NOT NULL,
	target	date	DEFAULT sysdate	NOT NULL,
	priority	number	DEFAULT 3	NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL
);

create sequence seqMemberTeam;
-- drop sequence seqMemberTeam;
CREATE TABLE memberTeam (
	seq	number	primary key,
	member_seq	number	NOT NULL,
	team_seq	number	NOT NULL,
	position	number	DEFAULT 2	NOT NULL,
    constraint fk_memberTeam_member foreign key(member_seq) references member(seq),
    constraint fk_memberTeam_team foreign key(team_seq) references team(seq)
);

create sequence seqTeamProject;
-- drop sequence seqTeamProject;
CREATE TABLE teamProject (
	seq	number	primary key,
	team_seq	number	NOT NULL,
	project_seq	number	NOT NULL,
    constraint fk_teamProject_project foreign key(project_seq) references project(seq)
);

create sequence seqCalendar;
-- drop sequence seqCalendar;
CREATE TABLE calendar (
	seq	number	primary key,
	teamProject_seq	number	NOT NULL,
	startDate	date	DEFAULT sysdate	NOT NULL,
	target	date	NULL,
	priority	number	NULL,
	schedule	varchar2(100)	NOT NULL,
    constraint fk_calendar_teamProject foreign key(teamProject_seq) references teamProject(seq)
);

-- 챗봇 -----
create sequence seqChatbot;
-- drop sequence seqChatbot;
CREATE TABLE chatbot (
	seq	number	primary key,
	member_seq	number	NOT NULL,
	memberMsg	varchar2(2000)	NOT NULL,
	botMsg	varchar2(2000)	NOT NULL,
	chatDate	date	DEFAULT sysdate	NOT NULL,
    constraint fk_chatbot_member foreign key(member_seq) references member(seq)
);

-- 코드 편집기 -----
create sequence seqTheme;
-- drop sequence seqTheme;
CREATE TABLE theme (
	seq	number	NOT NULL,
	theme	number(1)	DEFAULT 0	NOT NULL,
	member_seq	number	NOT NULL,
    constraint fk_theme_member foreign key(member_seq) references member(seq)
);

create sequence seqStyleType;
-- drop sequence seqStyleType;
CREATE TABLE styleType (
	seq	number	primary key,
	category	varchar2(50)	NOT NULL
);

create sequence seqStyleSetting;
-- drop sequence seqStyleSetting;
CREATE TABLE styleSetting (
	seq	number	primary key,
	value	varchar2(100)	NOT NULL,
	member_seq	number	NOT NULL,
	styleType_seq	number	NOT NULL,
    constraint fk_styleSetting_member foreign key(member_seq) references member(seq),
    constraint fk_styleSetting_styleType foreign key(styleType_seq) references styleType(seq)
);

create sequence seqBasicTemplate;
-- drop sequence seqBasicTemplate;
CREATE TABLE basicTemplate (
	seq	number	NOT NULL,
	keyword	varchar2(100)	NOT NULL,
	code	varchar2(2000)	NOT NULL
);

create sequence seqTemplate;
-- drop sequence seqTemplate;
CREATE TABLE template (
	seq	number	primary key,
	keyword	varchar2(100)	NOT NULL,
	code	varchar2(2000)	NOT NULL,
	member_seq	number	NOT NULL,
    constraint fk_template_member foreign key(member_seq) references member(seq)
);

create sequence seqVersionInfo;
-- drop sequence seqVersionInfo;
CREATE TABLE versionInfo (
	seq	number	primary key,
	regdate	date	DEFAULT sysdate	NOT NULL,
	message	varchar2(300)	NULL,
	project_seq	number	NOT NULL,
	member_seq	number	NOT NULL,
    constraint fk_versionInfo_project foreign key(project_seq) references project(seq),
    constraint fk_versionInfo_member foreign key(member_seq) references member(seq)
);

create sequence seqFileType;
-- drop sequence seqFileType;
CREATE TABLE fileType (
	seq	number	primary key,
	fileType	varchar2(100)	NOT NULL
);

create sequence seqVersionFile;
-- drop sequence seqVersionFile;
CREATE TABLE versionFile (
	seq	number	primary key,
	name	varchar2(600)	NOT NULL,
	code	clob	NULL,
	versionInfo_seq	number	NOT NULL,
	fileType_seq	number	NOT NULL,
	parent_seq	number	NULL,
    constraint fk_versionFile_versionInfo foreign key(versionInfo_seq) references versionInfo(seq),
    constraint fk_versionFile_fileType foreign key(fileType_seq) references fileType(seq),
    constraint fk_versionFile_parent foreign key(parent_seq) references versionFile(seq)
);

drop table versionFile;


create sequence seqBasicFile;
-- drop sequence seqBasicFile;
CREATE TABLE basicFile (
	seq	number	primary key,
	name	varchar2(600)	NOT NULL,
	code	clob	NULL,
	fileType_seq	number	NOT NULL,
	parent_seq	number	NULL,
    constraint fk_basicFile_fileType foreign key(fileType_seq) references fileType(seq),
    constraint fk_basicFile_parent foreign key(parent_seq) references basicFile(seq)
);

drop table basicFile;

insert into fileType (seq, fileType) values (seqFileType.nextVal, 'Project');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'Folder');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'Package');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'Class');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'Interface');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'TextFile');
insert into fileType (seq, fileType) values (seqFileType.nextVal, 'File');

select * From basicFile;

create sequence seqBasicFile;
drop sequence seqBasicFile;

INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'TestProject', null, 1, null);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'src', null, 2, 1);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'com.test.main', null, 3, 2);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'Test.java', 'public class Test {\n    public static void main(String[] args) {\n        System.out.println("test");\n    }\n}', 4, 3);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'Inter.java', 'public interface Inter {\n\n}', 5, 3);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'txt.file', null, 6, 3);
INSERT INTO basicFile (seq, name, code, fileType_seq, parent_seq) VALUES (seqBasicFile.nextVal, 'file', null, 7, 3);
select * from template;

commit;
select * from versionFile;

insert into versionInfo (seq, regdate, message, project_seq, member_seq) values (seqVersionInfo.nextVal, sysdate, 'test massge', 3, 1);
commit;

create sequence seqVersionFile;
drop sequence seqVersionFile;
select * from project;
select * from versionFile;
update versionFile set code ='public interface Inter {\n\n}' where seq = 5;
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'DogProject', null,  22, 1, null);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'src', null,  21, 2, 44);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'com.test.main', null,  1, 3, 2);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'Test.java', 'public class Test {\n    public static void main(String[] args) {\n        System.out.println("test");\n    }\n}',  1, 4, 3);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'Inter.java', 'public interface Inter {\n\n}',  1, 5, 3);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'txt.file', null,  1, 6, 3);
insert into versionFile (seq, name, code, versionInfo_seq, fileType_seq, parent_seq) values (seqVersionFile.nextVal, 'file', null,  1, 7, 3);
delete from versionFile where seq = 21;

create or replace view vwProjectFile
as
select 
vf.seq AS seq, vf.name AS name, vf.code AS code, vf.fileType_seq, 
m.seq AS member_seq, vi.seq AS versionInfo_seq, p.seq AS project_seq, tp.seq AS teamProject_seq, 
t.seq AS team_seq, t.teamType AS teamType, mt.seq AS memberTeam_seq  
from versionFile vf
inner join versionInfo vi on vi.seq = vf.versionInfo_seq
inner join project p on p.seq = vi.project_seq
inner join teamProject tp on p.seq = tp.project_seq
inner join team t on t.seq = tp.team_seq
inner join memberTeam mt on t.seq = mt.team_seq
inner join member m on m.seq = mt.member_seq
order by vf.seq;

select * from vwProjectFile;
select * from team;


    
CREATE OR REPLACE VIEW vwMemberProject
AS
SELECT 
    p.seq, p.projectName, p.projectEx, p.startDate, p.target, p.priority, p.regDate,
    tp.seq AS teamProject_seq, t.seq AS team_seq, t.teamName, t.teamEx, t.teamType, t.regDate AS teamRegDate, 
    mt.seq AS memberTeam_seq, mt.position, m.seq AS member_seq
FROM project p
INNER JOIN teamProject tp ON tp.project_seq = p.seq
INNER JOIN team t ON tp.team_seq = t.seq
INNER JOIN memberTeam mt ON mt.team_seq = t.seq
INNER JOIN member m ON m.seq = mt.member_seq;


select * from project;

SELECT * FROM vwMemberProject WHERE member_seq = 22 AND team_seq = 1;
SELECT * FROM vwMemberProject WHERE member_seq = 22;
SELECT * FROM vwMemberProject v
inner join versionInfo p on v.seq = p.project_seq;

select m.seq as seq, m.id as id, m.nick as nick, m.color as color, m.oAuthType as oAuthType, m.ing as ing, 
			t.seq as teamSeq, t.teamName as teamName, t.teamEx as teamEx, t.teamType as teamType, mt.position as position 
			from member m inner join memberTeam mt
			on m.seq = mt.member_seq
			inner join team t
			on mt.team_seq = t.seq where m.seq = 22;


select * from team;

-- 채팅 -----
create sequence seqServerList;
-- drop sequence seqServerList;
CREATE TABLE serverList (
	seq	number	primary key,
	serverName	varchar2(100)	NOT NULL,
	projectServerCheck	varchar2(1)	DEFAULT 'N'	NOT NULL
);

create sequence seqTextChannel;
-- drop sequence seqTextChannel;
CREATE TABLE textChannel (
	seq	number	primary key,
	textChannelName	varchar2(100)	DEFAULT '채팅채널1번' 	NULL,
	serverList_seq	number	NOT NULL,
    constraint fk_textchannel_serverList foreign key(serverList_seq) references serverList(seq)
);

create sequence seqTextContent;
-- drop sequence seqTextContent;
CREATE TABLE textContent (
	seq	number	primary key,
	content	clob	NOT NULL,
	messageSentTime	date	NOT NULL,
	textChannel_seq	number	NOT NULL,
    constraint fk_textContent_textChannel foreign key(textChannel_seq) references textChannel(seq)
);

create sequence seqMemberServer;
-- drop sequence seqMemberServer;
CREATE TABLE memberServer (
	seq	number	primary key,
	serverList_seq	number	NOT NULL,
	member_seq	number	NOT NULL,
    constraint fk_memberServer_serverList foreign key(serverList_seq) references serverList(seq),
    constraint fk_memberServer_member foreign key(member_seq) references member(seq)
);

create sequence seqVoiceChannel;
-- drop sequence seqVoiceChannel;
CREATE TABLE voiceChannel (
	seq	number	primary key,
	voiceChannelName	varchar(100)	DEFAULT '음성채널1번' 	NULL,
	serverList_seq	number	NOT NULL,
    constraint fk_voiceChannel_serverList foreign key(serverList_seq) references serverList(seq)
);

create sequence seqVoiceChannelSetting;
-- drop sequence seqVoiceChannelSetting;
CREATE TABLE voiceChannelSetting (
	seq	number	primary key,
	audioDevice	varchar2(1000)	DEFAULT '시스템 기본장치'	NULL,
	audioVolume	number	DEFAULT 50	NULL,
	recordingDevice	varchar2(1000)	DEFAULT '시스템 기본장치'	NULL,
	recordingVolume	number	DEFAULT 50	NULL,
	voiceChannel_seq	number	NOT NULL,
    constraint fk_voiceSetting_voiceChannel foreign key(voiceChannel_seq) references voiceChannel(seq)
);








