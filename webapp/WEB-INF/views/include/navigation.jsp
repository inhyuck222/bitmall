<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script type="text/javascript">
var ejsCategoryListItem = new EJS({
	url : "${pageContext.request.contextPath }/assets/js/ejs/template/categoryNavItem.ejs",
});

var contextPath='<%=request.getContextPath()%>';

var loadNavigation = function(){
	$.ajax({
		url: "/bitmall/api/category/list", 
		type: "post", 
		dataType: "json", 
		contentType: "application/json", 
		success: function(response){
			
			if(response.result == "fail"){
				console.log(response.message)
				deleteDialog.dialog("close");
				return;
			}
			
			response.data.forEach(function(values){			
				values.contextPath = contextPath;
				var html = ejsCategoryListItem.render(values);
				$(html).insertAfter("#category-nav-head");		
			});
			
		}
	});
}

$(function(){
	loadNavigation();
	
	$(document).on("click", "#btn-category", function(event){
		event.preventDefault();
	});
});

</script>
			<table id='category-table' width="150">
				<tr> 
					<td valign="top">
						<table>
							<tr id="category-nav-head">
								<td height="30"align="center" style="font-size:12pt;color:#333333"><b>Category</b></td>
							</tr>
						</table>
					</td>
				</tr>				
			</table>