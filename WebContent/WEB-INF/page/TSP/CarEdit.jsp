<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>汽车修改</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
     <script type="text/javascript">
    	function saveForm(){
    	    alert("修改成功！");
    	    window.location = "TSPCar.html";
    	}
    	</script>
</head>
<body>
      <!--主界面-->
   <s:form action="CarAction_edit">
   
   	<s:hidden name="id"></s:hidden>
   	<s:hidden name="carNumber"></s:hidden>
   <div class="divMain" id="divMain">
        <!--类容-->
        <div class="divDataList" id="divDataList">
            <table  class="tabModel">
             <tr>
                    <td class="modelTitle" colspan="2">
                        车辆基本信息
                    </td>
                </tr>
                 <tr>
    		        <td colspan="2" class="tabModelTitle">
    			        车辆基本信息修改
    		        </td>
    	        </tr>
    	        <tr>
                    <td class="tabModelTip">
                        车辆编号:
                    </td>
                    <td>
                       ${carNumber }
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆类型:
                    </td>
                    <td>
                       <%--  <select>
                            <option selected="selected">大型</option>
                            <option>中型</option>
                            <option>小型</option>
                        </select> --%>
                         <s:select list="#{1:'大型',2:'中型',3:'小型'}" name="carType" listKey="value" listValue="value"></s:select>
                    </td>
                </tr>
                
                <tr>
                    <td class="tabModelTip">
                        车辆装载量:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" value="0.0t" /><font color="red">*</font> -->
                         <s:textfield name="carLoad" cssClass="inputText"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆牌照:
                    </td>
                    <td>
                      <!--   <input type="text" class="inputText" value="渝A00115" /><font color="red">*</font> -->
                       <s:textfield name="carChePai" cssClass="inputText"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        购入日期:
                    </td>
                    <td>
                       <!--  <input type="text" class="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"  value=" 2009-9-9"/><font
                            color="red">*</font> -->
                             <s:textfield name="carBuyingTime" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        购买金额:
                    </td>
                    <td>
                        <s:textfield name="carBuyingMoney" cssClass="inputText"></s:textfield><font color="red">*</font> 
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆所在地:
                    </td>
                    <td>
                       <s:textfield name="carPlace" cssClass="inputText"></s:textfield><font color="red">*</font> 
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        备注:
                    </td>
                    <td>
                        <s:textarea cols="60" rows="4" name="carDescription"></s:textarea>
                    </td>
                </tr>
        </table>
        </div>
        <!--按钮-->
        <div class="divBtn" id="divBtn">
            <!-- <input  type="button" value="保 存" class="btn" onclick="saveForm()" /> -->
            <s:submit value="保存"></s:submit>
            <s:reset value="重置"></s:reset>
            <input  type="button" value="返 回" class="btn" onclick="location.href='/LIS/TSP/CarAction_list.action'"   />
        </div>
   </div>
  </s:form>
</body>
</html>
