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
			<h2>게시글 목록</h2>
			<table class="board_list">
				<colgroup>
					<col width="15%" />
					<col width="*" />
					<col width="15%" />
					<col width="25%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list">
						<td><a href="javascript:;" @click="fnView(item)">{{item.bNo}}</a></td>
						<td><a href="javascript:;" @click="fnView(item)">{{item.title}}</a></td>
						<td>{{item.bView}}</td>
						<td><label v-bind:for="'idx_' + index">{{item.changedate}}</label></td>
					</tr>
				</tbody>
			</table>
			<div>
				<button @click="fnAdd" style="float: right;">작성</button>

			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			selectedItemList : []
		},
		methods : {

			// 리스트
			fnGetList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "/list_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			},

			// 조회
			fnView : function(item) {
				var self = this;
				self.pageChange("./view_anoymous.do", {
					bNo : item.bNo
				});
			},

			// 작성
			fnAdd : function() {
				var self = this;
				self.pageChange("./add_anoymous.do", {});
			},

			// 페이지 전환
			pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					//	this.linkCall(url);
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for ( var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
						val = JSON.stringify(param[name]);
					} else {
						val = param[name];
					}
					var input = document.createElement("input");
					input.type = "hidden";
					input.name = item;
					input.value = val;
					form.insertBefore(input, null);
				}
				document.body.appendChild(form);
				form.submit();
				document.body.removeChild(form);
			}
		},
		created : function() {
			this.fnGetList();
		}
	});
</script>