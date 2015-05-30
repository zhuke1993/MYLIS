package com.lis.tsp.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lis.tsp.dao.LineDao;
import com.lis.tsp.entity.Line;
import com.lis.tsp.service.LineService;
@Service
@Transactional
public class LineServiceImpl implements LineService{
	@Resource
	private LineDao lineDao;

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#add(com.lis.tsp.entity.Line)
	 */
	@Override
	public void add(Line c) {
		// TODO Auto-generated method stub
		lineDao.save(c);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#getAllLine()
	 */
	@Override
	public List<Line> getAllLine() {
		// TODO Auto-generated method stub
		return lineDao.find("from Line");
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#getOneLine(java.lang.Long)
	 */
	@Override
	public Line getOneLine(Long id) {
		// TODO Auto-generated method stub
		return lineDao.get(Line.class, id);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#editLine(com.lis.tsp.entity.Line)
	 */
	@Override
	public void editLine(Line Line) {
		lineDao.update(Line);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#delect(com.lis.tsp.entity.Line)
	 */
	@Override
	public void delect(Line Line) {
		lineDao.delete(Line);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#getQueryList(java.lang.String)
	 */
	@Override
	public List<Line> getQueryList(String hql) {
		// TODO Auto-generated method stub
		return lineDao.find(hql);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#fenYe(int, int, java.lang.String)
	 */
	@Override
	public List<Line> fenYe(int start, int pageSize, String hql) {
		// TODO Auto-generated method stub
		return lineDao.getFenYeList(pageSize, start, hql);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.LineService#getCount(java.lang.String)
	 */
	@Override
	public Number getCount(String hql) {
		// TODO Auto-generated method stub
		return lineDao.count(hql);
	}
	
}
