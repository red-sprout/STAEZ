function iquireDetailPage(boardNo){
    const contextPath = $('input[name=contextPath]').val();
    const url = contextPath + '/inquireDetail.me?boardNo=' + boardNo;
    window.open(url, '상세페이지', "width=800, height=800, scrollbars=yes, resizable=no"); 
}
