<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车辆管理</title>

    <script src="<%=request.getContextPath() %>/js/check.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

    <script src="<%=request.getContextPath() %>/js/WebCalendar.js" type="text/javascript"></script>
    
    <script type="text/javascript" language="jscript">
    	
        function Show() {
            window.showModalDialog("TSPCarDetails.html", "车辆详细信息", "dialogHeight:270px; dialogWidth: 620px;");

        }
        window.onload = function() {
            tabrow_hover("tabData");
        };
		 function add() {
		     window.location = "TSPCarAdd.html";
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
        				url : "CarAction_delect.action",
        				type : "POST",
        				//data:{}如果没有就不传当有值的时候是比如：  
        				data:{"ids":ids},
        				dataType : "json",
        				complete : function() {
        					window.location.href = "/LIS/TSP/CarAction_list.action";
        				}
        			});
                    
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
                alert("请选择要删除的车辆信息");
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
                alert("请选择一项车辆信息");
                flag = false;
                return false;
            }
            if (count > 1) {
                alert("只能选择一项车辆信息");
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
            var chk1 = document.getElementsByName("chk");
            for (var i = 0; i < chk1.length; i++) {
                  if (chk1[i].checked) {
                        var id=chk1[i].value;
                    }
                }
            location.href = "/LIS/TSP/CarAction_editUI.action?id="+id;
            }
        }
        //修改
        function UpdateState() {
            chk();
            if (flag == false) {
                return false;
            } else {
            	var chk1 = document.getElementsByName("chk");
                for (var i = 0; i < chk1.length; i++) {
                      if (chk1[i].checked) {
                            var id=chk1[i].value;
                        }
                    }
            location.href = '/LIS/TSP/CarAction_editTypeUI.action?id='+id;
            }
        }
    </script>
</head>
<body>
    <div class="divMain" id="divMain">
    <s:form action="CarAction_query">
        <div class="divSelect" id="divSelect" >
        <div class="modelTitle">检索条件</div>
            <table class="tabModel" >
  	            <tr>
  		            <td class="tabModelTip">
  			            车辆编号:
		            </td>
		            <td >
			           <!--  <input type="text" class="inputText" name="txtCarId"/> -->
			           <s:textfield name="carNumber" cssClass="inputText"></s:textfield>
		            </td>
		            <td class="tabModelTip">
  			            车牌:
		            </td>
		            <td >
		           <!--  <input type="text"  class="inputText" name="txtCarPId"/> -->
		           <s:textfield name="carChePai" cssClass="inputText"></s:textfield>
  		            </td>
  			        <td class="tabModelTip">
  			         类型:
			        </td>
			        <td width="20%">	
  			           <%--  <select name="selectType">
  			                <option selected>---请选择---</option>
  				            <option>大型</option>
  				            <option>中型</option>
  				            <option>小型</option>
  			            </select> --%>
  			             <s:select list="#{1:'',2:'大型',3:'中型',4:'小型'}" name="carType" listKey="value" listValue="value"></s:select>					
	    	       </td>
	    	       <td  rowspan="3"><!-- <input type="submit" value="查询" class="btn" /> -->
	    	       	<s:submit cssClass="btn" value="查询"></s:submit>
	    	       </td>
  	            </tr>
  	            <tr>
  	                <td class="tabModelTip">
  	                    所在地：
  	                </td>
  	                <td>
  	                     <%-- <select name="selectPlace">
  			                <option selected="selected">---请选择---</option>
  				            <option>重庆</option>
    				        <option>上海</option>
    				        <option>北京</option>
    				        <option>成都</option>
  			            </select> --%>
  			             <s:select list="#{1:'',2:'重庆',3:'上海',4:'北京'}" name="carPlace" listKey="value" listValue="value"></s:select>		
  	                </td>
  	                <td class="tabModelTip">
  	                    购买时间：
  	                </td>
  	                <td>
  	                    <!-- <input type="text"  class="inputText" name="txtBeginTime" onclick="SelectDate(this,'yyyy-MM-dd')"  readonly="readonly"/> -->
  	                    <s:textfield name="carBuyingTimeStart" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
  	                    
  	                </td>
  	                 <td class="tabModelTip">
  	                    至
  	                </td>
  	                <td>
  	                    <s:textfield name="carBuyingTimeEnd" cssClass="inputText" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="readonly"></s:textfield>
  	                </td>
  	                
  	            </tr>
  	            <tr>
  	                <td class="tabModelTip">
  			         状态:
			        </td>
			        <td width="20%">	
  			           <%--  <select name="selectType">
  			                <option selected="selected">---请选择---</option>
  				            <option>出车</option>
    				        <option>修理</option>
    				        <option>保养</option>
    				        <option>未出</option>
  			            </select> --%>		
  			            <s:select list="#{1:'',2:'出车',3:'修理',4:'报废',5:'未出'}" name="carState" listKey="value" listValue="value"></s:select>			
	    	       </td>
	    	       <td colspan="4"></td>
  	            </tr>
              </table>
        </div>
        </s:form>
        <!-- ------------------------------------------------------------------------- -->
         <div class="modelTitle">车辆管理列表</div>
        <div class="divBtn" id="divBtn" >
        	<input type="button" value="新 增" class="btn" onclick="location.href='/LIS/TSP/CarAction_addUI.action'" />
      
             <input type="button" value="修 改" class="btn" onclick="Update()"/>&nbsp;
             <input type="button" value="删 除" class="btn" onclick="del()"/>&nbsp;
             <input type="submit" value="修改状态" class="btn" onclick="UpdateState()" />
            <%--  <s:form action="CarAction_delect" cssStyle="dispaly:block;float:left;margin-top:0px;margin-right:3px">
                    <s:submit value="删除" cssClass="btn"></s:submit>
              </s:form>&nbsp; --%>
             &nbsp;
        </div>
        <div class="divDataList" id="divDataList" >
            <table id="tabData" class="tabData">
                <tr class="tabModelTitle">
                     <th>
                     	<input type="checkbox" id="checkall" onclick="$('[name=ids]').attr('checked',this.checked)"/> 
                     	
                     </th>

    			    <th>
    				    车辆编号
    			    </th>
    			    <th>
    				    车辆牌照
    			    </th>
    			    <th>
    				    车辆装载量
    			    </th>
    			    <th>
    				    车辆类型
    			    </th>
    			     <th>
    				    状态
    			    </th>
    			    <th>
    				    所在地
    			    </th>
    			    <th>
    				    购入日期
    			    </th>
    			    <th>
    				    金额
    			    </th>
    		    </tr>
    		    <s:iterator value="#list">
    		    <tr>
    		    
    		     <td style="text-align:center">
    		     	<%-- <input type="checkbox" name="chk" value="${id }"/> --%>
    		     	
					<%--   <s:checkbox name="ids" value="%{id}"></s:checkbox> --%>
 					<input type="checkbox" name="chk" value="${id}"/>
    		     </td>

    			    <td>
    				    <%-- <a href="#" onclick="Show()">${ carNumber}</a> --%>
    				    <s:a action="CarAction_detail?id=%{id}">${ carNumber}</s:a>
    			    </td>
    			    <td>
    				    ${ carChePai}
    			    </td>
    			    <td>
    				    ${carLoad}
    			    </td>
    			    <td>
    				    ${ carType}
    			    </td>
    			     <td>
    				    ${carState }
    			    </td>
    			     <td>
    				   ${carPlace }
    			    </td>
    			    <td>
    				    ${carBuyingTime }
    			    </td>
    			    <td>
    				    ${carBuyingMoney }
    			    </td>
    		    </tr>
    		    </s:iterator>
    		    <tr class="page">
                    <td colspan="9">
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
                              <s:if test="%{#chaxunid=='chaxunid'}">
                              	<s:if test="%{#pageBean.page==1}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarAction_list?pageBean.page=1" cssClass="btnPage">首页</s:a>
                              		<s:a action="CarAction_list?pageBean.page=%{#pageBean.page-1}" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarAction_list?pageBean.page=%{#pageBean.page+1}" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarAction_list?pageBean.page=%{#pageBean.totalPage}" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="CarAction_list" cssStyle="display:block;float:right;margin-top:-2px">
                              	<%-- <input type="text" class="inputPage" />页 <s:a 
                                        id="btnGo" cssClass="btnPage">GO</s:a> --%>
                                        <s:textfield name="pageBean.page" cssClass="inputPage" ></s:textfield>
                                        <s:submit value="GO" cssClass="btnPage"></s:submit>
                                 </s:form>
                              </s:if>
                              <!--查询有条件时的分页 -->
                              <s:else>
                              	
                              	<s:if test="%{#pageBean.page==1}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarAction_query?pageBean.page=1&cahxuanid=1" cssClass="btnPage"> 首页</s:a>
                              		<s:a action="CarAction_query?pageBean.page=%{#pageBean.page-1}&cahxuanid=1" cssClass="btnPage">上一页</s:a>
                              	</s:else>
                              	<s:if test="%{#pageBean.page==#pageBean.totalPage}">
                              		
                              	</s:if>
                              	<s:else>
                              		<s:a action="CarAction_query?pageBean.page=%{#pageBean.page+1}&cahxuanid=1" cssClass="btnPage">下一页</s:a>
                              		<s:a action="CarAction_query?pageBean.page=%{#pageBean.totalPage}&cahxuanid=1" cssClass="btnPage">最后一页</s:a>
                              	</s:else>
                              	&nbsp; 转到第
                              	<s:form action="CarAction_query" cssStyle="display:block;float:right;margin-top:-2px">
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
        <div  id="divPage" >
        </div>
    </div>
</body>
</html>
