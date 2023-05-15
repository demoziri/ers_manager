<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="대상자 관리" />
<%@include file="../common/head.jspf" %>

<style>
  .mem_table>tbody>tr:hover {
    background-color: lightblue;
  }

  .re_table>tbody>tr:hover {
    background-color: lightblue;
  }
</style>

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
          <table class="table table-bordered border-2 mt-1 text-center mem_table">
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
                <tr onclick="memDetail_go();">
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
          <button type="button" class="btn btn-success" id="reg-btn" style="position:absolute;bottom:0;right:0;" onclick="registForm_go();">신규 대상자 등록</button>
        </div>
        <div class="row" id="memDetail" style="height:100%;margin-top:5px;background-color:#dfdfdf;">
          <!-- 대상자 상세정보 들어갈 자리 -->
          <div class="h-100 d-flex justify-content-center align-items-center">대상자를 선택해주세요.</div>
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
        <div id="reList" style="background-color:#dfdfdf;height: 100%;width: 100%;margin-top: 5px;overflow-x: hidden;overflow: scroll;overflow-x: hidden;">
          <!-- 보고서 테이블 들어갈 자리-->
          <div class="h-100 d-flex justify-content-center align-items-center">대상자를 선택해주세요.</div>

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

<!-- 생활지원사 배정 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">배정가능한 생활지원사</h4>
      </div>
      <div class="modal-body">
        <table class="modal-table table table-bordered w-100">
          <thead>
            <tr>
              <th class="th-1">선택</th>
              <th class="th-2">사진</th>
              <th class="th-3">정보</th>
            </tr>
          </thead>
          <tbody>
            <tr style="height:100px;vertical-align:middle;">
              <td>
                <input type="checkbox" />
              </td>
              <td>
                <div id="pictureView" class="manPicture mt-1" data-id="${member.id }" style="border: 1px solid green; height: 80px; width: 60px; margin: 0 auto;"></div>
              </td>
              <td>이정호 / 남 / 27 </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning">배정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div id="modalBox2" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
      </div>
      <div class="modal-body">
        <table class="modal-table table table-bordered w-100">
          <thead>
            <tr>
              <th class="th-1">이름</th>
              <th class="th-2">관계</th>
              <th class="th-3">연락처</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>이름이름</td>
              <td>아들</td>
              <td>010-1234-1234</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 비상연락망 등록 모달 -->

<div id="modalBox3" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
        <button id="addPhoneBtn" class="btn btn-primary btn-sm" type="button" style="float:right;" >+추가</button>
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
              <tr id="cPhone_list">
                <td>
                  <input type="text" name="name" style="width:70px;" />
                </td>
                <td>
                  <select name="relation" id="rel">
                    <option value="">선택</option>
                    <option value="d">아들</option>
                    <option value="e">딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <input type="text" name="relation" id="relInput" style="width:60px;" />
                </td>
                <td>
                  <select name="phone" id="">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="phone" style="width:50px;" />
                  <input type="text" name="phone" style="width:50px;" />
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

<!-- picture upload form  -->
<!-- label for="inputFile" 이름 같게하면 됨 -->
<form role="imageForm" action="picture.do" method="post" enctype="multipart/form-data">
  <!-- enctype안주면 type="file"전송안됨 but,일반적 getparameter안됨 -->
  <input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;" onchange="picture_go();">
  <!-- 업로드한 파일명 oldFile -->
  <input id="oldFile" type="hidden" name="oldPicture" value="test" />
  <!-- 업로드 필수 value 0->1 업로드하지않고 사진만바꾸면 다시 0 -->
  <input type="hidden" name="checkUpload" value="0" />
</form>

<script>
  //등록화면 호출
  function registForm_go() {
    $.ajax({
      url: "regist",
      type: "get",
      datatype: "html",
      success: function(data) {
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(data);
        $("#reList").html('');
        $("#reList").append('<div class="h-100 d-flex justify-content-center align-items-center" style="background-color:#dfdfdf">대상자를 선택해주세요.</div>');
        $("#reg-btn").hide();
        
        // modal open(비상연락망)
        $('#openRegPhoneModal').on('click', function() {
          $('#modalBox3').modal('show');
          alert("뭐냐1");
          
          
          
          
          var s =  $("#cPhone").html();
          $("#addPhoneBtn").on('click', function addPhone_go() {
         		 $("#cPhone").append(s);
         		 return;
         	  alert(s);
           });
           
          //입력박스 숨어있다가
          $("#relInput").hide();
          $("#rel").change(function() {
            //기타를 선택하면 등장
            if ($("#rel").val() == "etc") {
              $("#relInput").show();
            } else {
              $("#relInput").hide();
            }
          });
        });
      }
    });
  }
  
  // 대상자 상세화면 호출
  function memDetail_go() {
    $.ajax({
      url: "detail",
      type: "get",
      datatype: "html",
      success: function(data) {
        var e = $(data).find("#mem_Detail").html();
        var f = $(data).find("#re_List").html();
        // 대상자 상세
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(e);
        // 대상자 관련 보고서 리스트
        $("#reList").css('background-color', "");
        $("#reList").html(f);
        if ($("#reg-btn").css('display', 'none')) {
          $("#reg-btn").css('display', 'inline');
        }
        // modal open(생활지원사)
        $('#openModalBtn').on('click', function() {
          $('#modalBox').modal('show');
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox').modal('hide');
        });
        // modal open(비상연락망)
        $('#openPhoneModal').on('click', function() {
          $('#modalBox2').modal('show');
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox2').modal('hide');
        });
      }
    });
  }

  function picture_go() {
    //alert("changed file");
    var form = $('form[role="imageForm"]');
    var picture = form.find('[name=pictureFile]')[0]; //jqery객체 0번지에 javascript객체있음
    //find : 자손 선택자중에 찾아줌
    //alert(picture.files[0].name);//파일명만!
    //alert(picture.value); //경로 text만 가져옴(js객체라 val안됨)
    var fileFormat =
      picture.value.substr(picture.value.lastIndexOf('.') + 1).toUpperCase();
    //파일경로 뒤에서부터 찾았을때, "."(뒤로는 확장자) 
    //이미지 확장자 확인
    if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
      alert("이미지는 jpg 형식만 가능합니다.");
      return;
    }
    //이미지 파일 용량 체크
    if (picture.files[0].size > 1024 * 1024 * 1) {
      alert("사진 용량은 1MB 이하만 가능합니다.");
      return;
    }
    if (picture.files && picture.files[0]) {
      var reader = new FileReader();
      reader.readAsDataURL(picture.files[0]);
      reader.onload = function(e) {
        var pictureview = $('div#pictureView')[0];
        //이미지 미리보기
        pictureView.style.backgroundImage = "url(" + e.target.result + ")";
        pictureView.style.backgroundPosition = "center";
        pictureView.style.backgroundSize = "cover";
        pictureView.style.backgroundRepeat = "no-repeat";
      }
    }
    form.find('[name="checkUpload"]').val(0);
    $('#inputFileName').val(picture.files[0].name);
  }
</script>

<%@include file="../common/foot.jspf" %>