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



insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	1	,	'최대1080(FHD)'	,	'노출설정가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	2	,	'최대1080(FHD)'	,	'노출설정가능'	,	'영자막지원'	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	3	,	'최대1080(FHD)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	4	,	'최대480(고화질)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	5	,	'최대720(HD)'	,	'노출설정불가능'	,	null	)	;


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



insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	1	,	'DRM'	,	'(저작권 보호장치 적용)'  	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	2	,	'이용'	,	'해외에서 스트리밍/다운로드 불가, PC 및 TV에서 다운로드 불가, 외부화면 연결 불가'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	3	,	'이용안내'	,	'결제 후 7일 이내 이용을 시작하지 않을경우, 자동으로 이용기간이 시작됩니다. 소장 상품은 구매한 계정에서 이용 계약이 유지되는 동안 이용 가능합니다. 일부 작품은 다운로드 기간 제한이 있으므로 이용기간을 확인해 주세요.'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	4	,	'환불안내'	,	'사용하지 않은 구매,대여 상품은 7일 이내 MY > 구입내역에서 구매취소를 눌러 직접 환불하실 수 있습니다.')	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	5	,	'이용기기'	,	'PC, 모바일, TV 총 5대')	;

