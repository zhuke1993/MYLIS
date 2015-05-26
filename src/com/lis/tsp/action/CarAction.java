package com.lis.tsp.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lis.base.entitys.PageBean;
import com.lis.tsp.entity.Car;
import com.lis.tsp.service.CarService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.sun.xml.internal.fastinfoset.util.StringArray;
@Controller
@Scope("prototype")
public class CarAction extends ActionSupport implements ModelDriven<Car>{
	//这是车辆管理的action
	private Car car=new Car();
	@Resource
	private CarService carService;
	//cai的id
	private Long id;
	//选择的id
	private String[] ids ;
	//购买的时间开始与结束
	private Date carBuyingTimeStart;
	private Date carBuyingTimeEnd;
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
	/**
	 * @return the carBuyingTimeStart
	 */
	public Date getCarBuyingTimeStart() {
		return carBuyingTimeStart;
	}
	/**
	 * @param carBuyingTimeStart the carBuyingTimeStart to set
	 */
	public void setCarBuyingTimeStart(Date carBuyingTimeStart) {
		this.carBuyingTimeStart = carBuyingTimeStart;
	}
	/**
	 * @return the carBuyingTimeEnd
	 */
	public Date getCarBuyingTimeEnd() {
		return carBuyingTimeEnd;
	}
	/**
	 * @param carBuyingTimeEnd the carBuyingTimeEnd to set
	 */
	public void setCarBuyingTimeEnd(Date carBuyingTimeEnd) {
		this.carBuyingTimeEnd = carBuyingTimeEnd;
	}
	/**
	 * @return the ids
	 */
	public String[] getIds() {
		return ids;
	}
	/**
	 * @param ids the ids to set
	 */
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the car
	 */
	public Car getCar() {
		return car;
	}
	/**
	 * @param car the car to set
	 */
	public void setCar(Car car) {
		this.car = car;
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	//这是将对象的信息放在car中，放在栈顶
	@Override
	public Car getModel() {
		// TODO Auto-generated method stub
		return car;
	}
	public String list(){
		String hql="from Car c";
		Number number=carService.count("select count(c) "+hql);
		pageBean.setTotalCount(number.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Car> list=carService.getFenYeList(3,pageBean.getStart(), hql);
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("chaxunid","chaxunid");
		ActionContext.getContext().put("list", list);
		return "list";
	}
	//这是到增加car的UI的请求
	public String addUI(){
		return "addUI";
	}
	
	public String add(){
		//System.out.println(car.getCarType());
		//System.out.println(car.getCarDescription());
		carService.addOneCar(car);
		//增加一个car的信息到数据库中。并重定向到car的显示页面
		return "tolist";
	}
	//这是修改的UI
	public String editUI(){
		id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		Car car1=carService.get(id);
		ActionContext.getContext().getValueStack().push(car1);
		return "editUI";
	}
	public String edit(){
		car.setCarState(carService.get(car.getId()).getCarState());
		carService.update(car);
		return "tolist";
	}
	//删除所选的car
	public String delect() throws IOException{
		if(car.getId()!=null){
			System.out.println(car.getId());
			carService.delect(carService.get(car.getId()));
		}else{
			//从ajax传过来的数据
			String s=ServletActionContext.getRequest().getParameter("ids");
			String[] s1=s.split(",");
			for(int i=0;i<s1.length;i++){
				carService.delect(carService.get(Long.parseLong(s1[i])));
			}
			PrintWriter out=ServletActionContext.getResponse().getWriter();
			out.println(s1);
			out.flush();
		}
		
		return "tolist";
	}
	//修改状态的UI
	public String editTypeUI(){
		id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		Car car1=carService.get(id);
		ActionContext.getContext().getValueStack().push(car1);
		return "editTypeUI";
	}
	public String editType(){
		Car car1=carService.get(car.getId());
		car1.setCarState(car.getCarState());
		carService.update(car1);
		return "tolist";
	}
	//通过一些条件来查询car
	public String query(){
		String[] s=new String[5];
		int i=0;
		String hql="from Car c where 1=1 ";
		//--当已经有list数据后，进行分页的操作
		if(ServletActionContext.getRequest().getParameter("cahxuanid")!=null){
			//List<Car> list=carService.getQueryCar(hql);
			hql=(String)ServletActionContext.getRequest().getSession().getAttribute("hql");
		}
		else{
			//---查询时，需要这些数据来进行查询。组建好hql语句把他放在request中
			if(car.getCarNumber()!=null&&!car.getCarNumber().equals("")){
				hql=hql+"and c.carNumber='"+car.getCarNumber()+"'";
			}
			
			if(car.getCarChePai()!=null&&!car.getCarChePai().equals("")){
				hql=hql+"and c.carChePai='"+car.getCarChePai()+"'";
			}
			
			if(car.getCarType()!=null&&!car.getCarType().equals("")){
				hql=hql+"and c.carType='"+car.getCarType()+"'";
			}
			
			if(car.getCarPlace()!=null&&!car.getCarPlace().equals("")){
				hql=hql+"and c.carPlace='"+car.getCarPlace()+"'";
			}
			
			if(car.getCarState()!=null&&!car.getCarState().equals("")){
				hql=hql+"and c.carState='"+car.getCarState()+"'";
			}
			if(carBuyingTimeStart!=null){
				hql=hql+"and c.carBuyingTime>='"+carBuyingTimeStart+"'";
			}
			if(carBuyingTimeEnd!=null){
				hql=hql+"and c.carBuyingTime<='"+carBuyingTimeEnd+"'";
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
		return "list";
	}
	//分页查询
	public String fenYe(){
		
		return "list";
	}
	
	//一个car的详细信息
	public String detail(){
		System.out.println(car.getId());
		car=carService.get(car.getId());
		ActionContext.getContext().getValueStack().push(car);
		return "detail";
	}
}
