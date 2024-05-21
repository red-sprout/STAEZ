document.addEventListener('DOMContentLoaded', () => {
    // 모든 메뉴 아이템에 클릭 이벤트 추가
    document.querySelectorAll('.menu-item').forEach(item => {
        item.addEventListener('click', function() {
            // 현재 클릭된 메뉴 아이템을 제외한 모든 하위 메뉴 숨기기
            document.querySelectorAll('.menu-item .fold-content').forEach(subMenu => {
                if (subMenu !== this.querySelector('.fold-content')) {
                    subMenu.style.display = 'none';
                }
            });

            // 현재 클릭된 메뉴 아이템의 하위 메뉴를 토글
            const subMenu = this.querySelector('.fold-content');
            if (subMenu.style.display === 'block') {
                subMenu.style.display = 'none';
            } else {
                subMenu.style.display = 'block';
            }
        });
    });
});
