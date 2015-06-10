<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
   <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
    <style type="text/css">
        .tabModel td
        {
            width: 800px;
        }
    </style>
       <script type="text/javascript">
    	function saveForm(){
    		alert("修改成功！");
    		window.history.back();	
    	}
    	</script>
</head>
<body>
    <div class="modelTitle">
        修改司机信息</div>
    <div class="divMain">
    <s:form action="ChauffeurAction_%{id==null? 'add':'edit'}">
    <s:hidden name="id"></s:hidden>
        <table class="tabModel">
            <tr>
                <th class="tabModelTitle" colspan="2">
                    修改司机基本信息
                </th>
            </tr>
                <tr>
                <td class="tabModelTip">
                    司机编号
                </td>
                <td>
                    ${id }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    司机姓名
                </td>
                <td>
                    <!-- <input class="inputText" disabled="disabled" type="text" value="张三" /> -->
                    <s:textfield name="name" cssClass="inputText"></s:textfield>
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    电话
                </td>
                <td>
                    <s:textfield name="telPhone" cssClass="inputText"></s:textfield>
                </td>
            </tr>
             <tr>
                <td class="tabModelTip">
      email:
                </td>
                <td>
                    <s:textfield name="Email" cssClass="inputText"></s:textfield>
                </td>
            </tr>
                <tr>
                <td class="tabModelTip">
      性别:
                </td>
                <td>
                   <s:select list="#{1:'',2:'男',3:'女' }" listKey="value" listValue="value" name="sex"></s:select>
                </td>
            </tr>
             <tr>
                <td class="tabModelTip">
      出生日期:
                </td>
                <td>
                    <s:textfield name="brithday" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    地址
                </td>
                <td>
                    <s:textarea name="address" cols="50" rows="5"></s:textarea>
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    司机状态
                </td>
                <td>
                    <%-- <select style="width: 130px;">
                        <option>出车</option>
                        <option>未出车</option>
                    </select> --%>
                     <s:select list="#{1:'',2:'出车',3:'未出车' }" listKey="value" listValue="value" name="state"></s:select>
                </td>
            </tr>
        </table>
        <div class="divBtn">
            <!-- <input class="btn" type="submit" value="保 存" onclick="saveForm()" /> -->
            <s:submit value="保存" cssClass="btn"></s:submit>
            <input class="btn" type="button" value="重 置" />
            <input class="btn" type="button" value="返 回" onclick="history.back()" />
        </div>
        </s:form>
    </div>
</body>
</html>
