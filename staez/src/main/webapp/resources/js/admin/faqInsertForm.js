$(function(){
    category({refCategoryNo: 3}, (res) => {
        setCategory(res, 'faq-category')
    });
});

function faqSubmit() {
    if(!$("input[name=boardTitle]").val()){
        alert("제목을 입력해주시기 바랍니다.");
        return;
    }

    if(!$("input[name=categoryNo]").is(':checked')){
        alert("카테고리를 선택해주시기 바랍니다.");
        return;
    }

    if(!$("textarea[name=boardContent]").val()){
        alert("내용을 입력해주시기 바랍니다.");
        return;
    }
    
    $("#community-contents").submit();
}