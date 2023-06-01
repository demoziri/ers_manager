<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/esupporter/css/report.css" rel="stylesheet">
<c:set var="wCode" value="${dataMap.wCode }"/>
<c:set var="memberNameSearchList" value="${dataMap.memberNameSearchList}"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<c:set var="ymd" value="<%=new java.util.Date()%>" />

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>보고서</h1>
	</div>
</div>

<div class="row mb-2">
	<div class="col-12">
		<div class="report-buttons mb-2">
			<button type="button" class="btn btn-secondary" onclick="temporaryStorage();">임시 저장</button>
			<button type="button" class="btn btn-primary" onclick="reportRegist();">제출</button>
		</div>
		<div class="div-gather">
			<table class="tg ">
				<thead>
					<tr>
				    	<th class="tg-aur8 tableHeadFont">보고서 작성일자</th>
				    	<th class="tg-0lax text-center">
				    		<span class="regDate "><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></span>
				    	</th>
				  	</tr>
				</thead>
				<tbody>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">대상자명</td>
				    	<td class="tg-0lax text-center">
					    	<div class="search_container">
								<input onclick="modalopen();" value="" class="searchinput text-center" type="text" id="searchInput" name="name" required>
								<button type="submit" class="search_button">
							    	<i class="fa fa-search mr-1" id="popupBtn"></i>
								</button>
							</div>
							<div id="modalWrap">
								<div id="modalContent">
									<div id="modalBody">
										<span id="closeBtn">&times;</span>
										<!--모달창  -->
										<div class="callist">
											<div class="row">
												<div class="col-12">
													<h3 class="caltitle mt-2">대상자 이름조회</h3>
												</div>
											</div>
											<form id="searchForm">
												<table class="tg table table_list" style="table-layout: fixed; width: 100%;">
													<colgroup>
															<col style="width: 150.333333px">
															<col style="width: 300px">
													</colgroup>
													<tr>
														<th class="tg-l8qj">
															<select class="form-control" style="font-size: 1.5rem; height: auto;" name="searchType" id="searchType">
																<option value="nbg" ${cri.searchType=='nbg' ? "selected":"" }>전체</option>
																<option value="n" ${cri.searchType=='n' ? "selected":"" }>대상자명</option>
																<option value="b" ${cri.searchType=='b' ? "selected":"" }>나이</option>
																<option value="g" ${cri.searchType=='g' ? "selected":"" }>성별</option>
															</select>
														</th>
														<th class="tg-l8qj">
															<div class="search_container flex">
																<input onclick="modalopen();" value="" class="searchinput w-full" type="text" id="mSearchinput" name="keyword" required>
																<button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
																	<i class="fa fa-search" id="mSearch"></i>
																</button>
															</div>
														</th>
													</tr>
													</tbody>
												</table>
											</form>

											<div class="row">
												<div class="col-12">
													<table class="tg searchlist" id="modalTable" style="table-layout: fixed;">
														<colgroup>
															<col style="width: 100px">
															<col style="width: 100.333333px">
															<col style="width: 70.333333px">
															<col style="width: 70.333333px">
														</colgroup>
														<thead>
															<tr>
																<th class="tg-uqo3">이미지</th>
																<th class="tg-2xpi">대상자명</th>
																<th class="tg-2xpi">성별</th>
																<th class="tg-uqo3">나이</th>
															</tr>
														</thead>
														<c:forEach var="member" items="${memberNameSearchList }">
															<tbody>
																<tr>
																	<td style="display: none" class="modal_content" id="memberid">
																		<input type="hidden" class="member-id" value="${member.id}" />
																	</td>
																	<td class="modal_content">${member.picture }</td>
																	<td class="modal_content" id="modalname">${member.name }</td>
																	<td class="modal_content">${member.gender }</td>
																	<td class="modal_content">${member.birth }</td>
																</tr>
															</tbody>
														</c:forEach>
													</table>
													<%@include file="../include/esupporter/pagination.jsp"%>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
				    	</td>
				  	</tr>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">처리요원</td>
				    	<td class="tg-0lax text-center">
				    		<input class="tableBodyFont text-center w-full" value="${loginUser.name}" readonly/>
				    	</td>
				  	</tr>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">보고서 구분</td>
				    	<td class="tg-0lax text-center">
				    		<select style="text-align: center;" id="reType" name="reType" class="reportmenu input_date input_borderRadius w-full" onchange="toggleReport(this.value)">
								<option value="====" selected disabled>선택</option>
								<option value="1">응급상황보고서</option>
								<option value="7">장비점검보고서</option>
						    </select>
				    	</td>
				  	</tr>
				  	
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="wrapper">
			<div id="emergencyReport" class="card card-primary report-div" style="display: none;">
				<div class="card-header" id="report-form-1">
					<h3 class="card-title ">응급상황 보고서</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<form id="sendForm1" action="report" method="post">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="wCode" value="${wCode}">
						<input type="hidden" name="reType" value="1">
						<input type="hidden" name="reDone" value="">
						<input type="hidden" name="viewCheck" value="0">
						<table class="tg">
							<thead>
								<tr>
							    	<th class="tg-aur8 tableHeadFont">전화유무</th>
							    	<th class="tg-0lax">
							    		<input class="tableBodyFont" type="radio" name="callCheck" value="Y" > <label>전화 함</label>
										<input class="tableBodyFont" type="radio" name="callCheck" value="N" > <label>전화 안함</label>
							    	</th>
							  	</tr>
							</thead>
							<tbody>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">발생구분</td>
							    	<td class="tg-0lax">
							    		<input class="tableBodyFont" type="radio" name="occurType" value="1"> <label>응급</label>
							    		<input class="tableBodyFont" type="radio" name="occurType" value="2"> <label>119</label>
							    		<input class="tableBodyFont" type="radio" name="occurType" value="3"> <label>화재</label>
							    	</td>
							  	</tr>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">처리내용</td>
							    	<td class="tg-0lax">
							    		<textarea name="content" class="tableBodyFont" rows="" cols="">
	
										</textarea>
							    	</td>
							  	</tr>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">파일첨부</td>
							    	<td class="tg-0lax"></td>
							  	</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="wrapper">
			<div id="equipmentReport" class="card card-primary report-div" style="display: none;">
				<div class="card-header" id="report-form-7">
					<h3 class="card-title">장비점검 보고서</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<form id="sendForm7" action="report" method="post">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="wCode" value="${wCode}">
						<input type="hidden" name="reType" value="7">
						<input type="hidden" name="reDone" value="">
						<input type="hidden" name="viewCheck" value="0">
						<table class="table">
							<tbody>
								<tr>
								    <th class="tableHeadFont">게이트웨이</th>
								    <td>
								        <input type="radio" name="gateway" value="정상" onclick="showTextarea('gateway', this)" /> <label>정상</label>
								        <input type="radio" name="gateway" value="고장" onclick="showTextarea('gateway', this)" /> <label>고장</label>
								        <input type="radio" name="gateway" value="미수신" onclick="showTextarea('gateway', this)" /> <label>미수신</label>
								        <input type="radio" name="gateway" value="배터리 부족" onclick="showTextarea('gateway', this)" /> <label>배터리 부족</label>
								    </td>
								</tr>
								<tr id="gateway-details" style="display: none;">
								    <th class="tableHeadFont">처리내용</th>
								    <td>
								        <textarea id="gateway-details-input" name="content" rows="" cols=""></textarea>
								    </td>
								</tr>
								<tr>
								    <th class="tableHeadFont">화재감지기</th>
								    <td>
								        <input type="radio" name="fireAlarm" value="정상" onclick="showTextarea('fireAlarm', this)" /> <label>정상</label>
								        <input type="radio" name="fireAlarm" value="고장" onclick="showTextarea('fireAlarm', this)" /> <label>고장</label>
								        <input type="radio" name="fireAlarm" value="미수신" onclick="showTextarea('fireAlarm', this)" /> <label>미수신</label>
								        <input type="radio" name="fireAlarm" value="배터리 부족" onclick="showTextarea('fireAlarm', this)" /> <label>배터리 부족</label>
								    </td>
								</tr>
								<tr id="fireAlarm-details" style="display: none;">
								    <th class="tableHeadFont">처리내용</th>
								    <td>
								        <textarea id="fireAlarm-details-input" name="content" rows="" cols=""></textarea>
								    </td>
								</tr>
								<tr>
								    <th class="tableHeadFont">활동감지기</th>
								    <td>
								        <input type="radio" name="motionSensor" value="정상" onclick="showTextarea('motionSensor', this)" /> <label>정상</label>
								        <input type="radio" name="motionSensor" value="고장" onclick="showTextarea('motionSensor', this)" /> <label>고장</label>
								        <input type="radio" name="motionSensor" value="미수신" onclick="showTextarea('motionSensor', this)" /> <label>미수신</label>
								        <input type="radio" name="motionSensor" value="배터리 부족" onclick="showTextarea('motionSensor', this)" /> <label>배터리 부족</label>
								    </td>
								</tr>
								<tr id="motionSensor-details" style="display: none;">
								    <th class="tableHeadFont">처리내용</th>
								    <td>
								        <textarea id="motionSensor-details-input" name="content" rows="" cols=""></textarea>
								    </td>
								</tr>
								<tr>
								    <th class="tableHeadFont">출입문감지기</th>
								    <td>
								        <input type="radio" name="doorSensor" value="정상" onclick="showTextarea('doorSensor', this)" /> <label>정상</label>
								        <input type="radio" name="doorSensor" value="고장" onclick="showTextarea('doorSensor', this)" /> <label>고장</label>
								        <input type="radio" name="doorSensor" value="미수신" onclick="showTextarea('doorSensor', this)" /> <label>미수신</label>
								        <input type="radio" name="doorSensor" value="배터리 부족" onclick="showTextarea('doorSensor', this)" /> <label>배터리 부족</label>
								    </td>
								</tr>
								<tr id="doorSensor-details" style="display: none;">
								    <th class="tableHeadFont">처리내용</th>
								    <td>
								        <textarea id="doorSensor-details-input" name="content" rows="" cols=""></textarea>
								    </td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div style="height: 300px;"></div>

<script>
	
	function showTextarea(device, radio) {
	    var value = $(radio).val();
	    var detailsInput = $('#' + device + '-details');
	
	    if (value === '고장' || value === '미수신' || value === '배터리 부족') {
	        detailsInput.show();
	    } else {
	        detailsInput.hide();
	    }
	}
	
	function toggleReport(value) {
	    var emergencyReport = document.getElementById("emergencyReport");
	    var equipmentReport = document.getElementById("equipmentReport");

	    if (value === "1") {
	      emergencyReport.style.display = "block";
	      equipmentReport.style.display = "none";
	    } else if (value === "7") {
	      emergencyReport.style.display = "none";
	      equipmentReport.style.display = "block";
	    } else {
	      emergencyReport.style.display = "none";
	      equipmentReport.style.display = "none";
	    }
	  }
	
	var replyValue = null;
	$(document).ready(function() {
		
		$("#reType").change(function() {
			
			var selectedValue = $(this).val();
			replyValue = selectedValue;
			var selectedForm = $('#sendForm' + selectedValue);
			
			// 이전에 작성한 보고서 내용 초기화
			selectedForm.find('textarea[name="content"]').val('');
			selectedForm.find('input[name="uploadFile"]').val('');
			selectedForm.find('input[name="callCheck"]').prop('checked', false);
			selectedForm.find('input[name="occurType"]').prop('checked', false);
			
			// 초기화되지 않은 radio input 요소의 선택 해제
		    selectedForm.find('input[type="radio"][name="gateway"]:checked').prop('checked', false);
		    selectedForm.find('input[type="radio"][name="fireAlarm"]:checked').prop('checked', false);
		    selectedForm.find('input[type="radio"][name="motionSensor"]:checked').prop('checked', false);
		    selectedForm.find('input[type="radio"][name="doorSensor"]:checked').prop('checked', false);
			
		    selectedForm.find('#gateway-details').hide();
		    selectedForm.find('#fireAlarm-details').hide();
		    selectedForm.find('#motionSensor-details').hide();
		    selectedForm.find('#doorSensor-details').hide();
		    
		});
		
	});
	
	function temporaryStorage() {
		
		if($('#reType').val() == '===='){
			Swal.fire({
				icon : 'error',
				title : '보고서 구분',
				text : '보고서 구분을 선택해주세요.',
			});
			$('#reType').focus();
			return false;
		}
		
		if(replyValue == "1"){
			var form = $('#sendForm'+replyValue);
			
			if($('input[name="id"]').val().trim() == null){
				Swal.fire({
					icon : 'error',
					title : '대상자명',
					text : '대상자를 넣어주세요.',
				});
				$('#searchInput').focus();
				return false;
			}
			
			if(!$('input[name="callCheck"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '전화 유무',
					text : '전화 유무를 선택해 주세요',
				});
				$('input[name="callCheck"]').focus();
				return false;
			}
			
			if(!$('input[name="occurType"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '발생 구분',
					text : '발생 구분을 선택해주세요.',
				});
				$('input[name="callCheck"]').focus();
				return false;
			}
			
			if($('textarea[name="content"]').val().trim() == ''){
				Swal.fire({
					icon : 'error',
					title : '처리 내용',
					text : '처리 내용을 적어 주세요.',
				});
				$('textarea[name="content"]').focus();
				return false;
			}
			
			$('input[name=reDone]').val('0');
			Swal.fire({
				icon : 'success',
				title : '임시저장',
				text : '정말로 임시저장 하시겠습니까?',
				showCancelButton: true,
		        confirmButtonColor: '#eb0b0b',
		        cancelButtonColor: '#e0e0e0',
		        confirmButtonText: 'YES',
		        cancelButtonText: 'NO',
		        reverseButtons: false
			}).then((result) => {
		          if (result.value) {
			          /* "YES" 클릭 시 로직 */
		        	  form.submit();
			          return false;
			      } else {
			           return false;
			      }
			});
		}
		
		if(replyValue == "7"){
			var form = $('#sendForm'+replyValue);
			
			if(!$('input[name="gateway"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '게이트웨이 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="gateway"]').focus();
				return false;
			}
			
			if (($('input[name="gateway"]:checked').val() === '고장' || $('input[name="gateway"]:checked').val() === '미수신' 
				|| $('input[name="gateway"]:checked').val() === '배터리 부족') && $('#gateway-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '게이트웨이',
					text : '처리내용을 적어주세요.',
				});
				$('#gateway-details-input').focus();
				return false;
			}
			
			if(!$('input[name="fireAlarm"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '화재감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="fireAlarm"]').focus();
				return false;
			}
			
			if (($('input[name="fireAlarm"]:checked').val() === '고장' || $('input[name="fireAlarm"]:checked').val() === '미수신'
				|| $('input[name="fireAlarm"]:checked').val() === '배터리 부족') && $('#fireAlarm-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '화재감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#fireAlarm-details-input').focus();
				return false;
			}
			
			if(!$('input[name="motionSensor"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '활동감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="motionSensor"]').focus();
				return false;
			}
			
			if (($('input[name="motionSensor"]:checked').val() === '고장' || $('input[name="motionSensor"]:checked').val() === '미수신'
				|| $('input[name="motionSensor"]:checked').val() === '배터리 부족') && $('#motionSensor-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '활동감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#motionSensor-details-input').focus();
				return false;
			}
			
			if(!$('input[name="doorSensor"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '출입문 감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="doorSensor"]').focus();
				return false;
			}
			
			if (($('input[name="doorSensor"]:checked').val() === '고장' || $('input[name="doorSensor"]:checked').val() === '미수신'
				|| $('input[name="doorSensor"]:checked').val() === '배터리 부족') && $('#doorSensor-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '출입문 감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#doorSensor-details-input').focus();
				return false;
			}
			
			$('input[name=reDone]').val('0');
			Swal.fire({
				icon : 'success',
				title : '임시저장',
				text : '정말로 임시저장 하시겠습니까?',
				showCancelButton: true,
		        confirmButtonColor: '#eb0b0b',
		        cancelButtonColor: '#e0e0e0',
		        confirmButtonText: 'YES',
		        cancelButtonText: 'NO',
		        reverseButtons: false
			}).then((result) => {
		          if (result.value) {
			          /* "YES" 클릭 시 로직 */
		        	  form.submit();
			      } else {
			           return false;
			      }
			});
		}
	}
	
	function reportRegist() {
		
		if($('#reType').val() == '===='){
			Swal.fire({
				icon : 'error',
				title : '보고서 구분',
				text : '보고서 구분이 선택 되지 않았습니다. 보고서 구분을 선택해주세요.',
			});
			$('#reType').focus();
			return false;
		}
		
		if(replyValue == "1"){
			
			var form = $('#sendForm'+replyValue);
			
			if($('input[name="id"]').val().trim() == null){
				Swal.fire({
					icon : 'error',
					title : '대상자명',
					text : '대상자를 넣어주세요.',
				});
				$('#searchInput').focus();
				return false;
			}
			
			if(!$('input[name="callCheck"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '전화 유무',
					text : '전화 유무를 선택해 주세요',
				});
				$('input[name="callCheck"]').focus();
				return false;
			}
			
			if(!$('input[name="occurType"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '발생 구분',
					text : '발생 구분을 선택해주세요.',
				});
				$('input[name="callCheck"]').focus();
				return false;
			}
			
			if($('textarea[name="content"]').val().trim() == ''){
				Swal.fire({
					icon : 'error',
					title : '처리 내용',
					text : '처리 내용을 적어 주세요.',
				});
				$('textarea[name="content"]').focus();
				return false;
			}
			
			$('input[name=reDone]').val('1');
			Swal.fire({
				icon : 'success',
				title : '제출',
				text : '정말로 제출 하시겠습니까?',
				showCancelButton: true,
		        confirmButtonColor: '#eb0b0b',
		        cancelButtonColor: '#e0e0e0',
		        confirmButtonText: 'YES',
		        cancelButtonText: 'NO',
		        reverseButtons: false
			}).then((result) => {
		          if (result.value) {
			          /* "YES" 클릭 시 로직 */
		        	  form.submit();
			      } else {
			           return false;
			      }
			});
		}
		
		if(replyValue == "7"){
			
			var form = $('#sendForm'+replyValue);
			
			if(!$('input[name="gateway"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '게이트웨이 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="gateway"]').focus();
				return false;
			}
			
			if (($('input[name="gateway"]:checked').val() === '고장' || $('input[name="gateway"]:checked').val() === '미수신' 
				|| $('input[name="gateway"]:checked').val() === '배터리 부족') && $('#gateway-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '게이트웨이',
					text : '처리내용을 적어주세요.',
				});
				$('#gateway-details-input').focus();
				return false;
			}
			
			if(!$('input[name="fireAlarm"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '화재감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="fireAlarm"]').focus();
				return false;
			}
			
			if (($('input[name="fireAlarm"]:checked').val() === '고장' || $('input[name="fireAlarm"]:checked').val() === '미수신'
				|| $('input[name="fireAlarm"]:checked').val() === '배터리 부족') && $('#fireAlarm-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '화재감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#fireAlarm-details-input').focus();
				return false;
			}
			
			if(!$('input[name="motionSensor"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '활동감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="motionSensor"]').focus();
				return false;
			}
			
			if (($('input[name="motionSensor"]:checked').val() === '고장' || $('input[name="motionSensor"]:checked').val() === '미수신'
				|| $('input[name="motionSensor"]:checked').val() === '배터리 부족') && $('#motionSensor-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '활동감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#motionSensor-details-input').focus();
				return false;
			}
			
			if(!$('input[name="doorSensor"]:checked').val()){
				Swal.fire({
					icon : 'error',
					title : '출입문 감지기 ',
					text : '상태를 선택해주세요.',
				});
				$('input[name="doorSensor"]').focus();
				return false;
			}
			
			if (($('input[name="doorSensor"]:checked').val() === '고장' || $('input[name="doorSensor"]:checked').val() === '미수신'
				|| $('input[name="doorSensor"]:checked').val() === '배터리 부족') && $('#doorSensor-details-input').val().trim() == '') {
				Swal.fire({
					icon : 'error',
					title : '출입문 감지기',
					text : '처리내용을 적어주세요.',
				});
				$('#doorSensor-details-input').focus();
				return false;
			}
			
			$('input[name=reDone]').val('1');
			Swal.fire({
				icon : 'success',
				title : '제출',
				text : '정말로 제출 하시겠습니까?',
				showCancelButton: true,
		        confirmButtonColor: '#eb0b0b',
		        cancelButtonColor: '#e0e0e0',
		        confirmButtonText: 'YES',
		        cancelButtonText: 'NO',
		        reverseButtons: false
			}).then((result) => {
		          if (result.value) {
			          /* "YES" 클릭 시 로직 */
		        	  form.submit();
			      } else {
			           return false;
			      }
			});
			
		}
	}
	
	const btn = document.getElementById('popupBtn');
	const modal = document.getElementById('modalWrap');
	const closeBtn = document.getElementById('closeBtn');

	btn.onclick = function() {
	  modal.style.display = 'block';
	}

	closeBtn.onclick = function() {
	  modal.style.display = 'none';
	}

	window.onclick = function(event) {
	  if (event.target === modal) {
	    modal.style.display = 'none';
	  }
	}

	function modalopen() {
	  modal.style.display = 'block';
	}

	modal.style.display = 'none';
	
	$(document).ready(function() {
		// .modal_content 클릭 이벤트 처리
		$(document).on('click', '.modal_content', function() {
		    const modalname = $(this).text().trim();
		    $('#searchInput').val(modalname);
		    $('#modalWrap').hide();
		    
		});
		
		// .modal_content#modalname 클릭 이벤트 처리
		$(document).on('click', '.modal_content#modalname', function() {
			var memberId = $(this).closest('tr').find('.member-id').val();
		    var memberName = $(this).text();
		    $('input[name="id"]').val(memberId);
		    
		    const modalname = $(this).text().trim();
		    $('#searchInput').val(modalname);
		    $('#modalWrap').hide();
		});
	});
	
	
	
	$(document).ready(function() {
		
		// 돋보기 아이콘 클릭 이벤트 처리
		$('#mSearch').click(function() {
			var data = {
					"searchType" : $("#searchType").val(),
					"keyword" : $('#mSearchinput').val(),
					"perPageNum" : 5,
					"page" : 1
			}
			
		    // 검색 수행
		    if($('#mSearchinput').val().trim() !== ''){
			    performSearch(data);
		    }
			
			// 입력된 키워드를 name="keyword"에 설정
		    $('#mSearchinput').val(keyword);
		});

	});
		
	function performSearch(data) {
		  $.ajax({
		    url: '/ers/esupporter/memberSearch',
		    method: 'GET',
		    data: data,
		    dataType: 'json',
		    async: true,
		    contentType: 'application/json',
		    success: function(response) {
		      var table = $('.searchlist');
		      table.find('tbody').empty();

		      $.each(response.memberList, function(index, member) {
		        var row = '<tr>' +
		          '<td class="modal_content">' + member.picture + '</td>' +
		          '<td class="modal_content">' + member.name + '</td>' +
		          '<td class="modal_content">' + member.gender + '</td>' +
		          '<td class="modal_content">' + member.birth + '</td>' +
		          '</tr>';
		        table.find('tbody').append(row);

		        // Add an attribute to the row for easy access to the member ID
		        var lastRow = table.find('tbody tr:last-child');
		        lastRow.attr('data-member-id', member.id);
		      });

		      modal.style.display = 'block';
		    },
		    error: function(xhr, status, error) {
		      console.error(error);
		    }
		  });
		}
</script>

<%@include file="../include/esupporter/foot.jspf"%>