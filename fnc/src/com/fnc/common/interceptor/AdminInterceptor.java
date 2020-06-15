package com.fnc.common.interceptor;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.fnc.common.vo.AdminVo;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminInterceptor extends AbstractInterceptor {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(AdminInterceptor.class);
	private static final String ADMIN_INFO = "adminVo";

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		logger.info("##### AdminInterceptor - intercept() #####");
		Map<String, Object> session = invocation.getInvocationContext().getSession();		

		AdminVo adminVo = (AdminVo)session.get(ADMIN_INFO);
		
		String uri = ServletActionContext.getRequest().getRequestURI();
		String str = "admin/adm";

		if ( adminVo == null || StringUtils.isBlank(adminVo.getUserId()) ) {
			logger.info("##### adminLogin #####");
			return "adminLogin";
		}
		else if ( "Y".equals(adminVo.getYnExpiredPwd()) ) {
			logger.info("##### adminExpirePwd #####");
			return "adminExpirePwd";
		}
		else if ( !"A".equals(adminVo.getClAdmnPrsn()) && uri.indexOf(str) > -1 ) {
			logger.info("##### No Access #####");
			return "noAccess";
		}
		else {
			logger.debug("### adminVo : " + adminVo.toString() + " ###");
		}

		return invocation.invoke();
	}

}
