<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/openhead.jspf" %>

<!doctype html>
<html lang="ko">

<!-- 직원 사진 -->
<form role="form" class="row pe-0">
<div class="col-3 p-0">
  <input type="hidden" name="picture" value="noImage.jpg" />
  <div class="input-group mb-3">
    <div class="mailbox-attachments clearfix" style="text-align: center;">
      <div class="mailbox-attachment-icon has-img mt-2" id="pictureView" style="border: 1px solid green; height: 180px; width: 140px; margin: 0 auto;"></div>
      <div class="mailbox-attachment-info">
        <div class="input-group input-group-sm">
          <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
          <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled />
          <span class="input-group-append-sm">
            <button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>
          </span>
        </div>
      </div>
    </div>
    <br />
  </div>
</div>
<!-- 대상자 상세정보 -->
<div class="col-9">
	<ul style="list-style:none;">
        <li class="mt-3">
            <div>이름</div>
            <input type="text" value="박제성" style="border:0 solid black; background:#F2F2F2;" readonly />
        </li>
        <li class="mt-3">
            <div>부서</div>
            <input type="text" value="응급관리요원" style="border:0 solid black; background:#F2F2F2;" readonly />
        </li>
        <li class="mt-3">
            <div>부서주소</div>
            <input type="text" value="대전광역시 서구 둔산동 329-39" style="width:300px;border:0 solid black; background:#F2F2F2;" readonly />
        </li>
        <li class="mt-3">
            <div>전화번호</div>
            <input type="text" value="" style="border:0 solid black; background:#F2F2F2;"readonly />
        </li>
        <li class="mt-3">
            <div>생년월일</div>
            <input type="text" value="" style="width:100px; border:0 solid black; background:#F2F2F2;" readonly /> / 
            <input type="text" value="" style="width:50px; border:0 solid black; background:#F2F2F2;" readonly /> / 
            <input type="text" value="" style="width:50px; border:0 solid black; background:#F2F2F2;" readonly />
        </li>
        <li class="mt-3">
            <div>주소</div>
            <input type="text" value="대전광역시 서구 둔산동 329-39" style="width:300px;border:0 solid black; background:#F2F2F2;" readonly />
         </li>
         <li class="mt-3">
            <div>이메일</div>
            <input type="email" value="mimi@google.com" style="border:0 solid black; background:#F2F2F2;" readonly />
         </li>
      </ul>

  <div>
    <button type="button" onclick="" class="btn btn-secondary btn-sm my-1 ms-2" style="float:right;color:white;">취소</button>
    <button type="button" class="btn btn-success btn-sm my-1" style="float:right;color:white;">등록</button>
  </div>
</div>
</form>


</html>