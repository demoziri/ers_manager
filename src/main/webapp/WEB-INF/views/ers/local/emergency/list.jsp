<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="height: 100%; overflow-y: auto;">
	<div class="pt-2 pb-2 pr-5 pl-5">
		<div class="row">
			<div class="col-12">
				<div class="center-header-font">
					<i class="fa-solid fa-truck-medical dashboard_icon pr-2"></i>
					응급발생확인
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<span class="pt-1" onclick="location.href='../main'">◀뒤로가기</span>
			</div>
		</div>
		<div class="row pt-2">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">응급 관리 요원 배정</h3>
					</div>

					<div class="card-body p-0">
						<table class="table table-striped">
						<colgroup>
							<col width="5%">
							<col width="11%">
							<col width="7%">
							<col width="13%">
							<col width="9%">
							<col>
							<col width="13%">
							<col width="15%">
						</colgroup>
							<thead>
								<tr>
									<th>#</th>
									<th>대상자 구분</th>
									<th>이름</th>
									<th>발생시간</th>
									<th class="text-red">발생구분</th>
									<th>주소</th>
									<th>연락처</th>
									<th class="text-center">응급관리요원 배정</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="emergency" items="${emergencyList}" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${emergency.memtype}</td>
									<td>${emergency.m_name}</td>
									<td><fmt:formatDate value="${emergency.occurtime}" pattern="yy-MM-dd HH:MM"/> </td>
									<td class="text-red">${emergency.stype}</td>
									<td class="text-over-none">${emergency.address}</td>
									<td>${emergency.phone}</td>
									<td>
										<button type="button" class="btn btn-block btn-outline-danger m-auto p-0" style="width:50%;" onclick="popOpen('${emergency.address}','${emergency.scode}');">배정</button>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${emergencyList eq null || emergencyList.size() lt 1 }">
								<tr>
									<td colspan="8" class="text-center">응급발생 건수가 없습니다</td>
								</tr>
							</c:if>	
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width: 600px;">
	<div class="modal-content">
		<div class="modal-header bg-info p-1">
			<h4 class="modal-title pl-2">ERS</h4>
			<h4 class="modal-title m-auto modal-title-right">응급관리요원 배정</h4>
			<button type="button" class="close ml-0" data-dismiss="modal"
				aria-label="Close" onClick="javascript:popClose();">
				<span aria-hidden="true">×</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="emergency_modal_col-5-5">
					<div style="height:20%; border-bottom: 1px solid #aba5a5;">
						<div class="text-center font-weight-bolder font-size-1-2rem">${loginManager.depart} 관제센터</div>
						<div class="text-center font-weight-bold">수행기관</div>
					</div>
					<div style="height:80%; overflow-y:auto;" class="card-body">
						<div class="form-group">
						<form id="modal_center_list">
							
						</form>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center align-items-center" style="width:10%;">
				<i class="fa-solid fa-arrow-right make-info-arrow"></i>
				</div>
				<div class="emergency_modal_col-5-5">
					<div style="height:20%; border-bottom: 1px solid #aba5a5;">
						<div class="text-center font-weight-bolder font-size-1-2rem" style="padding-bottom: 1rem;" id="check_center_name"></div>
						<div class="font-size-0-7rem pl-2">총 대기중 <span class="text-red" id="emergenctListCount"></span>명</div>
					</div>
					<div style="height:80%; overflow-y:auto;" class="card-body">
						<div class="form-group">
						<form id="modal_emanager_list">
							
						</form>
						</div>
				</div>
			</div>
		</div>
		<div class="modal-footer justify-content-center">
			<button type="button" class="btn btn-primary" data-dismiss="modal"
				onclick="command_go();">업무지시</button>
			<button type="button" class="btn btn-light" data-dismiss="modal"
				onclick="popClose()">취소</button>
		</div>
	</div>
</div>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="center-list-template">
{{#each .}}
	<div class="custom-control custom-radio">
		<input class="custom-control-input" type="radio" id="{{cnum}}" name="center_names" {{#if checked}}checked="checked"{{/if}} onchange="emanagerList_go('{{cnum}}','{{c_name}}')">
			<label for="{{cnum}}" class="custom-control-label text-center {{#if bg_color}}{{else}}no_exist_center{{/if}}">{{c_name}}</label>
	</div>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="emanager-list-template">
{{#each .}}
	<div class="custom-control custom-radio">
		<input class="custom-control-input" type="radio" id="emanager_{{wcode}}" name="emanager_names" value="{{wcode}}">
			<label for="emanager_{{wcode}}" class="custom-control-label text-center d-flex">{{e_name}}<div class="centerEmanagerPictureThumb d-inline-block ml-2 mb-1" data-id="{{wcode}}" style="width:30px; height:40px;" ></div></label>
	</div>
{{/each}}
</script>

<script>
	let emanager_size = '';
	let scode = '';
	function printData(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		target.html(html);
	}

	function popOpen(address,getScode) {
		var modalPop = $('.modal_wrap');
		var modalBg = $('.modal_bg');
		scode = getScode;
		$.ajax({
			url : "centerList?address=" + address,
			method : "get",
			contentType : "application/JSON",
			success : function(map) {
				printData(map.centerList,$('#modal_center_list'),$('#center-list-template'));
				emanagerList_go(map.center_cnum,map.center_cname);
			},
			error : function(error) {
				alert(error);
			}
		})
		$(modalPop).show();
		$(modalBg).show();

	}

	function emanagerList_go(cnum,cname) {
		$('#check_center_name').text(cname);
		$.ajax({
			url : "emanagerList?cnum=" + cnum,
			method : "get",
			contentType : "application/JSON",
			success : function(list) {
				printData(list, $('#modal_emanager_list'), $('#emanager-list-template'));
				emanager_size = list.length;
				if (emanager_size == '' || emanager_size == 0) {
					$('#modal_emanager_list').html('<div class="text-center" style="font-size: 0.7rem;">조회된 응급관리요원이 없습니다.</div>');
				}
				$('#emergenctListCount').text(emanager_size);
				CenterEmanagerPictureThumb('${pageContext.request.contextPath}');
			},
			error : function(error) {
				alert(error);
			}
		})
	}

	function popClose() {
		var modalPop = $('.modal_wrap');
		var modalBg = $('.modal_bg');

		$(modalPop).hide();
		$(modalBg).hide();

	}
	
	function command_go(){
		var wcode = $("input[type=radio][name=emanager_names]:checked").val();
		if(wcode){
			if(confirm("응급 요원을 지정하시겠습니까?")){
				$.ajax({
					url : "commandEmanager?wcode=" + wcode + "&scode=" + scode,
					success:function(){
						alert("응급 요원 지정이 완료되었습니다.")
					},error:function(error){
						alert(error);
					}
				})
					location.reload();
			}else{
				return;
			}
		}else{
			alert("응급요원을 지정해주세요.");
			return;
		}
	}
</script>
<%@ include file="/WEB-INF/views/include/lfooter.jspf"%>