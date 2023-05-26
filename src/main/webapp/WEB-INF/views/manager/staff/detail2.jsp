<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="게시물 내용"/>

<style>
.info-box > ul > li > input{
	
	background:
}

</style>

	<!-- 직원 상세정보 -->
      <div class="col-7">
        <div class="card card-body" style="border:2px dotted gray;height:400px;">
          <div style="position:relative;">
            <span class="fs-3" style="border-bottom:2px solid gray;">대상자 정보</span>
            <button type="button" class="btn btn-success" style="position:absolute;bottom:0;right:0;">신규 대상자 등록</button>
          </div>
          
          
          <div class="row" id="mem_Detail" style="height:100%;margin-top:5px;border:2px solid gray;">
            <!-- 대상자 사진 -->
            
            <div class="col-3 border">
              <div id="pictureView" class="manPicture mt-2" data-id="${member.id }" style="border: 1px solid green; height: 180px; width: 140px; margin: 0 auto;"></div>
              <div style="text-align:center;margin-top:10px;">
                <span class="fs-4">박제성</span><span>님</span>
              </div>
            </div>
            <!-- 대상자 상세정보 -->
            <div class="col-9 border info-box">
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
              
            </div>
          </div>
          </div>
        
      </div>

 
<%@include file="../common/foot.jspf" %>