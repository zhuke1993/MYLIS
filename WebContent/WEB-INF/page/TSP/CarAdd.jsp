<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增车辆</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function save() {
            alert("新增成功！");
            window.location = "TSPCar.html";
        }
    </script>
</head>
<body>
    <!--主界面-->
    <s:form action="CarAction_add">
    <div class="divMain" id="divMain">
        <!--类容-->
        <div class="divDataList" id="divDataList">
            <table class="tabModel">
                <tr>
                    <td class="modelTitle" colspan="2">
                        车辆基本信息
                    </td>
                </tr>
                <tr>
    		        <td colspan="2" class="tabModelTitle">
    			        车辆基本信息新增
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
                        <s:select list="#{1:'大型',2:'中型',3:'小型'}" name="carType" listKey="value" listValue="value"  headerKey="0" headerValue="==请选择车辆类型=="></s:select>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆编号:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" /><font color="red">*</font> -->
                        <s:textfield name="carNumber" cssClass="inputText"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆装载量:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" /><font color="red">*</font> -->
                        <s:textfield name="carLoad" cssClass="inputText"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆牌照:
                    </td>
                    <td>
                       <!--  <input type="text" class="inputText" /><font color="red">*</font> -->
                       <s:textfield name="carChePai" cssClass="inputText"></s:textfield><font color="red">*</font> 
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        购入日期:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly" /><font
                            color="red">*</font> -->
                           <s:textfield name="carBuyingTime" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield><font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        购买金额:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" /><font color="red">*</font> -->
                   <s:textfield name="carBuyingMoney" cssClass="inputText"></s:textfield><font color="red">*</font> 
                        
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        车辆所在地:
                    </td>
                    <td>
                        <!-- <input type="text" class="inputText" /><font color="red">*</font> -->
                       <s:textfield name="carPlace" cssClass="inputText"></s:textfield><font color="red">*</font> 
                      
                    </td>
                </tr>
                <tr>
                    <td class="tabModelTip">
                        备注:
                    </td>
                    <td>
                        <!-- <textarea cols="60" rows="4"></textarea> -->
                        <s:textarea cols="60" rows="4" name="carDescription"></s:textarea>
                    </td>
                </tr>
            </table>
        </div>
        <!--按钮-->
        <div class="divBtn" id="divBtn">
            <!-- <input type="submit" class="btn" value="保 存" onclick="save()" /> -->
            <s:submit cssClass="btn" onclick="save()" value="保存"></s:submit>
            <input type="submit" class="btn" value="重 置" />
            <input type="button" class="btn" value="返 回" onclick="location.href='TSPCar.html'" />
        </div>
    </div>
    </s:form>
</body>
</html>
