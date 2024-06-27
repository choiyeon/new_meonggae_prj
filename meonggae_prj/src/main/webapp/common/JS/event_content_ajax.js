$(function() {
	$('input[name="event-type"]').click(function(e) {
		var eventType = $(this).val();
		$.ajax({
			url: 'event_handler.do',
			type: 'GET',
			data: {
				'event-type': eventType
			},
			 dataType: 'html',
			success: function(data) {
				$('.article').html(data);
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 실패: ', status, error);
			}
		});
	});
});
