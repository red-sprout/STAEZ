// function selectLike(data, callback) {
//     $.ajax({
//         url: contextPath + "select.bl",
//         data: data,
//         success : function(res) {
//             callback(res);
//         }, error() {
//             console.log("좋아요 요청 실패");
//         }
//     })
// }

// function onClickLike(data, callback) {
//     $.ajax({
//         url: contextPath + "update.bl",
//         data: data,
//         success: function (res) {
//             callback(res);
//         }, error() {
//             console.log("좋아요 요청 실패");
//         }
//     });
// }


// <div class="community-fixed">
// <div class="community-circle-area" onclick="likeToggle(this)">
//     <img><h4></h4>
// </div>
// <hr>
// <div class="community-circle-area" onclick="replyFocus()">
//     <img src="<c:url value='/resources/img/community/communityDetail/reply.png'/>" alt="">
//     <h4 class="reply-cnt"></h4>
// </div>
// </div>


// selectLike(data, (res) => {
//     likeStatus(res);
// });

// function likeStatus(result) {
//     const img = document.querySelector(".community-circle-area:nth-child(1) img");
//     const h4 = document.querySelector(".community-circle-area:nth-child(1) h4");
//     const likeYes = "like-yes";
//     const likeNo = "like-no";

//     img.setAttribute("src", imgsrc(result.userBoardLike ? likeYes : likeNo));
//     h4.innerHTML = result.boardLikeCnt;
// }

// function likeToggle(_this) {
//     const likeYes = "like-yes";
//     const likeNo = "like-no";
//     const img = _this.children[0];
//     const h4 = _this.children[1];

//     const data = {
//         "boardNo": document.querySelector("input[name=boardNo]").value,
//         "userNo": document.querySelector("input[name=userNo]").value
//     };

//     if(img.getAttribute("src").includes(likeYes)) {
//         // ajax 요청 보내기
//         data.status = "N";
//         onClickLike(data, (res) => h4.innerHTML = res);
//         img.setAttribute("src", imgsrc(likeNo));
//     } else {
//         // ajax 요청 보내기
//         data.status = "Y";
//         onClickLike(data, (res) => h4.innerHTML = res);
//         img.setAttribute("src", imgsrc(likeYes));
//     }
// }