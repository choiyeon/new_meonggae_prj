$(function() {
    $(".event_link").click(function(e) {
        e.preventDefault();
        e.stopPropagation();  // 이벤트 전파 차단
        
        // href 속성에서 event-code 값을 추출
        var href = $(this).attr('href');
        var eventCode = href.split('event-code=')[1];
        console.log("event-code:", eventCode);

        $.ajax({
            url: href,
            type: 'GET',
            data: {
                'event-code': eventCode,
            },
            success: function(data) {
                $('#event_main').html(data);
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패: ' + status + " " + error);
            }
        });
    });
});