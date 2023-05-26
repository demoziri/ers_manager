<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/emergencyList.css" rel="stylesheet">


<div>
	<div class="row">
		<div class="title_name text--center mt-3">
			<h1>장비점검 보고서</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="buttons mb-1">
				<button type="button" id="" class="btn btn-dark button-left" >뒤로가기</button>
				<button type="button" id="" class="btn bg-green" >수정</button>
				<button type="button" id="" class="btn btn-primary" >등록</button>
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
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="홍길동" />
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">상황구분</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="응급" />
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">상황일자</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="2023-05-04" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">대상자 주소</label>
							<div id="content" class="text_input">대전광역시 중구 용두동 어덕마을로 111-7 카오스빌 201호</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for=""  class="text_label">심장기기 부착여부</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="Y" />
							</div>

							<div class="form-group col-sm-4">
								<label for="" class="text_label">보고서 작성 상태</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="임시저장" />
							</div>
							<div class="form-group col-sm-4">
								<label for="" class="text_label">열람여부</label>
								<input type="text" class="form-control text_input" style="font-size: 1.75rem;" id="" readonly value="N" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="" class="text_label">알림 문구</label>
							<div id="" class="text_input">심장 질환과 기계부착 여부로 인해 CPR기기 사용시 주의 바랍니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<div style="height: 450px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>