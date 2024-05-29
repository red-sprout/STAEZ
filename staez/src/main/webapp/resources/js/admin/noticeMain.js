$(function() {
    category({ refCategoryNo: refCategoryMap.others }, (result) => onloadCategory(result));
    selectNotice({
        boardCode: boardCodeMap.notice,
        ...getUrlParams()
    }, res => draw(res));
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

function draw(result) {
    
}