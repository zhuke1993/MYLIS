<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车辆保养详细信息</title>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
        function baofei() {
            if (window.confirm("确认删除吗？")) {
                alert("删除成功！");
                //window.close();
            }
        }
    </script>
</head>
<body>
     <div class="divMain" id="divMain">
        <div class="divDataList" id="divDataList"> 
            <table class="tabModel">
                    <tr>
                    <th class="modelTitle" colspan="2">
                        车辆保养信息
                    </th>
                </tr>
                <tr>
    		        <td colspan="4" class="tabModelTitle">
    			        车辆保养记录详细
    		        </td>
    		        
    	        </tr>
                    <tr>
                        <td width="15%" class="tabModelTip">车辆编号:</td>
	                    <td width="35%">${car.id }</td>
                        <td width="15%" class="tabModelTip">保养周期:</td>
                        <td width="35%">${preservePeriod }</td>
                    </tr>
                    <tr>
                        <td class="tabModelTip">保养地点:</td>
                        <td>${preserverPlace }</td>
                        <td class="tabModelTip">保养日期：</td>
                        <td>${preserveTime }</td>
                    </tr>  
                    <tr>
        	            <td class="tabModelTip">
        		            保养金额:
        	            </td>
        	            <td colspan="3">
        		            ${preserveMoney }￥
        	            </td>
                    	
                    </tr>
                    <tr>       	
        	            <td class="tabModelTip">
        		            用户:
        	            </td>
        	            <td>
        		            ${ empName}
        	            </td>
        	            <td class="tabModelTip">
        		             创建时间时间:
        	            </td>
        	            <td>
        		            ${preserveCreateTime }
        	            </td>
                    </tr>
                    <tr>
        	            <td class="tabModelTip">
        		           维修者:
        	            </td>
                    <td>
        	           ${disposeName }
                    </td>
        	            <td class="tabModelTip">
        		            最后更新时间:
        	            </td>
        	            <td>
        		           ${ updateTime}
        	            </td>
                    </tr>
                    <tr >    	
        		            <td class="tabModelTip">备注:</td>
        		            <td colspan="3">
        		           ${preserveDescription }
        		            </td>     	
                    </tr> 
            </table>
        </div>
        <div class="divBtn" id="divBtn">
           <!--  &nbsp;<input type="button" value="删除" class="btn" onclick="baofei();"/> -->
             &nbsp;<a href="LIS/TSP/CarPreserveAction_delect.action?id=${id }"  class="btn" onclick="baofei();">删除</a>
              &nbsp;<a href="LIS/TSP/CarPreserveAction_list.action"  class="btn">返回</a>
           <!--  <input type="button" value="返回" class="btn" onclick="window.close()"/> -->
        </div>
        
     </div>   
</body>
</html>
