$(function () {
    category({ refCategoryNo: 3 }, (res) => {
        setCategory(res, 'faq-category')
        getOrigin();
    });
});

function faqSubmit() {
    if(!$("input[name=boardTitle]").val()){
        alert("제목을 입력해주시기 바랍니다.");
        return;
    }

    if(!$("input[name=categoryNo]").is(':checked')){
        alert("카테고리를 선택해주시기 바랍니다.");
        return;
    }

    if(!$("textarea[name=boardContent]").val()){
        alert("내용을 입력해주시기 바랍니다.");
        return;
    }
    
    $("#community-contents").submit();
}

function getOrigin() {
    const boardNo = getUrlParams();
    selectOneBoard(boardNo, (result) => {
        document.querySelector("input[name=boardNo]").value = result.boardNo;
        setOriginTitle(result.boardTitle);
        setOriginCategory(result.categoryNo);
        setOriginContent(result.boardContent);
    });
}

function setOriginTitle(title) {
    document.getElementById("title").value = title;
}

function setOriginCategory(categoryNo) {
    const btn = [...document.querySelectorAll("#faq-category .btn-staez")];
    const categoryNoList = [...document.querySelectorAll("input[name=categoryNo]")]
    for(let i = 0; i < btn.length; i++) {
        try {
            if(categoryNoList[i].value == categoryNo) {
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
    document.querySelector("textarea[name=boardContent]").innerHTML = boardContent;
}