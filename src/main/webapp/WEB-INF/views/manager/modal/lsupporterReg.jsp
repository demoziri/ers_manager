<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <tbody id="lsuppList">
            
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" id="reg_lsupp" class="btn btn-warning">배정</button>
        <button type="button" class="btn btn-secondary" id="closeModalBtn">취소</button>
      </div>
    </div>
  </div>
</div>