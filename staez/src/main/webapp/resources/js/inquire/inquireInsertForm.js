window.onload = function(){
    faqCategoryName((category) => (drawOption(category)));
}
function drawOption(category){
    const select = document.getElementById("to-inquire-category");

    for (let c of category){
        select.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`
    }
}