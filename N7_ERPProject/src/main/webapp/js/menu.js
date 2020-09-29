
	$(document).ready(function(){
		$.ajax({
			url:'/erp/rest/managermode/getaddmenu',
			type:'get',
			datatype:'json',
			success:function(data){
				console.log(data);
				var str="";

				for(var i in data.mList){
					str+="<li><a id="+data.mList[i].f_functions+" onclick=menu('"+data.mList[i].f_functions+"')>"+data.mList[i].f_functions+"</a></li>";
				}

				$("#mainmenu").html(str);
			},
			error:function(error){
				console.log(error);
			}

		});

	});

	function menu(menu){
		console.log(menu);

		if(menu=="인사관리"){
			$("#"+menu).attr("href","/erp/hr/movehrcardpage");
			}else if(menu=="영업관리"){
			$("#"+menu).attr("href","/erp/sales/main");
			}else if(menu=="구매관리"){
			$("#"+menu).attr("href","/erp/Purchase/erpmain");
			}else if(menu=="재고관리"){
			$("#"+menu).attr("href","/erp/stock/setcategory");
			}else if(menu=="회계관리"){
			$("#"+menu).attr("href","/erp/Account/acerp");
			}
	}