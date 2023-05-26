<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="직원 관리" />
<%@include file="../common/head.jspf" %>

<style>
  .staff_table>tbody>tr:hover {
    background-color: lightblue;
  }
</style>

<div class="container-fluid">
  <div class="row bg-primary bg-gradient" style="height:80px; line-height:80px;">
    <div class="col-5">
      <h1 class="align-self-center " style="line-height:80px; color:white; margin-left:20px; font-size:25px;">직원등록현황</h1>
    </div>
    <div class="col-7" style="">
      <div class="row" style="position:relative; height:90%; align-items:center;">
        <div class="col-4 text-center" style="line-height:normal;">
          <i class="bi bi-people-fill" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:16px;">총 직원수</div>
            <div style="color:white; font-size:25px;">100명</div>
          </div>
        </div>
        <div class="col-4 text-center" style="line-height:normal;">
          <i class="bi bi-people-fill" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:16px;">응급관리요원</div>
            <div style="color:white; font-size:25px;">50명</div>
          </div>
        </div>
        <div class="col-4 text-center" style="line-height:normal;">
          <i class="bi bi-heart-fill" style="color:white; font-size:50px;"></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:16px;">생활지원사</div>
            <div style="color:white; font-size:25px;">50명</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-5">
      <!-- 직원목록 -->
      
        <div class="card card-body mt-1" style="border:1px solid gray;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">직원 목록</span>
          </div>
          <div>
            <select name="memType" id="" style="height:30px;">
              <option value="" selected>직원구분</option>
              <option value="">응급관리요원</option>
              <option value="">생활지원사</option>
            </select>
            <select name="gu" id="" style="height:30px;width:70px;">
              <option value="" selected>지역구</option>
              <option value="">중구</option>
              <option value="">동구</option>
              <option value="">서구</option>
              <option value="">대덕구</option>
              <option value="">유성구</option>
            </select>
            <select name="dong" id="" style="height:30px;width:80px;">
              <option value="" selected>동</option>
            </select>
            <input type="text" placeholder="이름" style="width:100px;" />
            <button type="submit" class="btn btn-primary btn-sm" style="width:50px;float:right;">조회</button>
          </div>
          <div>
            <table class="table table-bordered border-2 mt-1 text-center staff_table">
              <thead style="background-color:#dfdfdf;">
                <tr>
                  <th>직원구분</th>
                  <th>지역구</th>
                  <th>동이름</th>
                  <th>직원명</th>
                </tr>
                <thead>
                <tbody class="table-group-divider">
                  <tr onclick="staffDetail_go();">
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
                  </tr>
                  <tr>
                    <td>응급관리요원</td>
                    <td>서구</td>
                    <td>둔산동</td>
                    <td>박제성</td>
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

    

    </div>
    <!-- 상세정보 -->
    <div class="col-7" style="height:580px;">
      <div class="card card-body  mt-1" style="border:1px solid gray;height:580px;">
        <div style="position:relative;">
          <span class="fs-3" style="border-bottom:2px solid gray;">직원 정보</span>
          <button type="button" class="btn btn-success" id="reg-btn" style="position:absolute;bottom:0;right:0;" onclick="openRegistForm_go();">직원 등록</button>
        </div>
        <div class="row" id="memDetail" style="height:100%;margin-top:5px;background-color:#dfdfdf;">
          <!-- 대상자 상세정보 들어갈 자리 -->
          <div class="h-100 d-flex justify-content-center align-items-center">직원를 선택해주세요.</div>
        </div>
      </div>
    </div>

  </div>
</div>

<script>
  //직원 상세화면 호출
  function staffDetail_go() {
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
          $(function addPhone_go() {
            var s = $("#cPhone_list");
            $("#cPhone").append($("#cPhone_list"));
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
  //오픈윈도우
  function openRegistForm_go() {
    popup = window.open('regist', '등록팝업', 'width=700px,height=700px,scrollbars=yes');
  }
</script>

<%@include file="../common/foot.jspf" %>