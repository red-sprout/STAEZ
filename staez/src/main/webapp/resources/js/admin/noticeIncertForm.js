window.onload = function () {
    summernote();

    category({ refCategoryNo: refCategoryMap.others }, (result) => setCategory(result, 'notice-category'));

    $('input').keydown(function (ev) {
        if (ev.keyCode === 13) {
            ev.preventDefault();
        };
    });

    $("#community-submit button:nth-child(1)").on("click", (ev) => {
        const data = {};
        data.userNo = $("input[name='userNo']").val();
        data.boardTitle = $("input[name='boardTitle']").val();
        data.categoryNo = categoryForm();
        data.boardContent = $(".note-editing-area>.note-editable").html();
        insertNotice(data, res => {
            location.href = contextPath + res;
        });
    });

    $("#community-submit button:nth-child(2)").on("click", ev => history.back());
};

// 썸머노트에 이미지업로드가 발생하였을 때 동작하는 함수
function fileUpload(fileList) {
    // 썸머노트는 이미지를 추가하면 해당이미지파일을 전달해준다.
    // callback함수를 작성하지 않을경우 자동으로 이미지를 string으로 변환해서 보여주지만
    // customCallback을 작성할 경우 해당 이미지의 경로를 직접 주어야한다.

    // 파일업로드를 할때는 form태그에서 encType을 multipart/form-data형식으로
    // 요청하는 것처럼 자바스크립트 객체에 FormData객체를 이용해서 ajax요청을 해준다.
    const fd = new FormData();
    for (let file of fileList) {
        fd.append("fileList", file);
    }

    insertFileApi(fd, function (nameList) {
        for (let name of nameList) {
            $("#summernote").summernote('insertImage', contextPath + name);
        }
    });
}

function searchResult(_this) {
    const keyword = _this.value;
    searchConcertList({ "keyword": keyword }, res => drawResultList(res));
}

function drawResultList(result) {
    const ul = document.querySelector("#community-tag .search-list");
    ul.innerHTML = "";

    for(let ele of result) {
        const li = document.createElement("li");
        const btn = document.createElement("button");
        const img = document.createElement("img");
        const input = document.createElement("input");
        const span = document.createElement("span");
        const poster = document.createElement("img");

        btn.setAttribute("type", "button");
        img.setAttribute("src", contextPath + "/resources/img/community/communityMain/search-icon.png");
        input.setAttribute("type", "hidden");
        poster.setAttribute("src", contextPath + ele.filePath + ele.changeName);
        poster.setAttribute("class", "poster");
        input.value = ele.concertNo;
        span.innerHTML = ele.concertTitle;

        btn.appendChild(img);
        li.appendChild(btn);
        li.appendChild(input);
        li.appendChild(span);
        li.appendChild(poster);
        ul.appendChild(li);

        li.addEventListener("click", (ev) => {
            const theaterName = document.querySelector("#community-tag input[name='concertTitle']")
            const theaterNo = document.querySelector("#community-tag input[name='concertNo']");
            theaterNo.value = ev.currentTarget.children[1].value;
            theaterName.value = ev.currentTarget.children[2].innerHTML;
            ul.innerHTML = "";
        });
    }
}

function categoryForm() {
    const category = document.querySelectorAll("input[name='categoryNo']");
    let arr = [];
    
    for(let ele of category) {
        if(ele.getAttribute("checked")) {
            arr.push(ele.value);
        }
    }
    console.log(arr);

    return arr;
}