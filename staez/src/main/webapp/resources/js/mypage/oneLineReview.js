const starRating = _this => {
    const val = _this.value - 1;
    const starlist = document.querySelectorAll(".star-label .star-icon");

    for(let i = 0; i < 5; i++) {
        if(i > val) starlist[i].innerHTML = `<img src="./resources/img/mypage/star.png">`;
        else starlist[i].innerHTML = `<img src="./resources/img/mypage/star-filled.png">`;
    }
}


