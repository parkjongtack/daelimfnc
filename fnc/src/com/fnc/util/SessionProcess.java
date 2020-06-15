package com.fnc.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"unchecked", "serial"})
public class SessionProcess extends ActionSupport implements Serializable{
    public Map getSession(){
        /* 세션 설정 */
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession() ;
        /* 세션 설정 */
        return session ;
    }
    
    public void setSession(){
        /* 세션 설정 */
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession() ;
        
        session.remove("ID_ADMN_PRSN");
        session.remove("NM_ADMN_PRSN");
        session.remove("EMAIL_ADMN_PRSN");
        session.remove("NM_DEPT_ADMNPRSN");
        session.remove("NO_MPHN");
        session.remove("YN_USE");
        session.remove("DT_BEGN_ATRT");
        session.remove("DT_END_ATRT");
        session.remove("CL_ADMN_PRSN");
        session.remove("DT_CHG_PWD");
        session.remove("DT_PLAN_CHG_PWD");
        session.remove("NO_ATCH_FILE_SRAL");
        session.remove("ADMIN_LOGIN"); 
        session.remove("ATRT_ADMN_PRSN");
        session.remove("LNB_AUTH");
    }
    
    
    @SuppressWarnings("unchecked")
    public void setSession(HashMap hm){
        /* 세션 설정 */
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession() ;
        
        session.put("ID_ADMN_PRSN"      , hm.get("ID_ADMN_PRSN"));
        session.put("NM_ADMN_PRSN"      , hm.get("NM_ADMN_PRSN"));
        session.put("EMAIL_ADMN_PRSN"   , hm.get("EMAIL_ADMN_PRSN"));
        session.put("NM_DEPT_ADMNPRSN"  , hm.get("NM_DEPT_ADMNPRSN"));
        session.put("NO_MPHN"           , hm.get("NO_MPHN"));
        session.put("YN_USE"            , hm.get("YN_USE"));
        session.put("DT_BEGN_ATRT"      , hm.get("DT_BEGN_ATRT"));
        session.put("DT_END_ATRT"       , hm.get("DT_END_ATRT"));
        session.put("CL_ADMN_PRSN"      , hm.get("CL_ADMN_PRSN"));
        session.put("DT_CHG_PWD"        , hm.get("DT_CHG_PWD")        == null ? "" : hm.get("DT_CHG_PWD"));
        session.put("DT_PLAN_CHG_PWD"   , hm.get("DT_PLAN_CHG_PWD")   == null ? "" : hm.get("DT_PLAN_CHG_PWD"));
        session.put("NO_ATCH_FILE_SRAL" , hm.get("NO_ATCH_FILE_SRAL") == null ? "" : hm.get("NO_ATCH_FILE_SRAL"));
    }
    
    public void setSession(String key , Object value){
        /* 세션 설정 */
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession() ;
        
        session.put(key , value);
        
    }
}
