//菜单数组
var menuNodes = [
                  { id: "财务管理", url:"", items: [
                                                     { id: "总账管理", url: "../FAS/GeneralLedger/GeneralLedgerManage.htm", items: [] },
                                                      { id: "出纳管理", url: "", items: [
																                                                      	    { id: "出纳记账蒲", url: "../FAS/chu_na/ChalkItUp/ChalkItUp.htm", items: [] },
																                                                      	  { id: "银行资料管理", url: "../FAS/chu_na/BankData/BankData.htm", items: [] },
																                                                      	  { id: "出纳账户管理", url: "../FAS/chu_na/Account/Account.htm", items: [] },


																                                                      	  { id: "支票管理", url: "../FAS/chu_na/Check/Check.htm", items: [] }
																                                                      	] },
                                                        { id: "科目管理", url: "../FAS/ke_mu/scan_list.html", items: [] },
                                                      { id: "票据管理", url: "../FAS/Bill/BillList.htm", items: [] },
                                                      { id: "差旅管理", url: "", items: [
   { id: "出差管理", url: "../FAS/EvectionTripManage/EvectionManage/EvectionList.htm", items: [] },
																                                                      	  { id: "旅行管理", url: "../FAS/EvectionTripManage/TripManage/TripList.htm", items: [] }


] },
                                                      { id: "财务报表管理", url: "", items: [
    { id: "工资报表", url: "../FAS/ReportForms/rsgzbb.html", items: [] },
																                                                      	  { id: "出纳报表", url: "../FAS/ReportForms/cnbb.html", items: [] },

 			 { id: "差旅分析报表", url: "../FAS/ReportForms/cai_nv_bb.htm", items: [] },
 			{ id: "应收应付报表", url: "../FAS/ReportForms/AccountList.htm", items: [] },
																                                                      	  { id: "年收入报表", url: "../FAS/ReportForms/YearEarningReport.htm", items: [] }


] },
                                                      { id: "租凭核算管理", url: "", items: [

  { id: "租赁申请管理", url: "../FAS/hire/hire_list.htm", items: [] },
                                                                                                                        { id: "场地类型管理", url: "../FAS/ground/Ground_list.htm", items: [] }


] },
                                                      { id: "应付应收管理", url: "", items: [

 { id: "应收款单管理", url: "../FAS/ReceivableAndPayable/Receivable.htm", items: [] },

                        	  { id: "应付款单管理", url: "../FAS/ReceivableAndPayable/Payable.htm", items: [] }

] },
                                                      { id: "工资核算", url: "", items: [

{ id: "工资结算", url: "../FAS/WageBalance/PayBalanceManage.htm", items: [] },
																                                                      	  { id: "基本工资管理", url: "../FAS/WageBalance/BasePayManage.htm", items: [] }


] }
                                                   ]
                  },
                  
                  
                  { id: "员工管理", url: "", items: [
                                                      { id: "在职员工管理", url: "../EMP/Incumbency/EmpIncList.htm", items: [] },
                                                      { id: "离职员工管理", url: "../EMP/Dimission/EmpDimList.html", items: [] },
                                                      { id: "员工退休管理", url: "../EMP/Retirement/EmpRetList.html", items: [] },
                                                      { id: "员工事例管理", url: "../EMP/Example/EmpEmpExamList.htm", items: [] },
                                                      { id: "员工调动管理", url: "../EMP/Remove/EmpMoveList.htm", items: [] },
                                                      { id: "员工考勤管理", url: "../EMP/Attendance/EmpAttList.html", items: [] },
                                                      { id: "员工业绩管理", url: "../EMP/Achievement/EmpAchList.htm", items: [] }
                                                      ] 
                  },
                  { id: "机构管理", url: "", items: [
                                                      { id: "部门管理", url: "../DTM/Department/DepartmentList.htm", items: [] },
                                                      { id: "职位管理", url: "../DTM/Major/MajorList.htm", items: [] }
                                                   ]
                  },
                  { id: "客户管理", url: "", items: [
                                                   { id: "客户基本信息管理", url: "../CLT/CustomerCommunicationManage/ScanClientList.htm", items: [] },
                                                   { id: "客户流失管理", url: "../CLT/customerLost/loseManager.htm", items: [] },
                                                   { id: "客户服务管理", url: "../CLT/CustomerService/CustomerService.htm", items: [] },
                                                   { id: "客户记录管理", url: "../CLT/CustomerNote/CustomerNote.htm", items: [] }
                                                ]
                  },
                   { id: "订单管理", url: "", items: [
                                                      { id: "订单管理", url: "../../page/ODF/ODFList.html", items: [] }
                                                   ]
                  },
                  { id: "系统管理", url: "", items: [
                                                      { id: "用户管理", url: "../SYS/UserManager/SysUserManageMent.htm", items: [] },
                                                      { id: "权限管理", url: "../SYS/RoleManager/SysRoleManageMent.htm", items: [] },
                                                      { id: "公告管理", url: "../SYS/MsgManager/Message.htm", items: [] },
                                                      { id: "日志管理", url: "../SYS/LogManager/LogIndex.htm", items: [] }
                                                   ]
                  },
                  { id: "仓库管理", url: "", items: [
                                                      { id: "仓库分区管理", url: "../../page/WHU/StorageSubarea/Warehouse.htm", items: [] },

                                                      { id: "货物类型管理", url: "../../page/WHU/GoddsType/GoodsTypeList.html", items: [] },
                                                      { id: "货物管理", url: "../../page/WHU/GoodsManage/StorageList.htm", items: [] },
                                                      { id: "库存管理", url: "../../page/WHU/StockManage/StockList.htm", items: [] }  
                                                   ]
                  },
                  { id: "运输管理", url: "", items: [
                                                      { id: "车辆管理", url: "", items: [
							     { id: "运输工具基本信息", url: "../../page/TSP/CarManage/TSPCar.html", items: [] },
                                                             { id: "运输工具保养信息", url: "../../page/TSP/CarManage/CarSurem.html", items: [] },
                                                             { id: "运输工具维修信息", url: "../../page/TSP/CarManage/CarRepair.html", items: [] },
                                                             { id: "运输工具出勤信息", url: "../../page/TSP/CarManage/CarWork.html",items:[]}
							]},
                                                      { id: "司机管理", url: "../../page/TSP/ChauffeurManage/ChauffeurList.htm", items: []},
                                                      { id: "运输路线管理", url: "../../page/TSP/LineManage/LineList.html", items: []},
						      { id: "物流配送管理中心", url:"../../page/TSP/TransferManager/TransferList.html", items: [] },
                                                      { id: "运输事故管理", url: "../../page/TSP/AccidentManage/AccidentList.htm", items: []},
                                                      { id: "配送及接包", url: "", items: [
													  {id: "运输配送",url:"../../page/TSP/ConsignmentManage/ConsignmentList.html",items:[]}, 
													  {id: "货物配送", url:"../../page/TSP/ConsignmentManage/GoodsList.htm",items: []}]},
                                                      { id: "中途签到", url: "../../page/TSP/SignManage/MidwaySignList.htm", items: []}
                                                   ]
                  },
                  { id: "前台功能", url: "", items: [
                                                      { id: "客户管理", url: "", items: [] },
                                                      { id: "人才招聘", url: "", items: [] },
                                                      { id: "运费计价", url: "", items: [] },
                                                      { id: "货物追踪", url: "", items: [] },
                                                      { id: "走进公司", url: "", items: [] }
                                                   ]
                  },
                  { id: "样式测试", url: "", items: [
                                                      { id: "测试", url: "../Test/index.htm", items: [] }
                                                   ]
                  }
              ];