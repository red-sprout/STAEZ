-------------------------더미 데이터 생성-----------------------------
/*
staez_user(회원)
(user_no, user_id, user_pwd, user_name, nickname, gender, birth, address, email, phone, genre_like, grade, enroll_date, withdrawal_date, user_status)
- 비밀번호는 pass01로 통일
- 관리자 계정을 제외하고는 아이디 뒤에 유저 번호를 붙힘
*/
INSERT INTO staez_user
VALUES (DEFAULT, 'admin', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '관리자', '관리자','M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user@gmail.com', '01011111111','', 1, DEFAULT, NULL, DEFAULT);
--관리자계정(userNo : 1)
INSERT INTO staez_user
VALUES (DEFAULT, 'user02', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '이원기','wg', 'M', '1997-04-23', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user02@gmail.com', '01022222222','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user03', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '김효영','hyo', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user03@gmail.com', '01033333333','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user04', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '주재완','joo', 'M', '1998-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user04@gmail.com', '01044444444','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user05', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '장용준','joon', 'M', '1998-01-03', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user05@gmail.com', '01055555555','', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user06', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '김남주','nam', 'F', '1998-08-31', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user06@naver.com', '01066666666', '', 2, DEFAULT, NULL, DEFAULT);
INSERT INTO staez_user
VALUES (DEFAULT, 'user07', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '탈주자','탈퇴한놈', 'M', '1991-11-11', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'withdrawal@gmail.com', '01099999999','', 2, '2024-01-01 17:41:18.955208+09', '2024-06-01 11:36:11.264208+09', 'N');
--탈퇴회원(userNo : 7)
INSERT INTO staez_user
VALUES (DEFAULT, 'user08', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '윈터','연예인1', 'F', '2001-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user08@daum.net', '01012341234','', 2, '2024-02-01 17:41:18.955208+09', NULL, 'Y');
INSERT INTO staez_user
VALUES (DEFAULT, 'user09', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '장원영','연예인2', 'F', '2004-08-31', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user09@gmail.com', '01023452345','', 2, '2024-03-01 17:41:18.955208+09', NULL, 'Y');
INSERT INTO staez_user
VALUES (DEFAULT, 'user10', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', '차은우','연예인3', 'M', '1997-03-03', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user10@naver.com', '01034563456','', 2, '2024-04-12 17:41:18.955208+09', NULL, 'Y');

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
VALUES (DEFAULT, 2, '깻잎이.jpg', '2024060512205164547.jpg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 3, '슬라임.jpg', '2024053118400375937.jpg', '/resources/uploadfiles/profile/',DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 4, 'raccoon.jpeg', '2024060118183248125.jpeg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 5, NULL, NULL, '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 6, 'theater.jpg', '2024061914422851996.jpg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 8, '윈터.jpg', '2024033118400348177.jpg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 9, '장원영.webp', '2024043018400311431.webp', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);
INSERT INTO profile_img
VALUES (DEFAULT, 10, '차은우.jpg', '2024060111400351931.jpg', '/resources/uploadfiles/profile/', DEFAULT, DEFAULT);

SELECT * FROM profile_img;




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
board(게시글)
(borad_no, ref_board_no, user_no, board_level, board_code, board_write_date, board_title, board_content, board_count, board_status)
- ref_board_no : 답변시 질문글번호 또는 연관 게시글번호
- board_level : 원글/문의/신고(1), 답변(2)
- board_code : 공지사항(1), 일반게시글(2), 문의(3), FAQ(4), 신고(5)

- board_count의 DEFAULT는 0
*/

/*
board_category(게시글 카테고리)
(board_no, category_no)
- 카테고리번호는 11~14(대분류), 15~21(소분류) 커뮤니티 카테고리만 해당
- 게시글과 카테고리 중계테이블로 게시글이 있으면 무조건 대분류와 소분류 데이터 쌍으로 2개씩 생성
  => 커뮤니티게시글 갯수 * 2 = 커뮤니티관련 category 테이블 데이터 개수
- 나머지 공지사항, 문의(질문, 답변), FAQ, 신고 게시글들은 기타 카테고리 1개씩 생성
*/


/*일반게시글*/

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-04-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 23, DEFAULT); 
INSERT INTO board_category
VALUES (1, 11);
INSERT INTO board_category
VALUES (1, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 11, DEFAULT);
INSERT INTO board_category
VALUES (2, 11);
INSERT INTO board_category
VALUES (2, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2022-06-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 4, DEFAULT);
INSERT INTO board_category
VALUES (3, 11);
INSERT INTO board_category
VALUES (3, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 124, DEFAULT);
INSERT INTO board_category
VALUES (4, 12);
INSERT INTO board_category
VALUES (4, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-05-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 45, DEFAULT);
INSERT INTO board_category
VALUES (5, 12);
INSERT INTO board_category
VALUES (5, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 12, DEFAULT);
INSERT INTO board_category
VALUES (6, 13);
INSERT INTO board_category
VALUES (6, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 1, DEFAULT);
INSERT INTO board_category
VALUES (7, 13);
INSERT INTO board_category
VALUES (7, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 588, DEFAULT);
INSERT INTO board_category
VALUES (8, 13);
INSERT INTO board_category
VALUES (8, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-27 13:01:40.193236+09', '게시글제목9', '게시글내용9', 11, DEFAULT);
INSERT INTO board_category
VALUES (9, 14);
INSERT INTO board_category
VALUES (9, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-28 13:01:40.193236+09', '게시글제목10', '게시글내용10', 11, DEFAULT);
INSERT INTO board_category
VALUES (10, 14);
INSERT INTO board_category
VALUES (10, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-29 13:01:40.193236+09', '게시글제목11', '게시글내용11', 11, DEFAULT);
INSERT INTO board_category
VALUES (11, 14);
INSERT INTO board_category
VALUES (11, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-31 13:01:40.193236+09', '게시글제목12', '게시글내용12', 11, DEFAULT);
INSERT INTO board_category
VALUES (12, 14);
INSERT INTO board_category
VALUES (12, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2024-05-31 13:01:40.193236+09', '게시글제목13', '게시글내용13', 11, DEFAULT);
INSERT INTO board_category
VALUES (13, 14);
INSERT INTO board_category
VALUES (13, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-06-01 13:41:40.193236+09', '김덕수 사물놀이 리뷰', '<p>신명나네요</p><p>김덕수 선생님의 장구는 명불허전이시고 다른 사물놀이 패들 역시 대단하시더라고요!</p><p>&nbsp;<a href="https://namu.wiki/w/%EC%82%AC%EB%AC%BC%EB%86%80%EC%9D%B4" target="_blank">사물놀이</a>라는게 알고보니 기원이 1978년으로 생각보단 오래되지 않았다는게 놀랐습니다</p>', DEFAULT, 'Y');
INSERT INTO board_category
VALUES (14, 13);
INSERT INTO board_category
VALUES (14, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 2, '2023-06-02 19:51:40.193236+09', '조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.', '<p>조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.&nbsp;조금은 긴 글을 작성하고자 합니다... 다름이 아니라 테스트용입니다.<br></p>', DEFAULT, 'Y');
INSERT INTO board_category
VALUES (15, 14);
INSERT INTO board_category
VALUES (15, 21);


INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 45, DEFAULT); 
INSERT INTO board_category
VALUES (16, 14);
INSERT INTO board_category
VALUES (16, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2023-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 15, DEFAULT);
INSERT INTO board_category
VALUES (17, 14);
INSERT INTO board_category
VALUES (17, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 123, DEFAULT);
INSERT INTO board_category
VALUES (18, 11);
INSERT INTO board_category
VALUES (18, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2023-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 32, DEFAULT);
INSERT INTO board_category
VALUES (19, 11);
INSERT INTO board_category
VALUES (19, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 11, DEFAULT);
INSERT INTO board_category
VALUES (20, 12);
INSERT INTO board_category
VALUES (20, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-20 13:01:40.193236+09', '게시글제목6', '게시글내용6', 6, DEFAULT);
INSERT INTO board_category
VALUES (21, 12);
INSERT INTO board_category
VALUES (21, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-02-22 13:01:40.193236+09', '게시글제목7', '게시글내용7', 12, DEFAULT);
INSERT INTO board_category
VALUES (22, 13);
INSERT INTO board_category
VALUES (22, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-05-21 13:01:40.193236+09', '게시글제목8', '게시글내용8', 12, DEFAULT);
INSERT INTO board_category
VALUES (23, 14);
INSERT INTO board_category
VALUES (23, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-01-24 13:01:40.193236+09', '게시글제목9', '게시글내용9', 61, DEFAULT);
INSERT INTO board_category
VALUES (24, 13);
INSERT INTO board_category
VALUES (24, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 2, '2024-03-25 13:01:40.193236+09', '게시글제목10', '게시글내용10', 1, DEFAULT);
INSERT INTO board_category
VALUES (25, 12);
INSERT INTO board_category
VALUES (25, 21);


INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2023-12-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 0, DEFAULT); 
INSERT INTO board_category
VALUES (26, 14);
INSERT INTO board_category
VALUES (26, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2023-02-24 11:18:56.955458+09', '게시글제목2', '게시글내용2', 6, DEFAULT);
INSERT INTO board_category
VALUES (27, 11);
INSERT INTO board_category
VALUES (27, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 14, DEFAULT);
INSERT INTO board_category
VALUES (28, 13);
INSERT INTO board_category
VALUES (28, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 8, DEFAULT);
INSERT INTO board_category
VALUES (29, 11);
INSERT INTO board_category
VALUES (29, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2022-07-11 13:01:40.193236+09', '게시글제목5', '게시글내용5', 2, DEFAULT);
INSERT INTO board_category
VALUES (30, 14);
INSERT INTO board_category
VALUES (30, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-02-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 63, DEFAULT);
INSERT INTO board_category
VALUES (31, 13);
INSERT INTO board_category
VALUES (31, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-03-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 1, DEFAULT);
INSERT INTO board_category
VALUES (32, 13);
INSERT INTO board_category
VALUES (32, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-05-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 62, DEFAULT);
INSERT INTO board_category
VALUES (33, 12);
INSERT INTO board_category
VALUES (33, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-05-01 13:01:40.193236+09', '게시글제목9', '게시글내용9', 54, DEFAULT);
INSERT INTO board_category
VALUES (34, 14);
INSERT INTO board_category
VALUES (34, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 2, '2024-05-19 13:01:40.193236+09', '게시글제목10', '게시글내용10', 8, DEFAULT);
INSERT INTO board_category
VALUES (35, 11);
INSERT INTO board_category
VALUES (35, 21);


INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2023-07-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 1, DEFAULT); 
INSERT INTO board_category
VALUES (36, 11);
INSERT INTO board_category
VALUES (36, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 67, DEFAULT);
INSERT INTO board_category
VALUES (37, 12);
INSERT INTO board_category
VALUES (37, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2023-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 2, DEFAULT);
INSERT INTO board_category
VALUES (38, 14);
INSERT INTO board_category
VALUES (38, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 5, DEFAULT);
INSERT INTO board_category
VALUES (39, 13);
INSERT INTO board_category
VALUES (39, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2022-11-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 8, DEFAULT);
INSERT INTO board_category
VALUES (40, 13);
INSERT INTO board_category
VALUES (40, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-11 13:01:40.193236+09', '게시글제목6', '게시글내용6', 23, DEFAULT);
INSERT INTO board_category
VALUES (41, 12);
INSERT INTO board_category
VALUES (41, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-02 13:01:40.193236+09', '게시글제목7', '게시글내용7', 1, DEFAULT);
INSERT INTO board_category
VALUES (42, 12);
INSERT INTO board_category
VALUES (42, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2023-05-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 8, DEFAULT);
INSERT INTO board_category
VALUES (43, 11);
INSERT INTO board_category
VALUES (43, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2021-01-28 13:01:40.193236+09', '게시글제목9', '게시글내용9', 43, DEFAULT);
INSERT INTO board_category
VALUES (44, 13);
INSERT INTO board_category
VALUES (44, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 2, '2024-05-30 13:01:40.193236+09', '게시글제목10', '게시글내용10', 822, DEFAULT);
INSERT INTO board_category
VALUES (45, 14);
INSERT INTO board_category
VALUES (45, 16);


INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-06-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 26, DEFAULT); 
INSERT INTO board_category
VALUES (46, 14);
INSERT INTO board_category
VALUES (46, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-06-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 45, DEFAULT);
INSERT INTO board_category
VALUES (47, 11);
INSERT INTO board_category
VALUES (47, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-05-11 19:01:40.193236+09', '게시글제목3', '게시글내용3', 48, DEFAULT);
INSERT INTO board_category
VALUES (48, 13);
INSERT INTO board_category
VALUES (48, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 22, DEFAULT);
INSERT INTO board_category
VALUES (49, 11);
INSERT INTO board_category
VALUES (49, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-06-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 73, DEFAULT);
INSERT INTO board_category
VALUES (50, 12);
INSERT INTO board_category
VALUES (50, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-06-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 12, DEFAULT);
INSERT INTO board_category
VALUES (51, 14);
INSERT INTO board_category
VALUES (51, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-05-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 16, DEFAULT);
INSERT INTO board_category
VALUES (52, 14);
INSERT INTO board_category
VALUES (52, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-05-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 2, DEFAULT);
INSERT INTO board_category
VALUES (53, 13);
INSERT INTO board_category
VALUES (53, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2024-01-28 13:01:40.193236+09', '게시글제목9', '게시글내용9', 8, DEFAULT);
INSERT INTO board_category
VALUES (54, 13);
INSERT INTO board_category
VALUES (54, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 2, '2023-05-29 13:01:40.193236+09', '게시글제목10', '게시글내용10', 9, DEFAULT);
INSERT INTO board_category
VALUES (55, 12);
INSERT INTO board_category
VALUES (55, 15);


INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2023-01-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 16, DEFAULT); 
INSERT INTO board_category
VALUES (56, 13);
INSERT INTO board_category
VALUES (56, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2024-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 327, DEFAULT);
INSERT INTO board_category
VALUES (57, 11);
INSERT INTO board_category
VALUES (57, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2021-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 46, DEFAULT);
INSERT INTO board_category
VALUES (58, 13);
INSERT INTO board_category
VALUES (58, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2022-10-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 27, DEFAULT);
INSERT INTO board_category
VALUES (59, 12);
INSERT INTO board_category
VALUES (59, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2023-10-31 13:01:40.193236+09', '게시글제목5', '게시글내용5', 1, DEFAULT);
INSERT INTO board_category
VALUES (60, 12);
INSERT INTO board_category
VALUES (60, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2023-05-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 167, DEFAULT);
INSERT INTO board_category
VALUES (61, 11);
INSERT INTO board_category
VALUES (61, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2023-05-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 21, DEFAULT);
INSERT INTO board_category
VALUES (62, 13);
INSERT INTO board_category
VALUES (62, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2024-05-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 3, DEFAULT);
INSERT INTO board_category
VALUES (63, 11);
INSERT INTO board_category
VALUES (63, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2024-04-28 13:01:40.193236+09', '게시글제목9', '게시글내용9', 6, DEFAULT);
INSERT INTO board_category
VALUES (64, 14);
INSERT INTO board_category
VALUES (64, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 7, 1, 2, '2024-04-29 13:01:40.193236+09', '게시글제목10', '게시글내용10', 8, DEFAULT);
INSERT INTO board_category
VALUES (65, 14);
INSERT INTO board_category
VALUES (65, 20);


INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2023-05-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 67, DEFAULT); 
INSERT INTO board_category
VALUES (66, 11);
INSERT INTO board_category
VALUES (66, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2023-05-30 11:18:56.955458+09', '게시글제목2', '게시글내용2', 7, DEFAULT);
INSERT INTO board_category
VALUES (67, 14);
INSERT INTO board_category
VALUES (67, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2023-03-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 41, DEFAULT);
INSERT INTO board_category
VALUES (68, 13);
INSERT INTO board_category
VALUES (68, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2024-05-16 05:01:42.193236+09', '게시글제목4', '게시글내용4', 34, DEFAULT);
INSERT INTO board_category
VALUES (69, 12);
INSERT INTO board_category
VALUES (69, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2024-05-12 13:01:40.193236+09', '게시글제목5', '게시글내용5', 6, DEFAULT);
INSERT INTO board_category
VALUES (70, 12);
INSERT INTO board_category
VALUES (70, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2024-05-22 13:01:40.193236+09', '게시글제목6', '게시글내용6', 83, DEFAULT);
INSERT INTO board_category
VALUES (71, 11);
INSERT INTO board_category
VALUES (71, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2022-05-16 13:01:40.193236+09', '게시글제목7', '게시글내용7', 17, DEFAULT);
INSERT INTO board_category
VALUES (72, 14);
INSERT INTO board_category
VALUES (72, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2022-08-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 12, DEFAULT);
INSERT INTO board_category
VALUES (73, 13);
INSERT INTO board_category
VALUES (73, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2023-05-28 13:01:40.193236+09', '게시글제목9', '게시글내용9', 5, DEFAULT);
INSERT INTO board_category
VALUES (74, 14);
INSERT INTO board_category
VALUES (74, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 8, 1, 2, '2024-08-29 13:01:40.193236+09', '게시글제목10', '게시글내용10', 8, DEFAULT);
INSERT INTO board_category
VALUES (75, 11);
INSERT INTO board_category
VALUES (75, 20);


INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2023-10-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 1, DEFAULT); 
INSERT INTO board_category
VALUES (76, 13);
INSERT INTO board_category
VALUES (76, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2023-05-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 2, DEFAULT);
INSERT INTO board_category
VALUES (77, 14);
INSERT INTO board_category
VALUES (77, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2024-05-22 19:01:40.193236+09', '게시글제목3', '게시글내용3', 67, DEFAULT);
INSERT INTO board_category
VALUES (78, 12);
INSERT INTO board_category
VALUES (78, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2023-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 243, DEFAULT);
INSERT INTO board_category
VALUES (79, 11);
INSERT INTO board_category
VALUES (79, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2023-02-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 1, DEFAULT);
INSERT INTO board_category
VALUES (80, 14);
INSERT INTO board_category
VALUES (80, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2024-01-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 63, DEFAULT);
INSERT INTO board_category
VALUES (81, 13);
INSERT INTO board_category
VALUES (81, 15);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2024-01-25 13:01:40.193236+09', '게시글제목7', '게시글내용7', 13, DEFAULT);
INSERT INTO board_category
VALUES (82, 14);
INSERT INTO board_category
VALUES (82, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2022-05-30 13:01:40.193236+09', '게시글제목8', '게시글내용8', 67, DEFAULT);
INSERT INTO board_category
VALUES (83, 13);
INSERT INTO board_category
VALUES (83, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2024-05-28 13:01:40.193236+09', '게시글제목9', '게시글내용9', 2, DEFAULT);
INSERT INTO board_category
VALUES (84, 11);
INSERT INTO board_category
VALUES (84, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 9, 1, 2, '2022-05-29 13:01:40.193236+09', '게시글제목10', '게시글내용10', 62, DEFAULT);
INSERT INTO board_category
VALUES (85, 12);
INSERT INTO board_category
VALUES (85, 18);


INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2023-07-03 18:08:32.248193+09', '게시글제목1', '게시글내용1', 9, DEFAULT); 
INSERT INTO board_category
VALUES (86, 12);
INSERT INTO board_category
VALUES (86, 16);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2023-12-05 11:18:56.955458+09', '게시글제목2', '게시글내용2', 6, DEFAULT);
INSERT INTO board_category
VALUES (87, 13);
INSERT INTO board_category
VALUES (87, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2023-05-12 19:01:40.193236+09', '게시글제목3', '게시글내용3', 48, DEFAULT);
INSERT INTO board_category
VALUES (88, 13);
INSERT INTO board_category
VALUES (88, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2024-05-14 05:01:42.193236+09', '게시글제목4', '게시글내용4', 76, DEFAULT);
INSERT INTO board_category
VALUES (89, 14);
INSERT INTO board_category
VALUES (89, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2022-05-15 13:01:40.193236+09', '게시글제목5', '게시글내용5', 98, DEFAULT);
INSERT INTO board_category
VALUES (90, 11);
INSERT INTO board_category
VALUES (90, 19);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2021-05-21 13:01:40.193236+09', '게시글제목6', '게시글내용6', 65, DEFAULT);
INSERT INTO board_category
VALUES (91, 14);
INSERT INTO board_category
VALUES (91, 17);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2023-05-15 13:01:40.193236+09', '게시글제목7', '게시글내용7', 11, DEFAULT);
INSERT INTO board_category
VALUES (92, 12);
INSERT INTO board_category
VALUES (92, 18);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2024-02-26 13:01:40.193236+09', '게시글제목8', '게시글내용8', 35, DEFAULT);
INSERT INTO board_category
VALUES (93, 13);
INSERT INTO board_category
VALUES (93, 21);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2024-06-04 13:01:40.193236+09', '게시글제목9', '게시글내용9', 7, DEFAULT);
INSERT INTO board_category
VALUES (94, 13);
INSERT INTO board_category
VALUES (94, 20);

INSERT INTO board
VALUES (DEFAULT, NULL, 10, 1, 2, '2024-05-11 13:01:40.193236+09', '게시글제목10', '게시글내용10', 13, DEFAULT);
INSERT INTO board_category
VALUES (95, 11);
INSERT INTO board_category
VALUES (95, 15);

SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
WHERE board_code=2
ORDER BY b.board_no, c.category_no;


--(기타 카테고리 22~27)
/*공지사항*/
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2022-05-27 18:08:32.248193+09', '테스트 공지사항입니다1', '공지사항 내용입니다1', 3, DEFAULT);
INSERT INTO board_category
VALUES (96, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-01-25 18:08:32.248193+09', '테스트 공지사항입니다2', '공지사항 내용입니다2', 0, DEFAULT);
INSERT INTO board_category
VALUES (97, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-12-27 23:04:32.248193+09', '테스트 공지사항입니다3', '공지사항 내용입니다3', 11, DEFAULT);
INSERT INTO board_category
VALUES (98, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2023-12-24 11:08:32.248193+09', '테스트 공지사항입니다4', '공지사항 내용입니다4', 2, DEFAULT);
INSERT INTO board_category
VALUES (99, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-01-31 15:08:32.248193+09', '테스트 공지사항입니다5', '공지사항 내용입니다5', 4, DEFAULT);
INSERT INTO board_category
VALUES (100, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-02-28 15:08:32.248193+09', '테스트 공지사항입니다6', '공지사항 내용입니다5', 4, DEFAULT);
INSERT INTO board_category
VALUES (101, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-03-20 15:08:32.248193+09', '테스트 공지사항입니다7', '공지사항 내용입니다5', 4, DEFAULT);
INSERT INTO board_category
VALUES (102, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-04-14 15:08:32.248193+09', '테스트 공지사항입니다8', '공지사항 내용입니다5', 4, DEFAULT);
INSERT INTO board_category
VALUES (103, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-05-13 00:08:32.248193+09', '사이트 긴급 점검 안내', '금일 01:00부터 03:00까지 긴급점검을 실시합니다. 사이트 이용에 불편을 드려 죄송합니다. ', 4, DEFAULT);
INSERT INTO board_category
VALUES (104, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 1, '2024-05-30 15:08:32.248193+09', '본인인증 정보 중복 계정에 대한 변경사항 안내', '사이트 정책상 중복계정은 사이트 이용에 제약이 있을 수 있습니다.', 4, DEFAULT);
INSERT INTO board_category
VALUES (105, 27);


SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
WHERE board_code=1
AND board_level=1
ORDER BY b.board_no;





/*FAQ*/
INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연 정보는 어디서 확인할 수 있나요?', '사이트 메인에서 [공연]메뉴를 선택하시면 현재 상연중인 공연들을 확인하실 수 있습니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (106, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '외부공연의 경우 예매가 불가능한가요?', 'staez 사이트 내에서는 불가능합니다. 외부공연을 선택시 자동으로 외부 예매 사이트로 이동합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (107, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연에 대한 후기는 어디서 작성할 수 있나요?', '[마이페이지]의 [한줄평] 메뉴에서 작성이 가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (108, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연이 취소될 수도 있나요?', '네, 주최측의 사정으로 부득이하게 취소될 경우 취소/환불 과정이 자동으로 진행됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (109, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '본인의 로그인 정보가 아닐 경우 어떻게 하나요?', '로그아웃 후 다시 로그인 해주세요. 그래도 문제가 지속될 시 고객센터로 문의바랍니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (110, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연에 대한 리뷰도 작성이 가능한가요?', '[커뮤니티]의 게시글 작성 페이지에서 리뷰 카테고리를 선택해주시면 됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (111, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '부적절한 게시글이나 유저의 신고가 가능한가요?', '네, 해당 게시글 내에서 신고 버튼을 눌러주시기 바랍니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (112, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '뮤지컬 입문자라 궁금한 점이 많습니다. 질문은 어디서 할 수 있나요?', '[커뮤니티]에서 게시글 작성 페이지에서 질문과 답변 카테고리를 선택해주시면 됩니다. ', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (113, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연 예매가 가능한 결제수단은 어떤 것들이 있나요?', '현재는 무통장입금과 카카오페이만 가능합니다. 결제수단은 지속해서 추가될 예정입니다. 감사합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (114, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '예매한 티켓의 결제수단 변경이 가능한가요?', '이미 결제완료된 티켓의 경우 변경이 불가합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (115, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '무통장입금 선택 시 언제까지 입금기한은 어떻게 되나요?', '좌석예약 후 24시간 내로 입금되지 않을시 예약은 자동 취소됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (116, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '보고싶은 공연의 잔여 좌석이 없어요.', '이미 매진된 공연입니다. 다른 날짜로 에매 바랍니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (117, 24);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연 예매 후 수량을 일부만 취소할 수 있나요?', '현재 일부 취소의 경우 불가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (118, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '취소 후 환불은 얼마나 걸리나요?', '3~7일 내에서 환불 처리됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (119, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '공연이 취소 됐어요!', '주최측 사유로 인한 공연 취소 시, 결제하셨던 금액은 전액 환불/취소됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (120, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '무통장미입금으로 인한 취소 좌석은 언제 예매할 수 있나요?', '무통장미입금으로 인한 취소티켓 좌석은 오전 9시에 순차 오픈됩니다. 예매에 참고하시기 바랍니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (121, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '아이디를 여러개 만들 수 있나요?', '원칙적으로 본인인증한 계정ID 1개만 생성가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (122, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '회원탈퇴 후 개인정보는 언제 삭제되나요?', '회원탈퇴 즉시 고객님에 대한 개인정보는 모두 삭제됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (123, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '이메일 인증을 통해 가입 후 다른 이메일로 변경은 어떻게 진행 해야 하나요?', '[마이페이지]에서 [회원정보 변경] 메뉴에서 이메일 인증 후 변경이 가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (124, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '14세 미만은 가입할 수 없나요?', '14세 미만도 회원가입이 가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (125, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '계정의 아이디와 비밀번호를 잊었습니다.', '[로그인]창에서 아이디 찾기나 비밀번호 찾기를 진행해주시면 됩니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (126, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '티켓을 분실했어요!', '티켓 분실 시 입장이 불가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (127, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '예매한 티켓은 본인만 사용 가능한가요?', '네, 기입한 회원정보를 기준으로 확인 후 입장 가능합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (128, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '	티켓이 예약번호입장(현장수령)으로만 예매되는데 티켓배송으로 예매할 수 없나요?', '네, 현재는 예약번호입장(현장수령)만 가능합니다. 추후 배송 수령할 수 있도록 시스템 개선 예정입니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (129, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 1, 1, 4, DEFAULT, '티켓 양도가 가능한가요?', '원칙적으로 본인 입장만 가능합니다. 양해부탁드립니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (130, 27);

SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
WHERE board_code=4
ORDER BY b.board_no;



/*문의(질문)*/
INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 3, '2024-05-27 18:08:32.248193+09', '환불 문의드립니다.', '사정이 있어 예매한 공연을 가지 못하게 됐습니다. 환불수수료가 얼마나 될까요?', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (131, 25);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 3, '2024-05-28 18:08:32.248193+09', '비매너 유저를 신고하고 싶습니다.', '어디서 신고하면 될까요?', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (132, 23);

INSERT INTO board
VALUES (DEFAULT, NULL, 2, 1, 3, '2024-05-29 18:08:32.248193+09', '연극 웃는남자 문의드립니다.', '반려동물 동반 가능할까요?', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (133, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 3, 1, 3, '2024-05-27 18:18:56.955458+09', '환불이', '왜 안되냐고요', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (134, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-01-27 19:01:40.193236+09', '문의입니다1', '문의내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (135, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-02-23 19:01:40.193236+09', '문의입니다2', '문의내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (136, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-04-21 19:01:40.193236+09', '문의입니다3', '문의내용입니다3', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (137, 27);

INSERT INTO board
VALUES (DEFAULT, NULL, 4, 1, 3, '2024-05-02 19:01:40.193236+09', '문의입니다4', '문의내용입니다4', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (138, 26);

INSERT INTO board
VALUES (DEFAULT, NULL, 5, 1, 3, '2024-05-31 19:01:40.193236+09', '문의입니다5', '문의내용입니다5', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (139, 22);

INSERT INTO board
VALUES (DEFAULT, NULL, 6, 1, 3, '2024-05-31 19:01:40.193236+09', '문의입니다6', '문의내용입니다6', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (140, 24);

SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
WHERE board_code=3
AND board_level=1
ORDER BY b.board_no;



/*문의(답변)*/
INSERT INTO board
VALUES (DEFAULT, 131, 1, 2, 3, '2024-05-28 18:13:32.248193+09', '답변드립니다', '전날 환불은 규정상 불가합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (141, 25);

INSERT INTO board
VALUES (DEFAULT, 132, 1, 2, 3, '2024-05-29 19:48:16.955458+09', '답변드립니다.', '게시글에서 신고버튼을 눌러주시면 반영됩니다. 감사합니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (142, 23);

INSERT INTO board
VALUES (DEFAULT, 133, 1, 2, 3, '2024-05-30 19:08:44.193236+09', '답변드립니다', '기본적으로 동물 동반 입장은 금지되어있습니다. 다른 관객들에게도 피해를 주는 행동이기 때문에 주의바랍니다.', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (143, 22);

INSERT INTO board
VALUES (DEFAULT, 134, 1, 2, 3, '2024-05-28 19:08:44.193236+09', '문의답변입니다1', '문의답변내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (144, 26);

INSERT INTO board
VALUES (DEFAULT, 135, 1, 2, 3, '2024-05-28 19:08:44.193236+09', '문의답변입니다2', '문의답변내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (145, 27);

SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
where board_level=1
ORDER BY b.board_no;

select * from board where board_code=5;


/*
신고
user_no : 신고를 한 유저번호
ref_board_no : 신고한 게시글
*/ 
INSERT INTO board
VALUES (DEFAULT, 1, 2, 2, 5, '2024-05-20 18:08:32.248193+09', '비매너 유저로 신고합니다', '신고내용입니다1', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (146, 24);

INSERT INTO board
VALUES (DEFAULT, 1, 3, 2, 5, '2024-05-24 18:18:56.955458+09', '신고입니다1', '신고내용입니다2', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (147, 22);

INSERT INTO board
VALUES (DEFAULT, 1, 5, 2, 5, '2024-05-28 19:01:40.193236+09', '신고입니다2', '신고내용입니다3', DEFAULT, DEFAULT);
INSERT INTO board_category
VALUES (148, 24);




SELECT b.board_no, 
	ref_board_no, 
	user_no, 
	board_level, 
	board_code, 
	board_write_date, 
	board_title, 
	board_content, 
	board_count, 
	board_status,
	c.category_no,
	category_name
FROM board b
LEFT JOIN board_category USING (board_no)
LEFT JOIN category c USING (category_no)
WHERE board_code=5
ORDER BY b.board_no;

SELECT * FROM board_category;





-- /*
-- (사용안함)
-- board_attachment(게시글 첨부파일)
-- (file_no, board_no, origin_name, change_name, file_path, upload_date, file_level, status)
-- - file_level : 썸네일(1/DEFAULT), 그외(2, 3, ...)
-- */
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 1, '원래이름.png', '2024052809480898527.webp', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 2, '원래이름.png', '바뀐이름1.png', '/resources/uploadfiles/community/', DEFAULT, DEFAULT, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 3, '원래이름.png', '바뀐이름2.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 4, '원래이름.png', '바뀐이름3.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 5, '원래이름.png', '바뀐이름4.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 6, '원래이름.png', '바뀐이름5.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);
-- INSERT INTO board_attachment
-- VALUES (DEFAULT, 7, '원래이름.png', '바뀐이름6.png', '/resources/uploadfiles/community/', DEFAULT, 1, DEFAULT);

-- SELECT * FROM board_attachment;





-- /*
-- board_like(게시글 좋아요)
-- (board_like_no, user_no, board_no, like_date, status)
-- - 같은 게시글 중복 좋아요하지 못하도록 UNIQUE(user_no, board_no) 제약조건 설정
-- */
-- INSERT INTO board_like
-- VALUES (DEFAULT, 2, 1, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 2, 3, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 3, 1, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 3, 2, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 4, 2, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 4, 4, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 5, 1, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 5, 4, DEFAULT, DEFAULT);
-- INSERT INTO board_like
-- VALUES (DEFAULT, 6, 5, DEFAULT, DEFAULT);
-- SELECT * FROM board_like;





/*
reply(댓글)
(reply_no, ref_reply_no, board_no, user_no, reply_content, reply_write_date, reply_status)
*/
INSERT INTO reply
VALUES (DEFAULT, NULL, 14, 3, '잘보고 갑니다', '2024-05-29 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, 1, 14, 2, '감사합니다', '2024-05-30 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 3, 2, '댓글입니다', '2024-05-29 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 4, 2, '잘보고 갑니다', '2024-05-29 09:45:52.783686+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 14, 4, '좋은 게시글 잘봤습니다.', '2024-06-24 02:00:14.069549+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 14, 2, '좋은 답변 감사드립니다.', '2024-06-24 02:01:26.588993+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 14, 7, '노잼', '2024-06-24 02:02:19.421745+09', DEFAULT);
INSERT INTO reply
VALUES (DEFAULT, NULL, 14, 2, '나가', '2024-06-24 02:06:23.558134+09', DEFAULT);

SELECT * FROM reply;


-- /*
-- reply_like(댓글 추천)
-- (reply_like_no, reply_no, user_no, like_date, status)
-- - 같은 댓글 중복 추천하지 않도록 UNIQUE(user_no, reply_no) 제약조건 설정
-- */
-- INSERT INTO reply_like
-- VALUES (DEFAULT, 1, 3, '2024-05-29 09:45:52.783686+09', DEFAULT);

-- SELECT * FROM reply_like;




















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
	, '베르사유의 장미'
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

INSERT INTO concert
VALUES (DEFAULT
   , 1
   , '클럽 드바이'
   , '<p>뮤지컬 <클럽 드바이>는 탄탄한 마니아층을 보유한 뮤지컬<트레이스 유>의 프리퀄 작품이다.</p>
      <p>불안과 기대, 혼란으로 점철된 20세기 말을 배경으로, 소외된 사람들을 위해 홍대 락클럽 "드바이"를 만든 도원과 드바이의 메인 보컬 본하</p> 
       <p>, 그리고 드바이를 찾아온 오수의 이야기</p>' 
    , 90 
    , '신주협,이지연,조영화,박소현'
    , '(주)스튜디오단단'
    , '14세 이상 관람가'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '사의찬미'
   , '<p>뮤지컬 <사의찬미>는 우리나라 최초의 신극 운동을 일으킨 천재 극작가 김우진과</p>
      <p>조선 최초의 소프라노 윤심덕의 1926년 8월 4일 현해탄 실종 사건을 모티브로 만들어진 창작 뮤지컬이다.</p> 
       <p>김우진과 윤심덕이라는 실존인물들의 스토리에 사내라는 가공인물이 추가되어 극이 진행되며</p>
       <p>, 두 사람과 사내가 처음 만난 1921년부터 실종 직전까지의 이야기가 과거와 현재를 오가는 방식으로 전개된다.</p>' 
    , 120
    , '주민진,진태화,임준혁,홍승안'
    , '네오 프로덕션'
    , '14세 이상 관람가'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '메노포즈'
   , '<p><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; color: rgb(68, 68, 68); font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;">중년 여성들의 솔직한 수다이자,</strong></p><p><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; color: rgb(68, 68, 68); font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;"><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;">이들을 위해 노래하는 속 시원한 응원가!!</strong></strong></p><p><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; color: rgb(68, 68, 68); font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;"><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;"><span style="font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px; font-weight: 400;">‘폐경’ 혹은 ‘폐경기’ 라는 뜻을 지닌 제목에서 알 수 있듯이 뮤지컬 &lt;메노포즈&gt;는 40~50대 폐경기를 맞은 중년 여성들의 고민을 유쾌하고 코믹하게 담은 뮤지컬이다.</span></strong></strong></p><p><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; color: rgb(68, 68, 68); font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;"><strong style="text-size-adjust: none; -webkit-tap-highlight-color: transparent; font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px;"><span style="font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px; font-weight: 400;">우아해 보이려고 나이와 투쟁 중이며 애쓰는 한물간 연속극 배우, 성공했지만 점점 늘어나는 건망증과 외로움으로 괴로워하는 전문직 여성, 순진하고 전형적인 현모양처 전업 주부, 60년대를 동경하며 채식주의자를 꿈꾸고 있는 히피 스타일의 웰빙 주부 둥 각기 다른 성격의 네 여자가 뮤지컬의 주인공이다. 백화점 란제리 세일 행사장에서 우연히 만난 네 사람은 검정 레이스 브레지어를 놓고 옥신각신하다가 자신들의 이야기를 하나 둘 털어 놓으며 이야기는 시작 된다.</span><span style="font-family: &quot;Malgun Gothic&quot;, 맑은고딕, dotum, 돋움, sans-serif; font-size: 14px; font-weight: 400;"><br></span><br></strong><br></strong><br></p>' 
    , 120
    , ' 문희경,서지오,주아'
    , '㈜엠피앤컴퍼니'
    , '만 15세 이상 관람가'
    , DEFAULT
    , DEFAULT);


INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '에밀'
   , '<p><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">"나는 고발한다"가 발표되고 4년 후 어느 밤.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">대문호의 칭호보다 타락한 지식인에 익숙해진 에밀 졸라의 집에 의문의 청년 클로드가 찾아온다.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">정점의 성공을 이루었던 위대한 작가 에밀 졸라와 작가 지망생인 클로드.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">값비싼 코낙을 마시며 세상의 부조리함을 논하는 에밀 졸라와 싸구려 압생트를 마시며 높은 세상을 꿈꾸는 클로드.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">각자의 과거를 곱씹으며 후회하고, 다가올 벅찬 미래를 꿈꾸는 순간!</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">세찬 폭우를 뚫고 총성이 울려퍼진다.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">1902년 9월 29일.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">에밀 졸라. 그의 마지막 밤에 대한 진실은 무엇일까.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(238, 238, 238);">에밀 졸라와 클로드, 두 인물의 미스터리한 만남이 그날의 진실을 그린다.</span><br></p>'
    , 120
    , '박영수,박유덕,정동화,구준모,김인성,정지우'
    , '㈜라이브러리컴퍼니'
    , '중학생 이상 관람가'
    , DEFAULT
    , DEFAULT);


INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '살리에르'
    , '<div class="H+n02jSL" data-v-02e757a3="" style="padding-left: 10px; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"><div class="IFc0jZrc" data-v-02e757a3="" style="margin-bottom: 1rem;"><span data-v-02e757a3="" style="font-weight: bolder;">그가 찾아오기 전까지 모든게 완벽했다!</span></div></div><div class="IFc0jZrc" data-v-02e757a3="" style="margin-bottom: 1rem; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"></div><div class="H+n02jSL" data-v-02e757a3="" style="padding-left: 10px; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"><div class="IFc0jZrc" data-v-02e757a3="" style="margin-bottom: 1rem;">1791년 오스트리아 빈.<br data-v-02e757a3=""><a class="mH-elBuS" href="https://namu.wiki/w/%EC%95%88%ED%86%A0%EB%8B%88%EC%98%A4%20%EC%82%B4%EB%A6%AC%EC%97%90%EB%A6%AC" title="안토니오 살리에리" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer;">살리에르</a>는 궁중음악가로서 명예로운 날들을 보낸다.<br data-v-02e757a3="">모든 사람들의 사랑과 존경을 한 몸에 받으며 음악가로서의 전성기를 보내고 있을 때, 그 앞에 나타난 젊은 천재&nbsp;<a class="mH-elBuS" href="https://namu.wiki/w/%EB%B3%BC%ED%94%84%EA%B0%95%20%EC%95%84%EB%A7%88%EB%8D%B0%EC%9A%B0%EC%8A%A4%20%EB%AA%A8%EC%B0%A8%EB%A5%B4%ED%8A%B8" title="볼프강 아마데우스 모차르트" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer;">모차르트</a>.<br data-v-02e757a3="">그의 음악은 한순간에 살리에르의 마음을 사로잡고 만다.<br data-v-02e757a3="">그와 동시에 그를 찾아온 낯선 남자, 젤라스. 그의 오랜 팬<del data-v-02e757a3="" style="color: gray;">이라 쓰고 스토커라고 읽는</del>이라고 말을 건넨 그는 말간 얼굴로 밤낮없이 살리에르를 돕겠다 찾아온다.<br data-v-02e757a3="">한편&nbsp;<a class="mH-elBuS" href="https://namu.wiki/w/%EC%9A%94%EC%A0%9C%ED%94%84%202%EC%84%B8" title="요제프 2세" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer;">요제프 왕</a>이 개최한 즉위식 책임자 자리를 놓고 모차르트와 경합을 벌이게 된 살리에르는 알 수 없는 불안감에 사로잡히게 되는데...</div></div>'
    , 120
    , '박규원,백인태,유현석,백형훈,김준영'
    , '에이치제이컬쳐㈜'
    , '12세 이상'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '4월은 너의 거짓말'
    , '<p><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">일본의&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%9D%8C%EC%95%85%EB%AC%BC" title="음악물" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">음악</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&nbsp;만화. 작가는 &lt;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%B0%A8%EA%B0%80%EC%9A%B4%20%ED%95%99%EA%B5%90%EC%9D%98%20%EC%8B%9C%EA%B0%84%EC%9D%80%20%EB%A9%88%EC%B6%98%EB%8B%A4" title="차가운 학교의 시간은 멈춘다" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">차가운 학교의 시간은 멈춘다</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&gt;의 코미컬라이즈로 데뷔한 아라카와 나오시(新川直司). 약칭은 "키미우소(君嘘)"이며 한국에선 "4월구라" 혹은 "4구라"라고 부르기도 한다.</span></p><p><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">과거 남다른 피아노 연주 실력으로 각종 콩쿠르를 휩쓸었지만 모종의 이유로 지금은 피아노를 멀리하고 있는&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%95%84%EB%A6%AC%EB%A7%88%20%EC%BD%94%EC%84%B8%EC%9D%B4" title="아리마 코세이" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">소년 피아니스트</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">가 자유롭고 열정적인 음악을 사랑하는&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%AF%B8%EC%95%BC%EC%A1%B0%EB%85%B8%20%EC%B9%B4%EC%98%A4%EB%A6%AC" title="미야조노 카오리" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">소녀 바이올리니스트</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">와의 만남을 계기로 다시금 피아노와 마주한다는&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/Boy%20Meets%20Girl" title="Boy Meets Girl" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">Boy Meets Girl</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&nbsp;청춘 음악 성장 스토리로,&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%95%84%EB%A6%AC%EB%A7%88%20%EC%BD%94%EC%84%B8%EC%9D%B4" title="아리마 코세이" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">두 주</a><a class="mH-elBuS" href="https://namu.wiki/w/%EB%AF%B8%EC%95%BC%EC%A1%B0%EB%85%B8%20%EC%B9%B4%EC%98%A4%EB%A6%AC" title="미야조노 카오리" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">인공</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">이 서로 공명하며 성장하고, 여기에 주변 동년배 사춘기 소년 소녀들의 우정과 사랑 이야기, 각양각색 연주가들의 이야기가 더불어 진행되며 작품의 축을 이루고 있다</span><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"><br></span><br></p>'
    , 120
    , '이상진,이은율,지원서,박선영'
    , '(주)EMK뮤지컬컴퍼니'
    , ' 초등학생이상 관람가'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '무인도 탈출기'
    , '<p><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">햇볕 한 점 들지 않는 신림동의 지하창고 방.</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">관짝 같은 그 곳에 살고 있는 동현과 봉수는 취업준비생이란 이름과 백수라는 이름 사이에 버티고 서있다. 그리고 이들의 윗집인 지상 1층에는 편의점 알바생 수아가 살고 있다. 거듭된 취업 낙방과 학자금 대출이자의 압박, 라면 살 돈도 떨어진 위기 상황. 세 사람은 서로 다른 이해관계로 연극 공모전 상금 500만원을 타기 위해, 문창과 출신 동현을 필두로 지하창고 방에서 "무인도 탈출기"라는 공연을 즉흥으로 만들기 시작한다. 어느새 칙칙한 지하 창고 방은 남태평양 한 가운데의 무인도로 탈바꿈되고...</span><br data-v-02e757a3="" style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;"><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">무인도에 조난당한 봉수와 수아 그리고 동현은 무인도에서 살아남아 그 곳을 탈출할 수 있을까?</span><br></p>'
    , 120
    , '장재웅,김효성,김준식'
    , '섬으로 간 나비'
    , '만 12세 이상'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '로보카폴리 - 잡아라! 황금트로피!'
    , '<p><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">기다리던 브룸스타운의 대운동회날!<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">구조대원들과 마을 사람들 모두 운동회 준비에 바빠요.<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">천재 발명가 진은 운동회의 1등에게 주어질 멋진 황금 트로피도 만들었답니다.<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;"><br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">...하지만!<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">호시탐탐 마을을 노리던 밀렵꾼 악당 포처의 계략에<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">운동회는 엉망이 되고, 황금 트로피도 빼앗기게 돼요.<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;"><br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">과연 구조대원들은 위기에 빠진 마을을 구하고<br></span><span style="color: rgb(34, 34, 37); font-family: -apple-system, BlinkMacSystemFont, helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;">황금 토로피를 되찾을 수 있을까요?</span><br></p>'
    , 60
    , '버스'
    , '㈜더화랑이엔티'
    , '24개월 이상 관람가능'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '누가내머리에똥쌌어？'
    , '<p><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">한&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%91%90%EB%8D%94%EC%A7%80" title="두더지" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">두더지</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">가 땅 위로 올라왔는데 자신의 머리 위에&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%98%A5" title="똥" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">똥</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">이 떨어졌다. 전체적인 내용은&nbsp;</span><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; text-align: center;">두더지가 자신의 머리에 똥을 싼 범인을 찾는다는 것이다. 두더지가 종횡무진 하며 온갖 동물들의 똥을 구경하고 다닌다.</span></p><p><a class="mH-elBuS" href="https://namu.wiki/w/%EB%91%90%EB%8D%94%EC%A7%80" title="두더지" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">두더지</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">는&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%B9%84%EB%91%98%EA%B8%B0" title="비둘기" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">비둘기</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">에게 "네가 내 머리에&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%98%A5" title="똥" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">똥</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&nbsp;쌌지?"라고 묻자 비둘기는 똥을 싸며 자신이 한 짓이 아니라고 한다. 이어서&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%A7%90(%EB%8F%99%EB%AC%BC)" title="말(동물)" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">말</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">,&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%ED%86%A0%EB%81%BC" title="토끼" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">토끼</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">,&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%97%BC%EC%86%8C" title="염소" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">염소</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">,&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EC%86%8C" title="소" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">소</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">,&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%8F%BC%EC%A7%80" title="돼지" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">돼지</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">에게도 하나같이 똑같은 대답들만 돌아올 뿐. 마지막에&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%ED%8C%8C%EB%A6%AC(%EA%B3%A4%EC%B6%A9)" title="파리(곤충)" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">파리</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">가&nbsp;</span><span data-v-02e757a3="" style="font-weight: bolder; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">두더지 머리에 떨어진 똥을 먹어치우더니</span><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EA%B0%9C" title="개" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">개</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">가 한 짓이라고 하자 이에 두더지는 그 근방에 사는 개인 한스가 범인이라는 것을 알아차린다. 두더지가&nbsp;</span><a class="mH-elBuS" href="https://namu.wiki/w/%EB%88%88%EC%97%90%EB%8A%94%20%EB%88%88%20%EC%9D%B4%EC%97%90%EB%8A%94%20%EC%9D%B4" title="눈에는 눈 이에는 이" data-v-02e757a3="" style="color: var(--espejo-link-color); transition: color 0.05s ease-in 0s; cursor: pointer; font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; background-color: rgb(255, 255, 255);">똑같이</a><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">&nbsp;한스의 머리에 똥</span><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji;">을 싸서 복수한 뒤 기분 좋게 웃으며 땅굴 속으로 들어가는 것으로 끝난다.</span><span style="font-family: &quot;Pretendard JP&quot;, Pretendard, -apple-system, BlinkMacSystemFont, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Noto Sans CJK KR&quot;, NanumBarunGothic, Roboto, &quot;Segoe UI&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, emoji; text-align: center;"><br></span><br></p>'
    , 60
    , '두더지'
    , '조이컬쳐'
    , '24개월 이상 관람가능'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '2024 양희주 해금독주회'
    , '<p>양희주의 해금독주회</p>'
    , 60
    , '양희주'
    , '양희주'
    , '8세 이상'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , '정선아리랑토요상설공연 뗏꾼'
    , '<p>정선아리랑토요상설공연 뗏꾼<br></p>'
    , 60
    , '홍둥주,최진실,최유진 등등'
    , '(재)정선아리랑문화재단'
    , '7세이상'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
   , 1
   , '지브리 OST 콘서트'
    , '<p>세계적인 애니메이션 제작사 &lt;월트 디즈니 애니메이션 스튜디오&gt;와</p><p>어깨를 나란히 하고있는 일본의 대표적인 애니메이션 제작사</p><h3>스튜디오 지브리</h3><p>"나는 결심했다. 예술가의 길을 버리고</p><p>앞으로는 되도록 많은 사람들이 들을 수 있는 폭넓은 음악을 하자!"</p><p>- 히사이시 조 -</p><h3><br></h3><p><br></p>'
    , 120
    , '밀레니엄심포니오케스트라'
    , '밀레니엄심포니오케스트라'
    , '초등학생 이상'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES   (DEFAULT
   , 1
   , 'ITZY 2ND WORLD TOUR <BORN TO BE> in NEWARK'
    , '<p>ITZY 2ND WORLD TOUR &lt;BORN TO BE&gt; in NEWARK<br></p>'
    , 120
    , 'ITZY'
    , 'ITZY'
    , '만 7세 이상 관람가'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
   , 1
   , '2024 IU HEREH WORLD TOUR CONCERT IN BERLIN'
    , '<p>2024 IU HEREH WORLD TOUR CONCERT IN BERLIN<br></p>'
    , 120
    , '아이유'
    , '아이유'
    , '7세 이상 관람가'
    , DEFAULT
    , DEFAULT);

INSERT INTO concert
VALUES (DEFAULT
   , 1
   , '어린이 서커스 마술쇼'
    , '<p>온 가족이 함께 즐기는</p>
	<p>어린이</p>
	<p>서커스 마술쇼</p>'
    , 120
    , '누군가'
    , '누군가'
    , '24개월이상 관람가'
    , DEFAULT
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
INSERT INTO concert_attachment
VALUES (DEFAULT, 11, '20240614-49632.jpg', '2024062222324167698.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 12, '20240603-49911.jpg', '2024062223413192220.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 13, '20240502-49640.jpg', '2024062300413892382.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 14, '20240430-49616.jpg', '2024062302115855211.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 15, '20240516-49727.jpg', '2024062302323677654.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 16, '20240514-49726.jpg', '2024062318183198070.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 17, '20240502-49350.jpg', '2024062318482891823.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 18, '20240524-49815.jpg', '2024062319035332332.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 19, '20240402-49321.jpg', '2024062319194339607.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 20, '양희주해금독주회.jpg', '2024062321050118383.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 21, '1710746276&&뗏꾼포스터.png', '2024062322073614750.png', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 22, '686FC9B7B50642669B65B3C199CA6398.jpg', '2024062322211276053.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 23, 'ITZY.jpg', '2024062322365047933.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 24, 'IU.jpg', '2024062322451748787.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 25, '47883221622.20240521175342.jpg', '2024062322574234876.jpg', '/resources/uploadfiles/concert/', DEFAULT, 1, DEFAULT);

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
INSERT INTO concert_category VALUES (11, 4);
INSERT INTO concert_category VALUES (12, 4);
INSERT INTO concert_category VALUES (13, 4);
INSERT INTO concert_category VALUES (14, 4);
INSERT INTO concert_category VALUES (15, 4);
INSERT INTO concert_category VALUES (16, 4);
INSERT INTO concert_category VALUES (17, 4);
INSERT INTO concert_category VALUES (18, 4);
INSERT INTO concert_category VALUES (19, 4);
INSERT INTO concert_category VALUES (20, 6);
INSERT INTO concert_category VALUES (21, 6);
INSERT INTO concert_category VALUES (22, 5);
INSERT INTO concert_category VALUES (23, 7);
INSERT INTO concert_category VALUES (24, 7);
INSERT INTO concert_category VALUES (25, 9);

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
VALUES (DEFAULT, 1, 'A', 80000, '2024-07-07', 9, 12, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'B', 50000, '2024-07-07', 13, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'R', 120000, '2024-07-08', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'S', 100000, '2024-07-08', 5, 8, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'A', 80000, '2024-07-08', 9, 12, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 1, 'B', 50000, '2024-07-08', 13, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 2, 'R', 120000, '2024-07-09', 1, 5, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'S', 100000, '2024-07-09', 6, 10, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'A', 80000, '2024-07-09', 11, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'B', 50000, '2024-07-09', 16, 20, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'R', 120000, '2024-07-10', 1, 5, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'S', 100000, '2024-07-10', 6, 10, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'A', 80000, '2024-07-10', 11, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 2, 'B', 50000, '2024-07-10', 16, 20, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 3, 'R', 120000, '2024-07-07', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'S', 100000, '2024-07-07', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'B', 80000, '2024-07-07', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'A', 50000, '2024-07-07', 13, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'R', 120000, '2024-07-08', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'S', 100000, '2024-07-08', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'B', 80000, '2024-07-08', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 3, 'A', 50000, '2024-07-08', 13, 15, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 4, 'R', 120000, '2024-07-07', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'S', 100000, '2024-07-07', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'A', 80000, '2024-07-07', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'B', 50000, '2024-07-07', 13, 15, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'R', 120000, '2024-07-08', 1, 4, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'S', 100000, '2024-07-08', 5, 8, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'A', 80000, '2024-07-08', 9, 12, 1, 10, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 4, 'B', 50000, '2024-07-08', 13, 15, 1, 10, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 5, 'R', 120000, '2024-07-07', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'S', 100000, '2024-07-07', 6, 10, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'A', 80000, '2024-07-07', 11, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'B', 50000, '2024-07-07', 16, 20, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'R', 120000, '2024-07-08', 1, 5, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'S', 100000, '2024-07-08', 6, 10, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'A', 80000, '2024-07-08', 11, 15, 1, 20, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 5, 'B', 50000, '2024-07-08', 16, 20, 1, 20, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 6, 'R', 120000, '2024-06-22', 1, 2, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'S', 100000, '2024-06-22', 3, 5, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'A', 80000, '2024-06-22', 6, 10, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'B', 50000, '2024-06-22', 11, 15, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'R', 120000, '2024-06-23', 1, 2, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'S', 100000, '2024-06-23', 3, 5, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'A', 80000, '2024-06-23', 6, 10, 1, 15, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 6, 'B', 50000, '2024-06-23', 11, 15, 1, 15, DEFAULT);

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
VALUES (DEFAULT, 9, 'A', 80000, '2024-06-28', 1, 80, 1, 30, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'B', 50000, '2024-06-28', 1, 80, 71, 100, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'R', 120000, '2024-06-29', 1, 40, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'S', 100000, '2024-06-29', 41, 80, 31, 70, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'A', 80000, '2024-06-29', 1, 80, 1, 30, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 9, 'B', 50000, '2024-06-29', 1, 80, 71, 100, DEFAULT);

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

INSERT INTO seat
VALUES (DEFAULT, 11, 'A', 50000, '2024-06-24', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 11, 'A', 50000, '2024-06-25', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 11, 'A', 50000, '2024-06-26', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 11, 'A', 50000, '2024-06-27', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 12, 'A', 66000, '2024-06-26', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 12, 'A', 66000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 12, 'A', 66000, '2024-06-28', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 13, 'R', 150000, '2024-06-27', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 13, 'S', 100000, '2024-06-27', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 13, 'A', 50000, '2024-06-27', 11, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 14, 'A', 185000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 14, 'A', 185000, '2024-06-28', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 14, 'A', 185000, '2024-06-29', 11, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 15, 'R', 99000, '2024-06-26', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'S', 77000, '2024-06-26', 5, 11, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'A', 55000, '2024-06-26', 12, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'R', 99000, '2024-06-27', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'S', 77000, '2024-06-27', 5, 11, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'A', 55000, '2024-06-27', 12, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'R', 99000, '2024-06-28', 1, 4, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'S', 77000, '2024-06-28', 5, 11, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 15, 'A', 55000, '2024-06-28', 12, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 16, 'R', 150000, '2024-06-25', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'S', 130000, '2024-06-25', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'A', 100000, '2024-06-25', 11, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'R', 150000, '2024-06-26', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'S', 130000, '2024-06-26', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'A', 100000, '2024-06-26', 11, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'R', 150000, '2024-06-27', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'S', 130000, '2024-06-27', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 16, 'A', 100000, '2024-06-27', 11, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 17, 'R', 60000, '2024-06-27', 1, 8, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 17, 'S', 45000, '2024-06-27', 9, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 17, 'R', 60000, '2024-06-28', 1, 8, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 17, 'S', 45000, '2024-06-28', 9, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 18, 'R', 43000, '2024-06-26', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 18, 'R', 43000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 18, 'R', 43000, '2024-06-28', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 18, 'R', 43000, '2024-06-29', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 19, 'R', 35000, '2024-06-29', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 20, 'R', 37000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 20, 'R', 37000, '2024-06-28', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 20, 'R', 37000, '2024-06-29', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 21, 'R', 6000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 21, 'R', 6000, '2024-06-28', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 22, 'R', 90000, '2024-06-25', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'S', 70000, '2024-06-25', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'A', 60000, '2024-06-25', 11, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'R', 90000, '2024-06-26', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'S', 70000, '2024-06-26', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'A', 60000, '2024-06-26', 11, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'R', 90000, '2024-06-27', 1, 5, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'S', 70000, '2024-06-27', 6, 10, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 22, 'A', 60000, '2024-06-27', 11, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 23, 'R', 164000, '2024-06-27', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 23, 'R', 164000, '2024-06-28', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 24, 'R', 300000, '2024-06-28', 1, 15, 1, 5, DEFAULT);
INSERT INTO seat
VALUES (DEFAULT, 24, 'R', 300000, '2024-06-29', 1, 15, 1, 5, DEFAULT);

INSERT INTO seat
VALUES (DEFAULT, 25, 'R', 26000, '2024-06-28', 1, 15, 1, 5, DEFAULT);

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
INSERT INTO concert_schedule
VALUES (DEFAULT, 11, '12:00-13:30', '2024-06-24', '2024-06-27', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 12, '12:00-14:00', '2024-06-26', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 12, '16:00-18:00', '2024-06-26', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 13, '12:00-14:00', '2024-06-27', '2024-06-27', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 14, '12:00-14:00', '2024-06-27', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 14, '16:00-18:00', '2024-06-29', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 15, '12:00-14:00', '2024-06-26', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 15, '20:00-22:00', '2024-06-26', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 16, '12:00-14:00', '2024-06-25', '2024-06-27', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 16, '20:00-22:00', '2024-06-25', '2024-06-27', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '12:00-14:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '16:00-18:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '20:00-22:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '12:00-14:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '16:00-18:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 17, '20:00-22:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 18, '12:00-13:00', '2024-06-26', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 18, '16:00-17:00', '2024-06-26', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 18, '19:00-20:00', '2024-06-26', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 19, '13:00-14:00', '2024-06-29', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 19, '15:00-16:00', '2024-06-29', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 19, '17:00-18:00', '2024-06-29', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 20, '14:00-15:00', '2024-06-27', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 20, '19:00-20:00', '2024-06-27', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 21, '12:00-13:30', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 21, '16:00-17:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 22, '16:00-18:00', '2024-06-25', '2024-06-27', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 23, '18:00-20:00', '2024-06-27', '2024-06-28', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 24, '20:00-22:00', '2024-06-28', '2024-06-29', 1, DEFAULT);
INSERT INTO concert_schedule
VALUES (DEFAULT, 25, '14:00-16:00', '2024-06-28', '2024-06-28', 1, DEFAULT);

SELECT * FROM concert_schedule;




/*
concert_like(공연찜)
(concert_like_no, user_no, concert_no, concert_like_date, status)
- 같은 사람이 같은 공연 찜 중복하지 않도록 UNIQUE(user_no, concert_no) 제약조건 설정
*/
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 1, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 3, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 4, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 5, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 6, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 7, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 9, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 2, 10, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 3, 1, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 3, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 3, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 4, 3, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 4, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 4, 5, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 5, 2, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 6, 6, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 6, 7, '2024-05-27 19:01:40.193236+09', DEFAULT);
-- INSERT INTO concert_like
-- VALUES (DEFAULT, 6, 8, '2024-05-27 19:01:40.193236+09', DEFAULT);

-- SELECT * FROM concert_like;





-- /*
-- concert_review(한줄평)
-- (review_no, user_no, concert_no, review_content, score, review_date, review_status)
-- */
-- INSERT INTO concert_review
-- VALUES (DEFAULT, 2, 1, '기대안했는데 재밌었습니다', 5, DEFAULT);
-- INSERT INTO concert_review
-- VALUES (DEFAULT, 3, 4, '조금 아쉬웠어요', 4, DEFAULT);
-- INSERT INTO concert_review
-- VALUES (DEFAULT, 4, 4, '졸려서 잤어요', 3, DEFAULT);
-- INSERT INTO concert_review
-- VALUES (DEFAULT, 5, 6, '처음 관람이었는데 기대이상이었어요', 5, DEFAULT);
-- INSERT INTO concert_review
-- VALUES (DEFAULT, 6, 4, '재밌었지만 코골며 자는 사람이 있었어요', 4, DEFAULT);

-- SELECT * FROM concert_review;





-- /*
-- reserve(예매정보)
-- (reserve_no, concert_no, user_no, r_name, r_birth, r_phone, reserve_row, reserve_col, reserve_date, pay_method, concert_date, reserve_status, schedule)
-- - 데이터 하나당 한좌석에 대한 정보 저장(ex. b3, b4, b5좌석 예매하면 3개의 데이터 저장)
-- - reserve_status : 결제된예약(Y), 결제전예약(U), 만료된예약(N) => DEFAULT는 'U'
-- */
-- INSERT INTO reserve
-- VALUES (DEFAULT, 1, 2, '이원기', '1997-04-23', '01022222222', 2, 3, '2024-05-20 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 1, 2, '이원기', '1997-04-23', '01022222222', 2, 4, '2024-05-20 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 1, 2, '이원기', '1997-04-23', '01022222222', 2, 5, '2024-05-20 19:01:40.193236+09','무통장입금', '2024-07-07', 'Y', '20:00-22:00');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 3, '홍길동', '2000-01-15', '01012345678', 3, 2, '2024-05-23 19:01:40.193216+09','무통장입금', '2024-07-08', 'Y', '20:00-22:40');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 3, '홍길동', '2000-01-15', '01012345678', 3, 3, '2024-05-23 19:01:40.193216+09','무통장입금', '2024-07-08', 'Y', '20:00-22:40');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 4, '주재완', '1998-01-01', '01044444444', 5, 6, '2024-05-24 12:01:40.123236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 4, '주재완', '1998-01-01', '01044444444', 5, 7, '2024-05-24 12:01:40.123236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 4, '주재완', '1998-01-01', '01044444444', 5, 8, '2024-05-24 12:01:40.123236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 4, 4, '주재완', '1998-01-01', '01044444444', 5, 9, '2024-05-24 12:01:40.123236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:30');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 5, 2, '이원기', '1997-04-23', '01022222222', 10, 4, '2024-05-26 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-23:00');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 5, 2, '이원기', '1997-04-23', '01022222222', 10, 3, '2024-05-26 12:01:40.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-23:00');
-- INSERT INTO reserve
-- VALUES (DEFAULT, 1, 2, '장용준', '1998-01-03', '01055555555', 4, 5, '2024-05-27 11:31:48.193236+09','무통장입금', '2024-07-08', 'Y', '20:00-22:00');

-- SELECT * FROM reserve;





/*
tag(태그)
(board_no, concert_no)
*/
INSERT INTO tag
VALUES (14,10);
INSERT INTO tag
VALUES (2,4);
INSERT INTO tag
VALUES (4,1);

SELECT * FROM tag;


COMMIT;