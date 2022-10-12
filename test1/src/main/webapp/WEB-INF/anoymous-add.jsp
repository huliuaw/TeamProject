<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/menu.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>익명게시판</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>게시판 등록</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td style="text-align: center;">제목</td>
					<td><input type="text" id="title" name="title" v-model="title"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="content"
							v-model="content"></textarea></td>
				</tr>
			</table>
			<button @click="fnList" class="btn" style="float: right;">목록</button>
			<button @click="fnSave" class="btn" style="float: right;">저장</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			selectedItemList : [],
			content : "",
			title : "",
			status : ""
		},
		methods : {
			fnSave : function() {
				var self = this;
				var nparmap = {
					title : self.title,
					content : self.content,
					status : 'A'
				};
				$.ajax({
					url : "/add_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("저장되었습니다..");
						location.href = "/anoymous.do";
					}
				});
			},
			fnList : function() {
				location.href = "/anoymous.do";
			}
		},
		created : function() {

		}
	});
</script>