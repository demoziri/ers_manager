<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	setInterval(() => checkEmergency('${loginUser.wid}'), 3000);
	
	function checkEmergency(depart){
	   
		$.ajax({
			  url: '${pageContext.request.contextPath}/ers/esupporter/checkEmergency?depart=' + depart,
			  success: function(data) {
			    var title = data.title;
			    var message = data.message;
			    var sType = data.sType;
			    var notice = data.notice;
			    if (data.sCode > 0) {
			    	if(notice == null){
			    		var htmlContent = '출동상세화면으로 넘어가시겠습니까?<br>' + message.replace(/(\r\n|\r|\n)/g, '<br>');
			    	}else{
			      		htmlContent = '출동상세화면으로 넘어가시겠습니까?<br>' + message.replace(/(\r\n|\r|\n)/g, '<br>') + '<br>' + notice;
			    	}
			    		
			    	if (sType >= 2 && sType <= 12) {
			        Swal.fire({
			          title: title,
			          html: htmlContent,
			          icon: 'warning',
			          showCancelButton: true,
			          confirmButtonColor: '#eb0b0b',
			          cancelButtonColor: '#e0e0e0',
			          confirmButtonText: 'YES',
			          cancelButtonText: 'NO',
			          reverseButtons: false
			        }).then((result) => {
			          if (result.value) {
			            /* "YES" 클릭 시 로직 */
			            $.ajax({
			              url: '${pageContext.request.contextPath}/ers/esupporter/emergencyUpdate?sCode=' + data.sCode + '&reportCheck=Y'
			            }).done(function() {
			              location.href = "${pageContext.request.contextPath}/ers/esupporter/dispatchDetail?sCode=" + data.sCode;
			            });
			          } else {
			            $.ajax({
			              url: '${pageContext.request.contextPath}/ers/esupporter/emergencyUpdate?sCode=' + data.sCode + '&reportCheck=N'
			            });
			          }
			        });
			      } else {
			        Swal.fire({
			          title: title,
			          html: htmlContent,
			          icon: 'warning',
			          showCancelButton: true,
			          confirmButtonColor: '#eb0b0b',
			          cancelButtonColor: '#e0e0e0',
			          confirmButtonText: 'YES',
			          cancelButtonText: 'NO',
			          reverseButtons: false
			        }).then((result) => {
			          if (result.value) {
			            /* "YES" 클릭 시 로직 */
			            $.ajax({
			              url: '${pageContext.request.contextPath}/ers/esupporter/emergencyUpdate?sCode=' + data.sCode + '&reportCheck=Y'
			            }).done(function() {
			              location.href = "${pageContext.request.contextPath}/ers/esupporter/dispatchDetail?sCode=" + data.sCode;
			            });
			          } else {
			            $.ajax({
			              url: '${pageContext.request.contextPath}/ers/esupporter/emergencyUpdate?sCode=' + data.sCode + '&reportCheck=N'
			            });
			          }
			        });
			      }
			    }
			  },
			  error: function(error) {
			    alert(error);
			  }
			});
	}
</script>
 