window.onload = function() {
    const keyword = document.querySelector("input[name = 'keyword']").value;
    console.log(keyword)
    keywordConcertList({keyword},(cList)=>drawConcertList(cList, keyword));
    keywordBoardList({keyword},(bList)=>drawBoardList(bList, keyword));
}

function drawConcertList(cList, keyword){
    const concertArea = document.querySelector(".concert-search-result-area");
    const concertCount = document.querySelector(".concert-count")
    concertCount.innerHTML = `공연정보(`+ cList.length +`)`
    concertArea.innerHTML = ``;
    if(cList.length === 0){
        concertArea.innerHTML = `<span style="font-size: 30px; font-weight: 500; width: 100%;">검색 결과가 없습니다</span>`
    } else {
        for(let c of cList){
            concertArea.innerHTML += `<div class="concert-search-result-info">
                                        <a href="/staez/detail.co?concertNo=`+ c.concertNo +`"><img class="key-concert-img" src="" alt=""></a>
                                        <div class="concert-search-result-content-info">
                                            <span class="concert-search-result-content-span1">`+ c.categoryName +`</span>
                                            <span class="concert-search-result-content-span2">[`+ c.concertTitle +`]</span>
                                            <span class="concert-search-result-content-span3">`+ c.startDate +` ~ `+ c.endDate +`</span>
                                        </div>
                                    </div>`; 
        }
        keywordConcertImgList({keyword},(ciList)=>drawConcertImgList(ciList))
    }   
}

function drawConcertImgList(ciList){
    const concertImg = document.querySelectorAll(".key-concert-img")
    console.log(ciList)
    for(let i = 0; i < concertImg.length; i++){
        concertImg[i].src="/staez" + ciList[i].filePath + ciList[i].changeName;  
    }
}

function drawBoardList(bList, keyword){
    const boardArea = document.querySelector(".community-bulletin-area");
    boardArea.innerHTML = ``;
    if(bList.length === 0 ){
        boardArea.innerHTML=`<span style="font-size: 30px; font-weight: 500; width: 100%;">검색 결과가 없습니다</span>`
    } else {
        for(let b of bList){
            const bNo = b.boardNo

            keywordCategoryList({bNo},(categoryList)=>drawBoardCategoryList(categoryList, b));
        }
        keywordUserProfile({keyword},(profileList)=>drawUserProfile(profileList, keyword))
    }
}

function drawBoardCategoryList(categoryList, b){
    const boardArea = document.querySelector(".community-bulletin-area");
    const bDate = formatDate(b.boardWriteDate) 
    boardArea.innerHTML += `<a href="/staez/detail.cm?boardNo=`+ b.boardNo +`" class="community-bulletin-search-result-a-area">
                                        <div class="community-bulletin-search-result-area">
                                            <div class="user-profile-area">
                                                <img class="user-profile-img" src="" alt="">
                                                <div class="user-info-area">
                                                    <span class="user-name">`+ b.nickname +`</span>
                                                    <span class="user-bulletin-upload-date">`+ bDate +`</span>
                                                </div>
                                            </div>
                                            <div class="bulletin-content-area">
                                                    <span class="bulletin-content-title">`+ b.boardTitle +`</span>
                                                    <span class="bulletin-detail-content">`+ b.boardContent +`</span>
                                            </div>
                                            <div class="bulletin-content-tag-area">
                                                <button class="btn-staez checked "><h4>`+ categoryList[0].categoryName +`</h4></button>
                                                <button class="btn-staez checked "><h4>`+ categoryList[1].categoryName +`</h4></button>
                                            </div>
                                        </div>
                                        <div class="bulletin-thumbnail-area">
                                            <img class="bulletin-thumbnail" src="/staez`+ b.path +`" alt="">
                                        </div>
                                    </a>
                                    <hr class="hr-line">`

}

function formatDate(bDate) {
     
    const date = new Date(bDate);
     
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');

    return `${year}-${month}-${day} ${hours}:${minutes}`;
}

function drawUserProfile(profileList, keyword){
    const userImgArea = document.querySelectorAll(".user-profile-img");

    for(let i = 0; i < userImgArea.length; i++){
        userImgArea[i].src="/staez" + profileList[i].filePath + profileList[i].changeName;  
    }
}