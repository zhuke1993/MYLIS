<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车辆详细信息</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="jscript">
        function Show() {
            var result = window.showModalDialog("../TSP/Car/TSPCarDetails.html", "订单详细信息", "dialogHeight:400px; dialogWidth: 620px;");
            if (result == 'ok') {
                document.location.href = "TSPCar.html";
            }
        }
        function baofei() {
            if (window.confirm("确认删除吗？")) {
                alert("删除成功！");
                window.close();
            }
        }
        
    </script>
</head>
<body>
<s:form action="CarAction_delect">
<s:hidden name="id"></s:hidden>
   <div class="divMain" id="divMain">
        <div class="divDataList" id="divDataList">
            <table class="tabModel">
                <tr>
                    <td class="modelTitle" colspan="4">
                        车辆基本信息
                    </td>
                </tr>
                <tr>
    		        <td colspan="4" class="tabModelTitle">
    			        车辆基本信息详细
    		        </td>
    	        </tr>
                <tr>
                    <td width="15%" class="tabModelTip">车辆编号:</td>
                    <td width="35%">${carNumber }</td>
                    <td width="15%" class="tabModelTip">车牌:</td>
                    <td width="35%">${carChePai }</td>
                </tr>
                <tr >
                    <td class="tabModelTip">状态:</td>
                    <td>${carState }</td>
                    <td class="tabModelTip">载重:</td>
                    <td>${carLoad }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">类型:</td>
                    <td>${carType }</td>
                    <td class="tabModelTip">购入日期:</td>
                    <td>${carBuyingTime }</td>
                </tr> 
                <tr>
        	        <td class="tabModelTip">
        		        所在地:
        	        </td>
        	        <td>
        		        ${carPlace }
        	        </td>
        	        <td class="tabModelTip">
        		         状态:
        	        </td>
        	        <td>
        		        ${ carState}
        	        </td>
                </tr> 
                <tr>
        	        <td class="tabModelTip">
        		        购买金额:
        	        </td>
        	        <td>
        		        ${carBuyingMoney }
        	        </td>
        	        <td class="tabModelTip">
        		         创建时间:
        	        </td>
        	        <td>
        		        ${carCreatTime }
        	        </td>
                </tr>  
                <tr>    	
        		        <td class="tabModelTip">备注:</td>
        		        <td colspan="3">
        		       ${carDescription }	
        	        </td>     	
                </tr> 
            </table>
        </div>
        <div class="divBtn" id="divBtn">
    		<!-- <input class="btn" onclick="baofei()" type="button" value="删 除" /> -->
    		<s:submit value="删除" cssClass="btn"></s:submit>
    		<input type="button" value="返 回" class="btn" onclick="window.close()"/>
        </div>
   </div>
   </s:form>
</body>
</html>
