/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import model.ViewDAO;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ASUS
 */
public class ActionController extends ActionSupport implements SessionAware {

    private Map<String, Object> session;

    public ActionController() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String home() {
        ViewDAO vdao = new ViewDAO();

        if (!session.containsKey("view")) {
            vdao.updateViewCount();
            session.put("view", vdao.getViewCount());
        } else {
            session.remove("view");
            session.put("view", vdao.getViewCount());
        }
        setSession(session);
        System.out.println(session.get("view"));
        return "success";
    }

    public String go() {
        ViewDAO vdao = new ViewDAO();
        if (!session.containsKey("view")) {
            vdao.updateViewCount();
            session.put("view", vdao.getViewCount());
        } else {
            session.remove("view");
            session.put("view", vdao.getViewCount());
        }
        setSession(session);
        return "success";
    }

    public String managerPage() {
        try {
            if (!session.containsKey("view") || session.get("user").equals("null")) {
                return "false";
            }
            return "success";
        } catch (Exception ex) {
            return "false";
        }
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
