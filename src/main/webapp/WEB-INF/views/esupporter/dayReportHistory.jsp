<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/dayReporyHistory.css" rel="stylesheet">

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>당일 보고서 내역</h1>
	</div>
</div>

<div class="row m-2">
	<div class="col-12">
		<ul class="tabs">
		    <li class="text-2xl" onclick="switchTab('tab1')">전체</li>
		    <li class="text-2xl" onclick="switchTab('tab2')">응급상황</li>
		    <li class="text-2xl" onclick="switchTab('tab3')">장비점검</li>
		</ul>
		
		<div id="tab1" class="tab-content active">
		    <div class="row">
				<div class="col-12 d-flex justify-content-between align-items-center">
				
					<button class="btn btn-dark m-3">뒤로가기</button>
						
					<div class="div_group mt-1 ">
						<select class="input_date input_borderRadius mr-2">
							<option>선택</option>
							<option>대상자 명</option>
							<option>보고서 상태</option>
							<option>열람여부</option>
						</select>
						
						<div class="search-bar ml-2 input_borderRadius">
							<input type="search" name="" class="search-bar__input input_date" >
							<button type="submit" >
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
					
					<button class="btn btn-primary mr-3">등록</button>
					
				</div>
			</div>

		    <div class="row m-1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<colgroup>
									<col width="50px" />
								    <col width="70px" />
								    <col width="110px" />
								    <col width="50px" />
								    <col width="50px" />
								    <col width="200px"/>
								</colgroup>
								
								<thead>
									<tr>
										<th class="tableHeadFont ">대상자 명</th>
										<th class="tableHeadFont ">대상자 주소</th>
										<th class="tableHeadFont ">보고서 종류</th>
										<th class="tableHeadFont ">보고서 작성 상태</th>
										<th class="tableHeadFont ">열람여부</th>
										<th class="tableHeadFont " >작성일자</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tableBodyFont">
										<td>홍길동</td>
										<td>용두동 어덕마을로 111-7</td>
										<td>응급</td>
										<td>임시저장</td>
										<td>N</td>
										<td>2023-05-04</td>
									</tr>
									<tr class="tableBodyFont">
										<td>김민지</td>
										<td>탄방동 롯데캐슬</td>
										<td>장비</td>
										<td>제출</td>
										<td>Y</td>
										<td>2023-05-04</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="tab2" class="tab-content">
			
			<div class="row">
				<div class="col-12 d-flex justify-content-between align-items-center">
				
					<button class="btn btn-dark m-3">뒤로가기</button>
						
					<div class="div_group mt-3 ">
						<select class="input_date input_borderRadius mr-2">
							<option>선택</option>
							<option>대상자 명</option>
							<option>보고서 상태</option>
							<option>열람여부</option>
							<option>파일첨부 여부</option>
						</select>
						
						<div class="search-bar ml-2 input_borderRadius">
							<input type="search" name="" class="search-bar__input input_date" >
							<button type="submit" >
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
					
					<button class="btn btn-primary mr-3">등록</button>
					
				</div>
			</div>

		    <div class="row m-1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<colgroup>
									<col width="50px" />
								    <col width="70px" />
								    <col width="110px" />
								    <col width="50px" />
								    <col width="50px" />
								    <col width="70px" />
								    <col width="200px"/>
								</colgroup>
								
								<thead>
									<tr>
										<th class="tableHeadFont ">대상자 명</th>
										<th class="tableHeadFont ">대상자 주소</th>
										<th class="tableHeadFont ">보고서 작성 상태</th>
										<th class="tableHeadFont ">열람여부</th>
										<th class="tableHeadFont ">대상자 상태</th>
										<th class="tableHeadFont ">상황일자</th>
										<th class="tableHeadFont ">파일첨부 여부</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tableBodyFont">
										<td>홍길동</td>
										<td>용두동 어덕마을로 111-7</td>
										<td>임시저장</td>
										<td>N</td>
										<td>안전</td>
										<td>2023-05-04</td>
										<td>N</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="tab3" class="tab-content">
		    <div class="row">
				<div class="col-12 d-flex justify-content-between align-items-center">
				
					<button class="btn btn-dark m-3">뒤로가기</button>
						
					<div class="div_group flex--center mt-3 ">
						<select class="input_date input_borderRadius mr-2">
							<option>선택</option>
							<option>대상자 명</option>
							<option>장비구분</option>
							<option>점검여부</option>
							<option>보고서 작성	상태</option>
							<option>열람여부</option>
						</select>
						
						<div class="search-bar ml-2 input_borderRadius">
							<input type="search" name="" class="search-bar__input input_date" >
							<button type="submit" >
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
					
					<button class="btn btn-primary mr-3">등록</button>
					
				</div>
			</div>
			
			<div class="row m-1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<colgroup>
									<col width="50px" />
								    <col width="70px" />
								    <col width="110px" />
								    <col width="50px" />
								    <col width="50px" />
								    <col width="70px" />
								    <col width="200px"/>
								</colgroup>
								
								<thead>
									<tr>
										<th class="tableHeadFont align-middle">대상자 명</th>
										<th class="tableHeadFont align-middle">대상자 주소</th>
										<th class="tableHeadFont align-middle">장비구분</th>
										<th class="tableHeadFont align-middle">점검여부</th>
										<th class="tableHeadFont align-middle">보고서 작성 상태</th>
										<th class="tableHeadFont align-middle">열람여부</th>
										<th class="tableHeadFont align-middle" >장비점검 요청날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tableBodyFont">
										<td>홍길동</td>
										<td>용두동 어덕마을로 111-7</td>
										<td>게이트웨이</td>
										<td>Y</td>
										<td>임시저장</td>
										<td>N</td>
										<td>2023-05-04</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    // 탭을 전환하는 JavaScript 함수
    function switchTab(tabId) {
      // 모든 탭 컨텐츠 숨기기
      var tabContents = document.getElementsByClassName('tab-content');
      for (var i = 0; i < tabContents.length; i++) {
        tabContents[i].classList.remove('active');
      }

      // 선택한 탭 컨텐츠 표시
      var selectedTab = document.getElementById(tabId);
      selectedTab.classList.add('active');
    }
</script>

<div style="height: 780px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>