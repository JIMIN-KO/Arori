            </div>
        </div>
    </div>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-chart/latest/toastui-editor-plugin-chart.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-uml/latest/toastui-editor-plugin-uml.min.js"></script>
    
    <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
    <script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
    <script>
		const Editor = toastui.Editor;
		const { colorSyntax } = Editor.plugin;
		const { codeSyntaxHighlight } = Editor.plugin;
		const { tableMergedCell } = Editor.plugin;
		const { chart } = Editor.plugin;
		const { uml } = Editor.plugin;
		const editor = new Editor({
			  el: document.querySelector('#editor'),
			  height: '600px',
			  initialEditType: 'markdown',
			  previewStyle: 'vertical',
			  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell, chart, uml]
		});
		/* editor.getHtml(); */

        var Calendar = tui.Calendar;
        var calendar = new Calendar('#calendar', {
        defaultView: 'day',
        taskView: true,
        template: {
            monthDayname: function(dayname) {
            return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
            }
        }
        });
	</script>
</body>
</html>