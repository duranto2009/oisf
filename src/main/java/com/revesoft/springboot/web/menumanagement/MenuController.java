package com.revesoft.springboot.web.menumanagement;

import com.revesoft.springboot.web.appregistration.ApplicationService;
import com.revesoft.springboot.web.geo.division.DivisionService;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.office.ministry.MinistryService;
import com.revesoft.springboot.web.util.AllTable;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by Bony on 11/30/2017.
 */
@RestController
public class MenuController {

    @Autowired
    MenuService menuService;
    @Autowired
    ApplicationService applicationService;
    @Autowired
    DivisionService divisionService;
    @Autowired
    MinistryService ministryService;
    @Autowired
    PolicyGroupService policyGroupService;


    @RequestMapping(value = "addmenu")
    ModelAndView addMenuForm(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView form = new ModelAndView("menumanagement/addmenumanagementform");
        form.addObject("parent", menuService.getAllList(-1));
        form.addObject("menuid",menuid);
        request.getSession().setAttribute("menuaddmenuid",menuid);
        return form;
    }

    @RequestMapping(value = "addmenu", method = RequestMethod.POST)
    RedirectView addMenu(@RequestParam String menunameeng, @RequestParam String menunamebng,
                         @RequestParam int type, @RequestParam String menuurl, @RequestParam int pardata,HttpServletRequest request) {
        MenuDTO menuDTO = new MenuDTO();
        menuDTO.setNameBng(menunamebng);
        menuDTO.setNameEng(menunameeng);
        menuDTO.setUrl(menuurl);
        menuDTO.setParentId(pardata);
        menuDTO.setMenuType(type);
        menuDTO.setCreatedBy(1);
        menuDTO.setModifiedBy(1);
        menuService.add(menuDTO);
        RedirectView redirectView = new RedirectView("/addmenu?menuid="+request.getSession().getAttribute("menuaddmenuid"));
        return redirectView;
    }

    @RequestMapping(value = "menuassign")
    ModelAndView assignMenuForm(@RequestParam int menuid) {

        ModelAndView form = new ModelAndView("menumanagement/menumanagementselection");
        // form.addObject("menulist",menuService.getAllList());
        form.addObject("division", divisionService.getDivisionData());
        form.addObject("ministry", ministryService.getAll());
        //form.addObject("sidemenu",menuService.getSideMenu());
        form.addObject("app", applicationService.getAppData());
        form.addObject("menuid",menuid);
        return form;
    }

    //start ---added by forhad 07/01/18
    @RequestMapping(value = "grouppolicyadd")
    ModelAndView groupPolicyAddGet(HttpServletRequest request) {

        String menuid = request.getSession().getAttribute("grouppolicylistmenuid").toString();

        ModelAndView form = new ModelAndView("menumanagement/grouppolicyadd");
        // form.addObject("menulist",menuService.getAllList());
        form.addObject("division", divisionService.getDivisionData());
        form.addObject("ministry", ministryService.getAll());
        //form.addObject("sidemenu",menuService.getSideMenu());
        form.addObject("app", applicationService.getAppData());
        form.addObject("menuid",menuid);
        return form;
    }


    //-------start--Bishwajit Code-----------------------------------------------------------------------------------------------------------------------------------------

    @RequestMapping(value = "grouppolicylist", method = RequestMethod.GET)
    public ModelAndView getAllGroupPolicy(HttpServletRequest request,@RequestParam int menuid) {
        ArrayList<MenuDTO> data = menuService.getGroupPolicyData();
        ModelAndView modelAndView = new ModelAndView();
        //request.getSession().setAttribute("divisionmenuid",me);
        modelAndView.addObject("list", data);
        //modelAndView.addObject("menuid",menuid);
        modelAndView.setViewName("menumanagement/grouppolicylist");
        modelAndView.addObject("menuid", menuid);
        request.getSession().setAttribute("grouppolicylistmenuid",menuid);
        return modelAndView;
    }


    @RequestMapping(path = "policylistdata")
    @ResponseBody
    JSONObject policylistPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / 10) + 1;

        //Fetch search parameter
        String searchParameter = request.getParameter("sSearch");
        Integer pageDisplayLength = 0;
        //Fetch Page display length
        if (request.getParameter("iDisplayLength") != null)
            pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

        ArrayList<MenuDTO> List;

        List = menuService.getGroupPolicyData();


        int i = new SQLStatementCreator().tableDatacount(AllTable.TBL_POLICY_GROUPS);
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords", i);
        obj.put("iTotalDisplayRecords", i);
        obj.put("aaData", List.toArray());
        //return list2;

        return obj;
    }


    @RequestMapping(value = "policyedit", method = RequestMethod.POST)
    public ModelAndView editForm(@RequestParam int id,
                                 @RequestParam String name_eng,
                                 @RequestParam String name_bng,
                                 HttpServletRequest request,
                                 @RequestParam int status) {
        MenuDTO menuDTO = new MenuDTO();
        menuDTO.setId(id);
        menuDTO.setNameEng(name_eng);
        menuDTO.setNameBng(name_bng);

        menuDTO.setStatus(status);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("policy", menuDTO);
        modelAndView.addObject("app", applicationService.getAppData());


//        modelAndView.addObject("division", divisionService.getDivisionData());
//        modelAndView.addObject("ministry",ministryService.getAll());
//        modelAndView.addObject("app",applicationService.getAppData());


        modelAndView.setViewName("menumanagement/grouppolicyedit");
        String menuid = request.getSession().getAttribute("grouppolicylistmenuid").toString();
        modelAndView.addObject("menuid",menuid);
        return modelAndView;
    }


    @RequestMapping(value = "selectedappForPolicyGroup")
    @ResponseBody
    ArrayList<Integer> getSelectedAppForPolicyGroup(HttpServletRequest request, @RequestParam long policygroupid) {

        // Long orgId=(Long)request.getSession().getAttribute("organogramId");
        return menuService.getSelectedAppForPolicyGroup(policygroupid);
    }


    @RequestMapping(value = "getSelectedMenuForPolicyGroup")
    @ResponseBody
    ArrayList<Integer> getSelectedMenuForPolicyGroup(HttpServletRequest request, @RequestParam long policygroupid) {
        //ArrayList<Integer> i = new ArrayList<>();
        //i.add(6006);
        // Long orgId=(Long)request.getSession().getAttribute("organogramId");
        ArrayList<Integer> data = menuService.getSelectedMenuForPolicyGroup(policygroupid);
        return data;
        //return i;
    }


    @RequestMapping(value = "grouppolicyassign", method = RequestMethod.POST)
    RedirectView grouppolicyassign(
//            @RequestParam int policygroupid,
            HttpServletRequest request,
            @RequestParam(value = "policygroupid") int policygroupid,
            @RequestParam(value = "insertedmenu[]") int[] insertedMenu,
            @RequestParam(value = "deletedmenu[]") int[] deletedMenu,
            @RequestParam(value = "insertedapp[]") int[] insertedApp,
            @RequestParam(value = "deletedapp[]") int[] deletedApp) {

     /*   ArrayList<Integer> menuList = new ArrayList<>();
        ArrayList<Integer> appList = new ArrayList<>();
        for(int i=0; i<menulist.length; i++){
            menuList.add(menulist[i]);
        }
        for (int i=0;i<applist.length;i++){
            appList.add(applist[i]);
        }*/


//        System.out.println("----------------------------------------------start grouppolicyassign------------------------------------------------------------------------");
//        System.out.println("policygroupid          :" +policygroupid);
//        System.out.println("insertedApp.length          :" +insertedApp.length);
//        System.out.println("deletedApp.length          :" +deletedApp.length);
//        System.out.println("insertedMenu.length          :" +insertedMenu.length);
//        System.out.println("deletedMenu.length          :" +deletedMenu.length);
//       // System.out.println("deletedApp         :" +deletedApp);
//        System.out.println("-----------------------------------------------end grouppolicyassign-----------------------------------------------------------------------");


        menuService.menuAssignForPolicyGroup(policygroupid, deletedMenu, insertedMenu);
        applicationService.appRoleMapperForPolicyGroup(policygroupid, deletedApp, insertedApp);

        return new RedirectView("grouppolicylist?menuid="+request.getSession().getAttribute("grouppolicylistmenuid"));
    }


    //-------end--Bishwajit Code------------------------------------------------------------------------------------------------------------------------------------------------


    @RequestMapping(value = "grouppolicyadd", method = RequestMethod.POST)
    RedirectView groupPolicyAddPost(
            HttpServletRequest request,
            @RequestParam String menunameeng,
            @RequestParam String menunamebng,
            @RequestParam(value = "insertedmenu[]") int[] insertedMenu,
            @RequestParam(value = "insertedapp[]") int[] insertedApp) {

     /*   ArrayList<Integer> menuList = new ArrayList<>();
        ArrayList<Integer> appList = new ArrayList<>();
        for(int i=0; i<menulist.length; i++){
            menuList.add(menulist[i]);
        }
        for (int i=0;i<applist.length;i++){
            appList.add(applist[i]);
        }*/

        menuService.groupPolicyAdd(menunameeng, menunamebng, insertedMenu, insertedApp);
//
//        applicationService.appRoleMapper(organogramdata,deletedApp,insertedApp);
        int x = 0;

         return new RedirectView("grouppolicylist?menuid="+request.getSession().getAttribute("grouppolicylistmenuid"));
    }


//end ---added by forhad 07/01/18


    @RequestMapping(value = "menuassign", method = RequestMethod.POST)
    RedirectView menuAssign(
            @RequestParam int organogramdata,
            @RequestParam(value = "insertedmenu[]") int[] insertedMenu,
            @RequestParam(value = "deletedmenu[]") int[] deletedMenu,
            @RequestParam(value = "insertedapp[]") int[] insertedApp,
            @RequestParam(value = "deletedapp[]") int[] deletedApp) {

     /*   ArrayList<Integer> menuList = new ArrayList<>();
        ArrayList<Integer> appList = new ArrayList<>();
        for(int i=0; i<menulist.length; i++){
            menuList.add(menulist[i]);
        }
        for (int i=0;i<applist.length;i++){
            appList.add(applist[i]);
        }*/

//        System.out.println("----------------------------------------------start menuassign------------------------------------------------------------------------");
//        System.out.println("organogramdata          :" +organogramdata);
//        System.out.println("insertedApp          :" +insertedApp.length);
//        System.out.println("deletedApp.length          :" +deletedApp.length);
//        // System.out.println("deletedApp         :" +deletedApp);
//        System.out.println("-----------------------------------------------end menuassign-----------------------------------------------------------------------");

        menuService.menuAssign(organogramdata, deletedMenu, insertedMenu);

        applicationService.appRoleMapper(organogramdata, deletedApp, insertedApp);

        return new RedirectView("menuassign");
    }

    @RequestMapping(value = "groupassign", method = RequestMethod.GET)
    ModelAndView assignGroupMenuForm(HttpServletRequest request,@RequestParam int menuid) {

        ModelAndView form = new ModelAndView("menumanagement/groupmenumanagementselection");
        // form.addObject("menulist",menuService.getAllList());
        //form.addObject("division", divisionService.getDivisionData());
        form.addObject("ministry", ministryService.getAll());
        //form.addObject("sidemenu",menuService.getSideMenu());
        form.addObject("groups", policyGroupService.getAll());
        form.addObject("menuid",menuid);
        request.getSession().setAttribute("groupassignmenuid",menuid);
        return form;
    }


    @RequestMapping(value = "groupassign", method = RequestMethod.POST)
    RedirectView groupMenuAssign(HttpServletRequest request,@RequestParam int organogramdata, @RequestParam(value = "insertedgroup[]") int[] insertedGroup, @RequestParam(value = "deletedgroup[]") int[] deletedGroup) {


        //menuService.groupMenuAssign(organogramdata, deletedMenu,insertedMenu);

        menuService.groupMapper(organogramdata, deletedGroup, insertedGroup);

        return new RedirectView("groupassign?menuid="+request.getSession().getAttribute("groupassignmenuid"));
    }

    @RequestMapping(value = "getmenutree")
    Node<MenuDTO> getMenuTree() {
        return menuService.createTree();
    }

    @RequestMapping(value = "menutree", method = RequestMethod.POST)
    ArrayList<JSONObject> menutree(@RequestParam long id) {
        return menuService.menuForJsTree(id);
    }

    @RequestMapping(value = "getsidemenudata")
    @ResponseBody
    ArrayList<MenuDTO> getSideMenu(@RequestParam int id) {
        ArrayList<MenuDTO> data = menuService.getSideMenuData(id);
//        Set<MenuDTO> sets=new LinkedHashSet<>();
//        sets.addAll(data);
//        data.clear();
//        data.addAll(sets);
        return data;
    }

    @RequestMapping(value = "getappdata")
    @ResponseBody
    ArrayList<MenuDTO> getAppData(@RequestParam int id) throws Exception {
        return menuService.getAppData(id);
    }


    @RequestMapping(value = "permission")
    @ResponseBody
    ArrayList<MenuDTO> getPermission(HttpServletRequest request, @RequestParam long menuid) {

        Long orgId = (Long) request.getSession().getAttribute("organogramId");
        return menuService.getButtonMenuData(orgId, menuid);
    }

    @RequestMapping(value = "leaf")
    @ResponseBody
    ArrayList<Integer> getLeaf(HttpServletRequest request, @RequestParam long desigid) {

        // Long orgId=(Long)request.getSession().getAttribute("organogramId");
        return menuService.getLeaf(desigid);
    }

    @RequestMapping(value = "selectedapp")
    @ResponseBody
    ArrayList<Integer> getSelectedApp(HttpServletRequest request, @RequestParam long desigid) {

        // Long orgId=(Long)request.getSession().getAttribute("organogramId");
        return menuService.getSelectedApp(desigid);
    }


    @RequestMapping(value = "selectedgroup")
    @ResponseBody
    ArrayList<Integer> getSelectedGroup(HttpServletRequest request, @RequestParam long desigid) {

        // Long orgId=(Long)request.getSession().getAttribute("organogramId");
        return policyGroupService.getSelectedGroup(desigid);
    }


    //    code added by forhad.... 01/04/18
    @RequestMapping(path = "menulistdata")
    @ResponseBody
    JSONObject divisionPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Integer pageNumber = 0;
        if (null != request.getParameter("iDisplayStart"))
            pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / 10) + 1;

        //Fetch search parameter
        String searchParameter = request.getParameter("sSearch");
        Integer pageDisplayLength = 0;
        //Fetch Page display length
        if (request.getParameter("iDisplayLength") != null)
            pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

        ArrayList<MenuDTO> List;

        List = menuService.getMenuListData();


        int i = new SQLStatementCreator().tableDatacount("menu");
        JSONObject obj = new JSONObject();
        obj.put("iTotalRecords", i);
        obj.put("iTotalDisplayRecords", i);
        obj.put("aaData", List.toArray());
        //return list2;

        return obj;
    }

    @RequestMapping(value = "menulist", method = RequestMethod.GET)
    public ModelAndView getAllMenu(HttpServletRequest request) {
        //ArrayList<MenuDTO> data=menuService.getMenuListData();
        ModelAndView modelAndView = new ModelAndView();
//        request.getSession().setAttribute("divisionmenuid",menuid);
        // modelAndView.addObject("list",data);
//        modelAndView.addObject("menuid",menuid);
        modelAndView.setViewName("menumanagement/menulist");
        return modelAndView;
    }

    @RequestMapping(value = "menuedit", method = RequestMethod.POST)
    public ModelAndView editForm(
            @RequestParam int id,
            @RequestParam String menunameeng,
            @RequestParam String menunamebng,
            @RequestParam String url,
            HttpServletRequest request,
            HttpServletResponse response
//            ,@RequestParam int status

    ) {
//        System.out.println("==================REQUEST===========================");
//        //System.out.println(request.toString());
//        System.out.println("=============================================");
//
//        System.out.println("================RESPONSE=============================");
//       // System.out.println(response.toString());
//        System.out.println("=============================================");

        MenuDTO menuDTO = new MenuDTO();
        menuDTO.setId(id);
        menuDTO.setNameEng(menunameeng);
        menuDTO.setNameBng(menunamebng);
        menuDTO.setUrl(url);
//
//        menuDTO.setStatus(status);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("menu", menuDTO);
//        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("menumanagement/menuedit");
        return modelAndView;
    }

    @RequestMapping(value = "menuupdate", method = RequestMethod.POST)
    @ResponseBody
    public RedirectView editMenu(
            @RequestParam int id,
            @RequestParam String menunameeng,
            @RequestParam String menunamebng,
            @RequestParam String url

    ) {
        MenuDTO dto = new MenuDTO();
        dto.setId(id);
        dto.setNameBng(menunamebng);
        dto.setNameEng(menunameeng);
        dto.setUrl(url);


        boolean success = menuService.update(dto);
        return new RedirectView("menulist");





    }

    @RequestMapping(value = "employeeorglist",method = RequestMethod.GET)
    public ArrayList<EmployeeOrgDTO> employeeOrg(@RequestParam long employeeId){
        return menuService.orgOfEmployee(employeeId);
    }


}
