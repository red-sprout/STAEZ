
const pwdChange = function() {

    
    

}

const emailDomain = () => {
    const domain = document.querySelector("select[name='domain']");
    const emailBack = document.querySelector("#email-back");

    emailBack.value = "";
    
    if(domain.value !== 'self-input'){ //'직접입력'이 아닐경우
        emailBack.value = domain.options[domain.selectedIndex].value;
        emailBack.readOnly = true;
    } else{
        emailBack.readOnly = false;
        emailBack.focus();        
    }
}

const btnToggle = (event) => {
    console.log(event);
    event.target.classList.toggle('checked');
}

// btn.addEventListener('click', () => {
//         _this.classList.toggle('checked');
// });
