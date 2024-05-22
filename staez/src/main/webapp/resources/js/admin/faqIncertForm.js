function init(data) {
    getFaqCategory({refCategoryNo: data}, function(res){
        console.log(res);
    });
}

function getFaqCategory(data, callback) {
    $.ajax({
        url: 'faqCategory.ad',
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("faq 카테고리 ajax 실패");
        }
    });
}

function toggleCategory(_this) {
    const categoryBtn = document.querySelectorAll("#faq-category .btn-staez");
    const categoryRadio = document.querySelectorAll("#faq-category input[name='categoryNo']");
    for(let i in categoryBtn) {
        categoryBtn[i].classList.remove("checked");
        if(categoryBtn[i] === _this) {
            _this.classList.add("checked");
            categoryRadio[i].setAttribute("checked", true);
        }
    }
}