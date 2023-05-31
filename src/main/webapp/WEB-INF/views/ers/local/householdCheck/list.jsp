<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="height: 100%; overflow-y: auto;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-house dashboard_icon pr-2"></i>
				점검대상가구
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
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="12%">
					<col width="12%">
					<col>
					<col width="20%">
					<col width="20%">
				</colgroup>
					<tr class="btn-danger active">
						<th class="text-center">점검 번호</th>
						<th class="text-center pt-1 pb-1">대상자 이름</th>
						<th class="text-center">주소</th>
						<th class="text-center">점검 장비</th>
						<th class="text-center">점검분류</th>
					</tr>
					<tbody>
					<c:forEach var="household" items="${householdList }" varStatus="status">
					<fmt:formatDate value="${household.unconnectTime}" pattern="yyyy-MM-dd" var="uctime1"/>
					<fmt:formatDate value="${household.unconnectTime}" pattern="HH:mm:ss" var="uctime2"/>
					<tr style="font-size: 0.73rem; font-weight: bold; cursor: pointer;" onclick="popOpen('${status.index}','${uctime1}','${uctime2}','${household.id }','${household.ma_name }','${household.mstatus }')">
						<td class="text-center">${status.index+1}</td>
						<th class="text-center pt-2 pb-2">${household.m_name}</th>
						<td class="pl-2">${household.address}</td>
						<td class="text-center">${household.ma_name}</td>
						<td class="text-center">${household.mstatus}</td>
					</tr>
					</c:forEach>
					<c:if test="${householdList eq null || householdList.size() eq 0 }">
					<tr>
						<td colspan="4" class="text-center py-2" style="font-size: 1rem;">점검대상 가구가 없습니다.</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width:900px;">
	<div class="modal-content">
	<div class="modal-header bg-info p-1">
	<h4 class="modal-title pl-2">ERS</h4><h4 class="modal-title m-auto modal-title-right">점검대상 가구</h4>
	<button type="button" class="close ml-0" data-dismiss="modal" aria-label="Close" onClick="javascript:popClose();">
	<span aria-hidden="true">×</span>
	</button>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-12">
				<div class="row my-1">
					<div class="col-3 modal-content-title">대상자 이름</div>
					<div class="col-3 modal-content-content" id="m_mName"></div>
					<div class="col-3 modal-content-title">전화번호</div>
					<div class="col-3 modal-content-content" id="m_phone"></div>
				</div>
				<div class="row my-1">
					<div class="col-3 modal-content-title">주소</div>
					<div class="col-9 modal-content-content justify-content-start" id="m_address"></div>
				</div>
				<div class="row my-1">
					<div class="col-3 modal-content-title">장비이름</div>
					<div class="col-3 modal-content-content" id="m_maName"></div>
					<div class="col-3 modal-content-title">미수신시간</div>
					<div class="col-3 modal-content-content flex-column">
						<span id="m_time1"></span>
						<span id="m_time2"></span>
					</div>
				</div>
			</div>		
		</div>
		<div class="row">
			<div class="col-12 pt-5">
				--응급관리요원 지정--
			</div>
		</div>
		
		<div class="row my-1">
			<div class="col-3 modal-content-title">수행기관</div>
			<div class="col-3 modal-content-content">
				<select class="w-100 border-0" id="centerList" onchange="javascript:emanagerList_go(this.value);">
					
				</select>
			</div>
			<div class="col-3 modal-content-title">응급요원</div>
			<div class="col-3 modal-content-content">
				<select class="w-100 border-0" id="emanagerList">		
				
				</select>
			</div>
		</div>
	</div>
	<div class="modal-footer justify-content-center">
	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="command_go()">업무지시</button>
	<button type="button" class="btn btn-light" data-dismiss="modal" onclick="popClose()">취소</button>
	</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>    

<script type="text/x-handlebars-template"  id="center-list-template" >
{{#each .}}
	<option value="{{cnum}}" {{cenval c_name }} {{#if bg_color}}style="background-color:#c4f8cd;"{{/if}}>{{c_name}}</option>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="emanager-list-template" >
{{#each .}}
	<option value="{{wcode}}">{{e_name}}</option>
{{/each}}
</script>

<script>
Handlebars.registerHelper({
	"cenval":function(c_name){
		if(c_name == center_val){
		return "selected";			  
			
		}else{
			return null;
		}
		
	}
	 
});
/* Handlebarsfy.registerHelper('test',function(){
	if(emanager_size == '' || emanager_size == 0){
		return false;
	}else{
		return true;
	}
}) */
</script>

<script>
let center_val = '';
let mem_id = '';
let m_name = '';
let m_mstatus = '';
function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	target.html(html);
	
}

function popOpen(index,uctime1, uctime2, id, ma_name, mstatus) {
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 
	mem_id = id;
	m_name = ma_name;
	m_mstatus = mstatus;
    $.ajax({
    	url:"detail?indexNum=" + index,
		method:"get",
		contentType:"application/JSON",
		success:function(map){
			$('#m_mName').text(map.household.m_name);
			$('#m_phone').text(map.household.phone);
			$('#m_address').text(map.household.address);
			$('#m_maName').text(map.household.ma_name);
			center_val = map.center_value;
			printData(map.centerList,$('#centerList'),$('#center-list-template'));
			emanagerList_go(map.center_cnum);
			/* $('#m_time').text(year+"-"+month+"-"+date+"/"+hour); */
			$('#m_time1').text(uctime1);
			$('#m_time2').text(uctime2);
		},error:function(error){
			alert(error);
		}
    })
    
   
    
    $(modalPop).show();
    $(modalBg).show();

}

	function emanagerList_go(cnum){
		$.ajax({
	    	url:"emanagerList?cnum=" + cnum,
			method:"get",
			contentType:"application/JSON",
			success:function(list){
				printData(list,$('#emanagerList'),$('#emanager-list-template'));
				emanager_size = list.length;
				if(emanager_size == '' || emanager_size == 0){
					$('#emanagerList').html('<option selected disabled>대기중인 요원이 없습니다.</option>');
				}
			},error:function(error){
				alert(error);
			}
	    })
	}

function command_go(){
	var wcode = $('#emanagerList').val();
	if(wcode){
		if(confirm("응급 요원을 지정하시겠습니까?")){
			$.ajax({
				url : "commandEmanager?wcode=" + wcode + "&mem_id=" + mem_id + "&m_name=" + m_name + "&mstatus=" + m_mstatus,
				success:function(){
					alert("응급 요원 지정이 완료되었습니다.")
				},error:function(error){
					alert(error);
				}
			})
			setTimeout(function() {	
					history.go(); }, 500);
				
		}else{
			return;
		}
	}else{
		alert("응급요원을 지정해주세요.");
		return;
	}
	
}
	
 function popClose() {
   var modalPop = $('.modal_wrap');
   var modalBg = $('.modal_bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
</script>
<%@ include file="/WEB-INF/views/include/lfooter.jspf"%>