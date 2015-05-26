<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车辆状态修改</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function save() {
            alert("修改成功！");
            window.location = "TSPCar.html";
        }
    </script>
</head>
<body>
	<s:form action="CarAction_editType">
	<s:hidden name="id"></s:hidden>
    <div class="divMain" id="divMain">
        <div class="divDataList" id="divDataList">
            <table class="tabModel">
             <tr>
    		        <td colspan="2" class="modelTitle">
    			        车辆状态
    		        </td>
    	     </tr>
    	     <tr>
    		        <td colspan="2"  class="tabModelTitle">
    			        车辆状态修改
    		        </td>
    	     </tr>	
             <tr>
                    <td class="tabModelTip">
                        车辆编号：
                    </td>
    		    <td>
    		       ${carNumber }
    		    </td>
    	    </tr>
    	    <tr>
    		    <td class="tabModelTip">
    			    状态:
    		    </td>
    		    <td>
    			    <%-- <select>
    				    <option>出车</option>
    				    <option>修理</option>
    				    <option>报废</option>
    				    <option>未出</option>
    			    </select> --%>
    			    <s:select list="#{1:'',2:'出车',3:'修理',4:'报废',5:'未出'}" name="carState" listKey="value" listValue="value"></s:select>
    		    </td>
    	    </tr>
            </table>
        </div>
        <div class="divBtn" id="divBtn">
    		<!-- <input type="submit" value="保 存" class="btn" onclick="save()"/> -->
    		<s:submit value="保存" cssClass="btn"></s:submit>
    		<input type="button" value="返 回" class="btn" onclick="location.href='/LIS/TSP/CarAction_list.action'"/>
        </div>
    </div>
    </s:form>
</body>
</html>
