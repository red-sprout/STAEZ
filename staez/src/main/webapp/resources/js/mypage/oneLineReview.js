const starRating = _this => {
    const val = _this.value - 1;
    const starlist = document.querySelectorAll(".star-label .star-icon");

    for(let i = 0; i < 5; i++) {
        if(i > val) starlist[i].innerHTML = `<img src="./resources/img/mypage/star.png">`;
        else starlist[i].innerHTML = `<img src="./resources/img/mypage/star-filled.png">`;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const hoverTarget = document.querySelector('#review-func>span');
    const hoverButton = document.querySelector('#review-func>button');

    const showButton = () => {
        hoverButton.style.display = 'inline-block';
        hoverTarget.style.display = 'none';
    };

    const hideButton = () => {
        hoverButton.style.display = 'none';
        hoverTarget.style.display = 'flex';
    };

    hoverTarget.addEventListener('mouseenter', showButton);
    hoverTarget.addEventListener('mouseleave', (event) => {
        if (!hoverButton.contains(event.relatedTarget)) {
            hideButton();
        }
    });

    hoverButton.addEventListener('mouseenter', showButton);
    hoverButton.addEventListener('mouseleave', (event) => {
        if (!hoverTarget.contains(event.relatedTarget)) {
            hideButton();
        }
    });
});
