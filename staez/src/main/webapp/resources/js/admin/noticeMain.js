$(function() {
    category({ refCategoryNo: refCategoryMap.others }, (result) => onloadCategory(result));
    // selectNotice({boardCode: boardCodeMap.notice, categoryNo: getUrlParams().categoryNo}, res => draw(res));

    const profileArea = [...document.querySelectorAll(".profile-area>td>img")];
    const userNo = document.querySelectorAll(".profile-area input[name=userNo]");
    const userNoList = [];

    userNo.forEach((uNo) => {userNoList.push(uNo.value)});

    for(let i = 0; i < userNoList.length; i++) {
        drawProfile(profileArea[i], userNoList[i])
    }
});

function onloadCategory(result) {
    let path = location.pathname;
    const btnId = "category-div"
    const searchId = "notice-search";

    setCategory(result, btnId);

    updateCategoryUrl(path, btnId);
    // updateSearchUrl(path, searchId);
    setColor(btnId);
}

function updateCategoryUrl(url, id) {
    $(`#${id}>button`).on("click", (ev) => {
        location.replace(commonMakeUrl(url, { categoryNo: getCategoryNo(ev.currentTarget, id) }));
    });
}

function updateSearchUrl(url, id) {
    $(`#${id}>button`).on("click", (ev) => {
        location.replace(commonMakeUrl(url, { keyword: getCategoryNo(ev.currentTarget, id) }));
    })
}

function setColor(id) {
    const categoryNo = getUrlParams().categoryNo;

    if(!categoryNo) return;
    const categoryBtn = document.querySelectorAll(`#${id}>.btn-staez`);
    const categoryRadio = document.querySelectorAll(`#${id} input[name='categoryNo']`);

    for (let i in categoryBtn) {
        if (categoryRadio[i].value === categoryNo) {
            categoryBtn[i].classList.add("checked");
            categoryRadio[i].setAttribute("checked", true);
            break;
        }
    }
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