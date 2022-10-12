<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div id="app">
		test
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       test1 : "${map123.test1}"
    	, test2 : "${map123.test2}"
    }   
    , methods: {
        

    }   
    , created: function () {
    	var self = this;
    	console.log(self.test1);
    	console.log(self.test2);
	}
});
</script>