package com.revesoft.springboot.web.util;

import com.revesoft.springboot.web.menumanagement.MenuDTO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


@Service
public class URLAccessController {

    public boolean hasAccessPermission(HttpServletRequest request,Integer menuId,String menuName){
        boolean hasAccess=true;
        HashMap<Integer,ArrayList<MenuDTO>>menus=(HashMap<Integer,ArrayList<MenuDTO>>)
                                                    request.getSession().getAttribute("menu");
        Iterator it=menus.entrySet().iterator();
        int outerbreak=0;
        while (it.hasNext()){

            if(outerbreak==1){
                break;
            }
            Map.Entry pair=(Map.Entry)it.next();
            ArrayList<MenuDTO>menu= (ArrayList<MenuDTO>) pair.getValue();
            for (MenuDTO menuDTO:menu
                 ) {
                if(menuId!=null){
                    if(menuDTO.getId()==menuId){
                        if( menuDTO.getUrl().equals(menuName)){
                            hasAccess=true;
                            outerbreak=1;
                            break;
                        }

                    }
                }else{
                    if( menuDTO.getUrl().equals(menuName)){
                        hasAccess=true;
                        outerbreak=1;
                        break;
                    }
                }


            }

        }
        return  hasAccess;
    }
}
