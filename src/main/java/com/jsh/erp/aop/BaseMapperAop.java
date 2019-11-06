package com.jsh.erp.aop;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jsh.erp.service.depotItem.DepotItemService;

@Aspect // 切面注解
@Component // 构成
public class BaseMapperAop {
	
	private Logger LOGGER = Logger.getLogger(BaseMapperAop.class);

	@Autowired
	private HttpSession session;
	
	@Autowired
    private DepotItemService depotItemService;


//	@After("execution(* com.jsh.erp.datasource.mappers.DepotHeadMapper.update*(..) "
//			+ "or execution(* com.jsh.erp.datasource.mappers.DepotHeadMapper.delete*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.DepotHeadMapper.insert*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.DepotHeadMapperEx.update*(..) "
//			+ "or execution(* com.jsh.erp.datasource.mappers.DepotHeadMapperEx.delete*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.DepotHeadMapperEx.insert*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapper.update*(..) "
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapper.delete*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapper.insert*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapperEx.update*(..) "
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapperEx.delete*(..))"
//			+ "or execution(* com.jsh.erp.datasource.mappers.MaterialMapperEx.insert*(..))")
	public void AfterDo(JoinPoint point) throws Exception {
		LOGGER.info("start-afterdo");
		Long depotId = null;
		Long mId = null;
		String monthTime = "";
		String timeA = monthTime+"-01 00:00:00";
		String timeB = monthTime+"-31 23:59:59";
		Long tenantId = Long.parseLong(session.getAttribute("tenantId").toString());
		BigDecimal prevSum = depotItemService.getStockByParam(depotId,mId,null,timeA,tenantId);

		LOGGER.info("end-afterdo");
	}
	
	
//	@Before("execution(* com.youwe.meet.dao.**.insert(..))")
//	public void beforeInsert(JoinPoint point) throws Exception {
//		LOGGER.info("before-update");
//		Object[] args = point.getArgs();
//		Object arg = args[0];
//		Method[] methods = arg.getClass().getMethods();
//		for (Method m : methods) { 
//			if("setUpdateDate".equals(m.getName()) || "setCreateDate".equals(m.getName())){
//				m.setAccessible(true);
//				m.invoke(arg,new Date());
//			}
//			if("setUpdater".equals(m.getName()) || "setCreater".equals(m.getName())){
//				m.setAccessible(true);
//				m.invoke(arg,((UserVo)session.getAttribute("currentUser")).getId());
//			}
//			
//		}
//		LOGGER.info("end-update");
//	}
	

}
