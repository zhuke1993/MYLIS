<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>车辆维护</title>
    <script src="<%=request.getContextPath() %>/js/check.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/js/tabrow_hover.js" type="text/javascript"></script>
    <script type="text/javascript" language="jscript">
        function Show() {
            window.showModalDialog("CarSuremDetails.html", "车辆维护详细信息", "dialogHeight:270px; dialogWidth: 620px;");
            
        }
			//新增
        function add() {
            window.location="CarSuremAdd.html";
        }
        //删除
        function del() {
            //这里要验证和获取选择删除的行
            DelChk();
            if (flag == false) {
                return false;
            } else {
                if (confirm("确认删除吗？")) {
                	var ids="";
                	var chk1 = document.getElementsByName("chk");
                  	for(var i=0;i<chk1.length;i++){
                  		 if (chk1[i].checked) {
                               ids=ids+chk1[i].value+",";
                           }
                  	}
                  	$.ajax({
        				url : "CarPreserveAction_delect.action",
        				type : "POST",
        				//data:{}如果没有就不传当有值的时候是比如：  
        				data:{"ids":ids},
        				dataType : "json",
        				complete : function() {
        					window.location.href = "/LIS/TSP/CarPreserveAction_list.action";
        				}
        			});
                    
                }
            }

        }

        function CheckAll(checkitems) {
            var chk = document.getElementsByName("chk");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].type == 'checkbox') {
                    chk[i].checked = checkitems.checked;
                }
            }
        }
        function DelChk() {
            var count = 0;
            var chk = document.getElementsByName("chk");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].checked) {
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择要删除的保养信息");
                flag = false;
                return false;
            }
            flag = true;
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
                alert("请选择一项保养信息");
                flag = false;
                return false;
            }
            if (count > 1) {
                alert("只能选择一项保养信息");
                flag = false;
                return false;
            }
            flag = true;
        }
        //修改
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
                      window.location.href="/LIS/TSP/CarPreserveAction_editUI.action?id="+id;
                     }
                 }
               
            }
        }
        
        window.onload = function() {
            tabrow_hover("tabData");
        };
    </script>
</head>
<body>
    <div class="divMain" id="divMain">
    <s:form action="CarPreserveAction_query">
        <div class="divSelect" id="divSelect" >
        <div class="modelTitle">检索条件</div>
            <table class="tabModel">
  	            <tr>
  		            <td class="tabModelTip">
  			            保单编号:
		            </td>
		            <td >
			            <!-- <input type="text" class="inputText" name="txtCarId"/> -->
			            <s:textfield name="id" cssClass="inputText"></s:textfield>
		            </td>
		            <td class="tabModelTip">
  			            车辆编号:
		            </td>
		            <td >
		            <s:textfield name="carId" cssClass="inputText"></s:textfield>
  		            </td>
  			        <td class="tabModelTip">
  			         保修地点:
			        </td>
			        <td >	
  			            <%-- <select name="selectType">
  			                <option selected>---请选择---</option>
  				            <option>大型</option>
  				            <option>中型</option>
  				            <option>小型</option>
  			            </select>	 --%>
  			            <s:select list="#{1:'',2:'重庆',3:'成都',4:'北京'}" listKey="value" listValue="value" name="preserverPlace"></s:select>
  			            				
	    	       </td>
	    	        <td><!-- <input type="submit" value="查询" class="btn" /> -->
	    	        	<s:submit value="查询" cssClass="btn"></s:submit>
	    	        </td>
  	            </tr>
  	            
              </table>
              </div>
             </s:form> 
      <!-- list-start -->
        
        <div class="modelTitle">保养信息列表</div>
        <div class="divBtn" id="divBtn">
           <input type="button" value="新 增" class="btn" onclick="location.href='/LIS/TSP/CarPreserveAction_addUI.action'"/>&nbsp;
            <%-- <s:a action="CarPreserveAction_addUI" cssClass="btn">新增</s:a> --%>
            <input type="button" value="修 改" class="btn" onclick="Update()"/>&nbsp;
            <input type="button" value="删 除" class="btn" onclick="del()"/>&nbsp;
        </div>
        <div class="divDataList">
            <table id="tabData" class="tabData">
    		    <tr class="tabModelTitle">
    		     <th><input type="checkbox" id="checkall"  onclick=" return CheckAll(this)"/></th>

    			    <th>
    				    保养编号
    			    </th>
    			    <th>
    				    车辆编号
    			    </th>
    			    <th>
    				    保养地点
    			    </th>
    			    <th>
    				    保养时间
    			    </th>
    			    <th>
    				    保养费用
    			    </th>
    			    <th>
    				    批注
    			    </th>
    		    </tr>
    		    <s:iterator value="#list">
    		    <tr>
    		     <td style="text-align:center;"><input type="checkbox" name="chk" value="${id }"/></td>

    			    <td>
    				    <%-- <a href="javascript:Show()" >${id }</a> --%>
    				    <s:a action="CarPreserveAction_detail?id=%{id}">${id}</s:a>
    			    </td>
    			    <td>
    				    ${car.id}
    			    </td>
    			    <td>
    				    ${preserverPlace }
    			    </td>
    			    <td>
    				    ${preserveTime }
    			    </td>
    			    <td>
    				    ${preserveMoney }$_$
    			    </td>
    			    <td>
    				    ${preserveDescription }
    			    </td>
    		    </tr>
    		   </s:iterator>
    		    <tr class="page">
			        	<td colspan="7">
			        		<div class="leftPage">
                            共${pageBean.totalCount}条记录，当前第${pageBean.page}/${pageBean.totalPage}页，每页${pageBean.pageSize}条记录
                        </div> 
                        <div class="rightPage">
                            <!-- <a class="btnPage" href="javascript:void(0)">首页</a> <a class="btnPage" href="javascript:void(0)">
                                上一页</a>
                           <a class="btnPage" href="javascript:void(0)">下一页</a> <a class="btnPage" href="javascript:void(0)">
                           尾页 </a>&nbsp; 转到第<input type="text" class="inputPage" />页 <a href="javascript:void(0)"
                                        id="btnGo">GO</a> -->
                             <!-- 这是所有数据的list的分页，用一个变量标记 -->
                              <s:if test="%{#allListid=='allListid'}">
                              	<s:if test="%{#pageBean.page==1}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarPreserveAction_list?pageBean.page=1" cssClass="btnPage">首页</s:a>
                              		<s:a action="CarPreserveAction_list?pageBean.page=%{#pageBean.page-1}" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarPreserveAction_list?pageBean.page=%{#pageBean.page+1}" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarPreserveAction_list?pageBean.page=%{#pageBean.totalPage}" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="CarPreserveAction_list" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:if>
                              <!--查询有条件时的分页 -->
                              <s:else>
                              	
                              	<s:if test="%{#pageBean.page==1}">
                              		<%-- <s:a action="CarPreserveAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarPreserveAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a> --%>
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarPreserveAction_query?pageBean.page=1&cahxuanid=1" cssClass="btnPage"> 首页</s:a>
                              		<s:a action="CarPreserveAction_query?pageBean.page=%{#pageBean.page-1}&cahxuanid=1" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarPreserveAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarPreserveAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="CarPreserveAction_query" cssStyle="display:block;float:right;margin-top:-19px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:hidden name="cahxuanid"></s:hidden>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:else>
                        </div>
			        	</td>	
			        </tr>
            </table>
        </div>
    </div>
</body>
</html>
