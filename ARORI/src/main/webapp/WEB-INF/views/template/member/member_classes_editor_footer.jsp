<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
					<div class="col-sm-3 col-md-3 col-lg-2 calendar-nav">
                        <br>
                        <h3 class="font-weight-bold mt-5">Calendar</h3>
                        <div id="menu">
                            <span id="menu-navi">
                            </span>
                            <span id="renderRange" class="render-range"></span>
                        </div>
                      
                        <div id="calendar" class="w-100 h-50"></div>
                    </div>
            	</div>
            </div>
        </div>
    </div>
    <!-- 취소 모달 -->
	<div class="modal" tabindex="-1" id="saveModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title font-weight-bold">해당 게시글을 임시 저장하시겠습니까?</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>임시 저장을 하지 않으시면 작성하신 모든 데이터는 삭제됩니다.</p>
	        <p>임시 저장을 진행하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-link font-weight-bold"  data-dismiss="modal">창 닫기</button>
	        <button type="button" class="btn btn-primary font-weight-bold" id="saveCancel" data-dismiss="modal">작성 취소</button>
	        <button type="button" class="btn btn-warning font-weight-bold" id="save" data-dismiss="modal">임시 저장</button>
	      </div>
	    </div>
	  </div>
	</div>
    <!-- Toast Editor -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-chart/latest/toastui-editor-plugin-chart.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-uml/latest/toastui-editor-plugin-uml.min.js"></script>