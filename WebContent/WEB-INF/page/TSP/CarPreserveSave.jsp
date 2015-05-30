<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车辆保养信息添加</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function save() {
            alert("新增成功！");
            window.location = "CarSurem.html";
        }
    </script>
</head>
<body>
	<s:form action="CarPreserveAction_%{id==null? 'add': 'edit'}">
	<s:hidden name="id"></s:hidden>
    <!--主界面-->
    <div class="divMain" id="divMain">
        <!--类容-->
        <div>
            <table class="tabModel">
                <tr>
                    <th class="modelTitle" colspan="2">
                        车辆保养信息
                    </th>
                </tr>
                <tr>
    		        <td colspan="2" class="tabModelTitle">
    			        车辆保养记录新增
    		        </td>
    		        
    	        </tr>	
                <tr>
                    <td class="tabModelTip">
                        保修单编号:
                    </td>
                    <td>
                       <s:label value="%{id}"></s:label>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆编号:
                    </td>
                    <td>
                       <s:textfield name="carId" cssClass="inputText"></s:textfield> 
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        保养周期:
                    </td>
                    <td>
                         <s:textfield name="preservePeriod" cssClass="inputText"></s:textfield>年
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        保养时间:
                    </td>
                    <td>
                       <!--  <input type="text" class="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"/> -->
                       <s:textfield name="preserveTime" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        保养地点:
                    </td>
                    <td>
                        <s:textfield name="preserverPlace" cssClass="inputText"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        金额:
                    </td>
                    <td>
                        <s:textfield name="preserveMoney" cssClass="inputText"></s:textfield>
                    </td>
                </tr>
                 <tr>
                    <td class="tabModelTip">
                        用户:
                    </td>
                    <td>
                        <s:textfield name="empName" cssClass="inputText"></s:textfield>
                    </td>
                </tr>
                 <tr>
                    <td class="tabModelTip">
                        维修者:
                    </td>
                    <td>
                        <s:textfield name="disposeName" cssClass="inputText"></s:textfield>
                    </td>
                </tr>
                   <tr>
                    <td class="tabModelTip">
                        创建时间:
                    </td>
                    <td>
                       <!--  <input type="text" class="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"/> -->
                       <s:textfield name="preserveCreateTime" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
                    </td>
                </tr>
                   <tr>
                    <td class="tabModelTip">
                        更新时间:
                    </td>
                    <td>
                       <!--  <input type="text" class="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"/> -->
                       <s:textfield name="updateTime" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        备注:
                    </td>
                    <td>
                           <s:textarea rows="6" cols="80" name="preserveDescription"></s:textarea>
                    </td>
                </tr>
            </table>
        </div>
        <!--按钮-->
        <div class="divBtn" id="divBtn">
           <!--  <input type="button" class="btn" value="保存" onclick="location.href='CarSurem.html'" /> -->
           <s:submit value="保存" cssClass="btn"></s:submit>
            <input type="button" class="btn" value="重置" />
            <input type="button" class="btn" value="返回" onclick="location.href='CarSurem.html'" />
        </div>
    </div>
    </s:form>
</body>
</html>
