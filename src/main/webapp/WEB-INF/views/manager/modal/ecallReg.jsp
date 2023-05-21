<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modalBox3" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
        <button id="addPhoneBtn" class="btn btn-primary btn-sm" type="button" style="float:right;">+추가</button>
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
              <tr id="cPhone_list" data-name="1">
                <td>
                  <input type="text" name="e_name" style="width:70px;" />
                </td>
                <td>
                  <select name="relation" id="rel1">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <input type="text" name="relation" id="relInput1" style="width:60px;display:none;" />
                </td>
                <td>
                  <select name="e_phone1" id="">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" />
                  <input type="text" name="e_phone3" style="width:50px;" />
                </td>
              </tr>
              <tr id="cPhone_list" data-name="2">
                <td>
                  <input type="text" name="e_name" style="width:70px;" />
                </td>
                <td>
                  <select name="relation" id="rel2">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <input type="text" name="relation" id="relInput2" style="width:60px;display:none;" />
                </td>
                <td>
                  <select name="e_phone1" id="">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" />
                  <input type="text" name="e_phone3" style="width:50px;" />
                </td>
              </tr>
              <tr id="cPhone_list" data-name="3">
                <td>
                  <input type="text" name="e_name" style="width:70px;" />
                </td>
                <td>
                  <select name="relation" id="rel3">
                    <option value="">선택</option>
                    <option>아들</option>
                    <option>딸</option>
                    <option value="etc">기타</option>
                  </select>
                  <input type="text" name="relation" id="relInput3" style="width:60px;display:none;" />
                </td>
                <td>
                  <select name="e_phone1" id="">
                    <option value="">선택</option>
                    <option value="010">010</option>
                    <option value="042">042</option>
                  </select>
                  <input type="text" name="e_phone2" style="width:50px;" />
                  <input type="text" name="e_phone3" style="width:50px;" />
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