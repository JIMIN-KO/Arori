<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var message = '${msg}';
var returnUrl = '${url}';
alert(msg);
document.location.href=retrunUrl;
</script>