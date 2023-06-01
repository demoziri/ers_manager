<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/esupporter/head.jspf"%>
<!-- Content Wrapper. Contains page content -->
<link href="/resources/esupporter/css/main.css" rel="stylesheet">

<!-- Main content -->
<section class="content-header" style="height:950px">

	<div class="row">
		<div class="col-md-12">
			<div class="consulting_status">
				<h5 class="nowactovity mb-3">당일 응급상황 발생 현황</h5>
				<div class="status_list">
					<div class="emergany_status_list">
						<div class="col-lg-3 col-3">
							<div class="small-box firestatus">
								<div class="inner" id="fireEmergency">
									<h3>화재건수</h3>
									<h3>${fireCount}건</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-3">
							<div class="small-box emergancystatus">
								<div class="inner" id="emergencyCount">
									<h3>응급건수</h3>
									<h3>${emergencyCount}건</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-3">
							<div class="small-box callstatus">
								<div class="inner" id="dispatchCount">
									<h3>출동건수</h3>
									<h3>${dispatchCount}건</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row mb-4">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="consulting_status">
						<h5 class="nowactovity mb-3">사용가능한 장비</h5>
						<div class="status_list">
							<div class="emergany_status_list">
								<div class="col-lg-3 col-3">
									<div class="small-box firestatus">
										<div class="inner" id="gatwayCount">
											<h3>게이트웨이</h3>
											<h3>${gatewayStockCount}개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box emergancystatus">
										<div class="inner" id="fireAramyCount">
											<h3>화재감지기</h3>
											<h3>${activityDetectorStockCount}개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box emergancystatus">
										<div class="inner" id="doorCount">
											<h3>출입감지기</h3>
											<h3>${doorDetectorsStockCount}개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box callstatus">
										<div class="inner" id="modeCount">
											<h3>활동감지기</h3>
											<h3>${fireDetectorStockCount}개</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container-fluid">
		<div class="row mx-auto"></div>
		<div class="col-12 menu_bar">
			<div class="menu_list mt-4">
				<div class="item">
					<ul class="menu_bar flex">
						<li class="col-3">
							<div class="card card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/emergencyList'" src="/resources/esupporter/img/심장이미지.png" style="width: 200px; height: 160px; cursor: pointer;" alt="">
									</div>
									<h3 class="profile-username text-center">
										응급상황
										<br />
										보고서 내역
									</h3>
								</div>
							</div>
						</li>
						<li class="col-3">
							<div class="card card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/equipmentList'" src="/resources/esupporter/img/장비점검.png" style="width: 200px; height: 200px; cursor: pointer;" alt="">
									</div>
									<h3 class="profile-username text-center">장비점검</h3>
								</div>
							</div>
						</li>
						<li class="col-3">
							<div class="card card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/dispatchList'" src="/resources/esupporter/img/사이렌.jpg" style="width: 200px; height: 200px; cursor: pointer;" alt="">
									</div>
									<h3 class="profile-username text-center">출동내역</h3>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</section>
<!--foot -->

<script>
function autoRefresh_div()
{
var currentLocation = window.location;
$("#fireEmergency").load(currentLocation + ' #fireEmergency');
$("#emergencyCount").load(currentLocation + ' #emergencyCount');
$("#dispatchCount").load(currentLocation + ' #dispatchCount');
$("#gatwayCount").load(currentLocation + ' #gatwayCount');
$("#fireAramyCount").load(currentLocation + ' #fireAramyCount');
$("#modeCount").load(currentLocation + ' #modeCount');
$("#doorCount").load(currentLocation + ' #doorCount');
}
setInterval('autoRefresh_div()', 3000);
</script>


<%@include file="../include/esupporter/foot.jspf"%>





