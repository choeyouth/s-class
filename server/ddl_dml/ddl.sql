 CREATE TABLE tblGenreList ( 
        seq NUMBER PRIMARY KEY,
        genre VARCHAR2(100) NOT NULL
);  
CREATE TABLE tblSubGenre (
        seq NUMBER PRIMARY KEY, 
        genre_seq NUMBER NOT NULL, 
        subGenre VARCHAR2(100) NOT NULL, 
        FOREIGN KEY (genre_seq) REFERENCES tblGenreList(seq)
);
                                
CREATE TABLE tblPreference (
        seq NUMBER PRIMARY KEY, 
        member_seq NUMBER NOT NULL, 
        subGenre_seq NUMBER NOT NULL, 
        targetRead NUMBER NOT NULL, 
        FOREIGN KEY (member_seq) REFERENCES tblMember(seq), 
        FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)
);