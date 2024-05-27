document.addEventListener('DOMContentLoaded', () => {
    const contentPage = document.querySelector("input[type='hidden']").value;
    const menus = document.querySelectorAll("li>a");

    menus.forEach(menu => {
        if(menu.id === contentPage){
            menu.style.color = '#b51b75';
            return;
        }
    });
});