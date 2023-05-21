<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

<!-- 대상자 사진 -->
<form role="form" class="row pe-0">
<div class="col-3 border p-0">
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
<div class="col-9 border">
  <table class="table table-bordered mb-0 mt-1" style="height:75%;">
    <tr>
      <th>대상자 구분</th>
      <td>
        <select name="memType" id="">
          <option value="" selected>선택</option>
          <option value="독거노인">독거노인</option>
          <option value="장애인">장애인</option>
        </select>
      </td>
      <th>이름</th>
      <td>
        <input type="text" name="name" />
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
        -<input type="text" name="phone" style="width:50px;" />
        -<input type="text" name="phone" style="width:50px;" />
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
      <th>성별</th>
      <td>
      	<select name="gender">
          <option value="">선택</option>
          <option value="남">남</option>
          <option value="여">여</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>구</th>
      <td>
      	<input type="hidden" name="address" value="대전광역시" />
        <select name="address" id="lNum" onchange="dongRegList_go(this.value)">
          <option value="">선택</option>
          <option value="중구" data-name="L02">중구</option>
          <option value="서구" data-name="L01">서구</option>
          <option value="동구" data-name="L03">동구</option>
          <option value="유성구" data-name="L04">유성구</option>
          <option value="대덕구" data-name="L05">대덕구</option>
        </select>
      </td>
      <th>동</th>
      <td>
        <select id="dongRegList" name="address" >
            <option value="" selected>선택</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>상세주소</th>
      <td colspan="3">
        <input type="text" name="address" style="width:100%;" />
      </td>
    </tr>
   
    <tr>
      <th>
        <button class="btn btn-danger btn-sm" type="button" id="openRegPhoneModal">비상연락망</button>
      </th>
      <td>0/3</td>
      <th>신청서</th>
      <td>
        <input type="file" style="width:200px;" />
      </td>
    </tr>
  </table>
  <input type="hidden" name="lNum" value=""/>
  <input type="hidden" name="e_Name" value=""/>
  <input type="hidden" name="relation" value=""/>
  <input type="hidden" id="phone1" name="e_Phone" value=""/>
  <input type="hidden" id="phone2" name="e_Phone" value=""/>
  <input type="hidden" id="phone3" name="e_Phone" value=""/>
  
  <div>
    <button type="button" onclick="check_lNum();" class="btn btn-secondary btn-sm my-1 ms-2" style="float:right;color:white;">취소</button>
    <button type="button" onclick="regist_go();" class="btn btn-success btn-sm my-1" style="float:right;color:white;">등록</button>
  </div>
</div>
</form>


</html>