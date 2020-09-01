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
    <!-- Toast Editor Plugin -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-chart/latest/toastui-editor-plugin-chart.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-uml/latest/toastui-editor-plugin-uml.min.js"></script>
	<script>
		const content = [${readmeDto.r_content}].join('\n')
		const viewer = toastui.Editor.factory({
			  el: document.querySelector('#viewer'),
			  viewer: true,
			  height: '1000px',
			  initialValue: content,
			  initialEditType: 'markdown'
		});
	</script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/toast_ui_viewer.js"></script> --%>
	