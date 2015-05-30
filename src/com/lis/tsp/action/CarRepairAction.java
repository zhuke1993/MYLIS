package com.lis.tsp.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lis.base.entitys.PageBean;
import com.lis.tsp.entity.Car;
import com.lis.tsp.entity.CarRepair;
import com.lis.tsp.service.CarRepairService;
import com.lis.tsp.service.CarService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class CarRepairAction extends ActionSupport implements ModelDriven<CarRepair>{
	@Resource
	private CarRepairService CarRepairService;
	@Resource
	private CarService carService;
	private PageBean pageBean=new PageBean();
	
	/**
	 * @return the pageBean
	 */
	public PageBean getPageBean() {
		return pageBean;
	}

	/**
	 * @param pageBean the pageBean to set
	 */
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	private CarRepair CarRepair=new CarRepair();//这里实例比较重要
	//前台传来的carID
	private Long carId;
	
	/**
	 * @return the carId
	 */
	public Long getCarId() {
		return carId;
	}

	/**
	 * @param carId the carId to set
	 */
	public void setCarId(Long carId) {
		this.carId = carId;
	}

	/**
	 * @return the CarRepair
	 */
	public CarRepair getCarRepair() {
		return CarRepair;
	}

	/**
	 * @param CarRepair the CarRepair to set
	 */
	public void setCarRepair(CarRepair CarRepair) {
		this.CarRepair = CarRepair;
	}

	@Override
	public CarRepair getModel() {
		// TODO Auto-generated method stub
		return CarRepair;
	}
	public String addUI(){
		return "saveUI";
	}
	public String add(){
		Car car=new Car();
		System.out.println(carId);
		car=carService.get(carId);
		System.out.println(car);
		if(car!=null){
			CarRepair.setCar(car);
		}
		CarRepairService.add(CarRepair);
		return "tolist";
	}
	//保修单的list
	public String list(){
		//List<CarRepair> list=CarRepairService.getAllCarRepair();
		String hql="from CarRepair c";
		Number totalCount=CarRepairService.getCount("select count(c) from CarRepair c");
		pageBean.setTotalCount(totalCount.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Car> list=carService.getFenYeList(3,pageBean.getStart(), hql);
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("allListid","allListid");
		ActionContext.getContext().put("list", list);
		return "list";
	}
	//更新的ui
	public String editUI(){
		//System.out.println(ServletActionContext.getRequest().getParameter("id"));
		Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		CarRepair=CarRepairService.getOneCarRepair(id);
		//carId=CarRepair.getCar().getId();
		if(CarRepair.getCar()!=null){
			ActionContext.getContext().put("carId", CarRepair.getCar().getId());
		}
		else{
			ActionContext.getContext().put("carId",null);
			}
		ActionContext.getContext().getValueStack().push(CarRepair);
		return "saveUI";
	}
	public String edit(){
		Car car=new Car();
		if(carId!=null){
			car=carService.get(carId);
			CarRepair.setCar(car);
		}
		CarRepairService.editCarRepair(CarRepair);
		return "tolist";
	}
	public String delect() throws IOException{
		if(ServletActionContext.getRequest().getParameter("id")!=null){
			Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
			CarRepairService.delect(CarRepairService.getOneCarRepair(id));
		}
		
		String ids=ServletActionContext.getRequest().getParameter("ids");
		if(ids!=null){
			String[] s1=ids.split(",");
			for(int i=0;i<s1.length;i++){
				//carService.delect(carService.get(Long.parseLong(s1[i])));
				CarRepairService.delect(CarRepairService.getOneCarRepair(Long.parseLong(s1[i])));
			}
			PrintWriter out=ServletActionContext.getResponse().getWriter();
			out.println();
			out.flush();
		}
		return "tolist";
	}
	//一个保修单的信息
	public String detail(){
		Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		CarRepair=CarRepairService.getOneCarRepair(id);
		ActionContext.getContext().getValueStack().push(CarRepair);
		return "detail";
	}
	//查询的操作
	public String query(){
		/*System.out.println(CarRepair.getId());
		System.out.println(carId);
		System.out.println(CarRepair.getPreserverPlace());*/
		String hql="from CarRepair c where 1=1 ";
		if(ServletActionContext.getRequest().getParameter("cahxuanid")!=null){
			//List<Car> list=carService.getQueryCar(hql);
			hql=(String)ServletActionContext.getRequest().getSession().getAttribute("hql");
		}else{
			if(CarRepair.getId()!=null&&!CarRepair.getId().equals("")){
				hql=hql+"and c.id='"+CarRepair.getId()+"'";
			}
			if(carId!=null&&!carId.equals("")){
				hql=hql+"and c.car.id='"+carId+"'";
			}
			if(CarRepair.getRepairPlace()!=null&&!CarRepair.getRepairPlace().equals("")){
				hql=hql+"and c.repairPlace='"+CarRepair.getRepairPlace()+"'";
			}
			ServletActionContext.getRequest().getSession().setAttribute("hql",hql);
		}
		Number number=carService.count("select count(c) "+hql);
		pageBean.setTotalCount(number.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Car> list=carService.getFenYeList(3,pageBean.getStart(), hql);
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("pageBean", pageBean);
		return "query";
	}
}
