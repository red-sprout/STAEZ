<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>concert</title>

    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- 적용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetailView.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetailInformationViewAjax.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/65a2de1a44.js" crossorigin="anonymous"></script>
    <!-- 달력 -->
    <script src="${pageContext.request.contextPath}/resources/js/concert/concertDetailCalendar.js"></script>
    <!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
    <!-- 적용 자바스크립트 -->
    <script src="<c:url value='/resources/js/concert/concertDetail.js'/>"></script>

</head>

<body>

    <div>
        <jsp:include page="./concertDetailMain.jsp"/>
    </div>

<!-- 공연상세페이지 아래쪽: ajax(공연상세정보, 판매정보, 한줄평, 관람후기 내용) -->

<!-- 판매정보 -->
<!-- [판매자정보], [상품정보], [티켓수령방법(반송안내)], [예매취소방법, 예매취소수수료, 환불안내] -->
    <section>
        <div>
            <div>
                <div class="concert-detail-subject">
                    <span><h3>상품정보</h3></span>
                </div>
                <div>
                    <table class="concert-detail-sellingInformation-table">
                        <tbody>
                            <tr>
                                <th>공연명</th>
                                <td>천개의 파랑</td>
                            </tr>
                            <tr>
                                <th>공연기간</th>
                                <td>2024.05.12~2024.05.26</td>
                            </tr>
                            <tr>
                                <th>공연장소</th>
                                <td>예술의전당 CJ 토월극장</td>
                            </tr>
                            <tr>
                                <th>공연런타임</th>
                                <td>170 분(인터미션 : 15분)</td>
                            </tr>
                            <tr>
                                <th>관람연령</th>
                                <td>초등학생이상 관람가</td>
                            </tr>
                            <tr>
                                <th>제작진</th>
                                <td>(재)서울예술단</td>
                            </tr>
                            <tr>
                                <th>공연내용</th>
                                <td>〈천 개의 파랑〉은 한국적 소재를 기반으로 창작가무극(한국적 창작뮤지컬)을 매년 소개하는 서울예술단의 2024년 신작이다. 2019년 제4회 한국과학문학상 장편 대상 수상작인 천선란 작가의 소설 〈천 개의 파랑〉을 원작으로, 한국 공연계를 견인하는 대표적인 창작진들이 대거 참여하여 서울예술단과 함께 창작가무극으로 재탄생시킨다.</td>
                            </tr>
                            <tr>
                                <th>출연진</th>
                                <td>윤태호, 진호, 서연정, 효정, 송문선, 김건혜, 최인형, 박재은, 이동규, 이혜수, 김용한, 안재홍</td>
                            </tr>

                        </tbody>
                    </table>
    
                </div>
            </div>
            <br>

            <div>
                <div class="concert-detail-subject">
                    <span><h3>티켓수령방법</h3></span>
                </div>
                <div>
                    <table class="concert-detail-sellingInformation-table">
                        <tbody>
                            <tr>
                                <th rowspan="2">현장수령</th>
                                <td>공연 당일 예약번호, 본인 확인 후 수령하실 수 있습니다.</td>     
                            </tr>
                            <tr>
                                <td>공연 시작 직전에는 현장매표소가 매우 혼잡하오니 되도록 공연 30분전까지 티켓을 수령 해주시기 바랍니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="3">우편수령</th>
                                <td>예매완료(결제익일) 기준 5일 이내 배송됩니다.(영업일 기준)</td>
                            </tr>
                            <tr>
                                <td>배송비가 추가됩니다.</td>
                            </tr>
                            <tr>
                                <td>
                                    공연 3일 전까지 배송받지 못한 경우 고객센터로 연락주시기 바랍니다.
                                </td>
                            </tr>                           
                        </tbody>
                    </table>
                </div>
            </div>
            <br>

            <div>
                <div class="concert-detail-subject">
                    <span><h3>예매취소 및 취소수수료</h3></span>
                </div>
                <div>
                    <table class="concert-detail-sellingInformation-table">
                        <tbody>
                            <tr>
                                <th>예매취소</th>
                                <td colspan="2">고객센터 문의요망</td>
                            </tr>
                            <tr>
                                <th rowspan="4">취소수수료</th>
                                <td colspan="2">예매 후 72시간 이내 취소 시에는 취소수수료가 없습니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="3">관람일 기준</th>
                                <td>관람일 9일~3일 전 : 티켓금액 30%</td>
                            </tr>
                            <tr>
                                <td>관람일 2일~1일 전 : 티켓금액 20%</td>
                            </tr>
                            <tr>
                                <td>관람당일 : 환불불가</td>
                            </tr>
                            <tr>
                                <th rowspan="5">환불안내</th>
                                <th rowspan="3">신용카드결제</th>
                                <td>당사 취소 처리 후 5일 이내 카드사 취소 확인 가능</td>
                            </tr>
                            <tr>
                                <td>취소수수료는 제외 후 환급됩니다.</td>
                            </tr>
                            <tr>
                                <td>해당 카드사의 처리 기준에 따라 취소금액은 다소 차이가 있을 수 있습니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="2">무통장입금</th>
                                <td>예매자 본인 명의의 계좌로만 환급됩니다.</td>
                            </tr>
                            <tr>
                                <td>취소수수료는 제외 후 환급됩니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br><br>
    </section>

	<div>
		<jsp:include page="../common/footer.jsp" />
	</div>

    
</body>
</html>