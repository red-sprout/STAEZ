$(function(){
    getAjax(
        "/staez/faqCategory.ad", 
        {refCategoryNo: 3}, 
        function(res){
            setFaqCategory(res);
        },
        "faq ajax요청 실패"
    );
});

function toggleFaqCategory(_this) {
    const categoryBtn = document.querySelectorAll("#faq-category>.btn-staez");
    const categoryRadio = document.querySelectorAll("#faq-category input[name='categoryNo']");
    for(let i in categoryBtn) {
        try {
            categoryBtn[i].classList.remove("checked");
            if(categoryBtn[i] === _this) {
                _this.classList.add("checked");
                categoryRadio[i].setAttribute("checked", true);
            }
        } catch (error) {
            continue;
        }
    }
}

function setFaqCategory(result) {
    const li = document.querySelector('#faq-category');
    for(let ele of result) {
        let btn = `<button class="btn-staez" type="button" onclick="toggleFaqCategory(this);">
                        <h4>${ele.categoryName}</h4>
                    </button>`
        let input = `<input type="radio" name="categoryNo" class="hidden" value="${ele.categoryNo}">`
        li.innerHTML += btn;
        li.innerHTML += input;
    }
}