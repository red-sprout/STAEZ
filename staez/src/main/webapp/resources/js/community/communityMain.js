$(function() {
    communityCategory({refCategoryNo: 2, categoryLevel: 1}, (res) => {
        const navArr = [{categoryNo : 0, categoryName : "커뮤니티 메인"}, ...res];
        setNav(navArr);
    });
    communityCategory({refCategoryNo: 2, categoryLevel: 2}, (res) => {
        setCategory(res, 'community-category');
    });
})

function setNav(result) {
    const ul = document.getElementById("community-nav");
    for(let ele of result) {
        const li = document.createElement("li");
        const h2 = document.createElement("h2");

        li.setAttribute("class", "community-nav-li");
        li.setAttribute("onclick", `location.href='main.cm?categoryNo=${ele.categoryNo}'`);
        h2.innerHTML += ele.categoryName;

        li.appendChild(h2);
        ul.appendChild(li);
    }

    ul.innerHTML += `<li id="write-btn" onclick="location.href='incertForm.cm'">
                        <h2>글쓰기</h2>
                        <img src="${contextPath}/resources/img/community/communityMain/write.png">
                    </li>`;
}

function getUrlParams() {
	const params = {};
	location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, (str, key, value) => { params[key] = value; });
	return params;
};