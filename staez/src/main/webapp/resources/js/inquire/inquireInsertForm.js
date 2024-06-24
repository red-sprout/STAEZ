window.onload = function(){
    faqCategoryName((category) => (drawOption(category)));
}
function drawOption(category){
    const select = document.getElementById("to-inquire-category");
    const cNo = document.querySelector("input[name='modelCategoryNo']").value;
  
    for (let c of category){
        if(String(c.categoryNo) === String(cNo)){
            
            select.innerHTML += `<option value="`+c.categoryNo+`" selected>`+c.categoryName+`</option>`
        } else {   
            select.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`
        }
    }
}

function insertInquire(_this){
    const content = document.querySelector("#to-inquire-content").value
    const title = document.querySelector("input[name='boardTitle']").value
    if(content === "" || title === ""){
        
        alert("제목이나 내용이 빈칸이면 안됩니다.")
        return false
    } else {
        _this.submit()
    }
    
}