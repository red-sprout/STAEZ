$(function () {
    getOrigin();
});

function getOrigin() {
    const boardNo = getUrlParams();
    selectOneBoard(boardNo, (result) => {
        document.querySelector("input[name=refBoardNo]").value = result.boardNo;
        setOriginTitle(result.boardTitle);
        setOriginWriter(result.userId);
        document.getElementById("ref-board-link").href = `detail.cm?boardNo=${result.refBoardNo}`
        setOriginContent(result.boardContent);
    });
}

function setOriginTitle(title) {
    document.getElementById("question-title").value = title;
}

function setOriginWriter(userId) {
    document.getElementById("question-writer").value = userId;
}

function setOriginContent(boardContent) {
    document.getElementById("question-contents").innerHTML = boardContent;
}