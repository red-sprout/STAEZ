

function checkBirth(_this) {
    var birthInput = _this;
    var value = birthInput.value;
    var pattern = /^\d{4}-\d{2}-\d{2}$/;

    if (!pattern.test(value)) {
       document.querySelector(".check-birth").classList.remove("hidden")
        birthInput.focus();
        return false;
    } else {
        document.querySelector(".check-birth").classList.add("hidden")
        return true;
    }
}

function checkPhone(_this){
    var phoneInput = _this;
    var value = phoneInput.value;
    var pattern = /^\d{11}$/;

    if(!pattern.test(value)){
        document.querySelector(".check-phone").classList.remove("hidden")
        phoneInput.focus();
        return false;
    } else {
        document.querySelector(".check-phone").classList.add("hidden")
        return true;
    }
}

function nextStep(_this, event){
    event.preventDefault();
   
    const name = document.querySelector("input[name = 'name']").value.trim();
    const birth = document.querySelector("input[name = 'birth']").value.trim();
    const phone = document.querySelector("input[name = 'phone']").value.trim();
    
    if(name === "" || birth === "" || phone === ""){
        alert("정보를 전부 입력해주세요.")
        return; 
    } else {
        const seatList = [];

        document.querySelectorAll(".my-seat-info-span").forEach(function(ev){
            const seatInfo = ev.textContent;

            seatList.push({
                seat : seatInfo
            })
        })

        document.querySelector("input[name = 'recipientName']").value = name;
        document.querySelector("input[name = 'recipientPhone']").value = phone;
        document.querySelector("input[name = 'recipientBirth']").value = birth;
   
        document.querySelector("input[name = 'seatList']").value = JSON.stringify(seatList);  

        _this.closest('form').submit();
    }




}