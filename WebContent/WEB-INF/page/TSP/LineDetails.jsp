<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>详细信息</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        //提示删除
        function del() {
            if (confirm('确认要删除吗？')) {
                //window.location.href = '';
                var id=document.getElementsByName("id")[0];
                window.location.href = 'LIS/TSP/LineAction_delect.action?id='+id.value;
            }
        }
    </script>
</head>
<body>
    <div class="divMain">
    	<input type="hidden" name="id" value="${id }"/>
        <div class="divDataList">
        <div class="modelTitle">运输线路详细</div>
            <table class="tabModel" cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
	                <th class="tabModelTitle" colspan="2">线路详细信息</th>
	            </tr>
                <tr>
                    <td class="tabModelTip" width="25%">路线编号:</td>
                    <td>line${id }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">起点城市:</td>
                    <td>${startCity }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">详细地址:</td>
                    <td>${startDescriptionPlace }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">终点城市</td>
                    <td>${endCity }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">详细地址:</td>
                    <td>${endDescriptionPlace }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">联系电话:</td>
                    <td>${telPhone }</td>
                </tr>
                <tr>
                    <td class="tabModelTip">备注信息:</td>
                    <td>${remark }</td>
                </tr>
            </table>
            <div>
            <input id="btnDel" class="btn" type="button" value="删 除" onclick="del();" />
            <input id="btnBack" class="btn" type="button" value="返 回" onclick="location.href='LineAction_list.action'" />
        </div>
        </div>
    </div>
</body>
</html>
