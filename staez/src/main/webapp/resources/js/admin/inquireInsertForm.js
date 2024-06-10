$(function () {
    category({ refCategoryNo: 3 }, (res) => {
        setCategory(res, 'inquire-category')
        getOrigin();
    });
});

function getOrigin() {
    const boardNo = getUrlParams();
    selectOneBoard(boardNo, (result) => {
        document.querySelector("input[name=refBoardNo]").value = result.boardNo;
        setOriginTitle(result.boardTitle);
        setOriginWriter(result.userId);
        setOriginCategory(result.categoryNo);
        setOriginContent(result.boardContent);
    });
}

function setOriginTitle(title) {
    document.getElementById("question-title").value = title;
}

function setOriginWriter(userId) {
    document.getElementById("question-writer").value = userId;
}

function setOriginCategory(categoryNo) {
    const btn = [...document.querySelectorAll("#inquire-category .btn-staez")];
    const categoryNoList = [...document.querySelectorAll("input[name=categoryNo]")]
    for (let i = 0; i < btn.length; i++) {
        try {
            if (categoryNoList[i].value == categoryNo) {
                btn[i].classList.add("checked");
                categoryNoList[i].setAttribute("checked", true);
                break;
            }
        } catch (error) {
            continue;
        }
    }
}

function setOriginContent(boardContent) {
    document.getElementById("question-contents").innerHTML = boardContent;
}