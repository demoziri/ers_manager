<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">

<!-- 대상자 사진 -->
<form role="modiform" class="row pe-0">
<div class="col-3 border p-0">
  <div class="row">
    <input type="hidden" name="oldPicture" value="${member.picture }" />
    <input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display: none" />
    <div class="input-group col-md-12">
       <div class="col-md-12" style="text-align: center;">
          <div class="manPicture" data-id="${member.id }" id="pictureView"
             style="border: 1px solid green; height: 180px; width: 140px; margin: 0 auto; margin-bottom: 5px;"></div>
          <div class="input-group input-group-sm" >
             <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
             <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled value="${member.picture.split("\\$\\$")[1]}" style="width:30px;"/>
             <input name="uploadPicture" class="form-control" type="hidden" id="picture" />
          </div>
       </div>
    </div>
 </div>
</div>
<!-- 대상자 상세정보 -->
<div class="col-9 border">
  <table class="table table-bordered mb-0 mt-1" style="height:75%;">
    <tr>
      <th>대상자 구분</th>
      <td>
        ${member.memType }
      </td>
      <th>이름</th>
      <td>
        ${member.name }
      </td>
    </tr>
    <tr>
      <th>생년월일</th>
      <td>
        <c:set value="${member.birth }" var="birth"/>
        19${fn:substring(birth,0,2) }년
        ${fn:substring(birth,2,4) }월
        ${fn:substring(birth,4,6) }일
      </td>
      <th>전화번호</th>
      <td>
        <c:set value="${member.phone }" var="phone"/>
        <c:set value="${fn:substring(phone,0,3) }" var="start"/>
        <c:set value="${fn:substring(phone,4,8) }" var="middle"/>
        <c:set value="${fn:substring(phone,9,13) }" var="end"/>
	
        <select name="phone" id="">
          <option value=""> 선택 </option>
          <option value="042" ${start eq '042' ? 'selected' : "" }>042</option>
          <option value="010" ${start eq '010' ? 'selected' : "" }>010</option>
        </select>
        -<input type="text" name="phone" value="${middle }" style="width:50px;" />
        -<input type="text" name="phone" value="${end }" style="width:50px;" />
      </td>
    </tr>
    <tr>
      <th>구</th>
      <td>
       <c:set value="${member.address }" var="address"/>
       <c:set value="${fn:split(address,' ')[1]}" var="gu"/>
       <c:set value="${fn:split(address,' ')[2]}" var="dong"/>
       <c:set value="${fn:split(address,' ')[3]}" var="detail"/>
       <%-- <c:set value="${fn:indexOf(address, detail }" var="detailIndex"/>
       <c:set value="${fn:substring(address,'detailIndex' }" var="realDetail"/> --%>
      
       
    	<input type="hidden" name="address" value="대전광역시" />
        <select name="address" id="lNum" onchange="dongModiList_go(this.value)">
          <option value="" >선택</option>
          <option value="중구" data-name="L02" ${gu eq '중구' ? 'selected' : "" }>중구</option>
          <option value="서구" data-name="L01" ${gu eq '서구' ? 'selected' : "" }>서구</option>
          <option value="동구" data-name="L03" ${gu eq '동구' ? 'selected' : "" }>동구</option>
          <option value="유성구" data-name="L04" ${gu eq '유성구' ? 'selected' : "" }>유성구</option>
          <option value="대덕구" data-name="L05" ${gu eq '대덕구' ? 'selected' : "" }>대덕구</option>
        </select>
      </td>
      <th>동</th>
      <td>
        <select name="address" id="dongModiList">
          <option value="${dong}" selected>${dong}</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>상세주소</th>
      <td colspan="3">
        <input type="text" name="address" value="${detail }"style="width:100%;" />
      </td>
    </tr>
    <tr>
      <th>고위험도</th>
      <td>
        <select name="caution">
          <option value="">선택</option>
          <option value="Y" ${member.caution eq 'Y' ? 'selected' : "" }>Y</option>
          <option value="N" ${member.caution eq 'N' ? 'selected' : "" }>N</option>
        </select>
      </td>
      <th>상태</th>
      <td>
        <select name="status">
          <option value=""></option>
          <option value="1" ${member.status eq '1' ? 'selected' : "" }>서비스 이용중</option>
          <option value="2" ${member.status eq '2' ? 'selected' : "" }>장기부재</option>
          <option value="3" ${member.status eq '3' ? 'selected' : "" }>해지</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>
        <button class="btn btn-danger btn-sm" type="button" id="openModiPhoneModal">비상연락망</button>
      </th>
      <td><span style="font-weight:bold;">${member.e_count }</span>/3</td>
      <th>신청서</th>
      <td>
        <input type="file" style="width:200px;" />
      </td>
    </tr>
  </table>
   <input type="hidden" name="id" value="${member.id }" />
   <input type="hidden" name="lNum" value=""/>
  <div>
    <button type="button" onclick="" class="btn btn-secondary btn-sm my-1 ms-2" style="float:right;color:white;">취소</button>
    <button type="button" onclick="modify_go();" class="btn btn-warning btn-sm my-1" style="float:right;color:white;">수정</button>
  </div>
</div>
</form>

<form role="ecall_modi">
  	<input type="hidden" name="e_Name" value="" />
  	<input type="hidden" id="phone1" name="e_Phone" value=""/>
    <input type="hidden" id="phone2" name="e_Phone" value=""/>
  	<input type="hidden" id="phone3" name="e_Phone" value=""/>
  	<input type="hidden" name="id" value="" />
  	<input type="hidden" name="c_Num" value="" />
  	<input type="hidden" name="relation" value="" id="relation_receive"/>
</form>





</html>