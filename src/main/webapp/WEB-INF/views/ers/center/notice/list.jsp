<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<c:set var="noticeList" value="${dataMap.noticeList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri}"/>
<div style="height: 100%; overflow-y: auto;">
	<div class="pt-2 pb-2 pr-5 pl-5">
		<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-note-sticky dashboard_icon pr-2"></i>
				공지사항
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span class="pt-1"
				onclick="location.href='../main'">◀뒤로가기</span>
		</div>
	</div>
	<div class="row pt-2">
		<div class="col-12">
			<div class="mb-2">
				<div class="float-right mb-2">
					<div class="d-inline-block">
						<select name="searchType">
							<option value="">--전체--</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected' : '' }>제목</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected' : '' }>내용</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected' : '' }>작성자</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected' : '' }>제목+내용</option>
						</select>
					</div>
					<input type="hidden" id="perPageNum" value="10"/>
					<div class="d-inline-block mr-1" style="width:15rem;">
						<input type="text" name="keyword" value="${cri.keyword}" class="w-100" onkeyup="if(window.event.keyCode==13){list_go()}"/>
					</div>
					<i class="fa-solid fa-magnifying-glass" onclick="javascript:list_go(${cri.page});"></i>
				</div>
			</div>
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="12%">
					<col>
					<col width="16%">
					<col width="16%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">글 번호</th>
						<th class="text-center pt-1 pb-1">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">등록일</th>
					</tr>
					<tbody style=" cursor: pointer;">
					<c:forEach var="notice" items="${noticeList }" varStatus="status">
					<fmt:formatDate value="${notice.regDate}" var="regDate" pattern="yyyy-MM-dd"/>
						<tr style="font-size: 0.73rem; font-weight: bold;" class="${status.index % 2 eq '0' ? 'bg-skyblue' : ''}" onclick="popOpen('${notice.nno}');">
							<th class="text-center pt-2 pb-2">${notice.nno }</th>
							<td class="pl-3 py-1 text-over-none">${notice.title}</td>
							<td class="text-center">${notice.name }</td>
							<td class="text-center">${regDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>	
	</div>
	<div>
	<%@ include file="/WEB-INF/views/module/centerPagination.jsp" %>
	</div>
</div>
<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width:800px;">
	<div class="modal-content">
	<div class="modal-header bg-info p-1">
	<h4 class="modal-title pl-2">ERS</h4><h4 class="modal-title m-auto modal-title-right">10번 공지사항</h4>
	<button type="button" class="close ml-0" data-dismiss="modal" aria-label="Close" onClick="javascript:popClose();">
	<span aria-hidden="true">×</span>
	</button>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-12">
				<div class="row my-1">
					<div class="col-3 modal-content-title">제목</div>
					<div class="col-9 modal-content-content justify-content-start" id="m_title"></div>
				</div>
				<div class="row my-1">
					<div class="col-3 modal-content-title">작성자</div>
					<div class="col-3 modal-content-content" id="m_writer"></div>
					<div class="col-3 modal-content-title">등록일</div>
					<div class="col-3 modal-content-content" id="m_date"></div>
				</div>
			</div>		
		</div>
		<div class="row">
			<div class="col-12 p-0">
				<div class="modal-textarea" id="m_content" style="height:300px;">
					22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer justify-content-center">
	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="popClose()">확인</button>
	</div>
	</div>
</div>

<script>
function popOpen(nno) {
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 
	
    $.ajax({
    	url:'detail',
    	method:'get',
    	data:"nno="+nno,
    	contentType:'application/json',
    	success:function(data){
    		$('#m_title').text(data.title);
    		$('#m_writer').text(data.name);
 
    		var dateObj=new Date(data.regDate);
   			var year=dateObj.getFullYear();
   			var month=dateObj.getMonth()+1;
   			var date=dateObj.getDate();
   			
    		$('#m_date').text(year+"-"+month+"-"+date);
    		$('#m_content').text(data.content);
    	},error:function(error){
			alert(error.status);
		}
    });
    
    
    
    $(modalPop).show();
    $(modalBg).show();

}

 function popClose() {
   var modalPop = $('.modal_wrap');
   var modalBg = $('.modal_bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
</script>
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>