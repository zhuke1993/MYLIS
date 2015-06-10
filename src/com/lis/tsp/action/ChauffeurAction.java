package com.lis.tsp.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lis.base.entitys.PageBean;
import com.lis.tsp.entity.Car;
import com.lis.tsp.entity.Chauffeur;
import com.lis.tsp.service.ChauffeurService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class ChauffeurAction extends ActionSupport implements ModelDriven<Chauffeur>{
	@Resource
	private ChauffeurService chauffeurService;
	private Chauffeur chauffeur=new Chauffeur();
	private PageBean pageBean=new PageBean();
	private String chauffeurId;
	
	
	/**
	 * @return the chauffeurId
	 */
	public String getChauffeurId() {
		return chauffeurId;
	}

	/**
	 * @param chauffeurId the chauffeurId to set
	 */
	public void setChauffeurId(String chauffeurId) {
		this.chauffeurId = chauffeurId;
	}

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
	 * @return the chauffeur
	 */
	public Chauffeur getChauffeur() {
		return chauffeur;
	}

	/**
	 * @param chauffeur the chauffeur to set
	 */
	public void setChauffeur(Chauffeur chauffeur) {
		this.chauffeur = chauffeur;
	}

	@Override
	public Chauffeur getModel() {
		// TODO Auto-generated method stub
		return chauffeur;
	}
	public String addUI(){
		return "saveUI";
	}
	public String add(){
		chauffeurService.add(chauffeur);
		return "tolist";
	}
	public String editUI(){
		String id1=ServletActionContext.getRequest().getParameter("id");
		Long id=Long.parseLong(id1);
		chauffeur=chauffeurService.getChauffeurById(id);
		ActionContext.getContext().getValueStack().push(chauffeur);
		return "saveUI";
	}
	public String edit(){
		chauffeurService.edit(chauffeur);
		return "tolist";
	}
	public String list(){
		String hql="from Chauffeur c";
		Number totalCount=chauffeurService.count("select count(c) from Chauffeur c");
		pageBean.setTotalCount(totalCount.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Chauffeur> list=chauffeurService.getFenYe(hql, pageBean.getStart(), 3);
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("allListid","allListid");
		ActionContext.getContext().put("list", list);
		
		List<String> list1=chauffeurService.getAllId("select c.id from Chauffeur c");
		ActionContext.getContext().put("list1", list1);
		return "list";
	}
	public String delect(){
		if(ServletActionContext.getRequest().getParameter("id")!=null){
			chauffeurService.delect(Long.parseLong(ServletActionContext.getRequest().getParameter("id")));
		}
		if(ServletActionContext.getRequest().getParameter("ids")!=null){
			String s=ServletActionContext.getRequest().getParameter("ids");
			String s1[]=s.split(",");
			for(int i=0;i<s1.length;i++){
				chauffeurService.delect(Long.parseLong(s1[i]));
			}
		}
		return "tolist";
	}
	public String detail(){
		String id1=ServletActionContext.getRequest().getParameter("id");
		Long id=Long.parseLong(id1);
		chauffeur=chauffeurService.getChauffeurById(id);
		ActionContext.getContext().getValueStack().push(chauffeur);
		return "detail";
	}
	public String query(){
		List<String> list1=chauffeurService.getAllId("select c.id from Chauffeur c");
		ActionContext.getContext().put("list1", list1);
		
		
		String hql="from Chauffeur c where 1=1 ";
		if(ServletActionContext.getRequest().getParameter("cahxuanid")!=null){
			//List<Car> list=carService.getQueryCar(hql);
			hql=(String)ServletActionContext.getRequest().getSession().getAttribute("hql");
		}else{
			System.out.println(hql);
			if(chauffeurId!=null&&!chauffeurId.equals("")){
				hql=hql+"and c.id='"+chauffeurId+"'";
			}
			if(chauffeur.getState()!=null&&!chauffeur.getState().equals("")){
				hql=hql+"and c.state='"+chauffeur.getState()+"'";
			}
			System.out.println(hql);
			ServletActionContext.getRequest().getSession().setAttribute("hql",hql);
		}
		Number number=chauffeurService.count("select count(c) "+hql);
		pageBean.setTotalCount(number.intValue());
		pageBean.setPageSize(3);
		pageBean.setStart((pageBean.getPage()-1)*3);
		pageBean.setTotalPage(pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1);
		List<Chauffeur> list=chauffeurService.getFenYe(hql, pageBean.getStart(), pageBean.getPageSize());
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("pageBean", pageBean);
		return "query";
	}
}
