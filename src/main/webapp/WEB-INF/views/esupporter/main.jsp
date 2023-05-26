<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/esupporter/head.jspf"%>
<!-- Content Wrapper. Contains page content -->
<style>
.profile-username {
	font-family: 'MBC1961GulimM';
	font-size: 2rem;
	padding-top: 10px;
}

.menu_list_name {
	margin: 0 auto;
	font-weight: bold;
	margin-bottom: 10px;
	color: black;
	font-size: 2.5rem;
}

.menu_bar_name {
	margin: 0 auto;
	border: 1px solid black;
	background-color: #02BB15C7;
	border: 3px solid #071038C7;
	color: black;
	width: 50%;
	font-size: 2.5rem;
	text-align: center;
	border-radius: 5px;
	margin-bottom: 5px;
	font-weight: bold;
	height: 70px;
	padding: 10px;
}

.box-profile {
	border: 2px solid orange;
}

.small-box {
	display: inline-block;
	width: 200px;
}

.col-lg-3 {
	display: inline-block;
	width: 200px;
}

.nowactovity {
	font-weight: bold;
	font-size: 2.2rem;
	text-align: center;
}

.emergany_status_list {
	display: flex;
	justify-content: space-evenly;
	margin: 0 auto;
}

.menu_bar {
	margin-bottom: 30px;
	justify-content: center;
}

.inner {
	text-align: center;
}

.firestatus {
	border: 2px solid #FE2E2E;
	border-radius: 10px;
}

.emergancystatus {
	border: 2px solid #FFFF00;
	border-radius: 10px;
}

.callstatus {
	border: 2px solid #AC58FA;
	border-radius: 10px;
}

.midbox {
	display: inline-block;
	width: 230px;
	padding: 10px;
	font-weight: bold;
}
</style>

<!-- Main content -->
<section class="content-header" style="height: 950px">

	<div class="row">
		<div class="col-md-12">
			<div class="consulting_status">
				<h5 class="nowactovity mb-3">당일 응급상황 발생 현황</h5>
				<div class="status_list">
					<div class="emergany_status_list">
						<div class="col-lg-3 col-3">
							<div class="small-box firestatus">
								<div class="inner">
									<h3>화재건수</h3>
									<h3>1건</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-3">
							<div class="small-box emergancystatus">
								<div class="inner">
									<h3>응급건수</h3>
									<h3>1건</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-3">
							<div class="small-box callstatus">
								<div class="inner">
									<h3>출동건수</h3>
									<h3>1건</h3>
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
										<div class="inner">
											<h3>게이트웨이</h3>
											<h3>1개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box emergancystatus">
										<div class="inner">
											<h3>화재감지기</h3>
											<h3>1개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box emergancystatus">
										<div class="inner">
											<h3>출입감지기</h3>
											<h3>1개</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-3">
									<div class="small-box callstatus">
										<div class="inner">
											<h3>활동감지기</h3>
											<h3>1개</h3>
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
			<div class="menu_list">
				<div class="item">
					<ul class="menu_bar flex">
						<li class="col-3">
							<div class="card card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/emergencyList'" src="/resources/esupporter/img/심장이미지.png" style="width: 600px; height: 160px;" alt="">
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
											<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/equipmentList'" src="/resources/esupporter/img/장비점검.png" style="width: 600px; height: 200px;" alt="">
									</div>
									<h3 class="profile-username text-center">장비점검</h3>
								</div>
							</div>
						</li>

						<li class="col-3">
							<div class="card card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/dispatchList'" src="/resources/esupporter/img/사이렌.jpg" style="width: 600px; height: 200px;" alt="">
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


<%@include file="../include/esupporter/foot.jspf"%>





