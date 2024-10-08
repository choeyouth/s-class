--상품정보========================================================
drop table Product_Info;
drop table Display;
drop table Guide;
drop table Product_Guide;


--화면정보
CREATE TABLE Display (
	display_id	NUMBER	NOT NULL PRIMARY KEY,
	video_quality	VARCHAR2(50)	NOT NULL,
    subtitles_display	VARCHAR2(50)	NOT NULL,
	foreign_subtitles	VARCHAR2(50)
);


--상품정보
CREATE TABLE Product_Info (
	productInfo_id	NUMBER	NOT NULL PRIMARY KEY,
	capacity	NUMBER	NOT NULL,
    display_id NUMBER	NOT NULL references Display(display_id),
    movie_id NUMBER	NOT NULL references Movie(movie_id)
);


--안내
CREATE TABLE Guide (

	guide_id	NUMBER	NOT NULL PRIMARY KEY,
	guide_title	VARCHAR2(30)	NOT NULL,
	guide_content	VARCHAR2(2000)	NOT NULL
);



--상품안내관계연결
CREATE TABLE Product_Guide (
    productguide_id	NUMBER	NOT NULL PRIMARY KEY,
    productInfo_id NUMBER NOT NULL REFERENCES Product_Info(productInfo_id),
    guide_id NUMBER NOT NULL REFERENCES Guide(guide_id)
);



select * from Product_info;
select * from Display;
select * from Product_Guide;
select * from Guide;


--화면정보데이터
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	1	,	'최대1080(FHD)'	,	'노출설정가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	2	,	'최대1080(FHD)'	,	'노출설정가능'	,	'영자막지원'	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	3	,	'최대1080(FHD)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	4	,	'최대480(고화질)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	5	,	'최대720(HD)'	,	'노출설정불가능'	,	null	)	;


--상품정보데이터
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	1	,	3840	,	1	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	2	,	4177.92	,	2	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	3	,	4403.2	,	3	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	4	,	700	,	4	,	4	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	5	,	4147.2	,	5	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	6	,	3840	,	6	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	7	,	3686.4	,	7	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	8	,	4167.68	,	8	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	9	,	4177.92	,	9	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	10	,	4382.72	,	10	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	11	,	4812.8	,	11	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	12	,	4751.36	,	12	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	13	,	3635.2	,	13	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	14	,	3921.92	,	14	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	15	,	5345.28	,	15	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	16	,	4587.52	,	16	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	17	,	4833.28	,	17	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	18	,	3942.4	,	18	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	19	,	4659.2	,	19	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	20	,	5027.84	,	20	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	21	,	4392.96	,	21	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	22	,	3747.84	,	22	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	23	,	6225.92	,	23	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	24	,	4648.96	,	24	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	25	,	5478.4	,	25	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	26	,	3696.64	,	26	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	27	,	4280.32	,	27	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	28	,	5140.48	,	28	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	29	,	3133.44	,	29	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	30	,	4741.12	,	30	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	31	,	5181.44	,	31	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	32	,	4597.76	,	32	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	33	,	4157.44	,	33	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	34	,	4505.6	,	34	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	35	,	5140.48	,	35	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	36	,	3491.84	,	36	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	37	,	2508.8	,	37	,	5	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	38	,	3819.52	,	38	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	39	,	3686.4	,	39	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	40	,	4382.72	,	40	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	41	,	5396.48	,	41	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	42	,	4802.56	,	42	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	43	,	5416.96	,	43	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	44	,	3399.68	,	44	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	45	,	3758.08	,	45	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	46	,	6656	,	46	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	47	,	4218.88	,	47	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	48	,	4894.72	,	48	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	49	,	4218.88	,	49	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	50	,	4229.12	,	50	,	3	)	;



--안내데이터
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	1	,	'DRM'	,	'(저작권 보호장치 적용)'  	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	2	,	'이용'	,	'해외에서 스트리밍/다운로드 불가, PC 및 TV에서 다운로드 불가, 외부화면 연결 불가'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	3	,	'이용안내'	,	'결제 후 7일 이내 이용을 시작하지 않을경우, 자동으로 이용기간이 시작됩니다. 소장 상품은 구매한 계정에서 이용 계약이 유지되는 동안 이용 가능합니다. 일부 작품은 다운로드 기간 제한이 있으므로 이용기간을 확인해 주세요.'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	4	,	'환불안내'	,	'사용하지 않은 구매,대여 상품은 7일 이내 MY > 구입내역에서 구매취소를 눌러 직접 환불하실 수 있습니다.')	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	5	,	'이용기기'	,	'PC, 모바일, TV 총 5대')	;



--상품가이드데이터
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	1	,	1	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	2	,	2	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	3	,	3	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	4	,	4	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	5	,	5	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	6	,	6	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	7	,	7	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	8	,	8	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	9	,	9	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	10	,	10	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	11	,	11	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	12	,	12	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	13	,	13	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	14	,	14	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	15	,	15	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	16	,	16	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	17	,	17	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	18	,	18	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	19	,	19	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	20	,	20	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	21	,	21	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	22	,	22	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	23	,	23	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	24	,	24	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	25	,	25	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	26	,	26	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	27	,	27	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	28	,	28	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	29	,	29	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	30	,	30	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	31	,	31	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	32	,	32	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	33	,	33	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	34	,	34	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	35	,	35	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	36	,	36	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	37	,	37	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	38	,	38	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	39	,	39	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	40	,	40	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	41	,	41	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	42	,	42	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	43	,	43	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	44	,	44	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	45	,	45	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	46	,	46	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	47	,	47	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	48	,	48	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	49	,	49	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	50	,	50	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	51	,	1	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	52	,	2	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	53	,	3	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	54	,	4	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	55	,	5	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	56	,	6	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	57	,	7	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	58	,	8	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	59	,	9	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	60	,	10	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	61	,	11	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	62	,	12	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	63	,	13	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	64	,	14	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	65	,	15	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	66	,	16	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	67	,	17	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	68	,	18	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	69	,	19	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	70	,	20	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	71	,	21	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	72	,	22	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	73	,	23	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	74	,	24	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	75	,	25	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	76	,	26	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	77	,	27	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	78	,	28	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	79	,	29	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	80	,	30	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	81	,	31	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	82	,	32	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	83	,	33	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	84	,	34	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	85	,	35	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	86	,	36	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	87	,	37	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	88	,	38	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	89	,	39	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	90	,	40	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	91	,	41	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	92	,	42	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	93	,	43	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	94	,	44	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	95	,	45	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	96	,	46	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	97	,	47	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	98	,	48	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	99	,	49	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	100	,	50	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	101	,	1	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	102	,	2	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	103	,	3	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	104	,	4	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	105	,	5	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	106	,	6	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	107	,	7	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	108	,	8	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	109	,	9	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	110	,	10	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	111	,	11	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	112	,	12	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	113	,	13	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	114	,	14	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	115	,	15	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	116	,	16	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	117	,	17	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	118	,	18	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	119	,	19	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	120	,	20	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	121	,	21	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	122	,	22	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	123	,	23	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	124	,	24	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	125	,	25	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	126	,	26	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	127	,	27	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	128	,	28	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	129	,	29	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	130	,	30	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	131	,	31	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	132	,	32	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	133	,	33	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	134	,	34	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	135	,	35	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	136	,	36	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	137	,	37	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	138	,	38	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	139	,	39	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	140	,	40	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	141	,	41	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	142	,	42	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	143	,	43	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	144	,	44	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	145	,	45	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	146	,	46	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	147	,	47	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	148	,	48	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	149	,	49	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	150	,	50	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	151	,	1	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	152	,	2	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	153	,	3	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	154	,	4	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	155	,	5	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	156	,	6	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	157	,	7	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	158	,	8	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	159	,	9	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	160	,	10	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	161	,	11	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	162	,	12	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	163	,	13	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	164	,	14	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	165	,	15	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	166	,	16	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	167	,	17	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	168	,	18	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	169	,	19	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	170	,	20	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	171	,	21	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	172	,	22	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	173	,	23	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	174	,	24	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	175	,	25	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	176	,	26	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	177	,	27	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	178	,	28	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	179	,	29	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	180	,	30	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	181	,	31	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	182	,	32	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	183	,	33	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	184	,	34	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	185	,	35	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	186	,	36	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	187	,	37	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	188	,	38	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	189	,	39	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	190	,	40	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	191	,	41	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	192	,	42	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	193	,	43	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	194	,	44	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	195	,	45	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	196	,	46	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	197	,	47	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	198	,	48	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	199	,	49	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	200	,	50	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	201	,	1	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	202	,	2	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	203	,	3	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	204	,	4	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	205	,	5	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	206	,	6	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	207	,	7	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	208	,	8	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	209	,	9	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	210	,	10	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	211	,	11	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	212	,	12	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	213	,	13	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	214	,	14	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	215	,	15	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	216	,	16	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	217	,	17	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	218	,	18	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	219	,	19	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	220	,	20	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	221	,	21	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	222	,	22	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	223	,	23	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	224	,	24	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	225	,	25	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	226	,	26	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	227	,	27	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	228	,	28	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	229	,	29	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	230	,	30	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	231	,	31	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	232	,	32	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	233	,	33	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	234	,	34	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	235	,	35	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	236	,	36	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	237	,	37	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	238	,	38	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	239	,	39	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	240	,	40	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	241	,	41	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	242	,	42	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	243	,	43	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	244	,	44	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	245	,	45	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	246	,	46	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	247	,	47	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	248	,	48	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	249	,	49	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	250	,	50	,	4	);
