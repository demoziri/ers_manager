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
          <tbody>
            <tr id="lsupp" style="height:100px;vertical-align:middle;">
              <td>
                <input type="checkbox" value="야야야"/>
              </td>
              <td>
                <div id="pictureView" class="manPicture mt-1" data-id="${member.id }" style="border: 1px solid green; height: 80px; width: 60px; margin: 0 auto;"></div>
              </td>
              <td >이정호 / 남 / 27 </td>
            </tr>
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