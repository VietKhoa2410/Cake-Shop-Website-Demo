/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import model.User;
import model.UserDAO;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ASUS
 */
public class LoginController extends ActionSupport implements SessionAware {

    private Map<String, Object> session;
    private String account, pass;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public LoginController() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getRequest() {
        UserDAO uDao = new UserDAO();
        User user = uDao.getUser(account, pass);
        if (user != null) {
            if (!session.containsKey("user")) {
                session.put("user", user);
            }
            setSession(session);
            return "success";
        }
        return "false";
    }

    public String logOut() {
        try {
            System.out.println(session.get("user"));
            session.remove("user");
            System.out.println(session.get("user"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        setSession(session);
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        this.session = map;
    }
}
