$(function(){
    category({refCategoryNo: 3}, (res) => {
        setCategory(res, 'faq-category')
        addEvent();
    });
});

function addEvent() {
    const categoryNo = document.querySelectorAll("#faq-category input[name=categoryNo]");
    const cNo = document.querySelector("#faq-category input[name=cNo]")
    for(let ele of categoryNo) {
        console.log(ele.getAttribute("checked"));
        if(ele.getAttribute("checked") === true) {
            cNo.value = ele.value;
        }
    }
}