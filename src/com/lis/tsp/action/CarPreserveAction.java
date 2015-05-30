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
import com.lis.tsp.entity.CarPreserve;
import com.lis.tsp.service.CarPreserveService;
import com.lis.tsp.service.CarService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class CarPreserveAction extends ActionSupport implements ModelDriven<CarPreserve>{
	@Resource
	private CarPreserveService carPreserveService;
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
	private CarPreserve carPreserve=new CarPreserve();//这里实例比较重要
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
	 * @return the carPreserve
	 */
	public CarPreserve getCarPreserve() {
		return carPreserve;
	}

	/**
	 * @param carPreserve the carPreserve to set
	 */
	public void setCarPreserve(CarPreserve carPreserve) {
		this.carPreserve = carPreserve;
	}

	@Override
	public CarPreserve getModel() {
		// TODO Auto-generated method stub
		return carPreserve;
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
			carPreserve.setCar(car);
		}
		carPreserveService.add(carPreserve);
		return "tolist";
	}
	//保修单的list
	public String list(){
		//List<CarPreserve> list=carPreserveService.getAllCarPreserve();
		String hql="from CarPreserve c";
		Number totalCount=carPreserveService.getCount("select count(c) from CarPreserve c");
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
		carPreserve=carPreserveService.getOneCarPreserve(id);
		//carId=carPreserve.getCar().getId();
		if(carPreserve.getCar()!=null){
			ActionContext.getContext().put("carId", carPreserve.getCar().getId());
		}
		else{
			ActionContext.getContext().put("carId",null);
			}
		ActionContext.getContext().getValueStack().push(carPreserve);
		return "saveUI";
	}
	public String edit(){
		Car car=new Car();
		car=carService.get(carId);
		carPreserve.setCar(car);
		carPreserveService.editCarPreserve(carPreserve);
		return "tolist";
	}
	public String delect() throws IOException{
		if(ServletActionContext.getRequest().getParameter("id")!=null){
			Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
			carPreserveService.delect(carPreserveService.getOneCarPreserve(id));
		}
		
		String ids=ServletActionContext.getRequest().getParameter("ids");
		if(ids!=null){
			String[] s1=ids.split(",");
			for(int i=0;i<s1.length;i++){
				//carService.delect(carService.get(Long.parseLong(s1[i])));
				carPreserveService.delect(carPreserveService.getOneCarPreserve(Long.parseLong(s1[i])));
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
		carPreserve=carPreserveService.getOneCarPreserve(id);
		ActionContext.getContext().getValueStack().push(carPreserve);
		return "detail";
	}
	//查询的操作
	public String query(){
		/*System.out.println(carPreserve.getId());
		System.out.println(carId);
		System.out.println(carPreserve.getPreserverPlace());*/
		String hql="from CarPreserve c where 1=1 ";
		if(ServletActionContext.getRequest().getParameter("cahxuanid")!=null){
			//List<Car> list=carService.getQueryCar(hql);
			hql=(String)ServletActionContext.getRequest().getSession().getAttribute("hql");
		}else{
			if(carPreserve.getId()!=null&&!carPreserve.getId().equals("")){
				hql=hql+"and c.id='"+carPreserve.getId()+"'";
			}
			if(carId!=null&&!carId.equals("")){
				hql=hql+"and c.car.id='"+carId+"'";
			}
			if(carPreserve.getPreserverPlace()!=null&&!carPreserve.getPreserverPlace().equals("")){
				hql=hql+"and c.preserverPlace='"+carPreserve.getPreserverPlace()+"'";
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
