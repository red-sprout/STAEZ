// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");

  conNaviDraw(conList => drawConNavi(conList));
  conMainDraw(list => (drawConMain(list, sliderContent, gridContent)));

});

function drawConNavi(conList){
  console.log(conList)
  const concertNaviArea = document.querySelector(".concert-ul");
  
  concertNaviArea.innerHTML = ``;
  for(let c of conList){
  
      concertNaviArea.innerHTML += `<li onclick="categoryConcertList(this)"><span><h2 id="`+ c.categoryNo +`">`+ c.categoryName +`</h2></span></li>`
      

  }
}


// 슬라이더 그려주기
function drawConMain(list, sliderContent, gridContent){

  for (let c of list) {
    if(c.categoryNo == 4){
    // sliderContent에 HTML 추가
    const sliderContentDiv = document.createElement('div');
    sliderContentDiv.className = 'concert-main-upper-pic-div';
    sliderContentDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `<div class="concert-main-upper-sen-div">
                                    <p><span><b><h2>` + c.concertTitle + `</h2></span></b></p>
                                    <p><span>` + c.theaterName + `</span></p>
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                                + `</div>`;
    sliderContent.appendChild(sliderContentDiv);

    // 임시, 공연세부페이지로
    sliderContentDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }

    const gridContentDiv = document.createElement('div');
    gridContentDiv.className = 'concert-grid-div';
    gridContentDiv.innerHTML +=  `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                            + `<div>`
                            +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                            + `</div>`
                            + `<div>`
                            +     `<p><span>뮤지컬</span></p>`
                            +     `<p><span><b>[` + c.concertTitle + `]</b></span></p>
                                   <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>`
    gridContent.appendChild(gridContentDiv);                        
    gridContentDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }
  }
  }

  
  // 슬릭 슬라이더 api 설정
  $.noConflict();
  $(".concert-main-upper").slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    arrows: true,
    autoplay: true,
    autoplaySpeed: 1250,
    // variableWidth: true,
    prevArrow: $(".concert-main-upper-before"),
    nextArrow: $(".concert-main-upper-next"),
    responsive: [ // 반응형 웹 구현 옵션
    {  
      breakpoint: 1000, //화면 사이즈 960px
      settings: {
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow:3
      } 
    },
    { 
      breakpoint: 750, //화면 사이즈 768px
      settings: {	
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow: 2

      }
     } ,
      {
        breakpoint: 485,
        settings: {
          slidesToShow: 1
        }
    }
  ]
  });


}





// // 뮤지컬 누르면 화면 뜨게
// document.addEventListener('DOMContentLoaded', function() {
//   console.log("페이지 로드 완료");
  
//   let category = "classic"; // 원하는 카테고리를 여기에 넣으세요
//   let url = `main.co?category=${category}`;


//   // 버튼 클릭 이벤트 처리
//   let musical = document.querySelector('.concert-ul').children[0];
//   musical.addEventListener('click', function() {
//       console.log("버튼 클릭됨");
//       // 페이지 로드 함수 호출
//       loadPage(url); // 로드할 페이지 URL을 넣으세요
//   });
// });

// // 페이지 로드 함수 정의
// function loadPage(url) {
//   console.log("페이지 로드 시작: " + url);
//   window.location.href = url; // 페이지 로드
// }






// $(function(){
//   getReplyList({bno : ${b.boardNo}}, function(result){

//       setReplyCount(result.length)
//       const list = getTdDataFormatToReply(result)

//       const replyBody = document.querySelector("#replyArea tbody");
//       drawTableList(result, replyBody);
//   })
// })

// //댓글 등록
// function addReply(){
//   //boardNo
//   //userId
//   //댓글내용

//   const boardNo = ${b.boardNo};
//   const userId = "${loginUser.userId}";
//   const content = document.querySelector("#content").value;


//   addReplyAjax({
//       refBno: boardNo,
//       replyWriter: userId,
//       replyContent: content
//   }, function(res){
//       getReplyList({bno : ${b.boardNo}}, function(result){
//           setReplyCount(result.length);
//           drawTableList(result, document.querySelector("#replyArea tbody"));
//       })
      
//   })
// }

// //댓글 데이터 포맷변경
// function getTdDataFormatToReply(replyList){
//   const list = [];
//   for (let r of replyList) {
//       list.push({ 
//           tdData1: r.replyWriter,
//           tdData2: r.replyContent,
//           tdData3: r.createDate,
//           rowEvent: function(){
//               console.log("클릭됨")
//           }
//       })
//   }

//   return list;
// }
// //댓글 카운트 넣기
// function setReplyCount(count){
//   const rCount = document.querySelector("#rcount");
//   rCount.innerHTML = count;
// }

// function addReplyAjax(data, callback){
//   $.ajax({
//       url: "rinsert.bo",
//       data : data,
//       success : function(res){
//           callback(res)
//       }, error(){
//           console.log("댓글 생성 ajax실패");
//       }
//   })
// }

// // 댓글 목록 가져오기
// function getReplyList(data, callback){
//   $.ajax({
//       url: 'rlist.bo',
//       data : data,
//       success: function(result){
//           callback(result)
//       },
//       error: function(item){
//           console.log(item);
//           console.log("댓글요청 ajax 실패");
//       }
//   })
// }

// function drawTableList(itemList, parent){
//   $(parent).empty();


//   //이벤트를 넣는 뷰를 작성하고 싶을 때               
//   for (let reply of itemList) {
//       const replyRow = document.createElement('tr');
//       replyRow.innerHTML = `<th>` + reply.replyWriter + `</th>
//                             <td>` + reply.replyContent + `</td>
//                             <td>` + reply.createDate + `</td>`;
//       parent.appendChild(replyRow);
      
//       replyRow.onclick = function(){
//           console.log(reply);
//       }
//   }
 
// }