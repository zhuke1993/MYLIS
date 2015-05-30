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
import com.lis.tsp.entity.Line;
import com.lis.tsp.service.LineService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class LineAction extends ActionSupport implements ModelDriven<Line>{
	private Line line=new Line();
	@Resource
	private LineService lineService;
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
	 * @return the line
	 */
	public Line getline() {
		return line;
	}

	/**
	 * @param line the line to set
	 */
	public void setline(Line line) {
		this.line = line;
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	@Override
	public Line getModel() {
		// TODO Auto-generated method stub
		return line;
	}
	public String addUI(){
		return "saveUI";
	}
	public String add(){
		lineService.add(line);
		return "tolist";
	}
	public String list(){
		String hql="from Line c";
		Number totalCount=lineService.getCount("select count(c) from Line c");
		pageBean.setTotalCount(totalCount.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Line> list=lineService.fenYe(pageBean.getStart(), 3, hql);
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("allListid","allListid");
		ActionContext.getContext().put("list", list);
		return "list";
	}
	public String delect() throws IOException{
		if(ServletActionContext.getRequest().getParameter("id")!=null){
			Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
			lineService.delect(lineService.getOneLine(id));
		}
		
		String ids=ServletActionContext.getRequest().getParameter("ids");
		if(ids!=null){
			System.out.println("ids"+ids);
			String[] s1=ids.split(",");
			for(int i=0;i<s1.length;i++){
				//carService.delect(carService.get(Long.parseLong(s1[i])));
				lineService.delect(lineService.getOneLine(Long.parseLong(s1[i])));
			}
			PrintWriter out=ServletActionContext.getResponse().getWriter();
			out.println();
			out.flush();
		}
		return "tolist";
	}
	public String editUI(){
		System.out.println("editui");
		Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		line=lineService.getOneLine(id);
		ActionContext.getContext().getValueStack().push(line);
		return "saveUI";
	}
	public String edit(){
		lineService.editLine(line);
		return "tolist";
	}
	public String detail(){
		Long id=Long.parseLong(ServletActionContext.getRequest().getParameter("id"));
		line=lineService.getOneLine(id);
		ActionContext.getContext().getValueStack().push(line);
		return "detail";
	}
	public String query(){
		String hql="from Line c where 1=1 ";
		if(ServletActionContext.getRequest().getParameter("cahxuanid")!=null){
			//List<Car> list=carService.getQueryCar(hql);
			hql=(String)ServletActionContext.getRequest().getSession().getAttribute("hql");
		}else{
			if(line.getId()!=null&&!line.getId().equals("")){
				hql=hql+"and c.id='"+line.getId()+"'";
			}
			if(line.getStartCity()!=null&&!line.getStartCity().equals("")){
				hql=hql+"and c.startCity='"+line.getStartCity()+"'";
			}
			if(line.getEndCity()!=null&&!line.getEndCity().equals("")){
				hql=hql+"and c.endCity='"+line.getEndCity()+"'";
			}
			ServletActionContext.getRequest().getSession().setAttribute("hql",hql);
		}
		Number number=lineService.getCount("select count(c) "+hql);
		pageBean.setTotalCount(number.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Line> list=lineService.fenYe(pageBean.getStart(),3, hql);
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("pageBean", pageBean);
		return "query";
	}
}
