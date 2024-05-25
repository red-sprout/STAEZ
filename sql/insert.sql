-------------------------더미 데이터 생성-----------------------------
/*staez_user*/
INSERT INTO staez_user
VALUES (DEFAULT, 'user01', '$2a$10$L0auCsxEDtxecgyW5Q/eP.4QWJGb3HCpuiPq1q28l8KSetOqJ6sgK', 'lwg', 'M', '2000-01-01', '[06234] 서울 강남구 테헤란로14길 6 (역삼동)/kh정보교육원', 'user@gmail.com', '01012345678','뮤지컬', 1, DEFAULT, NULL, 'Y');

/*category*/
INSERT INTO category
VALUES (DEFAULT, null, '공연', 0);
INSERT INTO category
VALUES (DEFAULT, null, '커뮤니티', 0);
INSERT INTO category
VALUES (DEFAULT, null, '기타', 0);
INSERT INTO category
VALUES (DEFAULT, 1, '뮤지컬', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '클래식', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '국악', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '대중음악', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '연극', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '서커스/마술', 1);
INSERT INTO category
VALUES (DEFAULT, 1, '기타', 1);
INSERT INTO category
VALUES (DEFAULT, 2, '입문 가이드', 1);
INSERT INTO category
VALUES (DEFAULT, 2, '질문과 답변', 1);
INSERT INTO category
VALUES (DEFAULT, 2, '리뷰', 1);
INSERT INTO category
VALUES (DEFAULT, 2, '자유게시판', 1);
INSERT INTO category
VALUES (DEFAULT, 2, '뮤지컬', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '클래식', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '국악', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '대중음악', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '연극', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '서커스/마술', 2);
INSERT INTO category
VALUES (DEFAULT, 2, '기타', 2);
INSERT INTO category
VALUES (DEFAULT, 3, '공연', 1);
INSERT INTO category
VALUES (DEFAULT, 3, '커뮤니티', 1);
INSERT INTO category
VALUES (DEFAULT, 3, '예매', 1);
INSERT INTO category
VALUES (DEFAULT, 3, '환불/취소', 1);
INSERT INTO category
VALUES (DEFAULT, 3, '사이트 이용', 1);
INSERT INTO category
VALUES (DEFAULT, 3, '티켓', 1);

/*theater*/
INSERT INTO theater
VALUES (DEFAULT, '예술의전당', '15', '5', '서울 서초구 남부순환로 2406', '1668-1352');
INSERT INTO theater
VALUES (DEFAULT, '성남 아트 센터', '20', '10', '경기 성남시 분당구 성남대로 808 성남아트센터', '031-783-8000');
INSERT INTO theater
VALUES (DEFAULT, '충무아트센터', '15', '10', '서울 중구 퇴계로 387', '02-2230-6600');
INSERT INTO theater
VALUES (DEFAULT, '대구오페라하우스', '15', '10', '대구광역시 북구 호암로 15', '053-666-6000');
INSERT INTO theater
VALUES (DEFAULT, '춘천문화예술회관', '20', '20', '강원 춘천시 효자상길5번길 13', '033-259-5841');

/*concert*/
INSERT INTO concert
VALUES (DEFAULT
	, 1
	, 'KBS 교향악단 1000회 정기 공연'
	, 'KBS 교향악단 1000회 기념 공연

1부
베토벤 - 삼중 협주곡
지휘 - 클라우스 메켈레
첼로 - 한재민
피아노 - 선우예권
바이올린 - 양인모

인터미션

2부
쇼스타코비치 교향곡 4번
지휘 - 클라우스 메켈레'
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
	, '1부
바흐 - 골드베르크 변주곡

2부
베토벤 - 디아벨리 변주곡'
	, 120
	, '백건우'
	, '재단법인 성남문화재단'
	, '초등학생 이상'
	, '2024-05-24'
	, DEFAULT);
INSERT INTO concert
VALUES (DEFAULT, 3
	, '뮤지컬 디어 에반 헨슨'
	, '디어 에반 헨슨
오늘은 멋진 하루가 될 거야! 왜냐하면...

불안장애를 앓고 있는 소심한 소년 <에반 핸슨>은
매일 스스로에게 편지를 쓰며
나답게 행동할 수 있는 멋진 하루를 꿈꾼다.'
	, 160
	, '김성규, 박강현, 임규형 외'
	, '디어에반핸슨문화산업전문회사'
	, '중학생 이상'
	, '2024-05-25'
	, DEFAULT);
INSERT INTO concert
VALUES (DEFAULT, 4
	, '오텔로'
	, '오텔로는 윌리엄 셰익스피어의 4대 비극 중 하나인 오셀로의 이탈리아어 표기이다. 원작은 셰익스피어 이지만, 현존하는 두 가지의 이탈리아 오페라 제목이라고도 할 수 있다. 이유인즉슨, 조아키노 로시니와 주세페 베르디가 오셀로를 바탕으로 오페라를 작곡했기 때문. 그래서 보통 영어에서도 셰익스피어 작품은 Othello라고 쓰고, 오페라는 Otello라고 써서 둘을 구별한다.

이 중 가장 인지도가 높은 오텔로는 단연 베르디가 작곡한 버전이라고 할 수 있다. 물론, 세빌리아의 이발사로 유명한 조아키노 로시니도 베르디보다 70년 먼저 오텔로 오페라를 작곡했지만, 이쪽은 초연 후 로시니의 팬들 정도 외에는 기억하는 사람이 거의 없다.

반면 베르디 버전은 초연 당시는 물론, 오늘날까지 이탈리아 오페라의 걸작으로 칭송받으며 <아이다>, <라 트라비아타> 등 그의 대표작들과 함께 즐겨 연주되고 있다. 더욱 놀라운 것은 베르디가 이 작품을 초연했을 당시의 나이가 이미 70대였다는 점이다.'
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
	, '[시놉시스]
부자들의 낙원은 가난한 자들의 지옥으로 세워진 것이다
     
17세기 영국, 아이들을 납치해 기형적인 괴물로 만들어 귀족들의 놀잇감으로 팔던 인신 매매단 콤프라치코스에 의해 기이하게 찢겨진 입을 갖게 된 어린 그윈플렌은 매서운 눈보라 속에 홀로 버려진다.
 
살을 에는 추위 속을 헤매던 그윈플렌은 얼어 죽은 여자의 품에 안겨 젖을 물고 있는 아기 데아를 발견하고 우연히 떠돌이 약장수 우르수스를 만나 도움을 청한다. 우르루스는 평소 인간을 혐오하지만 두 아이를 거두기로 결심하고 그윈플렌의 기형적인 미소와 눈 먼 데아의 이야기를 이용해 유랑극단을 꾸린다.
 
어느덧 성장한 그윈플렌은 기이한 미소 덕분에 유럽 전역에서 가장 유명한 광대가 되고 그의 공연을 본 앤 여왕의 이복동생 조시아나는 그의 매력에 푹 빠져버린다. 생애 처음으로 귀족인 조시아나에게 구애를 받은 그윈플렌은 고혹적인 그녀의 유혹에 순수했던 마음이 흔들리고, 우르수스와 데아는 그런 그윈플렌의 모습에 남몰래 가슴앓이 한다. 그러던 중 그윈플렌은 ‘눈물의 성’이라는 악명 높은 고문소로 끌려가게 되는데, 생각지도 못했던 그의 출생의 비밀이 밝혀지며 간신히 평화를 찾았던 세 사람의 삶이 송두리째 흔들린다.
 
 
[프로필]
 
* 그윈플렌 Gwynplaine : 이석훈, 규현, 박강현, 수호
- 인신매매단 콤프라치코스의 만행으로 기이하게 찢겨진 입을 갖게 된 그윈플렌은 지울 수 없는 영원한 미소를 가진 채 사람들을 웃기는 광대로 살아간다. 고혹적인 매력을 가진 조시아나 공작부인의 유혹에 흔들리던 차에 악명 높은 고문소 ‘눈물의 성’에 끌려가 출생의 비밀을 알게 되고 잔인한 운명의 소용돌이에 휘말리게 된다.
 
* 우르수스 Ursus : 민영기, 양준모
- 곰처럼 풍채가 좋은 떠돌이 약장수 우르수스는 인간을 혐오하는 염세주의자이자 철학자이다. 유랑극단의 단장이기도 한 그는 사교적이지는 않지만 말이 많으며 아무도 보고 싶어 하지 않지만 그 누군가와 대화 하고 싶어한다. 스스로 평생 단 한번도 운 적이 없다고 말하고 다니는 인물이다.
 
* 데아 Dea : 이수빈, 강혜인
- 아이와 같은 순백의 여린 마음을 갖고 있는 데아는 눈에 빛을 가득 담고 있지만 정작 앞을 보지 못한다. 어린 시절 자신을 구해준 그윈플렌을 천사이자 가족이라고 생각하는 데아는 눈이 아닌 영혼으로 그를 바라보며 마음의 상처를 보듬어준다.
 
* 조시아나 공작부인Lady Josiana : 신영숙, 김소향
- 앤 여왕의 이복동생으로 부유하고 매혹적이며 영리한 조시아나는 야망을 숨기기 위해 모든 일이 지루한 척 행동한다. 늘 자신만만한 그녀는 우연히 그윈플렌의 공연을 보고 그의 기이한 미소와 매력에 푹 빠져져 그를 유혹한다. 
     
* 데이빗 더리모어 경 Lord David Dirry-Moir : 최성원, 강태을
- 고 클랜찰리 공작의 사생아이자 어린 시절 조시아나 공작부인과의 약혼한 사이다. 조시아나와의 결혼을 통해 신분상승을 꿈꾸는 야망있는 인물로 ‘톰-짐-잭’이라는 가명을 쓰며 남몰래 평민들의 삶을 즐긴다.
 
* 페드로 Phedro : 이상준
- 질투와 증오로 가득 찬, 돈만 밝히는 박쥐 같은 교활한 하인이다.
 
* 앤 여왕 Queen Anne : 김경선, 한유란
- 영국의 통치자이자 죽은 제임스 왕의 적법한 딸로 식탐이 많고 이기적인 여인이다.'
	, 180
	, '이석훈, 규현, 박강현, 수호 외'
	, '춘천문화예술회관'
	, '초등학생 이상'
	, '2024-05-27'
	, DEFAULT);

/*concert_attachment*/
INSERT INTO concert_attachment
VALUES (DEFAULT, 1, 'thumbnail1.png', 'thumbnail1.png', '/resources/uploadfiles/concert/', '2024-05-23', 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 2, 'thumbnail2.png', 'thumbnail2.png', '/resources/uploadfiles/concert/', '2024-05-23', 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 3, 'thumbnail3.png', 'thumbnail3.png', '/resources/uploadfiles/concert/', '2024-05-23', 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 4, 'thumbnail4.png', 'thumbnail4.png', '/resources/uploadfiles/concert/', '2024-05-23', 1, DEFAULT);
INSERT INTO concert_attachment
VALUES (DEFAULT, 5, 'thumbnail5.png', 'thumbnail5.png', '/resources/uploadfiles/concert/', '2024-05-23', 1, DEFAULT);

/*concert_category*/
INSERT INTO concert_category VALUES (1, 5);
INSERT INTO concert_category VALUES (2, 5);
INSERT INTO concert_category VALUES (3, 4);
INSERT INTO concert_category VALUES (4, 5);
INSERT INTO concert_category VALUES (5, 4);

/*seat*/
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

/*impossible_seat*/
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 1);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 2);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 1, 3);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 2, 1);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 2, 2);
INSERT INTO impossible_seat VALUES (DEFAULT, 1, 3, 1);

/*concert_schedule*/
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

COMMIT;

SELECT * FROM concert_schedule;
