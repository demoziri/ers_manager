<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row m-0 pt-3 h-100">
	<div class="col-12">
		<div class="row m-0 h-30">
			<div class="col-7">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-bell bell_color pr-3"></i>금일 총 응급발생 처리현황</h3>
						<a href="#" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justify-content-around">
							<div class="card dashboard_gray_content_box">
								<div class="dashboard_gray_content_box_header">응급호출</div>
								<div class="dashboard_gray_content_box_body">3</div>
							</div>
							<div class="card dashboard_gray_content_box">
								<div class="dashboard_gray_content_box_header">119통화</div>
								<div class="dashboard_gray_content_box_body">3</div>
							</div>
							<div class="card dashboard_gray_content_box">
								<div class="dashboard_gray_content_box_header">화재감지</div>
								<div class="dashboard_gray_content_box_body">3</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
			<div class="col-5">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-person dashboard_icon pr-3"></i>총 응급요원 수<span class="total_emanager_count">${emanager_totalCount}</span></h3>
						<a href="${pageContext.request.contextPath }/ers/center/emanager/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justify-content-around">
							<c:forEach var="emanager" items="${emanagerList}">
							<div class="pb-2">
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="text-center">${emanager.status }</th>
										</tr>
										<tr>
											<td class="text-center ${emanager.status eq '출동중' ? 'text-red' : emanager.status eq '대기중' ? 'text-green' : ''} dashboard_emanager_count font-weight-bolder">${emanager.totalCount }</td>
										</tr>
									</tbody>
								</table>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row m-0 h-30">
			<div class="col-7">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-bell bell_color pr-3"></i>지역별 응급발생 건수</h3>
						<a href="#" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justify-content-around">
							<div class="pb-2">
								<div class="dashboard_gray_content_box_header">서구</div>
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="pl-1 pr-1">응급</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">119</th>
											<td class="pl-4 pr-4 text-red text-center">1</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">화재</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="pb-2">
								<div class="dashboard_gray_content_box_header">중구</div>
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="pl-1 pr-1">응급</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">119</th>
											<td class="pl-4 pr-4 text-red text-center">1</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">화재</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="pb-2">
								<div class="dashboard_gray_content_box_header">동구</div>
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="pl-1 pr-1">응급</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">119</th>
											<td class="pl-4 pr-4 text-red text-center">1</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">화재</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="pb-2">
								<div class="dashboard_gray_content_box_header">유성구</div>
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="pl-1 pr-1">응급</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">119</th>
											<td class="pl-4 pr-4 text-red text-center">1</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">화재</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="pb-2">
								<div class="dashboard_gray_content_box_header">대덕구</div>
								<table class="table-bordered">
									<tbody>
										<tr>
											<th class="pl-1 pr-1">응급</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">119</th>
											<td class="pl-4 pr-4 text-red text-center">1</td>
										</tr>
										<tr>
											<th class="pl-1 pr-1">화재</th>
											<td class="pl-4 pr-4 text-blue text-center">0</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-5">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-note-sticky dashboard_icon pr-3"></i>공지사항</h3>
						<a href="${pageContext.request.contextPath }/ers/center/notice/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justufy-content-center">
							<table class="table-bordered w-100" style="font-size:0.3rem;">
								<colgroup>
									<col width="15%">
									<col>
									<col width="15%">
								</colgroup>
									<tbody>
										<tr>
											<th class="pl-1 pr-1 text-center">공지번호</th>
											<th class="pl-1 pr-1">제목</th>
											<th class="pl-1 pr-1">작성일</th>
										</tr>
										<c:forEach var="notice" items="${noticeList}">
										<tr>
											<th class="pl-1 pr-1 text-center">${notice.nno }</th>
											<td class="pl-1 pr-1">${notice.title }</td>
											<td class="pl-1 pr-1">
												<fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/>
											</td>
										</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  --><div class="row m-0 h-40">
			<div class="col-7">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-wrench dashboard_icon pr-3"></i>댁내 장비 현황</h3>
						<a href="${pageContext.request.contextPath }/ers/center/equipment/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justufy-content-center">
							<table class="table-bordered w-100" style="font-size:0.3rem;">
								<colgroup>
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
									<col width="12.5%">
								</colgroup>
									<tbody>
										<tr class="btn-secondary active">
											<th class="text-center pt-1 pb-1">장비</th>
											<th class="text-center">총 보유량</th>
											<th class="text-center">수신</th>
											<th class="text-center">미수신</th>
											<th class="text-center">연결해제</th>
											<th class="text-center">고장</th>
											<th class="text-center">재고</th>
											<th class="text-center">정상 가동률(%)</th>
										</tr>
										<c:forEach var="equipment" items="${equipmentList }">
											<tr style="font-size:0.73rem; font-weight:bold;">
												<th class="text-center pt-2 pb-2">${equipment.m_name}</th>
												<td class="text-center">${equipment.totalCount}</td>
												<td class="text-center text-green">${equipment.receive}</td>
												<td class="text-center ${equipment.noreceive eq 0 ? '' : 'text-red' }">${equipment.noreceive}</td>
												<td class="text-center ${equipment.unconnect eq 0 ? '' : 'text-red' }">${equipment.unconnect}</td>
												<td class="text-center ${equipment.trouble eq 0 ? '' : 'text-red' }">${equipment.trouble}</td>
												<td class="text-center">${equipment.stock}</td>
												<td class="text-center text-blue">${equipment.equipmentPercent}</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-5">
				<div class="card h-96">
					<div class="card-header border-0">
						<h3 class="card-title"><i class="fa-solid fa-circle-check dashboard_icon pr-3"></i>장비 점검 현황</h3>
						<a href="equipmentCheck/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
					</div>
					<div class="card-body pb-0">
						<div class="row justufy-content-center">
							<table class="table-bordered w-100" style="font-size:0.3rem;">
								<colgroup>
									<col>
									<col width="23%">
									<col width="20%">
									<col width="20%">
								</colgroup>
									<tbody>
										<tr class="btn-secondary active">
											<th class="text-center pt-1 pb-1">대상자 이름</th>
											<th class="text-center">장비이름</th>
											<th class="text-center">지역구</th>
											<th class="text-center">날짜</th>
										</tr>
										<tr style="font-size:0.73rem;">
											<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
											<td class="text-center">게이트웨이</td>
											<td class="text-center">서구</td>
											<td class="text-center">2023-05-04</td>
										</tr>
										<tr style="font-size:0.73rem;">
											<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
											<td class="text-center">게이트웨이</td>
											<td class="text-center">서구</td>
											<td class="text-center">2023-05-04</td>
										</tr>
										<tr style="font-size:0.73rem;">
											<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
											<td class="text-center">게이트웨이</td>
											<td class="text-center">서구</td>
											<td class="text-center">2023-05-04</td>
										</tr>
										<tr style="font-size:0.73rem;">
											<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
											<td class="text-center">게이트웨이</td>
											<td class="text-center">서구</td>
											<td class="text-center">2023-05-04</td>
										</tr>
									</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		 -->
	</div>

</div>

<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>