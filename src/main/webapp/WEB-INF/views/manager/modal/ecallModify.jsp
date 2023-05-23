<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modalBox4" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title mx-auto" id="staticBackdropLabel">비상연락망</h4>
        <button id="addPhoneBtn" class="btn btn-primary btn-sm" type="button" style="float:right;">+추가</button>
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
            <tbody id="ecall_Modi">
              <!-- template 들어올 자리 -->
            </tbody>
          </table>
        
      </div>
      <div class="modal-footer">
        <button type="button" onclick="ecallModi_go();" class="btn btn-warning">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
  
</div>