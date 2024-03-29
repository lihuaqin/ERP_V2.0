//创建menu
var userBusinessList = null;
var type = null;
var options = "";
var kid = null;
var lei = null;
var functions = "";
var btnStrList = []; //按钮权限列表
//初始化系统基础信息
function initSystemData(kid, type) {
    $.ajax({
        type: "get",
        url: "/userBusiness/getBasicData",
        data: ({
            KeyId: kid,
            Type: type
        }),
        //设置为同步
        async: false,
        dataType: "json",
        success: function (res) {
            if (res && res.code === 200) {
                userBusinessList = res.data.userBusinessList;
            }
            else {
                userBusinessList = null;
            }
        }
    });
}
//初始化页面选项卡
function initSelectInfo(lei) {
    if (userBusinessList != null) {
        if (userBusinessList.length > 0) {
            options = userBusinessList[0].value;
            if (options != "") {
                options = options.substring(1, options.length - 1);
            }
            //功能菜单列表
            if (lei == 2) {
                functions += options + '][';
            }
            //按钮权限列表
            else if (lei == 3) {
                var btnStr = userBusinessList[0].btnstr;
                if (btnStr != null) {
                    var btnObj = JSON.parse(btnStr);
                    for (var j = 0; j < btnObj.length; j++) {
                        btnStrList.push(btnObj[j]);
                    }
                }
            }
        }
    }
}
var id =sessionStorage.getItem("userId");
initSystemData(id, 'UserRole');
initSelectInfo(1);
var arr = options.split('][');
for (var i in arr) {
    initSystemData(arr[i], 'RoleFunctions'); //根据角色找functions
    initSelectInfo(2); //功能菜单列表
    initSelectInfo(3); //查询角色对应的按钮权限
}
if (functions != "") {
    functions = "[" + functions.substring(0, functions.length - 1);
    //alert(functions);
}
if (btnStrList.length > 0) {
    window.winBtnStrList = JSON.stringify(btnStrList); //将按钮功能列表存为全局变量
}
$.ajax({
    type: "post",
    url: "/functions/findMenu",
    data: ({
        pNumber: 0,
        hasFunctions: functions
    }),
    dataType: "json",
    async: false,
    success: function (res) {
        if (res) {
        	var html= '';
        	for (var i in res) {
        		html += '<li class="treeview"  id = "'+ res[i].number +'">'+
	    		'	<a href="javascript:" data-href="blank" class="addTabPage"  onclick = "loadChildren(\''+res[i].number+'\')" title="'+res[i].text+'" data-code="'+res[i].id+'">'+
	    		'		<i class="fa fa-fw '+res[i].icon+ '"></i>                                                          '+
	    		'		<span>'+res[i].text+'</span>                                                                      '+
	    		'		<span class="pull-right-container">                                                        '+
	    		'			<i class="fa fa-angle-left pull-right"></i>                                            '+
	    		'		</span>                                                                                    '+
	    		'	</a>                                                                                           '+
	    		'</li>';
        	}
        	$(".sidebar-menu").html(html);
         
        }
    }

});


function loadChildren(pnumber){
	console.log(pnumber);
	var first = $("#" +pnumber ).children()[0];
	$("#" +pnumber ).html("");
	$("#" +pnumber ).html($(first));
	$(".active").attr("class" , "treeview");
	$.ajax({
	    type: "post",
	    url: "/functions/findMenu",
	    data: ({
	        pNumber: pnumber,
	        hasFunctions: ''
	    }),
	    dataType: "json",
	    async: false,
	    success: function (res) {
	    	if (res) { 
		    	var html = '	<ul class="treeview-menu">                                                                     ';
		    	for (var i in res) {
		    		html +='		<li class="treeview">                                                                      '+
				    		'			<a href="javascript:" data-href="'+ res[i].url +'" class="addTabPage" title="'+res[i].text+'" '+
				    		'			   data-code="'+res[i].id+'">                                                                 '+
				    		'				<i class="fa fa-fw '+res[i].icon+'"></i>                                                  '+
				    		'				<span>'+res[i].text+'</span>                                                              '+
				    		'			</a>                                                                                   '+
				    		'		</li>                                                                                      ';
		    		
		    	}

		    	html +=	'	</ul>                                                                                          ';
		    	$("#" + pnumber ).append(html);
		    
	    	}	    	
	    	
	    }
	});
	
}