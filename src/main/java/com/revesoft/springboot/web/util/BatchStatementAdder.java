package com.revesoft.springboot.web.util;

import com.revesoft.springboot.web.configurabledashboard.ConfigurableDashboardDAO;
import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDTO;
import com.revesoft.springboot.web.geo.citycorporation.CityCorporationService;
import com.revesoft.springboot.web.geo.citycorporationward.CityCorporationWardDAO;
import com.revesoft.springboot.web.geo.citycorporationward.CityCorporationWardDTO;
import com.revesoft.springboot.web.geo.municipality.MunicipalityDTO;
import com.revesoft.springboot.web.geo.municipality.MunicipalityService;
import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDAO;
import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDTO;
import com.revesoft.springboot.web.geo.postoffice.PostOfficeDTO;
import com.revesoft.springboot.web.geo.postoffice.PostOfficeService;
import com.revesoft.springboot.web.geo.thana.ThanaDTO;
import com.revesoft.springboot.web.geo.thana.ThanaService;
import com.revesoft.springboot.web.geo.union.UnionDTO;
import com.revesoft.springboot.web.geo.union.UnionService;
import com.revesoft.springboot.web.geo.upazilla.UpazillaDTO;
import com.revesoft.springboot.web.geo.upazilla.UpazillaService;
import databasemanager.DatabaseManager;
import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

@Service
public class BatchStatementAdder {

    @Autowired
    UpazillaService upazillaService;
    @Autowired
    UnionService unionService;
    @Autowired
    ThanaService thanaService;
    @Autowired
    CityCorporationService cityCorporationService;
    @Autowired
    MunicipalityService municipalityService;
    @Autowired
    PostOfficeService postOfficeService;
    @Autowired
    MunicipalityWardDAO municipalityWardDAO;
    @Autowired
    CityCorporationWardDAO cityCorporationWardDAO;

    private static final String TBL_GEO_DIVISION="geo_divisions";
    private static final String TBL_GEO_DISTRICT="geo_districts";
    private static final String TBL_GEO_UPAZILA="geo_upazilas";
    private static final String TBL_GEO_THANA="geo_thanas";
    private static final String TBL_GEO_POST="geo_post_offices";
    private static final String TBL_GEO_CITY_CORP="geo_city_corporations";
    private static final String TBL_GEO_CITY_CORP_WARD="geo_city_corporation_wards";
    private static final String TBL_GEO_UNION="geo_unions";
    private static final String TBL_GEO_MUNICIPALITY="geo_municipalities";
    private static final String TBL_GEO_MUNICIPALITY_WARD="geo_municipality_wards";
    private static final String TBL_GEO_HISTORY="geo_history";
    private static final String TBL_GEO_MAPPING="geo_mappings";



    java.util.Date dt = new java.util.Date();

    java.text.SimpleDateFormat sdf =
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    String currentTime = sdf.format(dt);



    public Statement munistatementAdder(Statement stmt, String parentName, int parentId, int userId, ArrayList<MunicipalityDTO>sourceMuniList)throws Exception {

        for (MunicipalityDTO municipalityDTO:sourceMuniList) {

            long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
            String q19 = "insert into " +TBL_GEO_HISTORY+" (id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by" +
                    ",modified_by,created,modified,expired_by)" +
                    " select " +ID+ " , geo_upazila_id,id,municipality_name_eng,municipality_name_bng,bbs_code,status,created_by,modified_by,created,modified, " + userId +
                    " from "+TBL_GEO_MUNICIPALITY+ " where id = " +municipalityDTO.getId() ;
            System.out.println(q19);
            stmt.addBatch(q19);

            String q20 = " insert into "  +TBL_GEO_MAPPING+ "( geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                    " select "+ ID+ " ,m.id, "+ Policy.MUNICIPALITY_TYPE+ " , " + Policy.MUNICIPALITY_TYPE+ " from "+TBL_GEO_MUNICIPALITY +
                    " m where m.id = " + municipalityDTO.getId() ;
            System.out.println(q20);
            stmt.addBatch(q20);


            String q21 = "update " +TBL_GEO_MUNICIPALITY + " set " +parentName+ " = "  + parentId +
                    " where id = " + municipalityDTO.getId() ;
            System.out.println(q21);
            stmt.addBatch(q21);
//
//
            //muni ward


            int count=municipalityWardDAO.getMunicipalityWardCount(municipalityDTO.getId());
            ArrayList<Long> wardIds=new ArrayList<>();
            ArrayList<MunicipalityWardDTO> wordLists = municipalityWardDAO.getMunicipalityWardListByMunicipalityId(municipalityDTO.getId());
            for(int i=1;i<=count;i++){
                long IDs=DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
                wardIds.add(IDs);
            }
            int i=0;

            for (Long wardId:wardIds) {

                //long wid=DatabaseManager.getInstance().getNextSequenceId("geo_history");

                String q22 = " insert into " +TBL_GEO_HISTORY+ "( id ,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by," +
                        "modified_by,created,modified,expired_by)" +
                        " select " +wardId+ " , geo_municipality_id,id ,ward_name_eng,ward_name_bng,bbs_code,status,created_by,modified_by,created,modified," + userId +
                        " from " +TBL_GEO_MUNICIPALITY_WARD+ " where id = " + wordLists.get(i).getId();
                System.out.println(q22);
                stmt.addBatch(q22);
                String q23 = " insert into " +TBL_GEO_MAPPING+  " (geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                        " select "+wardId+ " ,w.id,  " + Policy.MUNI_WARD_TYPE+ " , " + Policy.MUNI_WARD_TYPE+ " from "+
                        TBL_GEO_MUNICIPALITY_WARD+ " w where w.id  = " +  wordLists.get(i).getId();
                System.out.println(q23);
                stmt.addBatch(q23);
                String q24 = " update " +TBL_GEO_MUNICIPALITY_WARD+ " set   " +parentName+ " = "  + parentId +
                        " where id  = " +  wordLists.get(i).getId() ;
                System.out.println(q24);
                stmt.addBatch(q24);
                i++;

            }


        }

        return stmt;

    }


    public Statement unionstatementAdder(Statement stmt,String parentName,int parentId,int userId,ArrayList<UnionDTO>sourceUnionList)throws Exception{


        for (UnionDTO unionDTO:sourceUnionList) {

            long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
            String q16 = "insert into "+TBL_GEO_HISTORY+ " (id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    " created,modified,expired_by )" +
                    " select " + ID +  " , geo_upazila_id,id,union_name_eng,union_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from " +TBL_GEO_UNION+ " where id = " + unionDTO.getId() ;
            System.out.println(q16);
            stmt.addBatch(q16);

            String q17 = " insert into " +TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ", u.id , " + Policy.UNION_TYPE+" , "+ Policy.UNION_TYPE+ " from "+ TBL_GEO_UNION+
                    " u where u.id = " + unionDTO.getId() ;
            System.out.println(q17);
            stmt.addBatch(q17);


            String q18 = "  update " +TBL_GEO_UNION+ " set " +parentName+ " = "  + parentId +
                    " where id = " + unionDTO.getId() ;
            System.out.println(q18);
            stmt.addBatch(q18);

        }

        return stmt;
    }


    public Statement upazilaStatementAdd(Statement stmt,String parentName,int parentId,int userId,ArrayList<UpazillaDTO>sourceUpazila)throws Exception {

        for(UpazillaDTO upazillaDTO:sourceUpazila){
            long ID=DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
            String q16 = "insert into " +TBL_GEO_HISTORY+  " ( id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    "created,modified,expired_by )" +
                    " select " + ID +  " , geo_district_id,id,upazila_name_eng,upazila_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from "+TBL_GEO_UPAZILA+ " where id = " + upazillaDTO.getId() ;
            System.out.println(q16);
            stmt.addBatch(q16);
            String q17 = " insert into "+ TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ",u.id , " + Policy.UPAZILA_TYPE+"," + Policy.UPAZILA_TYPE+ " from "+TBL_GEO_UPAZILA +
                    " u where u.id = " + upazillaDTO.getId();
            System.out.println(q17);
            stmt.addBatch(q17);

            String q18 = "  update "+ TBL_GEO_UPAZILA+" set " +parentName+ " = "  + parentId +
                    " where id = " + upazillaDTO.getId() ;
            System.out.println(q18);
            stmt.addBatch(q18);
            ArrayList<UnionDTO> list=unionService.getUnionListByUpazillaId(upazillaDTO.getId());
            if(list.size()>0){
                stmt=unionstatementAdder(stmt,parentName,parentId,userId,list);
            }

            ArrayList<MunicipalityDTO> lists=municipalityService.getMunicipalityListbyUpazillaId(upazillaDTO.getId());
            if(lists.size()>0){
                stmt=munistatementAdder(stmt,parentName,parentId,userId,lists);
            }


        }

        return stmt;

    }
    public Statement cityStatementAdd(Statement stmt,String parentName,int parentId,int userId,ArrayList<CityCorporationDTO>sourceCity)throws Exception {

        for(CityCorporationDTO cityCorporationDTO:sourceCity){
            long ID=DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
            String q16 = "insert into " +TBL_GEO_HISTORY+  " ( id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    "created,modified,expired_by )" +
                    " select " + ID +  " , geo_district_id,id,city_corporation_name_eng,city_corporation_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from "+TBL_GEO_CITY_CORP+ " where id = " + cityCorporationDTO.getId() ;
            System.out.println(q16);
            stmt.addBatch(q16);
            String q17 = " insert into "+ TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ",u.id , " + Policy.CITY_TYPE+"," + Policy.CITY_TYPE+ " from "+TBL_GEO_CITY_CORP +
                    " u where u.id = " + cityCorporationDTO.getId();
            System.out.println(q17);
            stmt.addBatch(q17);

            String q18 = "  update "+ TBL_GEO_CITY_CORP+" set " +parentName+ " = "  + parentId +
                    " where id = " + cityCorporationDTO.getId() ;
            System.out.println(q18);
            stmt.addBatch(q18);

            ArrayList<Long> wardIds=new ArrayList<>();
            ArrayList<CityCorporationWardDTO> wordLists = cityCorporationWardDAO.getById(cityCorporationDTO.getId());
            for(int i=1;i<=wordLists.size();i++){
                long IDs=DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
                wardIds.add(IDs);
            }
            int i=0;

            for (Long wardId:wardIds) {

                //long wid=DatabaseManager.getInstance().getNextSequenceId("geo_history");

                String q22 = " insert into " +TBL_GEO_HISTORY+ "( id ,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by," +
                        "modified_by,created,modified,expired_by)" +
                        " select " +wardId+ " , geo_city_corporation_id,id ,ward_name_eng,ward_name_bng,bbs_code,status,created_by,modified_by,created,modified," + userId +
                        " from " +TBL_GEO_CITY_CORP_WARD+ " where id = " + wordLists.get(i).getId();
                System.out.println(q22);
                stmt.addBatch(q22);
                String q23 = " insert into " +TBL_GEO_MAPPING+  " (geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                        " select "+wardId+ ",w.id, " + Policy.CITY_WARD_TYPE+ " , " + Policy.CITY_WARD_TYPE+ " from "+
                        TBL_GEO_CITY_CORP_WARD+ " w where w.id  = " +  wordLists.get(i).getId();
                System.out.println(q23);
                stmt.addBatch(q23);
                String q24 = " update " +TBL_GEO_CITY_CORP_WARD+ " set " +parentName+ " = "  + parentId +
                        " where id = " +  wordLists.get(i).getId() ;
                System.out.println(q24);
                stmt.addBatch(q24);
                i++;

            }


        }

        return stmt;

    }

    public Statement thanaStatementAdd(Statement stmt,String parentName,int parentId,int userId,ArrayList<ThanaDTO>sourceThana)throws Exception {

        for(ThanaDTO thanaDTO:sourceThana){
            long ID=DatabaseManager.getInstance().getNextSequenceId(TBL_GEO_HISTORY);
            String q16 = "insert into " +TBL_GEO_HISTORY+  " ( id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    "created,modified,expired_by )" +
                    " select " + ID +  " , geo_district_id,id,thana_name_eng,thana_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from "+TBL_GEO_THANA+ " where id = " + thanaDTO.getId() ;
            System.out.println(q16);
            stmt.addBatch(q16);
            String q17 = " insert into "+ TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ",u.id , " + Policy.THANA_TYPE+"," + Policy.THANA_TYPE+ " from "+TBL_GEO_THANA +
                    " u where u.id = " + thanaDTO.getId();
            System.out.println(q17);
            stmt.addBatch(q17);

            String q18 = "  update "+ TBL_GEO_THANA+" set " +parentName+ " = "  + parentId +
                    " where id = " + thanaDTO.getId() ;
            System.out.println(q18);
            stmt.addBatch(q18);
//            ArrayList<UnionDTO> list=new UnionService().getUnionListByUpazillaId(thanaDTO.getId());
//            if(list.size()>0){
//                stmt=unionstatementAdder(stmt,parentName,upazillaDTO.getId(),userId,list);
//            }
//
//            ArrayList<MunicipalityDTO> lists=new MunicipalityService().getMunicipalityListbyUpazillaId(upazillaDTO.getId());
//            if(lists.size()>0){
//                stmt=munistatementAdder(stmt,parentName,upazillaDTO.getId(),userId,lists);
//            }


        }

        return stmt;

    }


    public Statement postStatementAdd(Statement stmt,String parentName,int parentId,int userId,ArrayList<PostOfficeDTO>sourcePost)throws Exception {

        for(PostOfficeDTO postOfficeDTO:sourcePost){
            long ID=DatabaseManager.getInstance().getNextSequenceId("geo_history");
            String q16 = "insert into " +TBL_GEO_HISTORY+  " ( id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    "created,modified,expired_by )" +
                    " select " + ID +  " , geo_district_id,id,postoffice_name_eng,postoffice_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from "+TBL_GEO_POST+ " where id = " + postOfficeDTO.getId() ;
            System.out.println(q16);
            stmt.addBatch(q16);
            String q17 = " insert into "+ TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ",u.id , " + Policy.POST_OFFICE_TYPE+"," + Policy.POST_OFFICE_TYPE+ " from "+TBL_GEO_POST +
                    " u where u.id = " + postOfficeDTO.getId();
            System.out.println(q17);
            stmt.addBatch(q17);

            String q18 = "  update "+ TBL_GEO_POST+" set " +parentName+ " = "  + parentId +
                    " where id = " + postOfficeDTO.getId() ;
            System.out.println(q18);
            stmt.addBatch(q18);
//            ArrayList<UnionDTO> list=new UnionService().getUnionListByUpazillaId(upazillaDTO.getId());
//            if(list.size()>0){
//                stmt=unionstatementAdder(stmt,parentName,upazillaDTO.getId(),userId,list);
//            }
//
//            ArrayList<MunicipalityDTO> lists=new MunicipalityService().getMunicipalityListbyUpazillaId(upazillaDTO.getId());
//            if(lists.size()>0){
//                stmt=munistatementAdder(stmt,parentName,upazillaDTO.getId(),userId,lists);
//            }


        }

        return stmt;

    }


    public Statement disStatementAdd(Statement stmt,String parentName,int parentId,int userId,ArrayList<Integer>sourceDisId)throws Exception{
        for(int disId:sourceDisId){
            long ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);
            String q16 = "insert into " +TBL_GEO_HISTORY+  " (id,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                    "created,modified,expired_by )" +
                    " select " + ID +  " , geo_division_id,id,district_name_eng,district_name_bng,bbs_code,status,created_by,modified_by,created,modified,"
                    + userId +
                    " from "+ TBL_GEO_DISTRICT+ " where id = " + disId ;
            System.out.println(q16);
            stmt.addBatch(q16);






            String q17 = " insert into " +TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                    " select " +ID+ ",d.id , " + Policy.DISTRICT_TYPE+"," + Policy.DISTRICT_TYPE+ " from " + TBL_GEO_DISTRICT+
                    " d where d.id = " + disId ;
            System.out.println(q17);
            stmt.addBatch(q17);

            String q18 = "  update " +TBL_GEO_DISTRICT + " set "
                   + " modified = ' "+ currentTime + "' , "
                    +parentName+ " = "  + parentId +
                    " where id = " + disId ;

            System.out.println(q18);
            stmt.addBatch(q18);
            ArrayList<UpazillaDTO> upazilas=upazillaService.getUpazillaListbyDistrictId(disId);
            stmt=upazilaStatementAdd(stmt,parentName,parentId,userId,upazilas);
            ArrayList<ThanaDTO>thanas=thanaService.getThanaListbyDistrictId(disId);
            stmt=thanaStatementAdd(stmt,parentName,parentId,userId,thanas);
            ArrayList<CityCorporationDTO>citylists=cityCorporationService.getDisWiseCity(disId);
            stmt=cityStatementAdd(stmt,parentName,parentId,userId,citylists);
            //ArrayList<PostOfficeDTO>postlists=postOfficeService.//post office not done


        }

        return stmt;
    }

//    by forhad
    @Autowired
    ConfigurableDashboardDAO configurableDashboardDAO;
    private static final String TBL_USER_SELECTED_MODULE = "user_selected_module";

    public Statement moduleStatementAdd(Statement stmt ,long orgId,int[] result,int modalId)throws Exception{
        String del = "delete from " + TBL_USER_SELECTED_MODULE + " where org_id = " + orgId +" and modal_id = " + modalId;
        System.out.println(del);
        stmt.addBatch(del);
        for(int i=0;i<result.length;i++){
            String ins = "insert into " + TBL_USER_SELECTED_MODULE + "(module_id,org_id,modal_id) values(" + result[i] + ", " + orgId +", " + modalId +  ")" ;
            System.out.println(ins);
            stmt.addBatch(ins);
        }
        return stmt;

}




    public Statement policyGroupAddStatementAdd(
            Statement stmt,
            long ID,
            String nameeng,
            String namebng,
            int[] insertedMenu,
            int[] insertedApp


    ) throws SQLException {
        String insertPolicyGroups = "insert into " + AllTable.TBL_POLICY_GROUPS + "(id,name_eng,name_bng,status) VALUES" + "(" +ID + ",'" + nameeng + "','" + namebng + "',1)";
        System.out.println("!!" + insertPolicyGroups + "!!");
        stmt.addBatch(insertPolicyGroups);
        for(int i=0;i<insertedMenu.length;i++){
            String ins = "insert into " + AllTable.TBL_POLICY_GROUP_MENU  + "(policy_group_id,menu_id,menu_type) values (" + ID + "," + insertedMenu[i] + "," + 0 + ")";
            System.out.println("!! + " + ins + "!!! ");
            stmt.addBatch(ins);
        }
        for(int i=0;i<insertedApp.length;i++){
            String ins = "insert into " + AllTable.TBL_POLICY_GROUP_MENU  + "(policy_group_id,menu_id,menu_type) values (" + ID + "," + insertedApp[i] + "," + 1 + ")";
            System.out.println("!! + " + ins + "!!! ");
            stmt.addBatch(ins);
        }

        return stmt;

    }




}
