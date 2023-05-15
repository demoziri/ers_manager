<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="대상자 관리"/>
<%@include file="../common/head.jspf" %>
  
    <div class="container-fluid">
      <div class="row">
        <!-- 대상자 목록 -->
        <div class="col-5">
          <div class="searchType card card-body" style="border:2px dotted gray;height:400px;">
            <div>
              <span class="fs-3" style="border-bottom:2px solid gray;">대상자 목록</span>
            </div>
            <div>
              <select name="memType" id="" style="height:100%;">
                <option value="" selected>대상자구분</option>
                <option value="">독거노인</option>
                <option value="">장애인</option>
              </select>
              <select name="gu" id="" style="height:100%;width:100px;">
                <option value="" selected>지역구</option>
                <option value="">중구</option>
                <option value="">동구</option>
                <option value="">서구</option>
                <option value="">대덕구</option>
                <option value="">유성구</option>
              </select>
              <select name="dong" id="" style="height:100%;width:100px;">
                <option value="" selected>동</option>
              </select>
              <input type="text" placeholder="이름" style="width:100px;" />
              <button type="submit" class="btn btn-primary btn-sm" style="width:100px;float:right;">조회</button>
            </div>
            <div>
              <table class="table table-bordered border-2 mt-1 text-center">
                <thead style="background-color:#dfdfdf;">
                  <tr>
                    <th>대상자구분</th>
                    <th>대상자명</th>
                    <th>등록일</th>
                    <th>장비설치</th>
                    <th>생활지원사</th>
                  </tr>
                  <thead>
                  <tbody class="table-group-divider">
                    <tr>
                      <td>독거노인</td>
                      <td>김미미</td>
                      <td>2023.05.10</td>
                      <td>미설치</td>
                      <td>미배정</td>
                    </tr>
                    <tr>
                      <td>독거노인</td>
                      <td>김미미</td>
                      <td>2023.05.10</td>
                      <td>미설치</td>
                      <td>미배정</td>
                    </tr>
                    <tr>
                      <td>독거노인</td>
                      <td>김미미</td>
                      <td>2023.05.10</td>
                      <td>미설치</td>
                      <td>미배정</td>
                    </tr>
                    <tr>
                      <td>독거노인</td>
                      <td>김미미</td>
                      <td>2023.05.10</td>
                      <td>미설치</td>
                      <td>미배정</td>
                    </tr>
                    <tr>
                      <td>독거노인</td>
                      <td>김미미</td>
                      <td>2023.05.10</td>
                      <td>미설치</td>
                      <td>미배정</td>
                    </tr>
                  </tbody>
              </table>
            </div>
            <!-- pagination -->
            <nav>
              <ul class="pagination" style="justify-content: center;">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>

          </div>
          <!-- 대상자 목록 끝-->
        </div>
        <!-- 대상자 상세정보 -->
        <div class="col-7">
          <div class="card card-body" style="border:2px dotted gray;height:400px;">
            <div style="position:relative;">
              <span class="fs-3" style="border-bottom:2px solid gray;">대상자 정보</span>
              <button type="button" class="btn btn-success" style="position:absolute;bottom:0;right:0;">신규 대상자 등록</button>
            </div>
            <div class="row" style="height:100%;margin-top:5px;border:2px solid gray;">
              <!-- 대상자 사진 -->
              <div class="col-3 border p-0">
                <input type="hidden" name="picture" value="noImage.jpg" />
                <div class="input-group mb-3">
                  <div class="mailbox-attachments clearfix" style="text-align: center;">
                    <div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 180px; width: 140px; margin: 0 auto;"></div>
                    <div class="mailbox-attachment-info">
                      <div class="input-group input-group-sm">
                        <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
                        <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled />
                        <span class="input-group-append-sm">
                          <button type="button" class="btn btn-info btn-sm btn-append" onclick="">업로드</button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <br />
                </div>

              </div>
              <!-- 대상자 상세정보 -->
              <div class="col-9 border">
                <table class="table table-bordered mb-0 mt-1" style="height:75%;">
                  <tr>
                    <th>대상자 구분</th>
                    <td>
                    	<select name="memType" id="">
                    		<option value="" selected>선택</option>
                    		<option value="">독거노인</option>
                    		<option value="">장애인</option>
                    	</select>
                    </td>
                    <th>이름</th>
                    <td>
                    	<input type="text" name="name"/>
                    </td>
                  </tr>
                  <tr>
                    <th>생년월일</th>
                    <td>
                    	<input type="date" name="birth" />
                    </td>
                    <th>전화번호</th>
                    <td>
                    	<select name="phone" id="">
                    		<option value="">선택</option>
                    		<option value="010">010</option>
                    		<option value="042">042</option>
                    	</select>
                    	-<input type="text" name="phone" style="width:50px;"/>
                    	-<input type="text" name="phone" style="width:50px;"/>
                    </td>
                  </tr>
                  <tr>
                  	<th>구</th>
                  	<td>
                  		<select name="gu" id="">
                    		<option value="">선택</option>
                    		<option value="">중구</option>
                    		<option value="">서구</option>
                    		<option value="">동구</option>
                    		<option value="">유성구</option>
                    		<option value="">대덕구</option>
                    	</select>
                  	</td>
                  	<th>동</th>
                  	<td>
                  		<select name="dong" id="">
                    		<option value="">선택</option>
                    	</select>
                  	</td>
                  </tr>
                  <tr>
                    <th>상세주소</th>
                    <td colspan="3">
                    	<input type="text" name="address" style="width:100%;"/>
                    </td>
                  </tr>
                  <tr>
                    <th>고위험도</th>
                    <td>
                    	<select name="caution">
                    		<option value="">선택</option>
                    		<option value="Y">Y</option>
                    		<option value="N">N</option>
                    	</select>
                    </td>
                    <th>상태</th>
                    <td>서비스 이용중</td>
                  </tr>
                  <tr>
                    <th>
                      <button class="btn btn-danger btn-sm" id="openPhoneModal">비상연락망</button>
                    </th>
                    <td>0/3</td>
                    <th>신청서</th>
                    <td>
                    	<input type="file" style="width:200px;"/>
                    </td>
                  </tr>
                </table>
                <div>
                  <button type="button" class="btn btn-warning btn-sm my-1" style="float:right;color:white;">정보 수정</button>
                </div>
              </div>
              <!-- 대상자 상세정보 들어갈 자리 -->
              
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
            <div style="height:100%;width:100%;background-color:#dfdfdf;margin-top:5px;">
              <!-- 보고서 테이블 들어갈 자리-->
              

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
              <span style="font-weight:bold;color:#4191B3">-</span>
            </div>
            <div style="height:100%;width:100%;background-color:#dfdfdf;">

            </div>
          </div>
        </div>
      </div>
      <!-- 보고서 상세 끝 -->
    </div>

   <!-- 비상연락망 등록 모달 -->

    <div id="modalBox2" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
            <button class="btn btn-primary btn-sm" style="float:right;" onclick="addPhone_go();">추가</button>
          </div>
          <div class="modal-body">
        	<form action="" id="form">
            <table class="modal-table table table-bordered w-100">
              <thead>
                <tr>
                  <th class="th-1">이름</th>
                  <th class="th-2">관계</th>
                  <th class="th-3">연락처</th>
                </tr>
              </thead>
              <tbody id="cPhone">
                <tr>
                  <td>
					<input type="text" name="name" style="width:70px;"/>
				  </td>
                  <td>
                  	<select name="relation" id="rel">
                  		<option value="">선택</option>
                  		<option value="d">아들</option>
                  		<option value="e">딸</option>
                  		<option value="etc">기타</option>
                  	</select>
                  	<input type="text" name="relation" id="relInput" style="width:70px;"/>
                  </td>
                  <td>
                    	<select name="phone" id="">
                    		<option value="">선택</option>
                    		<option value="010">010</option>
                    		<option value="042">042</option>
                    	</select>
                    	<input type="text" name="phone" style="width:50px;"/>
                    	<input type="text" name="phone" style="width:50px;"/>
                    </td>
                </tr>
              </tbody>
            </table>
          </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-warning">등록</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>

  </div>

  <script>
    
    // modal open(비상연락망)
    $('#openPhoneModal').on('click', function() {
      $('#modalBox2').modal('show');
      
    });
    // modal close
    $('#closeModalBtn').on('click', function() {
      $('#form')[0].reset();
      $('#modalBox2').modal('hide');
    });
    
	$(function() {
		//입력박스 숨어있다가
		$("#relInput").hide();
		$("#rel").change(function() {
			//기타를 선택하면 등장
			if ($("#rel").val()=="etc") {
				$("#relInput").show();
			} else {
				$("#relInput").hide();
			}
		})
	});
	
	
	
	
</script>
<%@include file="../common/foot.jspf" %>