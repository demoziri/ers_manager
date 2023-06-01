<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/disoatchDetail.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<div class="row">
		<div class="title_name text--center mt-3">
			<h1>출동상세</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="buttons mb-1">
				<button type="button" class="btn btn-dark button-left" onclick="">뒤로가기</button>
				<c:if test="${dispatch.RNo ne null} and ${dispatch.RNo eq 0}">
					<button type="button" class="btn bg-green" onclick="reportyModify('${dispatch.RNo}','${dispatch.name}');">보고서 수정</button>
				</c:if>
				<button type="button" class="btn btn-primary" onclick="reportRegist('${dispatch.id}','${dispatch.name}','${dispatch.SType}');">보고서 등록</button>
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
								<input type="text" class="form-control text_input" id="" readonly value="${dispatch.name}" />
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">상황구분</label>
								<c:if test="${dispatch.SType eq 1}">
									<input type="text" class="form-control text_input" id="" readonly value="응급" />
								</c:if>
								<c:if test="${dispatch.SType eq 2}">
									<input type="text" class="form-control text_input" id="" readonly value="119" />
								</c:if>
								<c:if test="${dispatch.SType eq 3}">
									<input type="text" class="form-control text_input" id="" readonly value="화재" />
								</c:if>
								<c:if test="${dispatch.SType eq 4}">
									<input type="text" class="form-control text_input" id="" readonly value="활동미감지" />
								</c:if>
								<c:if test="${dispatch.SType eq 5}">
									<input type="text" class="form-control text_input" id="" readonly value="장기외출" />
								</c:if>
								<c:if test="${dispatch.SType eq 6}">
									<input type="text" class="form-control text_input" id="" readonly value="게이트웨이 점검" />
								</c:if>
								<c:if test="${dispatch.SType eq 7}">
									<input type="text" class="form-control text_input" id="" readonly value="활동감지기 점검" />
								</c:if>
								<c:if test="${dispatch.SType eq 8}">
									<input type="text" class="form-control text_input" id="" readonly value="출입문감지기 점검" />
								</c:if>
								<c:if test="${dispatch.SType eq 9}">
									<input type="text" class="form-control text_input" id="" readonly value="화재감지기 점검" />
								</c:if>
								<c:if test="${dispatch.SType eq 10}">
									<input type="text" class="form-control text_input" id="" readonly value="연결차단 해제" />
								</c:if>
								<c:if test="${dispatch.SType eq 11}">
									<input type="text" class="form-control text_input" id="" readonly value="장비 회수" />
								</c:if>
								<c:if test="${dispatch.SType eq 12}">
									<input type="text" class="form-control text_input" id="" readonly value="신규가입" />
								</c:if>
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">상황일자</label>
								<input type="text" class="form-control text_input" id="" readonly value="2023-05-04" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">대상자 주소</label>
							<div id="content" class="text_input">${dispatch.address}</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for=""  class="text_label">심장기기 부착여부</label>
								<c:if test="${dispatch.pacemaker eq 'N'}">
									<input type="text" class="form-control text_input" id="" readonly value="부착안함" />
								</c:if>
								<c:if test="${dispatch.pacemaker eq 'Y'}">
									<input type="text" class="form-control text_input" id="" readonly value="부착함" />
								</c:if>
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">보고서 작성 상태</label>
								<c:if test="${dispatch.reDone eq null}">
									<input type="text" class="form-control text_input" id="" readonly value="작성안함" />
								</c:if>
								<c:if test="${dispatch.reDone eq 0}">
									<input type="text" class="form-control text_input" id="" readonly value="임시저장" />
								</c:if>
								<c:if test="${dispatch.reDone ne 0 and dispatch.reDone ne null}">
									<input type="text" class="form-control text_input" id="" readonly value="제출" />
								</c:if>
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">열람여부</label>
								<c:if test="${dispatch.viewCheck eq 0 or dispatch.viewCheck eq null}">
									<input type="text" class="form-control text_input" id="" readonly value="확인안함" />
								</c:if>
								<c:if test="${dispatch.viewCheck ne 0 and dispatch.viewCheck ne null}">
									<input type="text" class="form-control text_input" id="" readonly value="확인함" />
								</c:if>
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">알림 문구</label>
							<c:if test="${dispatch.pacemaker eq 'Y'}">
								<div id="" class="text_input">심장 질환과 기계부착 여부로 인해 CPR기기 사용시 주의 바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 5 }">
								<div id="" class="text_input">외출시간이 초과되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 1 }">
								<div id="" class="text_input">응급상황입니다. 출동바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 2 }">
								<div id="" class="text_input">119 응급상황입니다. 출동바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 3 }">
								<div id="" class="text_input">화재 상황입니다. 연락후 대상자 상태를 확인 바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 4 }">
								<div id="" class="text_input">활동이 미감지 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 6 }">
								<div id="" class="text_input">장비 게이트웨이가 미수신이 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 7 }">
								<div id="" class="text_input">장비 활동감지기가 미수신이 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 8 }">
								<div id="" class="text_input">장비 출입문감지기가 미수신이 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 9 }">
								<div id="" class="text_input">장비 화재감지기가 미수신이 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 10 }">
								<div id="" class="text_input">연결차단이 해제 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 11 }">
								<div id="" class="text_input">연락후 장비 회수를 하시기 바랍니다.</div>
							</c:if>
							<c:if test="${dispatch.getSType() eq 12 }">
								<div id="" class="text_input">신규가입이 되었습니다. 연락후 방문바랍니다.</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
	function reportyModify(rNo, name) {
		location.href = "reportModify?rNo="+rNo+"&name="+name;
	}
	
	function reportRegist(id, name, sType) {
		location.href = "reportForm?id="+id+"&name="+name+"&sType="+sType;
	}
</script>

<div style="height: 450px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>