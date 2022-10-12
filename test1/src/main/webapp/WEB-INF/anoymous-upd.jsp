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

			<table class="board_detail">
				<colgroup>
					<col width="10%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td style="text-align: center;">제목</td>
					<td><input type="text" id="title" name="title" v-model="title"
						readonly="readonly" value="${{info.title}}"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="content"
							v-model="content" value="${{info.content}}"></textarea></td>
				</tr>
			</table>

			<button @click="fnList" class="btn" style="float: right;">목록</button>
			<button @click="fnDel" class="btn" style="float: right;">삭제</button>
			<button @click="fnUpd" class="btn" style="float: right;">저장</button>
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
			bNo : "${map.bNo}",
			title : "",
			content : ""
		},
		methods : {
			fnGetAnoymous : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo
				};
				$.ajax({
					url : "/update_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.anoymous;
					}
				});
			},

			fnDel : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo
				};
				$.ajax({
					url : "/del_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("삭제되었습니다.");
						location.href = "/anoymous.do";
					}
				});
			},

			fnUpd : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo,
					content : info.content
				};
				$.ajax({
					url : "/upd_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("수정되었습니다.");
						location.href = "/anoymous.do";
					}
				});
			},

			fnList : function() {
				location.href = "/anoymous.do";
			}
		},
		created : function() {
			var self = this;
			self.fnGetAnoymous();
		}
	});
</script>