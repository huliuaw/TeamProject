<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/menu.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card">
				<h3 class="card-header p-4">
					{{info.title}} <span class="badge badge-pill badge-dark pull-right"
						style="float: right;">{{info.changedate}}</span>
				</h3>
				<div class="card-body">
					<div style="margin: 10px 10px 10px 10px;">{{info.content}}</div>
				</div>
			</div>
			<button @click="fnList" class="btn" style="float: right;">목록</button>
			<button @click="fnDel" class="btn" style="float: right;">삭제</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			bNo : "${map.bNo}"
		},
		methods : {
			fnGetBoard : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo
				};
				$.ajax({
					url : "/view_board.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.board;
					}
				});
			},
			
			// 삭제
			fnDel : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo
				};
				$.ajax({
					url : "/del_board.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("삭제되었습니다.");
						location.href = "/notice.do";
					}
				});
			},
			
			fnList : function() {
				location.href = "/board.do";
			}
		},
		created : function() {
			var self = this;
			self.fnGetBoard();
		}
	});
</script>