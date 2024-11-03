CREATE TABLE theme (
    seq NUMBER PRIMARY KEY,
    theme NUMBER DEFAULT 0 NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_theme_member
        FOREIGN KEY (member_seq) REFERENCES users(seq)
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
        FOREIGN KEY (styleType_seq) REFERENCES member(seq)       
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




CREATE TABLE member (
    seq NUMBER PRIMARY KEY, 
    id VARCHAR2(100) NOT NULL UNIQUE, 
    pw VARCHAR2(50) NOT NULL,
    nick VARCHAR2(100) NOT NULL UNIQUE,
    regdate DATE DEFAULT SYSDATE NOT NULL, 
    ing NUMBER DEFAULT 1 NOT NULL, 
    color NUMBER DEFAULT 1 NOT NULL,
    regtype NUMBER DEFAULT 1 NOT NULL
);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------


insert into member(seq, id, pw, nick, regdate, ing, color, regtype) values(seqMember.nextVal, 'test@google.com', 'a1234567!', 'test', default, default, default, default);
update user set nick = 'test2' where seq = 1;
delete from user; 
select * from member;
drop table member;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE theme (
    seq NUMBER PRIMARY KEY,
    theme NUMBER DEFAULT 0 NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_theme_member
        FOREIGN KEY (member_seq) REFERENCES member(seq)
);

-- sequence 생성
create sequence seqTheme;

-- sequence 삭제
drop sequence seqTheme;

INSERT INTO theme (seq, theme, member_seq) VALUES (seqTheme.nextVal, DEFAULT, 1);
update theme set theme = 1 where seq = 1;
delete from theme; 
select * from theme;
drop table theme;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE styleType (
    seq NUMBER PRIMARY KEY,
    category VARCHAR2(50) NOT NULL
);


-- sequence 생성
create sequence seqStyleType;

-- sequence 삭제
drop sequence seqStyleType;

INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'fontSize');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'fontFamily');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editor.background');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editor.foreground');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editorCursor.foreground');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editorLineNumber.activeForeground');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editorLineNumber.foreground');
INSERT INTO styleType (seq, category) VALUES (seqStyleType.nextVal, 'editor.selectionBackground'); 

update styleType set category = 'fontSize' where seq = 1;
delete from styleType; 
select * from styleType;
drop table styleType;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE styleSetting (
    seq NUMBER PRIMARY KEY,
    value VARCHAR2(100) NOT NULL,
    styleType_seq NUMBER NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_styleSetting_member
        FOREIGN KEY (member_seq) REFERENCES member(seq),
    CONSTRAINT fk_styleSetting_styleType
        FOREIGN KEY (styleType_seq) REFERENCES member(seq)       
);

--sequence 생성
create sequence seqStyleSetting;

--– sequence 삭제
drop sequence seqStyleSetting;

INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, '14', 1, 1); 
INSERT INTO styleSetting (seq, value, styleType_seq, member_seq) VALUES (seqStyleSetting.nextVal, 'D2Coding', 1, 1); 

update styleSetting set value = '16' where seq = 1;
delete from styleSetting; 
select * from styleSetting;
drop table styleSetting;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------


--sequence 생성
create sequence seqBasicTemplate;

--– sequence 삭제
drop sequence seqBasicTemplate;

select * From basicTemplate;

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'sysout', 'System.out.println(\\${1});');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'trycatch', 'try {\n    \\${1}\n} catch (\\${2:Exception} \\${3:e}) {\n    \\${4}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'tryfinally', 'try {\n    \\${1}\n} finally {\n    \\${2}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'main', 'public static void main(String[] args) {\n    \\${0}\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'if', 'if (\\${1:condition}) {\n    \\${2}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'else', 'else {\n    \\${1}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'catch', 'catch (\\${1:Exception} \\${2:e}) {\n    \\${3}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'finally', 'finally {\n    \\${1}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'switch', 'switch (\\${1:key}) {\n    case \\${2:value}:\n        \\${0}\n        break;\n    default:\n        break;\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'while', 'while (\\${1:condition}) {\n    \\${2}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'dowhile', 'do {\n    \\${0}\n} while (\\${1:condition});');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'for', 'for (int \\${1:index} = 0; \\${1:index} < \\${2:array}.length; \\${1:index}++) {\n    \\${3}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'foreach', 'for (\\${1:Type} \\${2:item} : \\${3:collection}) {\n    \\${0}\n}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'syserr', 'System.err.println(\\${1});\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'ifelse', 'if (\\${1:condition}) {\n    \\${2}\n} else {\n    \\${2}\n}\\${0}');

INSERT INTO basicTemplate (seq, keyword, code) 
VALUES (seqBasicTemplate.nextVal, 'ifelseif', 'if (\\${1:condition}) {\n    \\${2}\n} else if (\\${3:condition}) {\n    \\${4}\n} else {\n    \\${5}\n}\\${0}');

update basicTemplate set code = 'System.out.println(\\${1})\\${0};' where seq = 1;
delete from basicTemplate; 
select * from basicTemplate;
drop table basicTemplate;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------


--sequence 생성
create sequence seqTemplate;

--– sequence 삭제
drop sequence seqTemplate;


CREATE TABLE template (
    seq NUMBER NOT NULL,
    keyword varchar2(100) NOT NULL,
    code VARCHAR2(2000) NOT NULL,
    member_seq NUMBER NOT NULL,
    CONSTRAINT fk_template_member
        FOREIGN KEY (member_seq) REFERENCES member(seq)
);



INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'class', 'public class \\${1:ClassName} {\n\n    private \\${2:Type} \\${3:field};\n\n    public \\${1:ClassName}(\\${2:Type} \\${3:field}) {\n        this.\\${3:field} = \\${3:field};\n    }\n\n    public \\${2:Type} get\\${3:Field}() {\n        return \\${3:field};\n    }\n\n    public void set\\${3:Field}(\\${2:Type} \\${3:field}) {\n        this.\\${3:field} = \\${3:field};\n    }\n\n}\\${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'unittest', '@Test\npublic void \\${1:testMethod}() {\n    // given\n    \\${2:Setup code}\n\n    // when\n    \\${3:Execution code}\n\n    // then\n    assert\\${4:Condition}(\\${5:Expected}, \\${6:Actual});\n}\\${0}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'gettersetter', 'public \\${1:Type} get\\${2:Field}() {\n    return \\${3:field};\n}\n\npublic void set\\${2:Field}(\\${1:Type} \\${3:field}) {\n    this.\\${3:field} = \\${3:field};\n}\\${0}');


INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'lambda', '\\${1:collection}.stream()\n    .filter(\\${2:item} -> \\${3:condition})\n    .forEach(\\${2:item} -> {\n        \\${0} \n    });');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'switchenum', 'switch (\\${1:enumVariable}) {\n    case \\${2:EnumValue1}:\n        \\${0} \n        break;\n    case \\${3:EnumValue2}:\n        \n        break;\n    default:\n        throw new IllegalArgumentException("Unexpected value: " + \\${1:enumVariable});\n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'trywithresources', 'try (\\${1:ResourceType} \\${2:resource} = new \\${1:ResourceType}()) {\n    \\${0} \n} catch (\\${3:ExceptionType} \\${4:e}) {\n    \\${5} \n}');

INSERT INTO template (seq, member_seq, keyword, code) 
VALUES (seqTemplate.nextVal, 1, 'jsonparse', 'ObjectMapper objectMapper = new ObjectMapper();\n\\${1:Type} \\${2:variable} = objectMapper.readValue(\\${3:jsonData}, \\${1:Type}.class);\\${0}');


update template set keyword = 'class' where seq = 1;
delete from template; 
select * from template;
drop table template;







drop table template;
drop table basicTemplate;
drop table styleSetting;
drop table styleType;
drop table theme;

show user;
