function categoryChange(_this){
    const categoryBtn = document.querySelectorAll(".category-choice");
    const categoryText = document.querySelectorAll(".category-choice>span");

    for(let i = 0; i < categoryBtn.length; i++){
        categoryBtn[i].classList.remove("choice-background");
        categoryText[i].classList.remove("choice-color-span");
    }
    _this.classList.add("choice-background");
    _this.querySelector("span").classList.add("choice-color-span");
    drawFaqContent();
}

// $(".arrow-img").click(function(){
//     //this => 클릭이벤트가 발생한 요소(div)
//     //$(this).next() => 선택된 요소의 뒤에있는 요소(p)

//     const answerArea = document.

//     if($p.css("display") === "none"){
//         $(".qa_box > p").slideUp();
        
//         $p.slideDown();
//     }else{ //보여지고있는 상태
//         $p.slideUp();
//     }
// })

window.onload = function(){
    $.ajax({
        url : "ajaxSelectCategory.iq",
        success : function(categorys){
            console.log(categorys)
            drawCategory(categorys)
        },error : function(){
            console.log("실패")
        }
    })

    function drawCategory(categorys){
        const categorySpen = document.querySelectorAll(".categoryName");
        console.log(categorySpen)
        for (let i= 0; i < categorySpen.length; i++){
            categorySpen[i].innerHTML = categorys[i].categoryName;
            categorySpen[i].id = categorys[i].categoryNo;
        }       
    }

    $.ajax({
        url : "ajaxSelectFaq.iq",
        success : function(faqs){
            console.log(faqs)
            drawFaq(faqs)
        },error : function(){
            console.log("실패")
        }
    })

    function drawFaq(faqs){
        const faqCount = document.querySelector(".faq-count");
        const faqContent = document.querySelector(".faq-content-container");
        faqCount.innerHTML = `전체 ` + faqs.length; 
        // for(let f of faqs){
        //     faqContent.innerHTML = ``
        // } 
    }
}