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
			<div class="card">
				<h3 class="card-header p-4">
					{{info.title}} <span class="badge badge-pill badge-dark pull-right"
						style="float: right;"> {{info.changedate}}</span>
				</h3>
				<h4 class="card-header p-4">{{info.aId}}</h4>
				<div class="card-body">
					<div style="margin: 10px 10px 10px 10px;">{{info.content}}</div>
				</div>
			</div>
			<button @click="fnList" class="btn" style="float: right;">목록</button>
			<button @click="fnMoveUpd(info)" class="btn" style="float: right;">수정</button>
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
			fnGetAnoymous : function() {
				var self = this;
				var nparmap = {
					bNo : self.bNo
				};
				$.ajax({
					url : "/view_anoymous.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.anoymous;
					}
				});
			},

			fnList : function() {
				location.href = "/anoymous.do";
			},

			fnMoveUpd : function(item) {
				var self = this;
				self.pageChange("./update_anoymous.do", {
					bNo : item.bNo
				});
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
			var self = this;
			self.fnGetAnoymous();
		}
	});
</script>