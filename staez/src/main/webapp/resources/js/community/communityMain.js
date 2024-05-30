$(function() {
    communityCategory({refCategoryNo: 2, categoryLevel: 1}, (res) => {
        setNav(res);
        setColor();
    });
    
    communityCategory({refCategoryNo: 2, categoryLevel: 2}, (res) => {
        setCategory(res, 'community-category');
    });

    const btnArea = [...document.querySelectorAll(".posting-category>td")];
    const profileArea = [...document.querySelectorAll(".profile-area>td>img")];
    const boardNo = document.querySelectorAll(".profile-area input[name=boardNo]");
    const userNo = document.querySelectorAll(".profile-area input[name=userNo]");
    const boardNoList = [], userNoList = [];

    boardNo.forEach((bNo) => {boardNoList.push(bNo.value)});
    userNo.forEach((uNo) => {userNoList.push(uNo.value)});

    for(let i = 0; i < boardNoList.length; i++) {
        drawBtn(btnArea[i], boardNoList[i]);
        drawProfile(profileArea[i], userNoList[i])
    }
})

// 왼쪽 커뮤니티 대분류 항목 그리기
function setNav(result) {
    const ul = document.getElementById("community-nav");
    ul.innerHTML += `<li class="write-btn" onclick="location.href='main.cm'">
                        <h2>커뮤니티 메인</h2>
                    </li>`;

    for(let ele of result) {
        const li = document.createElement("li");
        const h2 = document.createElement("h2");
        const input = document.createElement("input");
        
        li.setAttribute("class", "community-nav-li");
        li.setAttribute("onclick", `location.href='main.cm?categoryNo=${ele.categoryNo}'`);
        
        h2.innerHTML += ele.categoryName;
        input.type = "hidden"
        input.value = ele.categoryNo;
        input.setAttribute("class", "community-hidden-input");
        
        li.appendChild(h2);
        li.appendChild(input)
        ul.appendChild(li);
    }

    ul.innerHTML += `<li id="write-btn" onclick="location.href='incertForm.cm'">
                        <h2>글쓰기</h2>
                        <img src="${contextPath}/resources/img/community/communityMain/write.png">
                    </li>`;
}

// 클릭한 곳 글자 칠하기 - 미구현
function setColor() {
    const communityNav = document.getElementsByClassName("community-nav-li");
    for(let i = 0; i < communityNav.length; i++) {
        if(communityNav.item(i));
    }
}

function setUrlParams(_this, mode) {
    const nowParams = getUrlParams();
}

// url 만들기
function generateUrls() {
    const input = document.getElementById('categoryInput').value;
    const categoryNos = input.split(',').map(num => num.trim());
    const outputDiv = document.getElementById('output');

    let urls = [];

    // Single categoryNo
    categoryNos.forEach(categoryNo => {
        urls.push(`/staez/main.com?categoryNo=${categoryNo}`);
    });

    // Multiple categoryNos
    if (categoryNos.length > 1) {
        let multipleCategoryNo = `/staez/main.com?categoryNo=${categoryNos.join('&categoryNo=')}`;
        urls.push(multipleCategoryNo);
    }

    // Display the URLs
    outputDiv.innerHTML = '<h2>Generated URLs:</h2>';
    urls.forEach(url => {
        const urlElement = document.createElement('p');
        urlElement.textContent = url;
        outputDiv.appendChild(urlElement);
    });
}

// 게시글마다 해당하는 카테고리 노출하기
function drawBtn(_this, bNo) {
    boardCategory({boardNo: bNo}, (result) => {
        for(let c of result) {
            _this.innerHTML += `<button class="btn-staez checked"><h4>${c.categoryName}</h4></button>`
        }
    });
}

// 게시글마다 프로필 사진 그리기
function drawProfile(_this, uNo) {
    selectProfile({userNo: uNo}, (result) => {
        _this.setAttribute("src", contextPath + result);
    })
}