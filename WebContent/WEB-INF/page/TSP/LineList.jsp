<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>查看线路</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath() %>/js/tabrow_hover.js" type="text/javascript"></script>
  	 <script src="<%=request.getContextPath() %>/js/jquery.js" type="text/javascript"></script>
   <script type="text/javascript" language="javascript">
       //模态弹出 
       function Details() {
           window.showModalDialog("LineDetails.html", window, "dialogWidth:640px;dialogHeight:400px;status:no;");
       };
       //光棒效果
       window.onload = function() {
           tabrow_hover("tabData");
       };
       //查询按钮  显示隐藏层
       function divDisplay() {
           document.getElementById("divHide").style.display = "block";
           document.getElementById("divShow").style.display = "none";
       }
       //全选
       function CheckAll(Items) {
           //获得所有name为chk的checkbox
           var chk = document.getElementsByName("chk");
           for (var i = 0; i < chk.length; i++) {
               if (chk[i].type == 'checkbox') {
                   chk[i].checked = Items.checked;
               }
           }
       }
       //只可选择一项
       var flag = false;
       function chk() {
           var count = 0;
           var chk = document.getElementsByName("chk");
           for (var i = 0; i < chk.length; i++) {
               if (chk[i].checked) {
                   count++;
               }
           }
           if (count == 0) {
               alert("请选择一项运输线路管理信息");
               return flag;
           }
           if (count > 1) {
               alert("只能选择一项运输线路管理信息");
               return flag;
           }
           flag = true;
       }
       function Edit() {
           chk();
           if (flag == false) {
               return false;
           } else {
        	   var id;
        	   var chk1 = document.getElementsByName("chk");
               for (var i = 0; i < chk1.length; i++) {
                   if (chk1[i].checked) {
                       id=chk1[i].value;
                   }
               }
               location.href = 'LineAction_editUI.action?id='+id;
           }
       }
       //支持多选
       function chkChoes() {
           var count = 0;
           var chk = document.getElementsByName("chk");
           for (var i = 0; i < chk.length; i++) {
               if (chk[i].checked) {
                   count++;
               }
           }
           if (count == 0) {
               alert("请选择要删除的运输线路信息");
               return flag;
           }
           flag = true;
       }
       //删除
       function del() {
           chkChoes();
           if (flag == false) {
               return false;
           } else {
        	var ids="";
           	var chk1 = document.getElementsByName("chk");
             	for(var i=0;i<chk1.length;i++){
             		 if (chk1[i].checked) {
                          ids=ids+chk1[i].value+",";
                      }
             	}
               if (confirm('确认删除吗？')) {
            		$.ajax({
        				url : "LineAction_delect.action",
        				type : "POST",
        				//data:{}如果没有就不传当有值的时候是比如：  
        				data:{"ids":ids},
        				dataType : "json",
        				complete : function() {
        					window.location.href = "/LIS/TSP/LineAction_list.action";
        				}
        			});
               }
           }
       }
    </script>
</head>
<body>
    <div class="divMain">
    <s:form action="LineAction_query">
    <div class="divSelect">
    <div class="modelTitle">检索条件</div>
        <table  class="tabModel">
            <tr>
                <td class="tabModelTip"><label for="txtLineNum">路线编号:</label></td>
                <td >
                    <!-- <input id="txtLineNum" type="text" class="inputText" /> -->
                    <s:textfield name="id"></s:textfield>
                </td>
                <td class="tabModelTip"><label for="txtLineNum">起点城市:</label></td>
                <td >
                    <%-- <select id="Select1">
                        <option>---请选择---</option>
                        <option>重庆</option>
                        <option>四川</option>
                    </select> --%>
                    <s:select list="#{1:'',2:'重庆',3:'北京',4:'上海' }" listKey="value" listValue="value" name="satrtCity"> </s:select>
                </td>
                <td class="tabModelTip"><label for="txtLineNum">终点城市:</label></td>
                <td >
                   <s:select list="#{1:'',2:'重庆',3:'北京',4:'上海' }" listKey="value" listValue="value" name="endCity"> </s:select>
                </td>
                 <td>
                 	<input id="btnSelect" class="btn" type="submit" value="查 询" onclick="divDisplay();" />
                 </td>
            </tr>
        </table>
        </div>
        
        </s:form>
        <!-- - -->
        <div class="modelTitle">线路信息列表</div>
    <div class="divDataList" id="divShow">
    <div class="divBtn">
    	<input id="btnAdd" class="btn" type="button" value="新增"  onclick="location.href='LineAction_addUI.action'" />
        <input id="btnEdit" type="button" value="修 改" class="btn" onclick="Edit();"/>&nbsp;
        <input id="btnDel" type="button" value="删 除" class="btn" onclick="del();"/>&nbsp;
	</div>
        <table  class="tabData" id="tabData" width="100%">
            <thead>
                <tr class="header">
                	<th style="width:40px;"><input type="checkbox" onclick="return CheckAll(this);" /></th>
                    <th>线路编号</th>
                    <th>起点城市</th>
                    <th>详细地址</th>
                    <th>终点城市</th>
                    <th>详细地址</th>
                    <th>备注信息</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="#list">
                <tr>
                	<td><input type="checkbox" name="chk" value="${id }"/></td>
                    <td><a href="LineAction_detail.action?id=${id }">line${id }</a></td>
                    <td>${startCity }</td>
    				<td>${startDescriptionPlace }</td>
    				<td>${endCity}</td>
    				<td>${ endDescriptionPlace}</td>
    				<td>${remark }</td>
                </tr>
                </s:iterator>
                 <tr class="page">
                    <td colspan="7">
                        <div class="leftPage">
                          共${pageBean.totalCount}条记录，当前第${pageBean.page}/${pageBean.totalPage}页，每页${pageBean.pageSize}条记录
                        </div>
                        <div class="rightPage">
                            <!-- 这是所有数据的list的分页，用一个变量标记 -->
                              <s:if test="%{#allListid=='allListid'}">
                              	<s:if test="%{#pageBean.page==1}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="LineAction_list?pageBean.page=1" cssClass="btnPage">首页</s:a>
                              		<s:a action="LineAction_list?pageBean.page=%{#pageBean.page-1}" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="LineAction_list?pageBean.page=%{#pageBean.page+1}" cssClass="btnPage">下一页</s:a>
                              		<s:a action="LineAction_list?pageBean.page=%{#pageBean.totalPage}" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="LineAction_list" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:if>
                              <!--查询有条件时的分页 -->
                              <s:else>
                              	
                              	<s:if test="%{#pageBean.page==1}">
                              		<%-- <s:a action="LineAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="LineAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a> --%>
                              	</s:if>
                              	<s:else>
                              		<s:a action="LineAction_query?pageBean.page=1&cahxuanid=1" cssClass="btnPage"> 首页</s:a>
                              		<s:a action="LineAction_query?pageBean.page=%{#pageBean.page-1}&cahxuanid=1" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="LineAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="LineAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="LineAction_query" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:hidden name="cahxuanid"></s:hidden>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:else>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <div class="divDataList" id="divHide" style="display:none;">
            <table  class="tabData" id="tabData" width="100%">
            <thead>
                <tr class="header">
                	<th style="width:40px;"><input type="checkbox" /></th>
                    <th>线路编号</th>
                    <th>起点城市</th>
                    <th>详细地址</th>
                    <th>终点城市</th>
                    <th>详细地址</th>
                    <th>备注信息</th>
                </tr>
            </thead>
            <tbody>
            	
            </tbody>
        </table>
        </div>
    </div>
</body>
</html>
