<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="test.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="testProc.jsp">
			<input type="button" value="결제하기" onclick="requestPay()"><p>
		</form>
	</div>
</body>
</html>