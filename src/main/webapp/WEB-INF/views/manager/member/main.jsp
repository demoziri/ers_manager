<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="대상자 관리" />
<%@include file="../common/head.jspf" %>

<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />

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
          <select name="memType" style="height:100%;">
            <option value="" ${cri.memType eq '' ? 'selected' : "" }>대상자구분</option>
            <option value="독거노인" ${cri.memType eq '독거노인' ? 'selected' : "" }>독거노인</option>
            <option value="장애인" ${cri.memType eq '장애인' ? 'selected' : "" }>장애인</option>
          </select>
          <select name="gu" onchange="dongList_go(this.value)" style="height:100%;width:100px;">
            <option value="" ${cri.gu eq 'selected' ? 'selected' : "" }>지역구 선택</option>
            <option value="중구" ${cri.gu eq '중구' ? 'selected' : "" }>중구</option>
            <option value="동구" ${cri.gu eq '동구' ? 'selected' : "" }>동구</option>
            <option value="서구" ${cri.gu eq '서구' ? 'selected' : "" }>서구</option>
            <option value="대덕구" ${cri.gu eq '대덕구' ? 'selected' : "" }>대덕구</option>
            <option value="유성구" ${cri.gu eq '유성구' ? 'selected' : "" }>유성구</option>
          </select>
          <select id="dongList" name="dong" style="height:100%;width:100px;">
            <option value="" selected>동 선택</option>
          </select>
          <input type="text" name="name" value="${cri.name }" placeholder="이름" style="width:100px;text-align:center;" />
          <button onclick="list_go(1);" class="btn btn-primary btn-sm" style="width:100px;float:right;">조회</button>
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
                <c:forEach var="member" items="${memberList }">
                  <fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd" var="regDate" />
                  <tr onclick="memDetail_go(${member.id});">
                    <td>${member.memType }</td>
                    <td>${member.name }</td>
                    <td style="font-size:0.9rem;">${regDate }</td>
                    <td>미설치</td>
                    <c:if test="${empty member.wid }">
	                    <td >
	                      미배정
	                    </td>
                    </c:if>
                    <c:if test="${not empty member.wid }">
	                    <td class="bg-primary">
	                      미배정
	                    </td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
          </table>
        </div>

        <%@ include file="/WEB-INF/views/manager/module/pagination.jsp" %>

      </div>
      <!-- 대상자 목록 끝-->
    </div>
    <!-- 대상자 상세정보 -->
    <div class="col-7">
      <div class="card card-body" style="border:2px dotted gray;height:400px;">
        <div style="position:relative;">
          <span class="fs-3 mem_title" style="border-bottom:2px solid gray;">대상자 정보</span>
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
            <option value="">장기부재신청</option>
            <option value="">건강상태</option>
          </select>
          &ensp;기간&nbsp;<input type="date" style="width:120px;" />&nbsp;-&nbsp;<input type="date" style="width:120px;" />
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
        <div id="memReport_detail" style="height:100%;width:100%;background-color:#dfdfdf;">

          <!-- 보고서 상세가 여기로 오겠지 -->
        </div>
      </div>
    </div>
  </div>
  <!-- 보고서 상세 끝 -->
</div>

<!-- 생활지원사 배정 모달 영역 -->
<%@include file="../modal/lsupporterReg.jsp" %>
<!-- 비상연락망 리스트 모달 -->
<%@include file="../modal/ecallList.jsp" %>
<!-- 비상연락망 등록 모달 -->
<%@include file="../modal/ecallReg.jsp" %>
<!-- 비상연락망 수정 모달 -->
<%@include file="../modal/ecallModify.jsp" %>

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

<script type="text/x-handlebars-template" id="dong-list-template">
  <option value="" selected="selected">동 선택</option>
{{#each .}}
	<option value="{{dongName}}">{{dongName}}</option>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="ecall-list-template">
  {{#each .}}
    <tr>
      <td>{{name}}</td>
      <td>{{relation}}</td>
      <td>{{phone}}</td>
    </tr>
  {{/each}}
</script>

<script>
  function dongList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        alert("되는거 맞지");
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
        console.log(html);
        $('#dongList').html(html);
      }
    });
  }

  function dongRegList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        alert("되는거 맞지");
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
        console.log(html);
        $('#dongRegList').html(html);
      }
    });
  }
  
  function dongModiList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        alert("되는거 맞지");
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
        console.log(html);
        $('#dongModiList').html(html);
      }
    });
  }

  function list_go(page, url) {
    if (!url) url = "main";
    var page = $("form#jobForm input[name='page']").val(page);
    var memType = $("form#jobForm input[name='memType']").val($('select[name="memType"]').val());
    var gu = $("form#jobForm input[name='gu']").val($('select[name="gu"]').val());
    var dong = $("form#jobForm input[name='dong']").val($('select[name="dong"]').val());
    var name = $("form#jobForm input[name='name']").val($('input[name="name"]').val());
    $('form#jobForm').attr({
      action: url,
      method: 'get'
    }).submit();
  }
  
  //등록화면 호출
  function registForm_go() {
    $.ajax({
      url: "regist",
      type: "get",
      datatype: "html",
      success: function(data) {
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(data);
        $(".mem_title").html("<span class='regist_text'>대상자 정보(등록)</span>");
        $("#reList").html('');
        $("#reList").append('<div class="h-100 d-flex justify-content-center align-items-center" style="background-color:#dfdfdf">대상자를 선택해주세요.</div>');
        $("#memReport_detail").html('');
        $("#memReport_detail").append('<div class="h-100 d-flex justify-content-center align-items-center" style="background-color:#dfdfdf">-</div>');
        $("#reg-btn").hide();
        // modal open(비상연락망)
        $('#openRegPhoneModal').on('click', function() {
          $('#modalBox3').modal('show');
          alert("뭐냐1");
          //입력박스 숨어있다가
          $("#rel").change(function() {
            //기타를 선택하면 등장
            if ($("#rel").val() == "etc") {
              $("#relInput").show();
            } else {
              $("#relInput").hide();
            }
          });
          var s = $("#cPhone").html();
          var num = 2;
          $("#addPhoneBtn").on('click', function addPhone_go() {
            if ($("#cPhone").children().length > 2) {
              alert("비상연락망은 3개까지 등록가능합니다.");
              $("#cPhone").append('');
              return false;
            } else {
              $("#cPhone").find("#cPhone_list").attr("data-name", num);
              $("#cPhone").append(s);
              num++;
            }
          });
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox3').modal('hide');
        });
      }
    });
  }
  
  // 대상자 상세화면 호출
  function memDetail_go(id) {
    $.ajax({
      url: "detail?id=" + id,
      type: "get",
      datatype: "text",
      success: function(data) {
        var e = $(data).find("#mem_Detail").html();
        var f = $(data).find("#re_List").html();
        // 대상자 상세
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(e);
        $(".mem_title").html("<span class='regist_text'>대상자 정보</span>");
        // 대상자 관련 보고서 리스트
        $("#reList").css('background-color', "");
        $("#reList").html(f);
        if ($("#reg-btn").css('display', 'none')) {
          $("#reg-btn").css('display', 'inline');
        }
        // modal open(생활지원사)
        $('#openModalBtn').on('click', function() {
          $('#modalBox').modal('show');
          $("#reg_lsupp").on('click', function() {
            var check = $("#lsupp").find('input:checked').val();
            alert(check);
            alert('뭔디');
            $('#modalBox').modal('hide');
          });
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox').modal('hide');
        });
        
        // modal open(비상연락망)
        $('#openPhoneModal').on('click', function() {
          $('#modalBox2').modal('show');
          alert(id);
          $.ajax({
            url: "ecall?id=" + id,
            type: "get",
            datatype: "json",
            success: function(data) {
              let template = Handlebars.compile($('#ecall-list-template').html());
              let html = template(data);
              $('#ecallList').html(html);
            }
          })
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox2').modal('hide');
        });
      }
    });
  }
  // 대상자 정보 수정화면 호출
  function memModifyForm_go(id) {
    $.ajax({
      url: "modify?id="+id,
      type: "get",
      datatype: "text",
      success: function(data) {
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(data);
        $(".mem_title").html("<span class='regist_text'>대상자 정보(수정)</span>");
        // modal open
        $('#openModiPhoneModal').on('click', function() {
          $('#modalBox4').modal('show');
          alert(id);
        });
      }
    })
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

  function memReport_go() {
    $.ajax({
      url: "reDetail",
      type: "get",
      datatype: "html",
      success: function(data) {
        $("#memReport_detail").css('background-color', "");
        $("#memReport_detail").html(data);
      }
    })
  }
</script>

<%@include file="../common/foot.jspf" %>