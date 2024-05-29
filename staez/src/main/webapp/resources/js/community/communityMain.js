$(function() {
    communityCategory({refCategoryNo: 2, categoryLevel: 1}, (res) => {
        const navArr = [{categoryNo : 0, categoryName : "커뮤니티 메인"}, ...res];
        setNav(navArr);
        setColor();
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
        const input = document.createElement("input");

        li.setAttribute("class", "community-nav-li");
        li.setAttribute("onclick", `location.href='main.cm?categoryNo=${ele.categoryNo}'`);

        h2.innerHTML += ele.categoryName;
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

function setColor() {
    const communityNav = document.getElementsByClassName("community-nav-li");
    for(let i = 0; i < communityNav.length; i++) {
        if(communityNav.item(i));
    }
}

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
