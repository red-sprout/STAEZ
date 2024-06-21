window.onload = function() {
    communityCategory({refCategoryNo: 2, categoryLevel: 1}, (result) => {
        setNavigation(result);
    });
}

function setNavigation(result) {
    let nodeEle = `<li class="community-nav-li">
                        <h2 onclick="location.href='main.cm'" style="color: #b51b75;">
                            커뮤니티 메인
                            <input type='radio' class="hidden">
                        </h2>
                    </li>`;
    result.forEach((res) => {
        nodeEle += `<li class="community-nav-li">
                                                <h2>
                                                    ${res.categoryName}
                                                    <input type='radio' class="hidden" value="${res.categoryNo}">
                                                </h2>
                                            </li>`;
    })
    nodeEle += `<li id="write-btn" onclick="location.href='insertForm.cm'">
                    <h2>글쓰기</h2>
                    <img src="resources/img/community/communityMain/write.png">
                </li>`;
    $("#community-nav").html(nodeEle);
}