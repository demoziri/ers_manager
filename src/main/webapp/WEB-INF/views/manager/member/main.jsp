<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="대상자 관리" />
<%@include file="../common/head.jspf" %>

<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.memCri }" />

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
      <div class="searchType card card-body mt-2" style="border:1px solid gray;height:400px;">
        <div>
          <span class="fs-3" style="border-bottom:2px solid gray;">대상자 목록</span>
        </div>
        <div>
          <select name="memType" style="height:100%;">
            <option value="" ${memCri.memType eq '' ? 'selected' : "" }>대상자구분</option>
            <option value="독거노인" ${memCri.memType eq '독거노인' ? 'selected' : "" }>독거노인</option>
            <option value="장애인" ${memCri.memType eq '장애인' ? 'selected' : "" }>장애인</option>
          </select>
          <select name="gu" onchange="dongList_go(this.value)" style="height:100%;width:100px;">
            <option value="" ${cmemCriri.gu eq 'selected' ? 'selected' : "" }>지역구 선택</option>
            <option value="중구" ${memCri.gu eq '중구' ? 'selected' : "" }>중구</option>
            <option value="동구" ${memCri.gu eq '동구' ? 'selected' : "" }>동구</option>
            <option value="서구" ${memCri.gu eq '서구' ? 'selected' : "" }>서구</option>
            <option value="대덕구" ${memCri.gu eq '대덕구' ? 'selected' : "" }>대덕구</option>
            <option value="유성구" ${memCri.gu eq '유성구' ? 'selected' : "" }>유성구</option>
          </select>
          <select id="dongList" name="dong" style="height:100%;width:100px;">
            <option value="" selected>동 선택</option>
          </select>
          <input type="text" name="name" value="${memCri.name }" placeholder="이름" style="width:100px;text-align:center;" />
          <button onclick="list_go(1);" class="btn btn-primary btn-sm" style="width:50px;float:right;">조회</button>
        </div>
        <div id="memList">
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
                    <td style="font-size:0.7rem;vertical-align:middle;">${regDate }</td>
                    <c:if test="${member.machineCk eq 4}">
                      <td style="color:#4f94d4;">설치완료</td>
                    </c:if>
                    <c:if test="${member.machineCk ne 4}">
                      <td style="color:#d63638;">미설치</td>
                    </c:if>
                    <c:if test="${empty member.wid }">
                      <td style="color:#e65054;">
                        미배정
                      </td>
                    </c:if>
                    <c:if test="${not empty member.wid }">
                      <td style="color:#e65054;">
                        배정완료
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
      <div class="card card-body mt-2" style="border:1px solid gray;height:400px;">
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
      <div class="card card-body pt-0 mt-3" style="border:1px solid gray;height:250px;">
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
          <button type="submit" class="btn btn-primary btn-sm" style="width:50px;float:right;">조회</button>
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
      <div class="card card-body pt-0 mt-3" style="border:1px solid gray;height:250px;">
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
<form role="imageForm" action="picture" method="post" enctype="multipart/form-data">
  <!-- enctype안주면 type="file"전송안됨 but,일반적 getparameter안됨 -->
  <input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;" onchange="picture_go();">
  <!-- 업로드한 파일명 oldFile -->
  <input id="oldFile" type="hidden" name="oldPicture" value="test" />
  <!-- 업로드 필수 value 0->1 업로드하지않고 사진만바꾸면 다시 0 -->
  <input type="hidden" name="checkUpload" value="0" />
</form>

<%@include file="../common/foot.jspf" %>

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

<script type="text/x-handlebars-template" id="ecallModi-list-template">
  {{#each .}}
    <tr id="cPhone_list" data-name="1">
      <td>
        <input type="text" name="name" value="{{name}}" style="width:70px;" id="e_name_id_{{cnum}}" />
      </td>
      <td>
        <select name="relation" id="rel_{{cnum}}">
          <option value="{{relation}}" 'selected'>{{relation}}</option>
          <option value="아들">아들</option>
          <option value="딸">딸</option>
          <option value="etc">기타</option>
        </select>
        <input type="text" name="relation" id="relInput" style="width:60px;display:none;" />
      </td>
      <td>
        <select name="phone" id="e_phone{{cnum}}_1">
          <option value="{{substring1 phone}}" selected>{{substring1 phone}}</option>
          <option value="010"></option>
          <option value="042">042</option>
        </select>
        <input type="text" value="{{substring2 phone}}" name="phone" style="width:50px;" id="e_phone{{cnum}}_2" />
        <input type="text" value="{{substring3 phone}}" name="phone" style="width:50px;" id="e_phone{{cnum}}_3" />
        <input id="innerId{{cnum}}" type="hidden" value="{{id}}" />
        <input id="innerCnum{{cnum}}" name="CNUM" type="hidden" value="{{cnum}}" />
      </td>
    </tr>
  {{/each}}
</script>

<script type="text/x-handlebars-template" id="lsupp-list-template">
  {{#each .}}
    <tr style="height:100px;vertical-align:middle;">
      <td>
        <input type="checkbox" value={{wid}} />
      </td>
      <td>
        <div id="pictureView" class="manPicture mt-1" data-id={{wid}} style="border: 1px solid green; height: 80px; width: 60px; margin: 0 auto;"></div>
      </td>
      <td>
        {{name}} / {{gender}} / {{birth}}
      </td>
    </tr>
  {{/each}}
</script>

<script>
  function regist_go() {
    var member_id = "";
    $('input[name="lNum"]').val($('#lNum option:selected').attr("data-name"));
    var forGubun = 2;
    if ($('#e_name_id_2').val() != null && $('#e_name_id_2').val() != "") forGubun += 1;
    if ($('#e_name_id_3').val() != null && $('#e_name_id_3').val() != "") forGubun += 1;
    for (var round = 1; round < forGubun; round++) {
      alert("round"+round);
      alert("gubun"+forGubun);
      var eName = $("#e_name_id_" + round + "").val();
      var ePhone1 = $("#e_phone" + round + "_1").val();
      var ePhone2 = $("#e_phone" + round + "_2").val();
      var ePhone3 = $("#e_phone" + round + "_3").val();
      var relation = $("#rel_" + round + "").val();
      $("input[name='e_Name']").val(eName);
      $("#relation_receive").val(relation);
      $("#phone1").val(ePhone1);
      $("#phone2").val(ePhone2);
      $("#phone3").val(ePhone3);
      var regInfo = $("form[role='form']").serialize();
      
      $.ajax({
        url: "doRegist",
        type: "post",
        data: regInfo,
        success: function(data) {
          member_id = data;
		    memDetail_go(member_id);
		    $("#memList").load(location.href + " #memList");
        },
        error: function() {
          alert("실패?");
        }
      });
    }
    alert("등록이 완료되었습니다.");
  }

  function modify_go() {
    $('input[name="lNum"]').val($('#lNum option:selected').attr("data-name"));
    var form = $("form[role='modiform']")[0];
    var formData = new FormData(form);


    $.ajax({
      url: "doModify",
      type: "post",
      data: formData,
      contentType : false,
      processData : false,     
      success: function(data) {
        alert(data.name + "님의 정보를 수정했습니다.");
        $("#memList").load(location.href + " #memList");
        memDetail_go(data.id);
        $(document).ready(function() {
           MemberPictureThumb('localhost');
        });
		changePicture_go();
      },
      error: function() {
        alert("실패");
      }
    });
  }

  function ecallModi_go() {
    var c_num = $('input[name="CNUM"	]:first').val();
    var numC_num = Number(c_num);
    var c_num2 = numC_num + 1;
    var c_num3 = numC_num + 2;
    var forGubun = 1;
    if ($('#e_name_id_' + c_num + '').val() != null && $('#e_name_id_' + c_num + '').val() != "")
      if ($('#e_name_id_' + c_num2 + '').val() != null && $('#e_name_id_' + c_num2 + '').val() != "") forGubun += 1;
    if ($('#e_name_id_' + c_num3 + '').val() != null && $('#e_name_id_' + c_num3 + '').val() != "") forGubun += 1;
    for (var round = 0; round < forGubun; round++) {
      var numC_num = Number(c_num);
      var eName = $("#e_name_id_" + Number(numC_num + round) + "").val();
      var ePhone1 = $("#e_phone" + Number(numC_num + round) + "_1").val();
      var ePhone2 = $("#e_phone" + Number(numC_num + round) + "_2").val();
      var ePhone3 = $("#e_phone" + Number(numC_num + round) + "_3").val();
      var relation = $("#rel_" + Number(numC_num + round) + "").val();
      var id = $("#innerId" + Number(numC_num + round) + "").val();
      var cnum = $("#innerCnum" + Number(numC_num + round) + "").val();
      $("input[name='id']").val(id);
      $("input[name='c_Num']").val(cnum);
      $("input[name='e_Name']").val(eName);
      $("#relation_receive").val(relation);
      $("#phone1").val(ePhone1);
      $("#phone2").val(ePhone2);
      $("#phone3").val(ePhone3);
      var ecallModiInfo = $("form[role='ecall_modi']").serialize();
      $.ajax({
        url: "modifyEcall",
        type: "post",
        data: ecallModiInfo,
        success: function() {},
        error: function() {
          alert("안됨");
        }
      });
    }
    alert("성공");
    $('#modalBox4').modal('hide');
  }

  function dongList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
        $('#dongList').html(html);
      }
    });
  }

  function dongRegList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
        $('#dongRegList').html(html);
      }
    });
  }

  function dongModiList_go(gu) {
    $.ajax({
      url: "dongList?gu=" + gu,
      type: "get",
      success: function(data) {
        let template = Handlebars.compile($('#dong-list-template').html());
        let html = template(data);
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
          //입력박스 숨어있다가
          $("#rel1").change(function() {
            //기타를 선택하면 등장
            if ($("#rel1").val() == "etc") {
              $("#relInput1").show();
            } else {
              $("#relInput1").hide();
            }
          });
          $("#rel2").change(function() {
            //기타를 선택하면 등장
            if ($("#rel2").val() == "etc") {
              $("#relInput2").show();
            } else {
              $("#relInput2").hide();
            }
          });
          $("#rel3").change(function() {
            //기타를 선택하면 등장
            if ($("#rel3").val() == "etc") {
              $("#relInput3").show();
            } else {
              $("#relInput3").hide();
            }
          });
          /* var s = $("#cPhone").html();
          var dataName = $("#cPhone").find("#cPhone_list").attr("data-name");
          var num = 1;
          
          $("#addPhoneBtn").on('click', function addPhone_go() {
            if ($("#cPhone").children().length > 2) {
              alert("비상연락망은 3개까지 등록가능합니다.");
              $("#cPhone").append('');
              return false;
            } else {
                dataName++;
                $("#cPhone").find("#cPhone_list").attr("data-name", dataName);
                $("#cPhone").append(s);
            }
          }); */
          $('#regEcallBtn').on('click', function() {
            alert("비상연락망을 등록했습니다.");
            $('#modalBox3').modal('hide');
            $('#ecallCount').html("등록완료");
          })
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
        $(document).ready(function() {
          MemberPictureThumb('localhost');
        });
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
          $.ajax({
            url: "regLsupp?id=" + id,
            type: "get",
            dataType: "json",
            success: function(data) {
              let template = Handlebars.compile($('#lsupp-list-template').html());
              let html = template(data);
              $('#lsuppList').html(html);
              //배정 버튼 눌렀을 때	
              $("#reg_lsupp").on('click', function() {
                var wid = $("#lsuppList").find('input:checked').val();
                $.ajax({
                  url: "regLsupporter",
                  type: "post",
                  data: {
                    "wid": wid,
                    "id": id
                  },
                  success: function(data) {
                    alert("생활지원사 배정이 완료되었습니다.");
                    $("#memList").load(location.href + " #memList");
                    $.ajax({
                      url: "lsuppName",
                      type: "get",
                      data: {
                        "id": id
                      },
                      success: function(data) {
                        $("#lsName").text(data);
                      },
                      error: function() {
                        alert("실패지롱");
                      }
                    });
                  },
                  error: function(xhr, status, error) {
                    alert("실패");
                  }
                });
                $('#modalBox').modal('hide');
              });
            }
          });
        });
        // modal close
        $('#closeModalBtn').on('click', function() {
          $('#modalBox').modal('hide');
        });
        // modal open(비상연락망)
        $('#openPhoneModal').on('click', function() {
          $('#modalBox2').modal('show');
          $.ajax({
            url: "ecall?id=" + id,
            type: "get",
            datatype: "json",
            success: function(data) {
              if (data.length == 0) {
                alert("비상연락망을 등록해주세요.");
                return;
              }
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
      url: "modify?id=" + id,
      type: "get",
      datatype: "text",
      success: function(data) {
        $("#memDetail").css('background-color', "");
        $("#memDetail").html(data);
        $(".mem_title").html("<span class='regist_text'>대상자 정보(수정)</span>");
        $(document).ready(function() {
          MemberPictureThumb('localhost');
        });
        // modal open
        $('#openModiPhoneModal').on('click', function() {
          $('#modalBox4').modal('show');
          $.ajax({
            url: "ecall?id=" + id,
            type: "get",
            datatype: "json",
            success: function(data) {
              let template = Handlebars.compile($('#ecallModi-list-template').html());
              Handlebars.registerHelper('substring1', function(phone) {
                return phone.substr(0, 3);
              });
              Handlebars.registerHelper('substring2', function(phone) {
                return phone.substr(4, 4);
              });
              Handlebars.registerHelper('substring3', function(phone) {
                return phone.substr(9);
              });
              let html = template(data);
              $('#ecall_Modi').html(html);
            }
          });
        });
      }
    })
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

  function upload_go() {
    //alert("upload btn");
    if (!$('input[name="pictureFile"]').val()) { //.val() : file 경로
      alert("사진을 선택하세요.");
      $('input[name="pictureFile"]').click();
      return;
    }
    if ($('input[name="checkUpload"]').val() == 1) {
      alert("이미 업로드된 파일입니다.");
      return;
    }
    //var formData = new FormData(document.querySelector('form[role="imageForm"]')); //form태그 객체화 : formdata안에 javascript
    var formData = new FormData($('form[role="imageForm"]')[0]); //form태그 객체화 : formdata안에 jquery
    $.ajax({
      url: "picture",
      data: formData,
      type: "post",
      processData: false,
      contentType: false,
      success: function(data) {
        //업로드 확인변수 세팅
        $('input[name="checkUpload"]').val(1);
        //저장된 파일명 저장
        $('input#oldFile').val(data); //변경시 삭제될 파일명
        $('form[role="form"] input[name="picture"]').val(data);
        alert("사진이 업로드 되었습니다.");
      },
      error: function(error) {}
    });
    //type:post processData:false contentType:false 반드시!! 줘야 formdata 넘어간다.
  }

  function MemberPictureThumb(contextPath) {
    for (var target of document.querySelectorAll('.manPicture')) {
      var id = target.getAttribute('data-id');
      target.style.backgroundImage = "url('/ers/manager/member/getPicture?id=" + id + "')";
      target.style.backgroundPosition = "center";
      target.style.backgroundRepeat = "no-repeat";
      target.style.backgroundSize = "cover";
    }
  }

  function changePicture_go() {
    alert("picture changed");
    var picture = $('input[id="inputFile"]')[0];
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
    $('#inputFileName').val(picture.files[0].name);
  }
</script>