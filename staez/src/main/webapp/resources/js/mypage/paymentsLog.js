$(function(){
    reserveDetail();
});


function iquireDetailPage(boardNo){
    const contextPath = $('input[name=contextPath]').val();
    const url = contextPath + '/inquireDetail.me?boardNo=' + boardNo;
    open(url, '_blank', "width=800, height=700, scrollbars=yes, resizable=no, location=no"); 
}

function reserveDetail(){
    $('.reserve-info').each(function(){
        const reserveNo = $(this).find('input[name=reserveNo]').val();
        console.log(reserveNo)
        const url = 'reserveDetail.me?reserveNo=' + reserveNo;

        $(this).on('click', function(){
            open(url, '_blank', "width=600, height=600, scrollbars=yes, resizable=no, location=no"); 

        });
    });
}