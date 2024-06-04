-------------------------더미 데이터 생성-----------------------------
/*
staez_user(회원)
(user_no, user_id, user_pwd, nickname, gender, birth, address, email, phone, genre_like, grade, enroll_date, withdrawal_date, user_status)
- 비밀번호는 pass01로 통일
- 관리자 계정을 제외하고는 아이디 뒤에 유저 번호를 붙힘
*/
INSERT INTO staez_user
VALUES (DEFAULT, 'admin', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '관리자', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user@gmail.com', '01011111111','', 1, DEFAULT, NULL, DEFAULT);
--관리자계정(userNo : 1)
INSERT INTO staez_user
VALUES (DEFAULT, 'user02', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'wg', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user01@gmail.com', '01022222222','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user03', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'hyo', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user02@gmail.com', '01033333333','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user04', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'joo', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user03@gmail.com', '01044444444','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user05', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'joon', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user04@gmail.com', '01055555555','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user06', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'nam', 'F', '1998-08-31', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user05@naver.com', '01066666666', '', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user07', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '탈퇴한놈', 'M', '1991-11-11', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'withdrawal@gmail.com', '01099999999','', 2, '2024-01-01 17:41:18.955208+09', '2024-06-01 11:36:11.264208+09', 'N');
--탈퇴회원(userNo : 7)

SELECT * FROM staez_user;





/*
profile_img(프로필사진)
(file_no, user_no, origin_name, change_name, file_path, upload_date, status)
- 기본이미지로 설정하면 origin_name = NULL, 
					 change_name = NULL, 
					 file_path = '/resources/img/mypage/profile/'
*/
INSERT INTO profile_img
VALUES (DEFAULT, 1, '원래이름.png', '2024053118061362372.jpg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 2, NULL, NULL, '/resources/img/mypage/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 3, NULL, NULL, '/resources/img/mypage/profile/',DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 4, NULL, NULL, '/resources/img/mypage/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 5, NULL, NULL, '/resources/img/mypage/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 6, NULL, NULL, '/resources/img/mypage/profile/', DEFAULT, DEFAULT);

SELECT * FROM profile_img;





/*
board(게시글)
(borad_no, ref_board_no, user_no, board_level, board_code, board_write_date, board_title, board_content, board_count, board_status)
- ref_board_no : 답변시 질문글번호 또는 연관 게시글번호
- board_level : 원글/문의/신고(1), 답변(2)
- board_code : 공지사항(1), 일반게시글(2), 문의(3), FAQ(4), 신고(5)

- board_count의 DEFAULT는 0
*/

/*일반게시글*/
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-05-01 13:41:40.193236+09', '김덕수 사물놀이 리뷰', '<p>신명나네요</p><p>김덕수 선생님의 장구는 명불허전이시고 다른 사물놀이 패들 역시 대단하시더라고요!</p><p>&nbsp;<a href="https://namu.wiki/w/%EC%82%AC%EB%AC%BC%EB%86%80%EC%9D%B4" target="_blank">사물놀이</a>라는게 알고보니 기원이 1978년으로 생각보단 오래되지 않았다는게 놀랐습니다</p>', DEFAULT, 'Y');
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-05-02 19:51:40.193236+09', '조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.', '<p>조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.<br></p>', DEFAULT, 'Y');
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-05-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 23, DEFAULT); 
INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2023-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 11, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2023-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 4, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2023-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 124, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-05-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 45, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-05-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 52, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 12, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 1, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-25 13:01:40.193236+09', '게시글제목8', '게시글내용8', 588, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-26 13:01:40.193236+09', '게시글제목9', '게시글내용9', 11, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2023-05-30 13:01:40.193236+09', '삭제된게시글제목1', '삭제된게시글내용1', 0, 'N');
INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2023-05-31 13:01:40.193236+09', '삭제된게시글제목2', '삭제된게시글내용2', 0, 'N');
INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-01-22 13:01:40.193236+09', '삭제된게시글제목3', '삭제된게시글내용3', 0, 'N');

SELECT * FROM board
WHERE board_code=2;


/*공지사항*/
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2022-05-27 18:08:32.248193+09', '테스트 공지사항입니다1', '공지사항 내용입니다1', 3, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-01-25 18:08:32.248193+09', '테스트 공지사항입니다2', '공지사항 내용입니다2', 0, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-12-27 23:04:32.248193+09', '테스트 공지사항입니다3', '공지사항 내용입니다3', 11, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-12-24 11:08:32.248193+09', '테스트 공지사항입니다4', '공지사항 내용입니다4', 2, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-05-31 15:08:32.248193+09', '테스트 공지사항입니다5', '공지사항 내용입니다5', 4, DEFAULT);

SELECT * FROM board
WHERE board_code=1
AND board_level=1;


/*문의(질문)*/
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 3, '2024-05-27 18:08:32.248193+09', '환불해줘요', '환불해달라고', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 3, '2024-05-27 18:18:56.955458+09', '환불이', '왜 안되냐고요', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-05-27 19:01:40.193236+09', '문의입니다1', '문의내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-05-23 19:01:40.193236+09', '문의입니다2', '문의내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 3, '2024-05-21 19:01:40.193236+09', '문의입니다3', '문의내용입니다3', DEFAULT, DEFAULT);

SELECT * FROM board
WHERE board_code=3
AND board_level=1;


/*문의(답변)*/
INSERT INTO board
VALUES (DEFAULT, 21, 1, 2, 3, '2024-05-27 18:08:32.248193+09', '환불정책', '환불 안됩니다', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, 22, 1, 2, 3, '2024-05-27 18:18:56.955458+09', '관리자사칭은', '밴사유입니다', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, 23, 1, 2, 3, '2024-05-27 19:01:40.193236+09', '문의답변입니다1', '문의답변내용입니다1', DEFAULT, DEFAULT);

SELECT * FROM board
WHERE board_code=3
AND board_level=2;


/*FAQ*/
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 18:08:32.248193+09', 'FAQ입니다1', 'FAQ내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 18:18:56.955458+09', 'FAQ입니다2', 'FAQ내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 19:01:40.193236+09', 'FAQ입니다3', 'FAQ내용입니다3', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 19:01:40.193236+09', 'FAQ입니다4', 'FAQ내용입니다4', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 19:01:40.193236+09', 'FAQ입니다5', 'FAQ내용입니다5', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 19:01:40.193236+09', 'FAQ입니다6', 'FAQ내용입니다6', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, '2024-05-27 19:01:40.193236+09', 'FAQ입니다7', 'FAQ내용입니다7', DEFAULT, DEFAULT);

SELECT * FROM board
WHERE board_code=4;


/*신고 (나중에 추가)*/ 
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 5, '2024-05-27 18:08:32.248193+09', '신고입니다1', '신고내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 5, '2024-05-27 18:18:56.955458+09', '신고입니다2', '신고내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 5, '2024-05-27 19:01:40.193236+09', '신고입니다3', '신고내용입니다3', DEFAULT, DEFAULT);

SELECT * FROM board
WHERE board_code=5;





/*
board_attachment(게시글 첨부파일)
(file_no, board_no, origin_name, change_name, file_path, upload_date, file_level, status)
- file_level : 썸네일(1/DEFAULT), 그외(2, 3, ...)
*/
INSERT INTO board_attachment
VALUES (DEFAULT, 1, '원래이름.png', '2024052809480898527.webp', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 2, '원래이름.png', '바뀐이름1.png', '/resources/uploadfiles/community/', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 3, '원래이름.png', '바뀐이름2.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 4, '원래이름.png', '바뀐이름3.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 5, '원래이름.png', '바뀐이름4.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 6, '원래이름.png', '바뀐이름5.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
INSERT INTO board_attachment
VALUES (DEFAULT, 7, '원래이름.png', '바뀐이름6.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);

SELECT * FROM board_attachment;





/*
board_like(게시글 좋아요)
(board_like_no, user_no, board_no, like_date, status)
- 같은 게시글 중복 좋아요하지 못하도록 UNIQUE(user_no, board_no) 제약조건 설정
*/
INSERT INTO board_like
VALUES (DEFAULT, 2, 1, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 2, 3, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 3, 1, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 3, 2, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 4, 2, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 4, 4, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 5, 1, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 5, 4, DEFAULT, DEFAULT);
INSERT INTO board_like
VALUES (DEFAULT, 6, 5, DEFAULT, DEFAULT);
SELECT * FROM board_like;





/*
reply(댓글)
(reply_no, ref_reply_no, board_no, user_no, reply_content, reply_write_date, reply_status)
*/
INSERT INTO reply
VALUES (DEFAULT, NULL, 1, 2, '잘보고 갑니다', '2024-05-29 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, 1, 1, 3, '감사합니다', '2024-05-30 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 3, 2, '댓글입니다', '2024-05-29 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 4, 2, '잘보고 갑니다', '2024-05-29 09:45:52.783686+09', DEFAULT);

SELECT * FROM reply;





/*
reply_like(댓글 추천)
(reply_like_no, reply_no, user_no, like_date, status)
- 같은 댓글 중복 추천하지 않도록 UNIQUE(user_no, reply_no) 제약조건 설정
*/
INSERT INTO reply_like
VALUES (DEFAULT, 1, 3, '2024-05-29 09:45:52.783686+09', DEFAULT);

SELECT * FROM reply_like;





/*
category(카테고리 테이블)
(category_no, ref_category_no, category_name, category_level)
- category_level : 대분류(0), 나머지(1, 2, ...)
*/
--대분류
INSERT INTO category
VALUES (DEFAULT, null, '공연', 0); --category_no : 1 
INSERT INTO category
VALUES (DEFAULT, null, '커뮤니티', 0); --category_no : 2
INSERT INTO category
VALUES (DEFAULT, null, '기타', 0); --category_no : 3
INSERT INTO category
--공연 카테고리
VALUES (DEFAULT, 1, '뮤지컬', 1); --category_no : 4
INSERT INTO category
VALUES (DEFAULT, 1, '클래식', 1); --category_no : 5
INSERT INTO category
VALUES (DEFAULT, 1, '국악', 1); --category_no : 6
INSERT INTO category
VALUES (DEFAULT, 1, '대중음악', 1); --category_no : 7
INSERT INTO category
VALUES (DEFAULT, 1, '연극', 1); --category_no : 8
INSERT INTO category
VALUES (DEFAULT, 1, '서커스/마술', 1); --category_no : 9
INSERT INTO category
VALUES (DEFAULT, 1, '기타', 1); --category_no : 10 
--커뮤니티 카테고리
--(대분류)
INSERT INTO category
VALUES (DEFAULT, 2, '입문 가이드', 1); --category_no : 11
INSERT INTO category
VALUES (DEFAULT, 2, '질문과 답변', 1); --category_no : 12
INSERT INTO category
VALUES (DEFAULT, 2, '리뷰', 1); --category_no : 13
INSERT INTO category
VALUES (DEFAULT, 2, '자유게시판', 1); --category_no : 14
--(소분류)
INSERT INTO category
VALUES (DEFAULT, 2, '뮤지컬', 2); --category_no : 15
INSERT INTO category
VALUES (DEFAULT, 2, '클래식', 2); --category_no : 16
INSERT INTO category
VALUES (DEFAULT, 2, '국악', 2); --category_no : 17
INSERT INTO category
VALUES (DEFAULT, 2, '대중음악', 2); --category_no : 18
INSERT INTO category
VALUES (DEFAULT, 2, '연극', 2); --category_no : 19
INSERT INTO category
VALUES (DEFAULT, 2, '서커스/마술', 2); --category_no : 20
INSERT INTO category
VALUES (DEFAULT, 2, '기타', 2); --category_no : 21
--기타 카테고리
INSERT INTO category
VALUES (DEFAULT, 3, '공연', 1); --category_no : 22
INSERT INTO category
VALUES (DEFAULT, 3, '커뮤니티', 1); --category_no : 23
INSERT INTO category
VALUES (DEFAULT, 3, '예매', 1); --category_no : 24
INSERT INTO category
VALUES (DEFAULT, 3, '환불/취소', 1); --category_no : 25
INSERT INTO category
VALUES (DEFAULT, 3, '사이트 이용', 1); --category_no : 26
INSERT INTO category
VALUES (DEFAULT, 3, '티켓', 1); --category_no : 27

SELECT * FROM category;





/*
board_category(게시글 카테고리)
(board_no, category_no)
- 카테고리번호는 11~14(대분류), 15~21(소분류) 커뮤니티 카테고리만 해당
- 게시글과 카테고리 중계테이블로 게시글이 있으면 무조건 대분류와 소분류 데이터 쌍으로 2개씩 생성
  => 커뮤니티게시글 갯수 * 2 = 커뮤니티관련 category 테이블 데이터 개수
- 나머지 공지사항, 문의(질문, 답변), FAQ, 신고 게시글들은 기타 카테고리 1개씩 생성
*/
INSERT INTO board_category
VALUES (1, 11);
INSERT INTO board_category
VALUES (1, 16);
INSERT INTO board_category
VALUES (2, 11);
INSERT INTO board_category
VALUES (2, 15);
INSERT INTO board_category
VALUES (3, 12);
INSERT INTO board_category
VALUES (3, 20);
INSERT INTO board_category
VALUES (4, 14);
INSERT INTO board_category
VALUES (4, 21);
INSERT INTO board_category
VALUES (5, 13);
INSERT INTO board_category
VALUES (5, 16);
INSERT INTO board_category
VALUES (6, 14);
INSERT INTO board_category
VALUES (6, 15);
INSERT INTO board_category
VALUES (7, 14);
INSERT INTO board_category
VALUES (7, 17);
INSERT INTO board_category
VALUES (8, 13);
INSERT INTO board_category
VALUES (8, 18);
INSERT INTO board_category
VALUES (9, 13);
INSERT INTO board_category
VALUES (9, 20);
INSERT INTO board_category
VALUES (10, 11);
INSERT INTO board_category
VALUES (10, 20);
INSERT INTO board_category
VALUES (11, 12);
INSERT INTO board_category
VALUES (11, 21);
INSERT INTO board_category
VALUES (12, 13);
INSERT INTO board_category
VALUES (12, 17);
INSERT INTO board_category
VALUES (13, 12);
INSERT INTO board_category
VALUES (13, 16);
INSERT INTO board_category
VALUES (14, 11);
INSERT INTO board_category
VALUES (14, 18);
INSERT INTO board_category
VALUES (15, 14);
INSERT INTO board_category
VALUES (15, 21);

--(기타 카테고리 22~27)
INSERT INTO board_category
VALUES (16, 22);
INSERT INTO board_category
VALUES (17, 23);
INSERT INTO board_category
VALUES (18, 24);
INSERT INTO board_category
VALUES (19, 25);
INSERT INTO board_category
VALUES (20, 26);

INSERT INTO board_category
VALUES (21, 23);
INSERT INTO board_category
VALUES (22, 24);
INSERT INTO board_category
VALUES (23, 25);
INSERT INTO board_category
VALUES (24, 26);
INSERT INTO board_category
VALUES (25, 27);

INSERT INTO board_category
VALUES (26, 23);
INSERT INTO board_category
VALUES (27, 24);
INSERT INTO board_category
VALUES (28, 25);

INSERT INTO board_category
VALUES (29, 22);
INSERT INTO board_category
VALUES (30, 23);
INSERT INTO board_category
VALUES (31, 24);
INSERT INTO board_category
VALUES (32, 25);
INSERT INTO board_category
VALUES (33, 26);
INSERT INTO board_category
VALUES (34, 27);
INSERT INTO board_category
VALUES (35, 22);

INSERT INTO board_category
VALUES (36, 22);
INSERT INTO board_category
VALUES (37, 24);
INSERT INTO board_category
VALUES (38, 26);

SELECT * FROM board_category;





/*
theater(공연장)
(theater_no, theater_name, theater_row, theater_col, address, telno)
*/
INSERT INTO theater
VALUES (DEFAULT, '예술의전당', 15, 5, '서울 서초구 남부순환로 2406', '1668-1352');
INSERT INTO theater
VALUES (DEFAULT, '성남 아트 센터', 20, 10, '경기 성남시 분당구 성남대로 808 성남아트센터', '031-783-8000');
INSERT INTO theater
VALUES (DEFAULT, '충무아트센터', 15, 10, '서울 중구 퇴계로 387', '02-2230-6600');
INSERT INTO theater
VALUES (DEFAULT, '대구오페라하우스', 15, 10, '대구광역시 북구 호암로 15', '053-666-6000');
INSERT INTO theater
VALUES (DEFAULT, '춘천문화예술회관', 20, 20, '강원 춘천시 효자상길5번길 13', '033-259-5841');
INSERT INTO theater
VALUES (DEFAULT, '충무아트센터 대극장', 15, 15, '서울시 중구 퇴계로 387', '033-259-5841');
INSERT INTO theater
VALUES (DEFAULT, 'CJ 토월극장', 20, 20, '서울 서초구 남부순환로 2406', '1668-1352');
INSERT INTO theater
VALUES (DEFAULT, 'KH정보교육원', 5, 10, '서울 강남구 테헤란로14길 6', '1544-9970');
INSERT INTO theater
VALUES (DEFAULT, '코엑스 신한카드 아티움', 80, 100, '서울시 강남구 영동대로 513', '1661-5628');
INSERT INTO theater
VALUES (DEFAULT, '남동소래아트홀 대공연장', 20, 20, '인천 남동구 아암대로1437번길 32', '032-439-5001');

SELECT * FROM theater;


/*
concert(공연)
(concert_no, theater_no, concert_title, concert_plot, concert_runtime, concert_members, concert_production, age_limit, update_date, concert_status)
*/
INSERT INTO concert
VALUES (DEFAULT
	, 1
	, 'KBS 교향악단 1000회 정기 공연'
	, '<p>KBS 교향악단 1000회 기념 공연</p>
<p></p>
<p>1부</p>
<p>베토벤 - 삼중 협주곡</p>
<p>지휘 - 클라우스 메켈레</p>
<p>첼로 - 한재민</p>
<p>피아노 - 선우예권</p>
<p>바이올린 - 양인모</p>
<p></p>
<p>인터미션</p>
<p></p>
<p>2부</p>
<p>쇼스타코비치 교향곡 4번</p>
<p>지휘 - 클라우스 메켈레</p>'
	, 120
	, 'KBS 교향악단'
	, 'KBS 교향악단'
	, '초등학생 이상'
	, '2024-05-23'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 2
	, '백건우 피아노 리사이틀 - 변주곡'
	, '<p>1부</p>
<p>바흐 - 골드베르크 변주곡</p>
<p></p>
<p>2부</p>
<p>베토벤 - 디아벨리 변주곡</p>'
	, 120
	, '백건우'
	, '재단법인 성남문화재단'
	, '초등학생 이상'
	, '2024-05-24'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT, 3
	, '뮤지컬 디어 에반 헨슨'
	, '<p>디어 에반 헨슨</p>
<p>오늘은 멋진 하루가 될 거야! 왜냐하면...</p>
<p></p>
<p>불안장애를 앓고 있는 소심한 소년 <에반 핸슨>은</p>
<p>매일 스스로에게 편지를 쓰며</p>
<p>나답게 행동할 수 있는 멋진 하루를 꿈꾼다.</p>'
	, 160
	, '김성규, 박강현, 임규형 외'
	, '디어에반핸슨문화산업전문회사'
	, '중학생 이상'
	, '2024-05-25'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT, 4
	, '오텔로'
	, '<p>오텔로는 윌리엄 셰익스피어의 4대 비극 중 하나인 오셀로의 이탈리아어 표기이다. 원작은 셰익스피어 이지만, 현존하는 두 가지의 이탈리아 오페라 제목이라고도 할 수 있다. 이유인즉슨, 조아키노 로시니와 주세페 베르디가 오셀로를 바탕으로 오페라를 작곡했기 때문. 그래서 보통 영어에서도 셰익스피어 작품은 Othello라고 쓰고, 오페라는 Otello라고 써서 둘을 구별한다.</p>
<p></p>
<p>이 중 가장 인지도가 높은 오텔로는 단연 베르디가 작곡한 버전이라고 할 수 있다. 물론, 세빌리아의 이발사로 유명한 조아키노 로시니도 베르디보다 70년 먼저 오텔로 오페라를 작곡했지만, 이쪽은 초연 후 로시니의 팬들 정도 외에는 기억하는 사람이 거의 없다.</p>
<p></p>
<p>반면 베르디 버전은 초연 당시는 물론, 오늘날까지 이탈리아 오페라의 걸작으로 칭송받으며 <아이다>, <라 트라비아타> 등 그의 대표작들과 함께 즐겨 연주되고 있다. 더욱 놀라운 것은 베르디가 이 작품을 초연했을 당시의 나이가 이미 70대였다는 점이다.</p>'
	, 150
	, '영남오페라단'
	, '대구광역시'
	, '초등학생 이상'
	, '2024-05-26'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 5
	, '웃는 남자'
	, '<p>[시놉시스]</p>
<p>부자들의 낙원은 가난한 자들의 지옥으로 세워진 것이다</p>
<p></p>
<p>17세기 영국, 아이들을 납치해 기형적인 괴물로 만들어 귀족들의 놀잇감으로 팔던 인신 매매단 콤프라치코스에 의해 기이하게 찢겨진 입을 갖게 된 어린 그윈플렌은 매서운 눈보라 속에 홀로 버려진다.</p>
<p></p>
<p>살을 에는 추위 속을 헤매던 그윈플렌은 얼어 죽은 여자의 품에 안겨 젖을 물고 있는 아기 데아를 발견하고 우연히 떠돌이 약장수 우르수스를 만나 도움을 청한다. 우르루스는 평소 인간을 혐오하지만 두 아이를 거두기로 결심하고 그윈플렌의 기형적인 미소와 눈 먼 데아의 이야기를 이용해 유랑극단을 꾸린다.</p>
<p></p>
<p>어느덧 성장한 그윈플렌은 기이한 미소 덕분에 유럽 전역에서 가장 유명한 광대가 되고 그의 공연을 본 앤 여왕의 이복동생 조시아나는 그의 매력에 푹 빠져버린다. 생애 처음으로 귀족인 조시아나에게 구애를 받은 그윈플렌은 고혹적인 그녀의 유혹에 순수했던 마음이 흔들리고, 우르수스와 데아는 그런 그윈플렌의 모습에 남몰래 가슴앓이 한다. 그러던 중 그윈플렌은 ‘눈물의 성’이라는 악명 높은 고문소로 끌려가게 되는데, 생각지도 못했던 그의 출생의 비밀이 밝혀지며 간신히 평화를 찾았던 세 사람의 삶이 송두리째 흔들린다.</p>
<p></p>
<p></p>
<p>[프로필]</p>
<p></p>
<p>* 그윈플렌 Gwynplaine : 이석훈, 규현, 박강현, 수호</p>
<p>- 인신매매단 콤프라치코스의 만행으로 기이하게 찢겨진 입을 갖게 된 그윈플렌은 지울 수 없는 영원한 미소를 가진 채 사람들을 웃기는 광대로 살아간다. 고혹적인 매력을 가진 조시아나 공작부인의 유혹에 흔들리던 차에 악명 높은 고문소 ‘눈물의 성’에 끌려가 출생의 비밀을 알게 되고 잔인한 운명의 소용돌이에 휘말리게 된다.</p>
<p></p>
<p>* 우르수스 Ursus : 민영기, 양준모</p>
<p>- 곰처럼 풍채가 좋은 떠돌이 약장수 우르수스는 인간을 혐오하는 염세주의자이자 철학자이다. 유랑극단의 단장이기도 한 그는 사교적이지는 않지만 말이 많으며 아무도 보고 싶어 하지 않지만 그 누군가와 대화 하고 싶어한다. 스스로 평생 단 한번도 운 적이 없다고 말하고 다니는 인물이다.</p>
<p></p>
<p>* 데아 Dea : 이수빈, 강혜인</p>
<p>- 아이와 같은 순백의 여린 마음을 갖고 있는 데아는 눈에 빛을 가득 담고 있지만 정작 앞을 보지 못한다. 어린 시절 자신을 구해준 그윈플렌을 천사이자 가족이라고 생각하는 데아는 눈이 아닌 영혼으로 그를 바라보며 마음의 상처를 보듬어준다.</p>
</p>
<p>* 조시아나 공작부인Lady Josiana : 신영숙, 김소향</p>
<p>- 앤 여왕의 이복동생으로 부유하고 매혹적이며 영리한 조시아나는 야망을 숨기기 위해 모든 일이 지루한 척 행동한다. 늘 자신만만한 그녀는 우연히 그윈플렌의 공연을 보고 그의 기이한 미소와 매력에 푹 빠져져 그를 유혹한다. </p>
<p></p>
<p>* 데이빗 더리모어 경 Lord David Dirry-Moir : 최성원, 강태을</p>
<p>- 고 클랜찰리 공작의 사생아이자 어린 시절 조시아나 공작부인과의 약혼한 사이다. 조시아나와의 결혼을 통해 신분상승을 꿈꾸는 야망있는 인물로 ‘톰-짐-잭’이라는 가명을 쓰며 남몰래 평민들의 삶을 즐긴다.</p>
<p></p>
<p>* 페드로 Phedro : 이상준</p>
<p>- 질투와 증오로 가득 찬, 돈만 밝히는 박쥐 같은 교활한 하인이다.</p>
<p></p>
<p>* 앤 여왕 Queen Anne : 김경선, 한유란</p>
<p>- 영국의 통치자이자 죽은 제임스 왕의 적법한 딸로 식탐이 많고 이기적인 여인이다.</p>'
	, 180
	, '이석훈, 규현, 박강현, 수호 외'
	, '춘천문화예술회관'
	, '초등학생 이상'
	, '2024-05-27'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 6
	, '뮤지컬 <베르사유의 장미>'
	, '<p>[시놉시스]</p>
<p>울지 마, 난 후회없이 살았어</p>
<p>대대로 왕실 근위대를 지휘하는 유서깊은 자르제 가문의 막내딸로 태어난 오스칼.</p>
<p>그녀는 집안의 명예를 이어가야 한다는 아버지의 뜻에 따라 아들로 키워져</p>
<p>조국과 왕가를 위해 충성을 다하는 근위대장이 된다.</p>
<p>하인 앙드레는 신분차이로 인해 오스칼의 향한 마음을 숨긴 채 언제나 그의 곁을 지킨다.</p>
<p></p>
<p>연일 화려한 불빛과 선율의 향연이 이어지는 프랑스 파리의 베르사유.</p>
<p>귀족들은 여왕의 총애를 받고자 아첨을 떠느라 바쁘지만</p>
<p>거리의 민중들은 연이은 흉작과 늘어나는 세금에 허덕이며 절망 속에서 살아간다.</p>
<p></p>
<p>어느 날, 귀족 저택만 노려 물건을 훔친다는 흑기사가 나타나고</p>
<p>오스칼은 앙드레를 흑기사로 위장시켜 진짜 흑기사를 유인하려는 계획을 시작으로</p>
<p>점차 귀족사회의 불편한 진실을 마주하게 된다.</p>
<p></p>
<p>1789년 바스티유 앞,</p>
<p>포격 소리가 울려퍼지는 가운데</p>
<p>오스칼은 진정한 군인의 사명을 다하고자 국민의 편에 서게 되는데...</p>'
	, 180
	, '옥주현, 김지우, 정유지 외'
	, '총괄 프로듀서 엄홍현, 프로듀서 김지원 등'
	, '초등학생 이상'
	, '2024-05-28'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 7
	, '천 개의 파랑'
	, '<p>SYNOPSIS</p>
<p>2035년의 한국, 경마를 하기 위해 <기수 휴머노이드>가 공장에서 만들어진다.</p>
<p>그 중 C-27은 연구원의 실수로 개발 중인 학습용 휴머노이드 칩을 갖게 되고, 천개의 단어를 알게 된다.</p>
<p>자신과 호흡을 맞추는 말인 <투데이>가 어느 순간부터 달릴 때 행복하지 않다는 걸 느낀 C-27은</p>
<p>투데이를 멈추기 위해 결국 스스로 낙마를 하는 선택을 한다.</p>
<p>그렇게 하반신이 부서진 채 폐기처분만 기다리고 있는 C-27에게 누군가가 나타난다.</p>
<p></p>
<p>과거 3퍼센트의 생존확률로 화재현장에서 살아남은 보경은</p>
<p>300퍼센트의 책임감으로 두 딸인 연재와 은혜를 키우고 있다.</p>
<p>은혜는 매일 마방에 휠체어를 타고 와서 안락사를 기다리는 <투데이>를 바라보고,</p>
<p>연재는 폐기처분을 기다리며 하늘을 바라보는 C-27에게 호기심을 느낀다.</p>
<p>그렇게 전재산을 털어 C-27을 사오고, 그를 <콜리>라고 이름 지어준다.</p>
<p></p>
<p>고요하던 세 모녀의 삶에 들어온 <콜리>는 이들에게 잔잔한 파동이 되어주는데...</p>'
	, 170
	, '윤태호, 진호(펜타곤), 서연정, 효정(오마이걸) 외'
	, '예술감독 이유리, 원작 천선란 외'
	, '초등학생 이상'
	, '2024-05-30'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 8
	, '김효영 강사의 화를 다스리는 법'
	, '<p>김효영 강사의 "화를 다스리는 법" 강의에 오신 것을 환영합니다.</p>
<p>이 강의는 일상 속에서 자주 맞닥뜨리는 분노와 스트레스를 효과적으로 관리하고, 평온한 마음을 유지하는 방법을 제공합니다.</p>
<p>다양한 심리학적 이론과 실제 사례를 통해 자신의 감정을 이해하고, 화를 긍정적인 에너지로 전환하는 기술을 배우실 수 있습니다.</p>
<p>또한, 실생활에 바로 적용할 수 있는 실용적인 팁과 명상, 호흡법 등 다양한 훈련 방법도 함께 소개됩니다.</p>
<p>김효영 강사와 함께 더 나은 자신을 발견하고, 조화로운 삶을 만들어가세요.</p>
<p>출처 ChatGPT...</p>'
	, 60
	, '김효영'
	, 'STAEZ'
	, '18세 이상'
	, '2024-05-30'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 9
	, '정은지 콘서트'
	, '<p>우리의 인생은 긴 여행과 같다.</p>
<p></p>
<p>이런 여정을 계속해서 해 나아갈 모든 이들에게,</p>
<p>작은 위로와, 삶의 안부를 이 공연을 통해 건네고자 한다.</p>
<p></p>
<p>이 곳에서 우리의 기억을 "기록"해 보자.</p>
<p></p>
<p>이 기록의 조각이 여정에 지친 모든 이들에게</p>
<p>완벽한 여행으로 완성되길 희망하며,</p>'
	, 120
	, '정은지'
	, '정은지'
	, '초등학생 이상'
	, '2024-06-01'
	, DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
	, 10
	, '김덕수 사물놀이'
	, '<p>김덕수 사물놀이.</p>'
	, 60
	, '김덕수'
	, '김덕수'
	, '초등학생 이상'
	, '2024-06-01'
	, DEFAULT);

SELECT * FROM concert;





/*
concert_attachment(공연 첨부파일))
(file_no, concert_no, origin_name, change_name, file_path, upload_date, file_level, status)
*/
INSERT INTO concert_attachment
VALUES (DEFAULT, 1, 'thumbnail1.png', 'thumbnail1.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 2, 'thumbnail2.png', 'thumbnail2.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 3, 'thumbnail3.png', 'thumbnail3.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 4, 'thumbnail4.png', 'thumbnail4.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 5, 'thumbnail5.png', 'thumbnail5.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 6, '베르사유의_장미_썸네일.gif', '2024060115000441318.gif', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 7, '천개의파랑.png', '2024052710180233177.webp', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 8, '효영선생.png', '2024052710243667567.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 9, '정은지이쁘다.png', '2024052718271133380.webp', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 10, '김덕수사물놀이.png', '2024052809053615113.webp', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);

SELECT * FROM concert_attachment;





/*
concert_category(공연 카테고리)
(concert_no, category_no)
- 공연 카테고리 중계테이블
- 카테고리번호는 4~10 공연 카테고리만 해당
- concert_category 테이블은 concert테이블과 데이터 개수가 같아야 함
*/
INSERT INTO concert_category VALUES (1, 5);
INSERT INTO concert_category VALUES (2, 5);
INSERT INTO concert_category VALUES (3, 4);
INSERT INTO concert_category VALUES (4, 8);
INSERT INTO concert_category VALUES (5, 8);
INSERT INTO concert_category VALUES (6, 8);
INSERT INTO concert_category VALUES (7, 8);
INSERT INTO concert_category VALUES (8, 10);
INSERT INTO concert_category VALUES (9, 7);
INSERT INTO concert_category VALUES (10, 6);

SELECT * FROM concert_category;





/*
seat(좌석 테이블)
(seat_id, concert_no, grade, price, concert_date, seat_start_row, seat_end_row, seat_start_col, seat_end_col, status)

*/
INSERT INTO seat
VALUES (DEFAULT, 1, 'R', 120000, '2024-07-07', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'S', 100000, '2024-07-07', 5, 8, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'B', 80000, '2024-07-07', 9, 12, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'A', 50000, '2024-07-07', 13, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'R', 120000, '2024-07-08', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'S', 100000, '2024-07-08', 5, 8, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'B', 80000, '2024-07-08', 9, 12, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'A', 50000, '2024-07-08', 13, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 2, 'R', 120000, '2024-07-09', 1, 5, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'S', 100000, '2024-07-09', 6, 10, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'B', 80000, '2024-07-09', 11, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'A', 50000, '2024-07-09', 16, 20, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'R', 120000, '2024-07-10', 1, 5, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'S', 100000, '2024-07-10', 6, 10, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'B', 80000, '2024-07-10', 11, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'A', 50000, '2024-07-10', 16, 20, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 3, 'R', 120000, '2024-07-09', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'S', 100000, '2024-07-09', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'B', 80000, '2024-07-09', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'A', 50000, '2024-07-09', 13, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'R', 120000, '2024-07-10', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'S', 100000, '2024-07-10', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'B', 80000, '2024-07-10', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'A', 50000, '2024-07-10', 13, 15, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 4, 'R', 120000, '2024-07-07', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'S', 100000, '2024-07-07', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'B', 80000, '2024-07-07', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'A', 50000, '2024-07-07', 13, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'R', 120000, '2024-07-08', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'S', 100000, '2024-07-08', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'B', 80000, '2024-07-08', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'A', 50000, '2024-07-08', 13, 15, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 5, 'R', 120000, '2024-07-07', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'S', 100000, '2024-07-07', 6, 10, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'B', 80000, '2024-07-07', 11, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'A', 50000, '2024-07-07', 16, 20, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'R', 120000, '2024-07-08', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'S', 100000, '2024-07-08', 6, 10, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'B', 80000, '2024-07-08', 11, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'A', 50000, '2024-07-08', 16, 20, 1, 20, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 6, 'R', 120000, '2024-06-22', 1, 2, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'S', 100000, '2024-06-22', 3, 5, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'B', 80000, '2024-06-22', 6, 10, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'A', 50000, '2024-06-22', 11, 15, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'R', 120000, '2024-06-23', 1, 2, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'S', 100000, '2024-06-23', 3, 5, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'B', 80000, '2024-06-23', 6, 10, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'A', 50000, '2024-06-23', 11, 15, 1, 15, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 7, 'R', 90000, '2024-06-24', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 7, 'S', 60000, '2024-06-24', 6, 12, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 7, 'A', 30000, '2024-06-24', 13, 20, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 7, 'R', 90000, '2024-06-25', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 7, 'S', 60000, '2024-06-25', 6, 12, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 7, 'A', 30000, '2024-06-25', 13, 20, 1, 20, DEFAULT);


INSERT INTO seat
VALUES (DEFAULT, 8, 'R', 20000, '2024-06-03', 1, 1, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 8, 'S', 10000, '2024-06-03', 2, 3, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 8, 'A', 5000, '2024-06-03', 4, 5, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 9, 'R', 120000, '2024-06-28', 1, 40, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'S', 100000, '2024-06-28', 41, 80, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'B', 80000, '2024-06-28', 1, 80, 1, 30, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'A', 50000, '2024-06-28', 1, 80, 71, 100, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'R', 120000, '2024-06-29', 1, 40, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'S', 100000, '2024-06-29', 41, 80, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'B', 80000, '2024-06-29', 1, 80, 1, 30, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'A', 50000, '2024-06-29', 1, 80, 71, 100, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 10, 'R', 40000, '2024-07-06', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 10, 'S', 30000, '2024-07-06', 6, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 10, 'A', 20000, '2024-07-06', 16, 20, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 10, 'R', 40000, '2024-07-07', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 10, 'S', 30000, '2024-07-07', 6, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 10, 'A', 20000, '2024-07-07', 16, 20, 1, 20, DEFAULT);

SELECT * FROM seat;





/*
impossible_seat(착석불가좌석)
(impossible_seat_no, theater_no, impossible_seat_row, impossible_seat_col)
*/
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 1);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 2);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 3);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 2, 1);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 2, 2);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 3, 1);

SELECT * FROM impossible_seat;





/*
concert_schedule(공연 일정)
(schedule_no, concert_no, schedule, start_date, end_date, concert_times, status)
- 
*/
INSERT INTO concert_schedule
VALUES (DEFAULT, 1, '20:00-22:00', '2024-07-07', '2024-07-08', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 2, '20:00-22:00', '2024-07-09', '2024-07-10', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 2, '14:00-16:00', '2024-07-09', '2024-07-09', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 3, '20:00-22:40', '2024-07-07', '2024-07-08', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 4, '20:00-22:30', '2024-07-07', '2024-07-08', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 5, '20:00-23:00', '2024-07-07', '2024-07-08', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 6, '18:00-21:00', '2024-06-22', '2024-06-23', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 7, '14:00-17:00', '2024-06-24', '2024-06-25', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 8, '18:00-19:00', '2024-06-03', '2024-06-03', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 9, '18:00-20:00', '2024-06-28', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 10, '10:00-11:00', '2024-07-06', '2024-07-07', 1, DEFAULT);

SELECT * FROM concert_schedule;





/*
concert_like(공연찜)
(concert_like_no, user_no, concert_no, concert_like_date, status)
- 같은 사람이 같은 공연 찜 중복하지 않도록 UNIQUE(user_no, concert_no) 제약조건 설정
*/
INSERT INTO concert_like
VALUES (DEFAULT, 2, 1, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 3, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 4, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 5, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 6, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 7, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 9, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 2, 10, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 3, 1, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 3, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 3, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 4, 3, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 4, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 4, 5, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 5, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 6, 6, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 6, 7, '2024-05-27 19:01:40.193236+09', DEFAULT);
INSERT INTO concert_like
VALUES (DEFAULT, 6, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);

SELECT * FROM concert_like;





/*
concert_review(한줄평)
(review_no, user_no, concert_no, review_content, score, review_date, review_status)
*/
INSERT INTO concert_review
VALUES (DEFAULT, 2, 1, '기대안했는데 재밌었습니다', 5, DEFAULT);
INSERT INTO concert_review
VALUES (DEFAULT, 3, 2, '조금 아쉬웠어요', 4, DEFAULT);
INSERT INTO concert_review
VALUES (DEFAULT, 4, 4, '졸려서 잤어요', 3, DEFAULT);
INSERT INTO concert_review
VALUES (DEFAULT, 5, 6, '처음 관람이었는데 기대이상이었어요', 5, DEFAULT);
INSERT INTO concert_review
VALUES (DEFAULT, 6, 4, '재밌었지만 코골며 자는 사람이 있었어요', 4, DEFAULT);

SELECT * FROM concert_review;





/*
reserve(예매정보)
(reserve_no, concert_no, user_no, reserve_row, reserve_col, reserve_date, pay_method, concert_date, reserve_status, schedule)
- 데이터 하나당 한좌석에 대한 정보 저장(ex. b3, b4, b5좌석 예매하면 3개의 데이터 저장)
- reserve_status : 결제된예약(Y), 결제전예약(U), 만료된예약(N) => DEFAULT는 'U'
*/
INSERT INTO reserve
VALUES (DEFAULT, 1, 2, 2, 3, '2024-05-27 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
INSERT INTO reserve
VALUES (DEFAULT, 1, 2, 2, 4, '2024-05-27 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
INSERT INTO reserve
VALUES (DEFAULT, 1, 2, 2, 5, '2024-05-27 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
INSERT INTO reserve
VALUES (DEFAULT, 3, 4, 3, 2, '2024-05-26 19:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:40');
INSERT INTO reserve
VALUES (DEFAULT, 3, 4, 3, 3, '2024-05-26 19:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:40');
INSERT INTO reserve
VALUES (DEFAULT, 4, 5, 5, 6, '2024-05-24 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
INSERT INTO reserve
VALUES (DEFAULT, 4, 5, 5, 7, '2024-05-24 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
INSERT INTO reserve
VALUES (DEFAULT, 4, 5, 5, 8, '2024-05-24 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
INSERT INTO reserve
VALUES (DEFAULT, 4, 5, 5, 9, '2024-05-24 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
INSERT INTO reserve
VALUES (DEFAULT, 5, 2, 10, 4, '2024-05-21 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-23:00');
INSERT INTO reserve
VALUES (DEFAULT, 5, 2, 10, 3, '2024-05-21 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-23:00');
INSERT INTO reserve
VALUES (DEFAULT, 1, 2, 4, 5, '2024-05-27 19:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:00');

SELECT * FROM reserve;





/*
tag(태그)
(board_no, concert_no)
*/
INSERT INTO tag
VALUES (1,9);
INSERT INTO tag
VALUES (2,4);
INSERT INTO tag
VALUES (4,1);


SELECT * FROM tag;


COMMIT;