<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/myPage.css" rel="stylesheet">

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>정보수정</h1>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="buttons mb-2">
			<button class="btn btn-dark buttonLeft">뒤로가기</button>
			<button class="btn btn-primary">정보수정</button>
		</div>
	</div>
</div>

<div class="row card ml-2 mr-2">
	<div class="col-12 flex">
		<div class="col-4">
			<div class="picture-container mt-4">
				<input type="hidden" name="oldPicture" value="${member.picture}"/>
				<input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
				<div class="input-group col-md-12">
					<div class="col-md-12 text-center">
					    <div class="manPicture" data-id="${member.id}" id="pictureView"></div>
					    <div class="input-group input-group-sm">
					    	<label for="inputFile" class="btn btn-warning btn-sm btn-flat input-group-addon">사진 변경</label>
					    	<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled value="${member.picture.split("\\$\\$")[1]}"/>
					    	<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
					    	<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>
					    </div>
				    </div>
				</div>
			</div>
		</div>
		<div class="col-8">
			<table class="type03">
				<tr>
					<th scope="row">아이디</th>
				    <td>
				    	<input type="text" class="input-width" value="prt4435">
				    </td>
				</tr>
				<tr>
					<th scope="row">패스워드</th>
					<td>
						<input type="text" class="input-width" value="김동훈" />
					</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td>
						<input type="text" class="input-width" value="2023-05-04" />
					</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>
						<input type="text" class="input-width" value="" />
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>
						<input type="text" class="input-width" value="">
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script>
//HTML 엘리먼트를 선택합니다.
const oldPictureInput = document.querySelector('input[name="oldPicture"]');
const uploadButton = document.querySelector('.btn-append');

// oldPictureInput의 값이 비어있지 않은 경우에만 uploadButton을 표시합니다.
if (oldPictureInput.value !== '') {
  uploadButton.style.display = 'none';
} else {
  uploadButton.style.display = 'block';
}
</script>

<div style="height: 780px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>