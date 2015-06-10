<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function Close() {
            window.close();
        }
        function Delete() {
            window.invalue = confirm("你确定删除吗？");
            if (window.invalue == true) {
            var id=document.getElementsByName("id")[0].value;
               window.location.href='ChauffeurAction_delect.action?id='+id;
            }
        }
    </script>

    <style type="text/css">
        .tabModel td
        {
            width: 500px;
        }
    </style>
</head>
<body>
    <div class="modelTitle">
        司机详细信息</div>
   <input type="hidden" name="id" value="${id }"/>
    <div class="divMain">
     <s:form>
     
        <table class="tabModel">
            <tr>
                <th class="tabModelTitle" colspan="2">
                    司机基本信息
                </th>
            </tr>
            <tr>
                <td class="tabModelTip">
                    姓名：
                </td>
                <td>
               ${name }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    性别：
                </td>
                <td>
                    ${sex }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    出生年月：
                </td>
                <td>
                    ${brithday }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    出车情况：
                </td>
                <td>
                    ${state}
                </td>
            </tr>
        </table>
        <table class="tabModel">
            <tr>
                <th class="tabModelTitle" colspan="2">
                    联系方式
                </th>
            </tr>
            <tr>
                <td class="tabModelTip">
                    电话：
                </td>
                <td>
                    ${telPhone }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    Email：
                </td>
                <td>
                    ${Email }
                </td>
            </tr>
            <tr>
                <td class="tabModelTip">
                    住址：
                </td>
                <td>
                   ${address }
                </td>
            </tr>
        </table>
        <div class="divBtn">
            <input type="button" class="btn" onclick="Delete()"
                value="删 除" />&nbsp;
            <input type="button" class="btn" onclick="window.close();" value="返 回" />
        </div>
        </s:form>
        
    </div>
</body>
</html>
