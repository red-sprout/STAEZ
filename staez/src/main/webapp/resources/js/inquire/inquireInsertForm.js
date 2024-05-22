window.onload = function(){
    $.ajax({
        url : "ajaxSelectCategory.iq",
        success : function(categorys){
            console.log(categorys)
            drawOption(categorys)
        },error : function(){
            console.log("실패")
        }
    })
}
function drawOption(categorys){
    const select = document.getElementById("to-inquire-category");

    for (let c of categorys){
        select.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`
    }
}