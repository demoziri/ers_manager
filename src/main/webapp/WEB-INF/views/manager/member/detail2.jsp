<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="게시물 내용"/>



    
	<!-- 대상자 상세정보 -->
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
                <span class="fs-4">김미미</span><span>님</span>
              </div>
            </div>
            <!-- 대상자 상세정보 -->
            <div class="col-9 border">
              <table class="table table-bordered mb-0 mt-1" style="height:75%;">
                <tr>
                  <th>대상자 구분</th>
                  <td>독거노인</td>
                  <th>나이</th>
                  <td>71세</td>
                </tr>
                <tr>
                  <th>성별</th>
                  <td>남</td>
                  <th>전화번호</th>
                  <td>010-1234-1234</td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td colspan="3">대전 서구 괴정동 OOOOO OOOOOO OOOOO</td>
                </tr>
                <tr>
                  <th>고위험도</th>
                  <td>Y</td>
                  <th>상태</th>
                  <td>서비스 이용중</td>
                </tr>
                <tr>
                  <th>신청서</th>
                  <td>신청서.pdf<i class="bi bi-file-earmark-text-fill"></i></td>
                  <th>생활지원사</th>
                  <td style="text-align:center;">
                    <button class="btn btn-primary btn-sm" id="openModalBtn"  style="height:25px;">배정하기</button>
                  </td>
                </tr>
                <tr>
                  <th>장비설치유무</th>
                  <td>설치완료</td>
                  <th></th>
                  <td>
                  </td>
                </tr>
                <tr>
                 <th>
                 	<button class="btn btn-danger btn-sm" id="openPhoneModal">비상연락망</button>
                 </th>
                  <td>3/3</td>
                </tr>
              </table>
              <div >
                <button type="button" onclick="memModifyForm_go();" class="btn btn-warning btn-sm my-1" style="float:right;color:white;">정보 수정</button>
              </div>
            </div>
          </div>
          </div>
        
      </div>
      <!-- 대상자 상세정보 끝-->
    </div>

    <div class="row">
      <!-- 보고서 목록 -->
      <div class="col-5">
        <div class="card card-body pt-0" style="border:2px dotted gray;height:250px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">보고서 목록</span>
          </div>
          <div>
            <select name="reType" id="" style="height:100%;">
              <option value="" selected>보고서 구분</option>
              <option value="">고객면담</option>
              <option value="">장비점검</option>
              <option value="">서비스취소</option>
              <option value="">악성대상자신고</option>
              <option value="">응급보고서</option>
            </select>
            &ensp;기간&nbsp;<input type="date" />&nbsp;-&nbsp;<input type="date" />
            <button type="submit" class="btn btn-primary btn-sm" style="width:100px;float:right;">조회</button>
          </div>
          <div  id="re_List">
          
            <table class="table table-bordered  text-center re_table">
              <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                <tr>
                  <th>보고서번호</th>
                  <th>보고서구분</th>
                  <th>제출일</th>
                  <th>작성자구분</th>
                </tr>
                <thead>
                <tbody style="overflow:auto;">
                  <tr onclick="memReport_go();">
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                  <tr>
                    <td>2034</td>
                    <td>고객면담</td>
                    <td>2023-05-10</td>
                    <td>생활지원사</td>
                  </tr>
                </tbody>
            </table>
        
          </div>
        </div>
      </div>
        <!-- 보고서 목록 끝 -->
        <!-- 보고서 상세 -->
      <div class="col-7">
        <div class="card card-body pt-0" style="border:2px dotted gray;height:250px;">
           <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">보고서 상세</span>
            &ensp;
            <span style="font-weight:bold;color:#4191B3">서비스취소보고서</span>
          </div>
          <div style="height:100%;width:100%;">
          	<table class="table table-bordered">
          		<tr>
          			<th>작성자</th>
          			<td>김보건[생활지원사]</td>
          			<th>등록일</th>
          			<td>2023-04-05</td>
          		</tr>
          		<tr style="height:100px;vertical-align:middle;">
          			<th>특이사항</th>
          			<td colspan="3">어쩌고 저쩌고 내용이 여기 오겠지요</td>
          		</tr>
          		<tr>
          			<th>첨부파일</th>
          			<td>첨부파일.pdf<i class="bi bi-file-earmark-text-fill"></i></td>
          			<th>비고</th>
          			<td>-</td>
          		</tr>
          	</table>
          </div>
        </div>
      </div>
    </div>
    <!-- 보고서 상세 끝 -->
  </div>
  
 
  
  
  
<%@include file="../common/foot.jspf" %>