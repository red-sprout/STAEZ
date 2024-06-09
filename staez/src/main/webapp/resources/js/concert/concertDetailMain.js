$(function() { 
    const userNo = $("input[name='userNo']").val();
    const concertNo =  $("input[name='concertNo']").val();

    conNaviDraw(conList => drawConNavi(conList));

    // 하트 insert, update
    // likeUpdate({ "userNo" : userNo, "concertNo" : concertNo}, (result) => drawLikeUpdate(result))
    
    //하트 카운트
    likeCount({ "userNo" : userNo, "concertNo" : concertNo}, (result) => drawLikeCount(result));
    conDetail({"concertNo" : concertNo}, (result) => drawConDetail(result));
    // conPagination(result => drawConPagination(result));
});

// ajax로 콘서트 navi 그려
function drawConNavi(conList){

    const concertNaviArea = document.querySelector(".concert-ul");
    concertNaviArea.innerHTML = ``;
  
    for(let c of conList){
      let naviLi = document.createElement('li');
      naviLi.innerHTML = ``;
      naviLi.innerHTML = `<h2 id="`+ c.categoryNo +`">`+ c.categoryName +`</h2>
                          <input type="hidden" name="concertNo" value=`+ c. categoryNo +`>`;
  
      naviLi.setAttribute("onclick", `location.href ='main.co?categoryNo=`+ c.categoryNo +`'`)
  
      concertNaviArea.appendChild(naviLi);
    }
  }


  // 예매버튼 클릭
function reservePage(){
    const concertNo =  $("input[name='concertNo']").val();
    const userNo =  $("input[name='userNo']").val();
    window.open(`/staez/selectDate.co?concertNo=`+concertNo+`&userNo=`+userNo , "_blank", "width=1001, height=601, scrollbars=no");
}


// 세부 내용 ajax로 값받아오기
function goSellDetail(){
    const concertNo =  $("input[name='concertNo']").val();
    conSellDetail({"concertNo" : concertNo}, (result) => drawConSellDetail(result))
}

function goCommentDetail(_this, cpage){
console.log(_this)
console.log(cpage)

    const concertNo =  $("input[name='concertNo']").val();
    // const cpage = $(this).data('cpage');
    commentDetail({"concertNo" : concertNo, "cpage" : cpage}, (result) => drawCommentDetail(result))
}


function goReviewDetail(_this, rpage){
    const concertNo =  $("input[name='concertNo']").val();
    // const cpage = $(this).data('rpage');
    reviewDetail({"concertNo" : concertNo, "rpage" : rpage}, (result) => drawReviewDetail(result))
}




// 좋아요 누르기 구현
function drawLikeCount(result){

    // const empty = document.querySelector(".fa-regular");
    // const fill = document.querySelector(".fa-solid");
    const heart = document.querySelector(".fa-heart");
    const span = document.querySelector(".concert-likeCount");
    console.log("userConLikeCount:" + result.userConLikeCount)

    if(result.userConLikeCount == 1){ // 좋아요 한 적 있으면: 1이랑 0으로 오는구나
        heart.classList.add("fa-solid"); // 하트 채워라
        heart.classList.remove("fa-regular");
    } else {
        heart.classList.remove("fa-solid");
        heart.classList.add("fa-regular");
    }

    // const heart = result.userConLikeCount ? fill : empty // a유저가 1이라는 콘서트에 좋아요한 갯수 status Y
    span.innerHTML = result.conLikeCount // 콘서트가 가진 좋아요 총 갯수 status Y
}

    // 찜버튼(하트)눌러서 색 채우기

    function likeToggle(_this) {
        _this.children[0].classList.toggle("fa-solid");
        _this.children[0].classList.toggle("fa-regular");
        const span = document.querySelector(".concert-likeCount");

        const data = {
            "concertNo": document.querySelector("input[name=concertNo]").value,
            "userNo": document.querySelector("input[name=userNo]").value
        };    

        if(_this.children[0].classList.contains('fa-solid')) { // fa-regular이 하트 빈상태
            // ajax 요청 보내기
            data.status = "Y";
            likeUpdate(data, (result) => span.innerHTML = result);
        } else {
            // ajax 요청 보내기
            data.status = "N";
            likeUpdate(data, (result) => span.innerHTML = result);
        }
    }



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
                                                <td>` + c.concertRuntime + `분</td>
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
                                          <td>` + c.concertMembers + `</td>
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
    const crList = result.crList;
    drawSection.innerHTML = ``;

    if(crList.length === 0){
        let divEmpty = document.createElement('p');
        drawSection.appendChild(divEmpty);
        divEmpty.innerHTML += "등록된 한줄평이 없습니다.";
        divEmpty.style.fontSize = '24px';
        divEmpty.style.padding = `15% 0 15% 0`;
        
    } else { 
        for(let c of result.crList){
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
                                                            <td align="left"><b>` + c.nickname + `</b></td>
                                                            <td align="right">` + c.reviewDate + `</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">` + c.reviewContent + `</td>
                                                        </tr>
                                                    </tbody>                 
                                            </table>
                                        </div>
                                    </div>
                                    <br>`
        }
    }
    drawCPagination(result);
}


function drawCPagination(result){

    const drawPagination = document.querySelector(".page-list");
    drawPagination.style.justifyContent = "center";
    const crList = result.crList;
    drawPagination.innerHTML = ``;

    if(crList.length === 0){
        drawPagination.innerHTML = ``;
    }

    if(crList.length > 0){
        const pi = result.pi;

        if(pi.currentPage == 1){
            drawPagination.innerHTML += 
            `<a disabled>
            <div class="pagination">
                <img src="` + contextPath + `/resources/img/main/before.png">
            </div>
            </a>`
        } else {
            drawPagination.innerHTML += 
            `<a data-cpage="` + (pi.currentPage-1) + `" onclick="goCommentDetail(this, ` + (pi.currentPage-1) + `)">
                <div class="pagination">
                    <img src="` + contextPath + `/resources/img/main/before.png">
                </div>
            </a>`
            
            // `<a data-cpage="` + (pi.currentPage-1) + `" href="commentDetail.co?concertNo=`+ concertNo + `&cpage=` + (pi.currentPage-1) + `">
            // <div class="pagination">
            //     <img src="` + contextPath + `/resources/img/main/before.png">
            // </div>
            // </a>`;
        }
        
        for(let i = pi.startPage; i <= pi.endPage; i++){
            drawPagination.innerHTML +=
            `<div class="pagination current"><a data-cpage="` + i + `" class="page-link" onclick="goCommentDetail(this, ` + i + `)"
            style="text-decoration: none;  background-color:#b51b75; border: #b51b75;">
            <h4>` + i + `</h4></a></div>`

            //  `<div class="pagination current"><a data-cpage="` + i + `" class="page-link" href="commentDetail.co?concertNo=`+ concertNo + `&cpage=` + i + `"
            //  style="text-decoration: none;  background-color:#b51b75; border: #b51b75;">
            //  <h4>` + i + `</h4></a></div>`
        }

        if(pi.currentPage === pi.maxPage){
            drawPagination.innerHTML += 
            `<a disabled>
            <div class="pagination">
                <img src="` + contextPath + `/resources/img/main/after.png">
            </div>
            </a>`
        } else{
            drawPagination.innerHTML += 
            `<a data-cpage="` + (pi.currentPage-1) + `" onclick="goCommentDetail(this, ` + (pi.currentPage+1) + `)">
                <div class="pagination">
                    <img src="` + contextPath + `/resources/img/main/after.png">
                </div>
            </a>`
            // `<a data-cpage="` + (pi.currentPage+1) + `" href="commentDetail.co?concertNo=`+ concertNo + `&cpage=` + (pi.currentPage+1) + `">
            // <div class="pagination">
            //     <img src="` + contextPath + `/resources/img/main/after.png">
            // </div>
            // </a>`;
        }
    }


    // drawPagination.innerHTML = `<div class="pagination">
    //                             <img href="#" src="` + contextPath + `/resources/img/main/before.png">
    //                                 </div>
    //                                 <div class="pagination current"><h4>1</h4></div>
    //                                     <div class="pagination"><h4>2</h4></div>
    //                                     <div class="pagination"><h4>3</h4></div>
    //                                     <div class="pagination"><h4>4</h4></div>
    //                                     <div class="pagination"><h4>5</h4></div>
    //                                 <div class="pagination">
    //                                     <img src="` + contextPath + `/resources/img/main/after.png">
    //                                 </div>
    //                             </div>`


                                // <div id="pagingArea">
                                // <ul class="pagination">
                                
                                //     <c:choose>
                                //         <c:when test="${ pi.currentPage eq 1 }">
                                //             <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                //         </c:when>
                                //         <c:otherwise>
                                //             <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                                //         </c:otherwise>
                                //     </c:choose>
                    
                                //     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                //         <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                                //     </c:forEach>
                                    
                                //   <c:choose>
                                //         <c:when test="${ pi.currentPage eq pi.maxPage }">
                                //             <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                                //         </c:when>
                                //         <c:otherwise>
                                //             <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                                //         </c:otherwise>
                                //     </c:choose>


}

// function pageNumber(_this, cpage){
//     console.log(_this);
//     console.log(cpage);
// }
       

function drawReviewDetail(result){
    const drawSection = document.querySelector(".concert-detail-down-section");
    const drawPagination = document.querySelector(".concert-detail-comment-page-list");
    drawSection.innerHTML = ``;

    if(result.length === 0){
        let divEmpty = document.createElement('p');
        drawSection.appendChild(divEmpty);
        divEmpty.innerHTML += "등록된 관람후기가 없습니다.";
        divEmpty.style.fontSize = '24px';
        divEmpty.style.padding = `15% 0 15% 0`;

    } else {
        for(let c of result){
            let str = c.boardContent;
            let boardContentCut = str.substr(0, 50)
            drawSection.innerHTML += `<div>
                                                <p><h4><b>글쓰기 전 주의사항</b></h4></p>
                                                <p>※ 저속한 표현, 타인의 명예훼손, 광고성 게시물 등 게시판 운영규정에 어긋나는 글은 통보 없이 삭제될 수 있습니다.</p>
                                                <p>※ 등록된 관람평, 관람후기의 수정과 삭제는 마이페이지에서 가능합니다.</p>        
                                            </div>
                                            <br>
                                            <div>
                                                <div class="concert-detail-review-div">
                                                    <table class="concert-detail-review-table">
                                                            <tbody class="concert-detail-review-tbody">
                                                                <tr>
                                                                    <td rowspan="3"><img align="left" src="`+ contextPath + `/resources/img/concert/heart-background.png" alt=""></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left"><b>`+ c.nickname + `</b></td>
                                                                    <td rowspan="4" class="concert-detail-review-table-img"><img align="center" src="`+ contextPath + `/resources/img/concert/heart-background.png" alt=""></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">` + c.boardWriteDate + `</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="2"><h3>` + c.boardTitle + `</h3>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="2">` + boardContentCut + `...</td>
                                                                </tr>
                                                            </tbody>
                                                    </table>
                                                </div>
                                                <br>`
        
        }   
    }

    drawRPagination(result);

}


function drawRPagination(result){

    const drawPagination = document.querySelector(".page-list");
    drawPagination.style.justifyContent = "center";
    const rList = result.rList;
    drawPagination.innerHTML = ``;

    if(rList.length === 0){
        drawPagination.innerHTML = ``;
    }

    if(rList.length > 0){
        const pi = result.pi;

        if(pi.currentPage == 1){
            drawPagination.innerHTML += 
            `<a disabled>
            <div class="pagination">
                <img src="` + contextPath + `/resources/img/main/before.png">
            </div>
            </a>`
        } else {
            drawPagination.innerHTML += 
            `<a onclick="goCommentDetail(this, ` + (pi.currentPage-1) + `)">
                <div class="pagination">
                    <img src="` + contextPath + `/resources/img/main/before.png">
                </div>
            </a>`
        }
        
        for(let i = pi.startPage; i <= pi.endPage; i++){
            drawPagination.innerHTML +=
            `<div class="pagination current"><a data-cpage="` + i + `" class="page-link" onclick="goCommentDetail(this, ` + i + `)"
            style="text-decoration: none;  background-color:#b51b75; border: #b51b75;">
            <h4>` + i + `</h4></a></div>`
        }

        if(pi.currentPage === pi.maxPage){
            drawPagination.innerHTML += 
            `<a disabled>
            <div class="pagination">
                <img src="` + contextPath + `/resources/img/main/after.png">
            </div>
            </a>`
        } else{
            drawPagination.innerHTML += 
            `<a onclick="goCommentDetail(this, ` + (pi.currentPage+1) + `)">
                <div class="pagination">
                    <img src="` + contextPath + `/resources/img/main/after.png">
                </div>
            </a>`

        }
    }
}

 








// 세부페이지 노란부분
// window.onload = function() {
//     const detailPic = document.querySelector(".concert-detail-pic");
//     detailPic.innerHTML = `<img src="` + contextPath + con.filePath + con.changeName + `"alt="">`    
// }






