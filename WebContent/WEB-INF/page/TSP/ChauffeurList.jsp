<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>

    <script src="<%=request.getContextPath() %>/js/tabrow_hover.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">

        window.onload = function() {
            tabrow_hover("tabData");
        };
        function Detail() {
            window.showModalDialog("ChauffeurDetail.htm", window, "dialogWidth:640px;dialogHeight:400px;status:no;");
        }
        function CheckAll(checkitems) {
            var chk = document.getElementsByName("chk");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].type == 'checkbox') {
                    chk[i].checked = checkitems.checked;
                }
            }
        }
        function Delete() {
			 var count = 0;
            var chk = document.getElementsByName("chk");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].checked) {
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择要删除的司机信息");
                flag = false;
                return false;
            }else{
            	window.value = confirm("确认删除吗？");
            	if (window.value == true) {
            		var s="";
            		var chk1 = document.getElementsByName("chk");
                    for (var i = 0; i < chk1.length; i++) {
                        if (chk1[i].checked) {
                            s=s+chk1[i].value+",";
                        }
                    }
                    window.location.href='ChauffeurAction_delect.action?ids='+s;
            }
			}
        }
        function chk() {
            var count = 0;
            var chk = document.getElementsByName("chk");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].checked) {
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择一项司机信息");
                flag = false;
                return false;
            }
            if (count > 1) {
                alert("只能选择一项司机信息");
                flag = false;
                return false;
            }
            flag = true;
        }
        function Update() {
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
               window.location.href = 'ChauffeurAction_editUI.action?id='+id;
            }
        }
    </script>

</head>
<body>
   
    <div class="divMain">
        <div class="modelTitle">
            检索条件</div>
        <s:form action="ChauffeurAction_query">
        <div class="divSelect">
            <table class="tabModel">
                <tr>
                    <td class="tabModelTip">
                        司机编号：
                    </td>
                    <td>
                        <%-- <select class="textMid">
                             <option>---请选择---</option>
                            <option>E-SJ199805011</option>
                            <option>E-SJ199805011</option>
                        </select> --%>
                       <%--  <s:textfield name="id"></s:textfield> --%>
                      <s:select list="#list1"  headerKey="" cssClass="textMid"  headerValue="--选择司机编号--" name="chauffeurId"></s:select> 
                       <%-- <select name="chauffeur.id">
	  						<c:forEach items="${list1}" var="chauffeur" > 
							<option value="${chauffeur.id }">${chauffeur.id  }</option>
 						</c:forEach> 
						</select> --%>
                    </td>
                    <td class="tabModelTip">
                        工作状态：
                    </td>
                    <td>
                        <%-- <select>
                         <option>---请选择---</option>
                            <option>出车</option>
                            <option>未出车</option>
                        </select> --%>
                        <s:select list="#{1:'',2:'出车',3:'未出车' }" listKey="value" listValue="value" name="state"></s:select>
                    </td>
                    <td>
                        <!-- <input id="btnSelect" type="button" class="btn" value="查 询" /> -->
                        <s:submit value="查询" cssClass="btn"></s:submit>
                    </td>
                </tr>
            </table>
        </div>
        </s:form>
        <div class="divBtn">
            <input id="btnAdd" type="button" value="新 增" onclick="location.href='ChauffeurAction_addUI.action'"
                class="btn" />&nbsp;
                <input id="Button2" type="button" value="删 除" onclick="Delete()" class="btn" />&nbsp;
            <input id="Button3" type="button" value="修 改" onclick="Update()" class="btn" />
            
        </div>
        <div class="divDataList">
            <div class="modelTitle">
                司机信息列表</div>
            <table id="tabData" class="tabData">
                <tr class="header">
                    <td style="width: 3%;">
                        <input type="checkbox" onclick=" return CheckAll(this)" />
                    </td>
                    <th>
                        司机编码
                    </th>
                    <th>
                        司机姓名
                    </th>
                    <th>
                        电话
                    </th>
                    <th>
                        地址
                    </th>
                    <th>
                        司机状态
                    </th>
                </tr>
             <s:iterator value="#list"> 
             
                <tr>
                    <td>
                        <input name="chk" type="checkbox" value="${id }"/>
                    </td>
                    <td>
                        <a href="ChauffeurAction_detail.action?id=${id }">${id }</a>
                    </td>
                    <td>
                      ${name }
                    </td>
                    <td>
                       ${telPhone }
                    </td>
                    <td>
                       ${address }
                    </td>
                    <td>
                       ${state }
                    </td>
                </tr>
               </s:iterator>   
                <tr class="page">
                    <td colspan="6">
                        <div class="leftPage">
                             共${pageBean.totalCount}条记录，当前第${pageBean.page}/${pageBean.totalPage}页，每页${pageBean.pageSize}条记录
                        </div>
                        <div class="rightPage">
                            <!-- 这是所有数据的list的分页，用一个变量标记 -->
                              <s:if test="%{#allListid=='allListid'}">
                              	<s:if test="%{#pageBean.page==1}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="ChauffeurAction_list?pageBean.page=1" cssClass="btnPage">首页</s:a>
                              		<s:a action="ChauffeurAction_list?pageBean.page=%{#pageBean.page-1}" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="ChauffeurAction_list?pageBean.page=%{#pageBean.page+1}" cssClass="btnPage">下一页</s:a>
                              		<s:a action="ChauffeurAction_list?pageBean.page=%{#pageBean.totalPage}" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="ChauffeurAction_list" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:if>
                              <!--查询有条件时的分页 -->
                              <s:else>
                              	
                              	<s:if test="%{#pageBean.page==1}">
                              		<%-- <s:a action="CarRepairAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarRepairAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a> --%>
                              	</s:if>
                              	<s:else>
                              		<s:a action="ChauffeurAction_query?pageBean.page=1&cahxuanid=1" cssClass="btnPage"> 首页</s:a>
                              		<s:a action="ChauffeurAction_query?pageBean.page=%{#pageBean.page-1}&cahxuanid=1" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="ChauffeurAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="ChauffeurAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="ChauffeurAction_query" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:hidden name="cahxuanid" ></s:hidden>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:else>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
