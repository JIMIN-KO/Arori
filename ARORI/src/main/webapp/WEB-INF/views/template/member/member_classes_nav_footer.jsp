<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Toast Calendar -->
    <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
    <script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	
	<!-- resources > Toast Editor Viewer -->
	<script>
		// Toast Ui Calendar
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