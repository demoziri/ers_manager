<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var eStatus = null;
	
	 function updateStatus(status) {
	        $('.header_menu_name').val(status);
	    }
	
	function statusChange(depart){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/ers/esupporter/statusChange?depart=' + depart,
			success: function(data) {
				
				eStatus = data.eStatus;
				
				if (eStatus === '대기중') {
                    $('.status_img').attr('src', '/resources/esupporter/img/대기중.png');
                    $('.status_img').css('width', '40px');
                    $('.status_img').css('height', '40px');
                    $('.status_img').css('margin-top', '9px');
                    $('.status_img').css('margin-bottom', '10px');
                } else if (eStatus === '퇴근') {
                    $('.status_img').attr('src', '/resources/esupporter/img/퇴근.png');
                    $('.status_img').css('width', '40px');
                    $('.status_img').css('height', '40px');
                    $('.status_img').css('margin-top', '15px');
                    $('.status_img').css('margin-bottom', '5px');
                } else if (eStatus === '출동중') {
                    $('.status_img').attr('src', '/resources/esupporter/img/출동중.png');
                    $('.status_img').css('width', '55px');
                    $('.status_img').css('height', '55px');
                    $('.status_img').css('margin-top', '2px');
                    $('.status_img').css('margin-bottom', '2px');
                }
				
				updateStatus(eStatus);
			}
		})
	}
	
	setInterval(() => statusChange('${loginUser.wid}'), 500);
</script>