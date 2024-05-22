function categoryChange(_this){
    const categoryBtn = document.querySelectorAll(".category-choice");
    const categoryText = document.querySelectorAll(".category-choice>span");

    for(let i = 0; i < categoryBtn.length; i++){
        categoryBtn[i].classList.remove("choice-background");
        categoryText[i].classList.remove("choice-color-span");
    }
    _this.classList.add("choice-background");
    _this.querySelector("span").classList.add("choice-color-span");
}

window.onload = function(){
    $.ajax({
        url : "ajaxSelectFaq",
        data : {
                
        }
    })
}