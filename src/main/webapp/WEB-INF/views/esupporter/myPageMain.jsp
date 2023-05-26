<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/myPageMain.css" rel="stylesheet">

<div class="container-fluid">
	<div class="col-12 menu_bar">
		<div class="menu_list">
			<div class="item">
				<ul class="menu_bar flex justify-center">
					<li class="col-3">
						<div class="card card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/dayReportHistory'" src="/resources/esupporter/img/응급관리이미지.jpg" style="width: 600px; height: 200px;" alt="">
								</div>
								<h3 class="profile-username text-center">당일보고서 내역</h3>
							</div>
						</div>
					</li>
					<li class="col-3">
						<div class="card card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/esupporter/myPage'" src="/resources/esupporter/img/정보수정.jpg" style="width: 600px; height: 200px;" alt="">
								</div>
								<h3 class="profile-username text-center">정보수정</h3>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div style="height: 450px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>