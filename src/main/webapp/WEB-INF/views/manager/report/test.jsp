<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="대상자 관리" />
<%@include file="../common/head.jspf" %>

<div class="container-fuid">
	<div class="row">
		<div class="col-5">
			<!-- 직원목록 -->
			<div class="row" style="border:1px solid red;height:400px;">
				<div class="card card-body"></div>			
			</div>
			<!-- 보고서 -->
			<div class="row" style="border:1px solid red;height:400px;">
				<div class="card card-body"></div>
			</div>
		
		</div>
		<!-- 상세정보 -->
		<div class="col-7 h-100" style="border:1px solid red;">
			<div class="card card-body"></div>
		</div>
	
	</div>
</div>


<%@include file="../common/foot.jspf" %>