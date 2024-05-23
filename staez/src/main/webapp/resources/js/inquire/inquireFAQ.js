window.onload = function(){
    faqCategoryName((category) => (drawCategory(category)));
    selectFaq((faqs) => drawFaq(faqs));
}

function drawCategory(categorys){
    const categorySpen = document.querySelectorAll(".categoryName");
    console.log(categorySpen)
    for (let i= 0; i < categorySpen.length; i++){
        categorySpen[i].innerHTML = categorys[i].categoryName;
        categorySpen[i].id = categorys[i].categoryNo;
    }       
}

function drawFaq(faqs){
    const faqCount = document.querySelector(".faq-count");
    const faqContent = document.querySelector(".faq-content-container");
    faqCount.innerHTML = `전체 ` + faqs.length; 
    faqContent.innerHTML = ``;
    for(let f of faqs){
        faqContent.innerHTML += `<div class="faq-content-area">
                                    <div class="faq-content-category"><span>`+ f.categoryName +`</span></div>
                                    <span class="faq-content">`+ f.boardTitle +`</span>
                                    <img class="arrow-img" onclick="changeImg(this)" src="/staez/resources/img/inquire/down.png" alt="">
                                </div>
                                <div class="faq-content-answer-area">
                                    <div class="faq-content-answer">
                                        <p>`+ f.boardContent +`</p>
                                    </div>
                                    <div class="customer-service-insert-from-shortcut"><a href="insertForm.iq">1대1 문의</a></div>
                                </div>`
    } 
}

function faqSearchEv(){
    const option = document.getElementById("search-way-box").value;
    const content = document.getElementById("input-search-bar").value;
    faqSearch({
        option,
        content
    }, (faqs) => drawSearchFaq(faqs));

}

function drawSearchFaq(faqs){
    console.log(faqs)
    const categoryBtn = document.querySelectorAll(".category-choice");
    const categoryText = document.querySelectorAll(".category-choice>span");

    for(let i = 0; i < categoryBtn.length; i++){
        categoryBtn[i].classList.remove("choice-background");
        categoryText[i].classList.remove("choice-color-span");
    }

    const faqCount = document.querySelector(".faq-count");
    const faqContent = document.querySelector(".faq-content-container");
    faqCount.innerHTML = `전체 ` + faqs.length;
    faqContent.innerHTML = ``; 

    if(faqs.length === 0){
        faqContent.innerHTML += `<div style="margin-top: 30px;"><span style="font-size: 30px;">검색 결과가 없습니다.</span></div>`
    } else {
        for(let f of faqs){
            faqContent.innerHTML += `<div class="faq-content-area">
                                        <div class="faq-content-category"><span>`+ f.categoryName +`</span></div>
                                        <span class="faq-content">`+ f.boardTitle +`</span>
                                        <img class="arrow-img" onclick="changeImg(this)" src="/staez/resources/img/inquire/down.png" alt="">
                                    </div>
                                    <div class="faq-content-answer-area">
                                        <div class="faq-content-answer">
                                            <p>`+ f.boardContent +`</p>
                                        </div>
                                        <div class="customer-service-insert-from-shortcut"><a href="insertForm.iq">1대1 문의</a></div>
                                    </div>`
        } 
    }
}

function categoryChange(_this){
    const categoryBtn = document.querySelectorAll(".category-choice");
    const categoryText = document.querySelectorAll(".category-choice>span");

    for(let i = 0; i < categoryBtn.length; i++){
        categoryBtn[i].classList.remove("choice-background");
        categoryText[i].classList.remove("choice-color-span");
    }
    _this.classList.add("choice-background");
    _this.querySelector("span").classList.add("choice-color-span");
    categoryName = _this.querySelector("span").innerHTML;
    drawFaqContent({"categoryName": categoryName}, (cfaq) => (drawCategoryFaq(cfaq)));
}

function drawCategoryFaq(cfaq){
    const faqCount = document.querySelector(".faq-count");
    const faqContent = document.querySelector(".faq-content-container");
    faqCount.innerHTML = `전체 ` + cfaq.length;
    faqContent.innerHTML = ``; 

    if(cfaq.length === 0){
        faqContent.innerHTML += `<div style="margin-top: 30px;"><span style="font-size: 30px;">해당하는 결과가 없습니다.</span></div>`
    } else {
        for(let f of cfaq){
            faqContent.innerHTML += `<div class="faq-content-area">
                                        <div class="faq-content-category"><span>`+ f.categoryName +`</span></div>
                                        <span class="faq-content">`+ f.boardTitle +`</span>
                                        <img class="arrow-img" onclick="changeImg(this)" src="/staez/resources/img/inquire/down.png" alt="">
                                    </div>
                                    <div class="faq-content-answer-area">
                                        <div class="faq-content-answer">
                                            <p>`+ f.boardContent +`</p>
                                        </div>
                                        <div class="customer-service-insert-from-shortcut"><a href="insertForm.iq">1대1 문의</a></div>
                                    </div>`
        } 
    }
}

function changeImg(_this){
    const answerArea = $(_this).parent().next();  
    if (answerArea.css("display") === "none") {
        $(".faq-content-container .faq-content-answer-area").slideUp();
        $(_this).attr("src", "/staez/resources/img/inquire/up.png")
        answerArea.slideDown(); 
    } else {
        $(_this).attr("src", "/staez/resources/img/inquire/down.png")
        answerArea.slideUp(); 
    }
}





