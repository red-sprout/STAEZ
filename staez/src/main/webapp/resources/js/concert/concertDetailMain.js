$(function() { 
    const userNo = $("input[name='userNo']").val();
    const concertNo =  $("input[name='concertNo']").val();
    const conSellinfo = document.getElementsByClassName("concert-detail-down-section");

    conNaviDraw(conList => drawConNavi(conList));
    // conHeart({
    //     "userNo" : userNo,
    //     "concertNo" : concertNo
    // }, (conL) => insertLike(conL, userNo, concertNo))
    
    conDetail({"concertNo" : concertNo}, (result) => drawConDetail(result))
});

// ajax로 콘서트 navi 그려
function drawConNavi(conList){
  
  const concertNaviArea = document.querySelector(".concert-ul");
  concertNaviArea.innerHTML = ``;

  for(let c of conList){
    let naviLi = document.createElement('li');
    naviLi.innerHTML = `<h2 id="`+ c.categoryNo +`">`+ c.categoryName +`</h2>`;

    naviLi.setAttribute("onclick", `location.href ='main.co?categoryNo=${c.categoryNo}'`)

    concertNaviArea.appendChild(naviLi);
  }
  
}

function goSellDetail(){
    const concertNo =  $("input[name='concertNo']").val();
    conSellDetail({"concertNo" : concertNo}, (result) => drawConSellDetail(result))
}

function goCommentDetail(){
    const concertNo =  $("input[name='concertNo']").val();
    commentDetail({"concertNo" : concertNo}, (result) => drawCommentDetail(result))
}


function goReviewDetail(){
    const concertNo =  $("input[name='concertNo']").val();
    reviewDetail({"concertNo" : concertNo}, (result) => drawReviewDetail(result))
}



// let heartClick = document.getElementsByClassName("concert-detail-like-button");

// heartClick.addEventListener("click", function(){

// });


// function insertLike(like, userNo, concertNo){
//   console.log("alertMsg");    

// }
function drawConDetail(result){
    const drawSection = document.querySelector(".concert-detail-down-section");
    const conDetail1 = document.querySelector(".conDetail1");
    drawSection.innerHTML = ``;
    for(let c of result){
    drawSection.innerHTML +=  `<div>
                                  <div class="concert-detail-subject">
                                    <br>
                                    <span><h2>작품소개</h2></span>
                                    <div>`
                                        +c.concertPlot +
                                    `</div>
                                  </div>
                                  <br><br>
                                  <div class="concert-detail-subject">
                                      <span><h2>공지사항</h2></span>`
                                      + `<img src="` + contextPath + c.filePath + c.changeName + `">`+
                                  `</div>
                                </div>
                              <br><br>`
conDetail1.onclick = function goConDetail(){
    location.href = 'detail.co?concertNo=' + c.concertNo;
    }

  }
}
  

function drawConSellDetail(result){
  const drawSection = document.querySelector(".concert-detail-down-section");
  drawSection.innerHTML= '';
  for(let c of result){
  drawSection.innerHTML += `<div>
                                <div>
                                <div class="concert-detail-subject">
                                    <span><h3>상품정보</h3></span>
                                </div>
                                <div>
                                    <table class="concert-detail-sellingInformation-table">
                                        <tbody>
                                            <tr>
                                                <th>공연명</th>
                                                <td>` + c.concertTitle + `</td>
                                            </tr>
                                            <tr>
                                                <th>공연기간</th>
                                                <td>` + c.startDate +`~` + c.endDate + `</td>
                                            </tr>
                                            <tr>
                                                <th>공연장소</th>
                                                <td>` + c.theaterName + `</td>
                                            </tr>
                                            <tr>
                                                <th>공연런타임</th>
                                                <td>` + c.concertRuntime + `</td>
                                      </tr>
                                      <tr>
                                          <th>관람연령</th>
                                          <td>` + c.ageLimit + `</td>
                                      </tr>
                                      <tr>
                                          <th>제작진</th>
                                          <td>(재)` + c.concertProduction + `</td>
                                      </tr>
                                      <tr>
                                          <th>공연내용</th>
                                          <td>` + c.concertPlot + `</td>
                                      </tr>
                                      <tr>
                                          <th>출연진</th>
                                          <td>` + c.concertMember + `</td>
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
                    <br><br>`

                          }
    }

function drawCommentDetail(result){
    const drawSection = document.querySelector(".concert-detail-down-section");
    drawSection.innerHTML = ``;

    for(let c of result){
        drawSection.innerHTML += `<div>
                                    <p><h4><b>글쓰기 전 주의사항</b></h4></p>
                                    <p>※ 저속한 표현, 타인의 명예훼손, 광고성 게시물 등 게시판 운영규정에 어긋나는 글은 통보 없이 삭제될 수 있습니다.</p>
                                    <p>※ 등록된 관람평, 관람후기의 수정과 삭제는 마이페이지에서 가능합니다.</p>        
                                </div>
                                <br>
                                <div>
                                    <div class="concert-detail-comment-div">
                                        <table class="concert-detail-comment-table">
                                                <tbody>
                                                    <tr>
                                                        <td align="left"><b>` + 뮤덕이 + `</b></td>
                                                        <td align="right">2024-05-01 00:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">재미있을 것 같습니다</td>
                                                    </tr>
                                                </tbody>                 
                                                <tbody>
                                                    <tr>
                                                        <td align="left"><b>뮤덕이</b></td>
                                                        <td align="right">2024-05-01 00:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">재미있을 것 같습니다</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td align="left"><b>뮤덕이</b></td>
                                                        <td align="right">2024-05-01 00:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">재미있을 것 같습니다</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td align="left"><b>뮤덕이</b></td>
                                                        <td align="right">2024-05-01 00:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">재미있을 것 같습니다</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td align="left"><b>뮤덕이</b></td>
                                                        <td align="right">2024-05-01 00:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">재미있을 것 같습니다</td>
                                                    </tr>
                                                </tbody>
                                            
                                        </table>
                                    </div>
                                    <br>        
                                    <div class="concert-detail-comment-page-list">    
                                        <div class="page-list" align="center">
                                            <div class="pagination">
                                                <img src="${pageContext.request.contextPath}/resources/img/main/before.png">
                                            </div>
                                            <div class="pagination current"><h4>1</h4></div>
                                            <div class="pagination"><h4>2</h4></div>
                                            <div class="pagination"><h4>3</h4></div>
                                            <div class="pagination"><h4>4</h4></div>
                                            <div class="pagination"><h4>5</h4></div>
                                            <div class="pagination">
                                                <img src="${pageContext.request.contextPath}/resources/img/main/after.png">
                                            </div>
                                        </div>
                                    </div>
                                        <br><br>
                                </div>`
    }
    
}
       








 



  // 찜버튼(하트)눌러서 색 채우기
function likeToggle(_this) {
    // const check = _this.children[1];
    // check.checked = !check.checked;
    // fa-solid && fa-regular
    _this.children[0].classList.toggle("fa-solid");
    _this.children[0].classList.toggle("fa-regular");


}




// 세부페이지 노란부분
// window.onload = function() {
//     const detailPic = document.querySelector(".concert-detail-pic");
//     detailPic.innerHTML = `<img src="` + contextPath + con.filePath + con.changeName + `"alt="">`    
// }





// 예매버튼 클릭
function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

