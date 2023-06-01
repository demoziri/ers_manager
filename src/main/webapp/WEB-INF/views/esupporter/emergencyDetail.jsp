<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/esupporter/css/emergencyDetail.css" rel="stylesheet">

<div>

	<div class="row">
		<div class="title_name text--center mt-3">
			<h1>응급상황보고서</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="buttons mb-1">
				<button type="button" id="" class="btn btn-dark button-left" >뒤로가기</button>
				<button type="button" id="" class="btn bg-green" onclick="location.href='/ers/esupporter/reportForm?afterUrl=2&rNo=${emergencyReport.RNo}'">수정</button>
				<button type="button" id="" class="btn btn-primary" onclick="location.href='/ers/esupporter/reportForm?afterUrl=2'">등록</button>
			</div>
		</div>
	</div>

	<!-- Main content -->
	<section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-body">
						<div class="row">
							<div class="form-group col-sm-4">
								<label class="text_label" for="">대상자명</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="${emergencyReport.name}" />
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">전화유무</label>
								<c:if test="${emergencyReport.callCheck eq 'Y'}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="전화함" />
								</c:if>
								<c:if test="${emergencyReport.callCheck eq 'N'}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="전화안함" />
								</c:if>
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">상황일자</label>
								<fmt:formatDate var="occurTime" value="${emergencyReport.occurTime}"/>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="${occurTime}" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">대상자 주소</label>
							<div id="content" class="text_input">${emergencyReport.address}</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for=""  class="text_label">보고서 작성 상태</label>
								<c:if test="${emergencyReport.reDone eq 0}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="임시저장" />
								</c:if>
								<c:if test="${emergencyReport.reDone eq 1}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="저장" />
								</c:if>
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">열람여부</label>
								<c:if test="${emergencyReport.viewCheck eq 0}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="열람함" />
								</c:if>
								<c:if test="${emergencyReport.viewCheck ne 0}">
									<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="열람안함" />
								</c:if>
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">파일첨부</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">처리내용</label>
							<div id="" class="text_input"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<div style="height: 450px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>