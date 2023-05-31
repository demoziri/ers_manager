<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="emanagerList" value="${dataMap.emanagerList}"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri}"/>
<div style="height: 100%;">
	<div class="pt-2 pb-2 pr-5 pl-5">
		<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-users dashboard_icon pr-2"></i>
				응급관리요원
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
						 <select name="select_gu" onchange="javascript:elist_go(1,null);" style="height:100%;width:100px;">
				            <option value="">--전체--</option>
				            <option value="서구" ${param.gu eq '서구' ? 'selected' : ""}>서구</option>
				            <option value="중구" ${param.gu eq '중구' ? 'selected' : ""}>중구</option>
				            <option value="동구" ${param.gu eq '동구' ? 'selected' : ""}>동구</option>
				            <option value="대덕구" ${param.gu eq '대덕구' ? 'selected' : ""}>대덕구</option>
				            <option value="유성구" ${param.gu eq '유성구' ? 'selected' : ""}>유성구</option>
				          </select>
					</div>
					<div class="d-inline-block">
						<select name="select_dong" id="dongList" onchange="javascript:elist_go(1,null);" style="height:100%;width:100px;">
						<option value="" selected="selected">전체</option>
						<c:forEach var="dong" items="${dongList}">
							<option value="${dong.dongName }" ${param.dong eq dong.dongName ? 'selected' : ''}>${dong.dongName}</option>
						</c:forEach>
						</select>
					</div>
					<div class="d-inline-block">
						<select name="select_status" onchange="javascript:elist_go(1,null);">
							<option value="">--전체--</option>
							<option value="출동중" ${param.status eq '출동중' ? 'selected' : ''}>출동중</option>
							<option value="대기중" ${param.status eq '대기중' ? 'selected' : ''}>대기중</option>
							<option value="퇴근" ${param.status eq '퇴근' ? 'selected' : ''}>퇴근</option>
						</select>
					</div>
					<div class="d-inline-block mx-3" style="width:15rem;">
						<input type="text" name="keyword" placeholder="응급요원이름을 입력하세요." value="${cri.keyword}" class="w-100" onkeyup="if(window.event.keyCode==13){elist_go(1,null);}"/>
					</div>
					<i class="fa-solid fa-magnifying-glass" onclick="javascript:elist_go(1,null);"></i>
					<input type="hidden" id="perPageNum" value="8"/>
					<input type="hidden" id="gubunVal" value="center_emanager"/>
				</div>
			</div>
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="16%">
					<col>
					<col width="20%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">응급관리요원 사진</th>
						<th class="text-center pt-1 pb-1">이름</th>
						<th class="text-center">지역구</th>
						<th class="text-center">수행기관</th>
						<th class="text-center">현재 상태</th>
					</tr>
					<tbody style=" cursor: pointer;">
					<c:forEach var="emanager" items="${emanagerList }" varStatus="status">
					
						<tr style="font-size: 0.73rem; font-weight: bold;" class="${status.index % 2 eq '0' ? 'bg-skyblue' : ''}" onclick="popOpen('${emanager.wcode}');">
							<th class="text-center">
								<span class="centerEmanagerPictureThumb mx-auto" data-id="${emanager.wcode}" style="display:block;width:50px;height:50px;"></span>
							</th>
							<td class="py-1 text-center">${emanager.e_name }</td>
							<td class="text-center py-2">${emanager.l_name}</td>
							<td class="text-center">${emanager.c_name}</td>
							<td class="text-center ${emanager.status eq '대기중' ? 'text-green' : emanager.status eq '출동중' ? 'text-red' : ''}">${emanager.status}</td>
						</tr>
					</c:forEach>
					<c:if test="${emanagerList eq null || emanagerList.size() eq 0}">
					<tr style="font-size: 0.73rem; font-weight: bold; cursor: default;">
						<th colspan="5" class="text-center pt-2 pb-2">조회된 응급관리요원이 없습니다.</th>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>	
	</div>
	<%@ include file="/WEB-INF/views/module/centerPagination.jsp" %>
</div>

<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width:800px;">
	<div class="modal-content">
	<div class="modal-header bg-info p-1">
	<h4 class="modal-title pl-2">ERS</h4><h4 class="modal-title m-auto modal-title-right">응급관리요원 상세보기</h4>
	<button type="button" class="close ml-0" data-dismiss="modal" aria-label="Close" onClick="javascript:popClose();">
	<span aria-hidden="true">×</span>
	</button>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-6 h-100">
					<div class="d-flex justify-content-center align-items-center"style="height:270px; width:100%;">
						<span id="detail_picture" style="width: 70%; height:100%">
						
						</span>
					</div>
			</div>
			<div class="col-6">
				<div class="row my-1">
					<div class="col-6 modal-content-title">이름</div>
					<div class="col-6 modal-content-content" id="detail_name"></div>
				</div>
				<div class="row my-2">
					<div class="col-6 modal-content-title">지역구</div>
					<div class="col-6 modal-content-content" id="detail_l_name"></div>
				</div>
				<div class="row my-2">
					<div class="col-6 modal-content-title">수행기관</div>
					<div class="col-6 modal-content-content" id="detail_c_name"></div>
				</div>
				<div class="row my-2">
					<div class="col-6 modal-content-title">전화번호</div>
					<div class="col-6 modal-content-content" id="detail_phone"></div>
				</div>
				<div class="row my-2">
					<div class="col-6 modal-content-title">현재상태</div>
					<div class="col-6 modal-content-content" id="detail_status"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer justify-content-center">
	<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="javascript:popClose();">확인</button>
	</div>
	</div>
</div>
<script>
function popOpen(wcode) {
	
	 $.ajax({
	    	url:'detail',
	    	method:'get',
	    	data:"wcode="+wcode,
	    	contentType:'application/json',
	    	success:function(data){
	    		$('#detail_name').text(data.e_name);
	    		$('#detail_l_name').text(data.l_name);
	    		$('#detail_c_name').text(data.c_name);
	    		$('#detail_phone').text(data.phone);
	    		$('#detail_status').text(data.status);
	    		if(data.status == '대기중'){
	    			$('#detail_status').addClass('text-green');
	    		}
	    		if(data.status == '출동중'){
	    			$('#detail_status').addClass('text-red');
	    		}
	    		
	    		var target = document.getElementById('detail_picture');
	    		console.log(target);
	    		target.style.backgroundImage="url('/ers/center/emanager/getPicture?wcode="+data.wcode+"')";
	    		target.style.backgroundPosition="center";
	    		target.style.backgroundRepeat="no-repeat";
	    		target.style.backgroundSize="cover";
	    		
	    	},error:function(error){
				alert(error.status);
			}
	    });
	
	 
	 
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 

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
<script>

	
function elist_go(page,url){
	if(!url) url="list";
	if(!page) page = 1;
	$("form#jobForm input[name='page']").val(page);
	$("form#jobForm input[name='perPageNum']").val($('#perPageNum').val());
	$("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
	$("form#jobForm input[name='keyword']").val($('input[name="keyword"]').val());
	$("form#jobForm input[name='gu']").val($('select[name="select_gu"]').val());
	$("form#jobForm input[name='dong']").val($('select[name="select_dong"]').val());
	$("form#jobForm input[name='status']").val($('select[name="select_status"]').val());
	$('form#jobForm').attr({
		action:url,
		method:'get'
	}).submit();
}

window.onload=function(){
	CenterEmanagerPictureThumb('${pageContext.request.contextPath}');
}

</script>
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>
