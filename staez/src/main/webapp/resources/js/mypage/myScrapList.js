$(function(){
    let checkAll = $('#checkAll'); //전체선택 체크박스
    let checkElList = $('.age-checkbox input:checkbox'); //각 공연선택 체크박스

    //전체 체크박스 선택되면, 모든 체크박스 선택
    checkAll.change(function() {
        let checked = $(this).is(':checked');
        $('input:checkbox').prop('checked', checked);
    });

    //체크박스 중 하나라도 체크해제되면, 전체선택 체크박스 해제
    checkElList.change(function() {
        $.each(checkElList, function(index, checkbox){
            if(!($(checkbox).is(':checked'))){
                $(checkAll).prop('checked', false);
            }
        });
    });
});

function deleteMyScrap(){
    //각 체크박스에 value = concertNo
    let checkElList = $('.age-checkbox input:checkbox');

    $.each(checkElList, function(index, checkbox){

        if($(checkbox).is(':checked')){            
            deleteMyScrapAjax({concertNo : checkbox.value,}, function(res){
                if(res === "NNNNY"){
                    location.reload();
                } else{
                    alert("삭제 실패");
                }
            });
        }
    });
}