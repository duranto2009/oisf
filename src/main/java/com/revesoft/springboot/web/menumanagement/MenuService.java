package com.revesoft.springboot.web.menumanagement;

import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by reve on 11/30/2017.
 */
@Service
public class MenuService {
    @Autowired
    private MenuDAO menuDAO;


    ArrayList<MenuDTO> getAllList( long designationId){
     ArrayList<MenuDTO> list = null;
        try {
            list = menuDAO.getAll(designationId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //-------start--Bishwajit Code------------------------------------------------------------------------------------------------------------------------------------

    ArrayList<MenuDTO> getGroupPolicyData(){
        ArrayList<MenuDTO> list = null;
        try {
            list = menuDAO.getGroupPolicyData();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    ArrayList<Integer> getSelectedAppForPolicyGroup(long policygroupid){
        ArrayList<Integer> leaf = null;
        try {
            leaf = menuDAO.getSelectedAppForPolicyGroup(policygroupid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaf;
    }

    ArrayList<Integer> getSelectedMenuForPolicyGroup(long policygroupid){
        ArrayList<Integer> leaf = null;
        try {
            leaf = menuDAO.getSelectedMenuForPolicyGroup(policygroupid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaf;
    }

    void menuAssignForPolicyGroup(int designationid, int[] deleted,int[] inserted){
        try {
            menuDAO.roleMapperForPolicyGroup(designationid, deleted,inserted);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //-------end--Bishwajit Code-------------------------------------------------------------------------------------------------------------------------------------------


   public void add(MenuDTO menuDTO){
        try {
            menuDAO.addMenu(menuDTO);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    ArrayList<MenuDTO> getchildbyparentid(int id, ArrayList<MenuDTO> data){
        ArrayList<MenuDTO> childbyid = new ArrayList<>();
        for (MenuDTO m:data) {
            if(m.getParentId()== id)childbyid.add(m);
        }
        return childbyid;
    }

    Node<MenuDTO> makeTree(Node<MenuDTO> root,ArrayList<MenuDTO> childlist){
        ArrayList<MenuDTO> clist = getchildbyparentid(root.getData().getId(), childlist);


        for (MenuDTO m: clist
             ) {
            Node<MenuDTO> temp = root.addChild(m);
            makeTree( temp,childlist);

        }
        return root;
    }

    Node<MenuDTO> createTree(){
        Node<MenuDTO> root = new Node<MenuDTO>(new MenuDTO());

        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getByDesignation(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        root = makeTree(root,data);

        return root;

    }

    ArrayList<JSONObject> makeJsTree(int id,ArrayList<MenuDTO> childlist){
        ArrayList<MenuDTO> clist = getchildbyparentid(id, childlist);
        ArrayList<JSONObject> jsondata = new ArrayList<>();

        for (MenuDTO m: clist
                ) {
           JSONObject  js = new JSONObject();
           js.put("id",m.getId());
           js.put("text",m.getNameBng());
           js.put("assigned",m.getIsAssigned());
           js.put("children",makeJsTree(m.getId(),childlist));
            jsondata.add(js);
        }
        return jsondata;
    }

    int level = 0;
   String makeSideMenu(int id,ArrayList<MenuDTO> childlist){
        String sideMenu = "";
        ArrayList<MenuDTO> clist = getchildbyparentid(id, childlist);
        ArrayList<JSONObject> jsondata = new ArrayList<>();

       if(clist.size() ==0)return "</a>";
       else if((level+1) !=1)sideMenu = " <span\n" +
               "                        class=\"arrow \"></span></a>";

        level++;
        if(level !=1)sideMenu += "<ul class=\"sub-menu\">";
        for (MenuDTO m: clist
                ) {


            if(level ==1){
                sideMenu += " <li id=\""+m.getNameBng()+"\"> <a href=\"#\"><span class=\"gen-office1\"></span><span class=\"title\"> "+m.getNameBng()+"  </span>"+makeSideMenu(m.getId(),childlist)+"</li>";
            }
            else{
                sideMenu += " <li id=\""+m.getNameBng()+"\">\n" +
                        "                        <a href=\"<%=request.getContextPath()%>/"+m.getUrl()+"\"><i class=\"fa fa-edit\"></i> "+m.getNameBng()+makeSideMenu(m.getId(),childlist)+"</li>";
            }
        }
       if(level !=1)sideMenu +="</ul>";
        level--;
        return sideMenu;
    }
    ArrayList<JSONObject> menuForJsTree(long designationId){
        ArrayList<JSONObject> js = null;
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getAll(designationId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        js = makeJsTree(-1,data);
        return  js;

    }

    void menuAssign(int designationid, int[] deleted,int[] inserted){
        try {
            menuDAO.roleMapper(designationid, deleted,inserted);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    String getSideMenu(){
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getByDesignation(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return makeSideMenu(-1,data);
    }
    ArrayList<Integer> getLeaf(long desigId){
        ArrayList<Integer> leaf = null;
        try {
            leaf = menuDAO.getLeaf(desigId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaf;
    }
    ArrayList<Integer> getSelectedApp(long desigId){
        ArrayList<Integer> leaf = null;
        try {
            leaf = menuDAO.getSelectedApp(desigId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaf;
    }

    public ArrayList<MenuDTO> getSideMenuData(int designationid){
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getByDesignation(designationid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<MenuDTO> getAllMenuData(int designationid){
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getAllMenuByDesignation(designationid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }
    ArrayList<MenuDTO> getButtonMenuData(long designationid,long menuId){
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getButtonByDesignation(designationid,menuId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }

    ArrayList<MenuDTO> getAppData(int designationid)throws  Exception{
        ArrayList<MenuDTO> data = null;
        try {
            data = menuDAO.getAppByDesignation(designationid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }
    public void groupMapper(int designationId,int[]deleted,int[] inserted) {

        try{
            menuDAO.groupMapper(designationId,deleted,inserted);

        }catch (Exception e){
            e.printStackTrace();
        }

    }


//    added by forhad
public ArrayList<MenuDTO> getMenuListData(){

    ArrayList<MenuDTO>data=new ArrayList<>();
    try {
        data=MenuDAO.getMenuListData();
    }catch (Exception e){
        e.printStackTrace();
    }
    return data;
}

    public boolean update(MenuDTO dto) {
        boolean success=false;
        try {
            success=MenuDAO.update(dto);
        }catch (Exception e){
            e.printStackTrace();
        }
        return success;

    }

    public void groupPolicyAdd(String menunameeng, String menunamebng, int[] insertedMenu, int[] insertedApp) {
    boolean success = false;
    try{
        success = MenuDAO.groupPolicyAdd(menunameeng,menunamebng,insertedMenu,insertedApp);
    }catch (Exception e){
        e.printStackTrace();
    }
    }

    public ArrayList<EmployeeOrgDTO> orgOfEmployee(long employeeId) {
       ArrayList<EmployeeOrgDTO>data=new ArrayList<>();
       try{
           data=menuDAO.orgOfEmployee(employeeId);
       }catch (Exception e){
           e.printStackTrace();
       }
       return data;
    }
}
