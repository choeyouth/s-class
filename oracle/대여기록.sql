-- 대여 기록
CREATE TABLE tblItemRental (
	id NUMBER PRIMARY KEY,
	rentalDate DATE NOT NULL,
	returnDate DATE NULL,
	tblItemState_id NUMBER REFERENCES tblItemState(id) NOT NULL,
	tblStudent_id NUMBER REFERENCES tblStudent(id) NOT NULL
);

DROP TABLE tblItemRental;

CREATE SEQUENCE seqItemRental;

DROP SEQUENCE seqItemRental;

SELECT l.name, r.rentalDate, r.returnDate, s.tblItemList_id FROM tblItemRental r
    inner join tblitemState s
        on r.tblitemstate_id = s.id
            inner join tblItemList l
                on l.id = s.tblitemlist_id
                    ORDER BY r.id;



-- 2023년 
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-01-27', '2023-02-01', 16, 1);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-03', '2023-02-06', 17, 5);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-08', '2023-02-13', 18, 7);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-09', '2023-02-15', 56, 10);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-16', '2023-02-17', 1, 1);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-16', '2023-02-20', 2, 25);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-16', '2023-02-17', 3, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-16', '2023-02-17', 4, 31);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-16', '2023-02-17', 5, 16);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-22', '2023-02-22', 166, 29);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-22', '2023-02-22', 96, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-24', '2023-02-27', 116, 32);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-27', '2023-02-28', 146, 8);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-27', '2023-02-28', 201, 14);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-27', '2023-02-28', 26, 9);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-28', '2023-02-28', 71, 24);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-28', '2023-03-02', 181, 29);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-02-28', '2023-03-03', 19, 33);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-02', '2023-03-03', 6, 27);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-02', '2023-03-06', 7, 51);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-03', '2023-03-09', 171, 48);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-06', '2023-03-07', 27, 25);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-07', '2023-03-08', 28, 3);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-08', '2023-03-10', 19, 6);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-08', '2023-03-13', 29, 15);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-10', '2023-03-13', 72, 16);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-10', '2023-03-14', 81, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-13', '2023-03-16', 182, 33);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-14', '2023-03-17', 8, 29);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-14', '2023-03-15', 9, 42);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-15', '2023-03-20', 131, 47);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-17', '2023-03-23', 57, 48);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-17', '2023-03-20', 58, 14);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-20', '2023-03-24', 46, 21);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-20', '2023-03-22', 36, 26);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-21', '2023-03-27', 161, 37);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-22', '2023-03-28', 166, 28);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-24', '2023-03-27', 172, 44);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-27', '2023-03-28', 191, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-03-29', '2023-03-30', 201, 1);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-03', '2023-04-05', 16, 2);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-05', '2023-04-06', 36, 20);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-05', '2023-04-10', 37, 21);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-07', '2023-04-10', 96, 37);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-11', '2023-04-12', 112, 44);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-12', '2023-04-17', 176, 52);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-12', '2023-04-13', 202, 6);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-18', '2023-04-21', 17, 7);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-21', '2023-04-24', 71, 16);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-04-26', '2023-04-28', 111, 30);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-01', '2023-05-04', 201, 21);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-03', '2023-05-04', 181, 26);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-08', '2023-05-12', 171, 5);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-12', '2023-05-16', 172, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-16', '2023-05-18', 71, 52);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-19', '2023-05-22', 26, 44);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-22', '2023-05-26', 27, 37);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-24', '2023-05-25', 16, 33);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-25', '2023-05-30', 17, 20);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-05-26', '2023-05-31', 81, 10);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-01', '2023-06-05', 36, 28);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-05', '2023-06-07', 37, 33);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-07', '2023-06-08', 111, 7);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-08', '2023-06-12', 116, 17);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-12', '2023-06-16', 202, 31);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-13', '2023-06-19', 131, 37);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-16', '2023-06-19', 1, 51);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-21', '2023-06-23', 2, 47);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-23', '2023-06-26', 56, 8);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-06-28', '2023-06-30', 26, 23);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-03', '2023-07-05', 191, 53);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-03', '2023-07-04', 16, 57);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-07', '2023-07-10', 1, 54);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-10', '2023-07-12', 2, 81);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-11', '2023-07-14', 3, 91);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-14', '2023-07-17', 56, 97);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-17', '2023-07-21', 200, 107);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-18', '2023-07-21', 161, 114);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-21', '2023-07-26', 116, 123);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-25', '2023-07-28', 46, 126);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-27', '2023-07-31', 146, 127);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-07-28', '2023-07-31', 166, 54);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-10', '2023-08-14', 56, 61);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-14', '2023-08-18', 1, 62);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-17', '2023-08-18', 116, 100);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-21', '2023-08-23', 82, 80);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-24', '2023-08-29', 181, 105);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-25', '2023-08-28', 26, 113);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-28', '2023-08-31', 131, 96);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-08-30', '2023-08-31', 201, 148);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-01', '2023-09-04', 16, 104);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-05', '2023-09-07', 26, 123);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-05', '2023-09-07', 36, 133);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-08', '2023-09-11', 46, 114);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-13', '2023-09-15', 166, 151);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-18', '2023-09-22', 202, 157);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-20', '2023-09-25', 181, 139);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-25', '2023-09-26', 96, 171);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-25', '2023-09-26', 131, 172);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-09-26', '2023-09-27', 71, 194);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-05', '2023-10-06', 146, 196);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-10', '2023-10-13', 131, 189);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-12', '2023-10-16', 56, 166);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-13', '2023-10-16', 1, 142);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-18', '2023-10-20', 2, 109);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-20', '2023-10-23', 3, 112);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-24', '2023-10-27', 111, 121);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-27', '2023-10-30', 116, 140);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-27', '2023-10-31', 81, 108);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-10-30', '2023-10-31', 71, 131);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-02', '2023-11-03', 111, 104);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-03', '2023-11-08', 131, 110);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-07', '2023-11-10', 161, 123);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-10', '2023-11-13', 162, 131);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-13', '2023-11-17', 112, 135);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-16', '2023-11-17', 81, 142);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-20', '2023-11-22', 96, 158);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-24', '2023-11-27', 201, 144);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-27', '2023-11-30', 202, 161);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-11-28', '2023-11-30', 16, 179);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-01', '2023-12-05', 1, 149);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-05', '2023-12-07', 2, 151);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-07', '2023-12-08', 171, 161);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-11', '2023-12-12', 201, 169);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-19', '2023-12-20', 191, 166);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-22', '2023-12-26', 161, 186);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-26', '2023-12-29', 116, 197);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-27', '2023-12-29', 46, 182);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-27', '2023-12-29', 56, 149);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2023-12-28', '2023-12-29', 16, 158);


-- 2024년
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-02', '2024-01-05', 56, 237);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-05', '2024-01-08', 57, 220);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-08', '2024-01-11', 131, 231);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-11', '2024-01-12', 1, 193);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-17', '2024-01-19', 26, 172);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-19', '2024-01-22', 81, 187);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-22', '2024-01-25', 111, 155);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-25', '2024-01-26', 161, 161);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-29', '2024-01-31', 171, 175);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-01-30', '2024-01-31', 191, 189);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-02', '2024-02-05', 16, 198);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-05', '2024-02-06', 17, 207);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-08', '2024-02-13', 71, 177);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-13', '2024-02-16', 111, 184);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-16', '2024-02-19', 181, 234);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-19', '2024-02-20', 56, 244);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-22', '2024-02-23', 57, 247);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-23', '2024-02-26', 46, 265);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-26', '2024-02-29', 81, 248);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-02-27', '2024-02-29', 176, 201);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-04', '2024-03-08', 16, 200);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-05', '2024-03-08', 26, 217);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-11', '2024-03-12', 46, 230);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-15', '2024-03-18', 71, 239);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-18', '2024-03-22', 161, 247);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-22', '2024-03-28', 201, 254);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-22', '2024-03-25', 181, 265);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-25', '2024-03-28', 131, 213);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-26', '2024-03-29', 166, 199);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-03-28', '2024-03-29', 72, 229);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-01', '2024-04-04', 16, 213);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-05', '2024-04-08', 131, 230);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-09', '2024-04-11', 56, 204);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-12', '2024-04-15', 181, 243);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-15', '2024-04-19', 182, 253);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-18', '2024-04-22', 171, 277);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-22', '2024-04-24', 166, 281);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-26', '2024-04-29', 2, 222);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-26', '2024-04-30', 3, 247);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-04-29', '2024-04-30', 71, 254);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-07', '2024-05-09', 1, 200);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-10', '2024-05-13', 116, 211);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-13', '2024-05-16', 81, 227);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-17', '2024-05-21', 171, 238);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-20', '2024-05-21', 201, 244);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-22', '2024-05-23', 56, 265);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-24', '2024-05-27', 36, 250);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-27', '2024-05-29', 26, 222);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-27', '2024-05-28', 2, 198);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-05-28', '2024-05-31', 3, 203);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-03', '2024-06-05', 1, 238);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-03', '2024-06-07', 191, 248);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-07', '2024-06-10', 166, 283);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-13', '2024-06-14', 146, 266);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-17', '2024-06-18', 81, 275);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-21', '2024-06-24', 201, 284);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-21', '2024-06-25', 16, 293);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-24', '2024-06-26', 82, 296);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-26', '2024-06-27', 167, 244);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-06-27', '2024-06-28', 26, 252);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-01', '2024-07-02', 1, 253);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-01', '2024-07-03', 2, 293);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-01', '2024-07-02', 3, 302);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-05', '2024-07-08', 71, 300);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-12', '2024-07-15', 72, 277);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-12', '2024-07-16', 116, 265);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-22', '2024-07-23', 171, 275);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-26', '2024-07-29', 16, 307);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-29', '2024-07-30', 4, 314);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-07-29', '2024-07-31', 5, 292);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-01', '2024-08-02', 116, 266);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-06', '2024-08-07', 131, 277);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-14', '2024-08-16', 181, 296);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-20', '2024-08-22', 201, 297);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 3, 277);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 4, 278);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 13, 279);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 16, 280);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 20, 281);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 23, 282);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-23', null, 31, 283);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 39, 284);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 42, 285);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 48, 286);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 52, 287);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 56, 288);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 61, 289);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-26', null, 62, 290);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 67, 291);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 70, 292);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 74, 293);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 76, 334);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 77, 336);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 80, 296);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-27', null, 88, 297);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 99, 298);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 101, 299);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 104, 300);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 105, 301);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 106, 302);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 113, 303);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 114, 304);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-28', null, 116, 305);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 122, 306);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 127, 307);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 129, 308);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 132, 309);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 136, 310);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 142, 311);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 148, 312);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-29', null, 150, 313);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 152, 314);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 159, 315);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 160, 316);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 169, 317);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 181, 318);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 182, 319);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 184, 349);
INSERT INTO tblItemRental (id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, '2024-08-30', null, 192, 351);































































