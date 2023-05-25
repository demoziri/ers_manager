<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modalBox3" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
       <!--  <button id="addPhoneBtn" class="btn btn-primary btn-sm" type="button" style="float:right;">+추가</button> -->
      </div>
      <div class="modal-body">
       <form role="form2">
          <table class="modal-table table table-bordered w-100">
            <thead>
              <tr>
                <th class="th-1">이름</th>
                <th class="th-2">관계</th>
                <th class="th-3">연락처</th>
              </tr>
            </thead>
            <tbody id="cPhone">
            <!-- 비상연락망1 -->
              <tr id="cPhone_list1">
              
                <td>
                  <input type="text" name="e_name" style="width:70px;" id="e_name_id_1" />
                </td>
                <td>
                  <select name="relation" id="rel_1">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <!-- <input type="text" name="relation2" id="relInput1" style="width:60px;display:none;" /> -->
                </td>
               <td>
                  <select name="e_phone1" id="e_phone1_1">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" id="e_phone1_2"/>
                  <input type="text" name="e_phone3" style="width:50px;" id="e_phone1_3"/>
                </td>
              </tr>
        	
        	<!-- 비상연락망2 -->
              <tr id="cPhone_list2">
              
                <td>
                  <input type="text" name="e_name" style="width:70px;" id="e_name_id_2" />
                </td>
                <td>
                  <select name="relation" id="rel_2">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <!-- <input type="text" name="relation222" id="relInput2" style="width:60px;display:none;" /> -->
                </td>
               <td>
                  <select name="e_phone1" id="e_phone2_1">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" id="e_phone2_2"/>
                  <input type="text" name="e_phone3" style="width:50px;" id="e_phone2_3"/>
                </td>
              </tr>
              
              <!-- 비상연락망1 -->
              <tr id="cPhone_list3">
              
                <td>
                  <input type="text" name="e_name" style="width:70px;" id="e_name_id_3" />
                </td>
                <td>
                  <select name="relation" id="rel_3">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                 <!--  <input type="text" name="relation2222" id="relInput3" style="width:60px;display:none;" /> -->
                </td>
               <td>
                  <select name="e_phone1" id="e_phone3_1">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" id="e_phone3_2"/>
                  <input type="text" name="e_phone3" style="width:50px;" id="e_phone3_3"/>
                </td>
              </tr>
            </tbody>
          </table>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="regEcallBtn" class="btn btn-warning">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>