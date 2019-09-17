package com.revesoft.springboot.web.appregistration;

import com.revesoft.springboot.web.menumanagement.MenuDTO;
import com.revesoft.springboot.web.util.Policy;
import org.jose4j.json.internal.json_simple.JSONArray;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import org.jose4j.json.internal.json_simple.JSONObject;




/**
 * Created by Bony on 9/21/2017.
 */
@Service
public class ApplicationService {

    @Autowired
    ApplicationDAO applicationDAO;



    //-------start--Bishwajit Code-----------------------------------------------------------------------------------------------------------------------------------------



    //-------end--Bishwajit Code-----------------------------------------------------------------------------------------------------------------------------------------


    //region app crud service
    public boolean addApplicationService(ApplicationDTO applicationDTO, Long userID) {
        boolean status = false;
        try {
            applicationDAO.addApplication(applicationDTO, userID);
                //sendSecret(applicationDTO.getAppDomainEmail(), applicationDTO.getApplicationSecret());
                status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public void updateApplicationService(ApplicationDTO applicationDTO) {
        try {
            applicationDAO.updateApplication(applicationDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void approveApplicationService(int id, String key,String clientId, int userId) {
        try {
            applicationDAO.approveApplication(id, key,clientId, userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void declineApplicationService(Long id) {
        try {
            applicationDAO.declineApplication(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteApplicationService(Integer id) {
        boolean flag =false;
        try {
            flag = applicationDAO.deleteApplication(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }


    public ArrayList<ApplicationDTO> getAppData() {
        ArrayList<ApplicationDTO> data = new ArrayList<>();
        try {
            data = applicationDAO.getAppData();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ApplicationDTO getSingleMenuService(Integer appid) {
        ApplicationDTO data = new ApplicationDTO();
        try {
            data = applicationDAO.getSingleMenu(appid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public ArrayList<ApplicationDTO> getApprovalMenuService() {
        ArrayList<ApplicationDTO> data = new ArrayList<>();
        try {
            data = applicationDAO.getApproveMenu();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }


    //endregion

    //region module crud service
    public void addMopduleService(ApplicationModuleDTO applicationModuleDTO) {
        boolean status = false;
        try {
            applicationDAO.addModule(applicationModuleDTO);



        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void editMopduleService(ApplicationModuleDTO applicationModuleDTO) {
        boolean status = false;
        try {
            applicationDAO.editModule(applicationModuleDTO);



        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteModuleService(Integer id) {
        boolean flag =false;
        try {
            flag = applicationDAO.deleteModule(id);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return flag;
    }

    public ArrayList<ApplicationModuleDTO> getModuleData(int id) {
        ArrayList<ApplicationModuleDTO> data = new ArrayList<>();
        try {
            data = applicationDAO.getModuleData(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }


    //endregion

    private void sendSecret(String email, String secret) {

    }




    public long idGenaretor(){
        long id=-1;
        try {
            id=applicationDAO.idGen();
        }catch (Exception e){
            e.printStackTrace();
        }
        return id;
    }


    //region service oparations

    public ArrayList<JSONObject> getOwnerListbyApp(int appId,int type) throws Exception{
        ArrayList<JSONObject> jsondata = new ArrayList<>();
        ArrayList<ServiceDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getOwnerListbyApp(appId,type);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceDTO m: data
                ) {
            JSONObject  js = new JSONObject();
            js.put("id","owner_"+m.getId());
            js.put("text",m.getNameEng());
            js.put("bng",m.getNameBng());
            js.put("description",m.getDescription());
            js.put("logo",m.getLogoUrl());
            js.put("assigned",0);
            js.put("children",getServicesListforApp(m.getId()));
            jsondata.add(js);
        }
        JSONObject  js = new JSONObject();
        js.put("text","<a  title='নতুন সার্ভিস রুট যুক্ত করুন' class='red equ'><i class='icon icon-plus'></i></a>");
        jsondata.add(js);
        return jsondata;
    }
    public ArrayList<JSONObject> getServicesListforApp(int parentId) throws Exception{
        ArrayList<JSONObject> jsdata = new ArrayList<>();
        ArrayList<ServiceDetailsDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getServiceList(parentId);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceDetailsDTO m:data
                ) {
            JSONObject  js = new JSONObject();
            js.put("id","service_"+m.getId());
            js.put("text",m.getNameEng()
//                    +"<a  title=\'এই শাখাটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\' + data.node.id.split(\"_\")[1]+\')><i class=\'fa fa fa-minus-circle\'></i></a>"
            );
            js.put("bng",m.getNameBng());
            js.put("description",m.getDescription());
            js.put("parent_id",m.getServiceOwnerId());
            js.put("output_type",m.getOutputType());
            js.put("metadata",m.getMetaDataRef());
            js.put("data_standard",m.getDataStanRef());
            js.put("int_standard",m.getIntStanRef());
            js.put("owner_sub",m.getOwnerSubSystem());
            js.put("invoking",m.getInvokingUri());
            js.put("request",m.getRequestUri());
            js.put("sample_req",m.getExampleRequest());
            js.put("sample_response",m.getExampleResponse());
            js.put("assigned",0);
            js.put("children",getServiceFieldsListByService(m.getId()));
            jsdata.add(js);

        }
        JSONObject  js = new JSONObject();
        js.put("text","<a  title='নতুন সার্ভিস যুক্ত করুন' class='red equ'><i class='icon icon-plus'></i></a>");
        jsdata.add(js);

        return jsdata;
    }
    public ArrayList<JSONObject> getOwnerList(int type) throws Exception{
        ArrayList<JSONObject> jsondata = new ArrayList<>();
        ArrayList<JSONObject> jsondata2 = new ArrayList<>();
        ArrayList<ServiceDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getOwnerList(type);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceDTO m: data
                ) {
            JSONObject  js = new JSONObject();
            js.put("id","owner_"+m.getId());
            js.put("text",m.getNameEng());
            js.put("assigned",0);
            js.put("children",getServicesList(m.getId()));
            jsondata.add(js);
        }

        JSONObject js2=new JSONObject();
        js2.put("id","root");
        js2.put("text","");
        js2.put("children",jsondata);
        jsondata2.add(js2);

        return jsondata2;
    }
    public ArrayList<JSONObject> getOwnerListForProvide(int type) throws Exception{
        ArrayList<JSONObject> jsondata = new ArrayList<>();
        ArrayList<JSONObject> jsondata2 = new ArrayList<>();
        ArrayList<ServiceDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getOwnerList(type);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceDTO m: data
                ) {
            JSONObject  js = new JSONObject();
            js.put("id","owner_"+m.getId());
            js.put("text",m.getNameEng());
            js.put("assigned",0);
            jsondata.add(js);
        }

        JSONObject js2=new JSONObject();
        js2.put("id","root");
        js2.put("text","");
        js2.put("children",jsondata);
        jsondata2.add(js2);

        return jsondata2;
    }
    public ArrayList<JSONObject> getServicesList(int parentId) throws Exception{
        ArrayList<JSONObject> jsdata = new ArrayList<>();
        ArrayList<ServiceDetailsDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getServiceList(parentId);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceDetailsDTO m:data
             ) {
            JSONObject  js = new JSONObject();
            js.put("id","service_"+m.getId());
            js.put("text",m.getNameEng());
            js.put("assigned",0);
            jsdata.add(js);

        }


        return jsdata;
    }

    public ArrayList<JSONObject> getServiceFieldsListByService(Integer serviceId) throws Exception {
        ArrayList<JSONObject> jsdata = new ArrayList<>();
        ArrayList<ServiceFieldsDTO> data = new ArrayList<>();
        try {
            data=applicationDAO.getServiceFieldsListByService(serviceId);

        }catch (Exception e){
            e.printStackTrace();
        }
        for (ServiceFieldsDTO m:data
                ) {
            JSONObject  js = new JSONObject();
            js.put("id","field_"+m.getId());
            js.put("text",m.getNameEng()
//                    +"<a  title=\'এই শাখাটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\' + data.node.id.split(\"_\")[1]+\')><i class=\'fa fa fa-minus-circle\'></i></a>"
            );
            js.put("bng",m.getNameBng());
            js.put("description",m.getDescription());
            js.put("parent_id",m.getServiceId());

            js.put("field_type",m.getFieldType());
            js.put("type",m.getType());
            js.put("is_mandatory",m.getIsMandatory());
            jsdata.add(js);

        }
        JSONObject  js = new JSONObject();
        js.put("text","<a  title='নতুন সার্ভিস  যুক্ত করুন' class='red equ'><i class='icon icon-plus'></i></a>");
        jsdata.add(js);

        return jsdata;
    }

    public void updateOwner(ServiceDTO serviceDTO )throws Exception{
        boolean success=false;
        try{
            applicationDAO.updateOwner(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void insertOwner(ServiceDTO serviceDTO )throws Exception{
        try{
            applicationDAO.insertOwner(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void delete(int id,String tableName )throws Exception{
        try{
            applicationDAO.delete(id,tableName);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateService(ServiceDetailsDTO serviceDTO )throws Exception{
        try{
            applicationDAO.updateService(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void addService(ServiceDetailsDTO serviceDTO )throws Exception{
        try{
            applicationDAO.addService(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void updateFiledsService(ServiceFieldsDTO serviceDTO) {
        try{
            applicationDAO.updateServiceFileds(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void addFiledsService(ServiceFieldsDTO serviceDTO) {
        try{
            applicationDAO.addServiceFileds(serviceDTO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //endregion

    //region approval and permission edit process

    public ArrayList<Integer> getSelectedService(int appid,int serviceType) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();

        try {
            data=applicationDAO.getSelectedService(appid,serviceType);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;

    }
    public ArrayList<Integer> getSelectedOrigins(int appid,int hasExceptions) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();
        try {
            data=applicationDAO.getSelectedOrigins(appid,hasExceptions);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;

    }
    public ArrayList<Integer> getSelectedOrgan(int originId) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();
        try {
            data=applicationDAO.getSelectedOrganograms(originId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;

    }
    public JSONObject getSelecteForApp(int appID) throws Exception{
        ArrayList<JSONObject> jsdata = new ArrayList<>();
        ArrayList<JSONObject> originjsdata = new ArrayList<>();
        ArrayList<Integer> core = new ArrayList<>();
        ArrayList<Integer> shared = new ArrayList<>();
        ArrayList<Integer> origin = new ArrayList<>();
        ArrayList<Integer> execptionorigin = new ArrayList<>();
        try {
            core=getSelectedService(appID, Policy.CORE_SERVICE_TYPE);
            shared=getSelectedService(appID, Policy.SHARED_SERVICE_TYPE);
            origin=getSelectedOrigins(appID,0);
            execptionorigin=getSelectedOrigins(appID,1);

        }catch (Exception e){
            e.printStackTrace();
        }

        for( int i:origin){
            JSONObject jsonObject=applicationDAO.getSelectedOriginsDetails(i);
            originjsdata.add(jsonObject);
        }


        for (int i:execptionorigin
                ) {
            JSONObject exception=new JSONObject();
            JSONObject exceptiondetails=applicationDAO.getSelectedOriginsDetails(i);
            exception.put("origins",exceptiondetails);
            exception.put("organograms",getSelectedOrgan(i));
            jsdata.add(exception);

        }
//        for (int i=0;i<4;i++) {
        JSONObject  js = new JSONObject();
        js.put("coreservices",core);
        js.put("sharedservices",shared);
        js.put("originorganograms",originjsdata);
        js.put("originorganogramswithexception",jsdata);
//            jsdata.add(js);

//        }

        return js;
    }


    public boolean appMapperWithOriginOgranogram(int [] originOrgId, int applicationId) throws Exception {
        boolean success=false;
        try {
            success=applicationDAO.appMapperWithOriginOgranogram(originOrgId,applicationId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }
    public boolean appMapperWithExceptionOriginOgranogram(ArrayList<HashMap> organograms, int applicationId) throws Exception {

        boolean success=false;
        try {
            success=applicationDAO.appMapperWithExceptionOriginOgranogram(organograms,applicationId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return success;

    }

    public boolean systemMapperWithService(int[] coreServiceId, int[] sharedServiceId,int systemId) throws Exception {

        boolean success=false;
        try {
            success=applicationDAO.systemMapperWithService(coreServiceId,sharedServiceId,systemId);

        }catch (Exception e){
            e.printStackTrace();
        }

        return success;

    }
    public boolean providerSystemMapperWithService(int[] providerId,int systemId) throws Exception {

        boolean success=false;
        try {
            success=applicationDAO.ProviderSystemMapperWithService(providerId,systemId);

        }catch (Exception e){
            e.printStackTrace();
        }

        return success;

    }
    public boolean  deleteSystemMappingWithService(int[] coreServiceId, int[] sharedServiceId,int systemId) throws Exception {
        boolean success=false;
        try {
            success=applicationDAO.deleteSystemMappingWithService(coreServiceId,sharedServiceId,systemId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }
    public boolean deleteAppMappingWithOriginOgranogram(int[] originOrgId, int applicationId) throws Exception{
        boolean success=false;
        try {
            success=applicationDAO.deleteAppMappingWithOriginOgranogram(originOrgId,applicationId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }

    public boolean deleteappMappingWithExceptionOriginOgranogram(ArrayList<HashMap> organograms, int applicationId) throws Exception {
        boolean success=false;
        try {
            success=applicationDAO.deleteappMappingWithExceptionOriginOgranogram(organograms,applicationId);

        }catch (Exception e){
            e.printStackTrace();
        }

        return success;
    }
    public boolean appRemapping(int[] insertedcoreServiceId,int[] deletedcoreServiceId, int[] insertedsharedServiceId,
                                int[] deletedsharedServiceId,int systemId,int [] insertedoriginOrgId,int [] deletedoriginOrgId,
                                ArrayList<HashMap> insertedorganograms, ArrayList<HashMap> deletedorganograms)throws Exception {

        boolean success=false;
        boolean systemdelmap= deleteSystemMappingWithService(deletedcoreServiceId,deletedsharedServiceId,systemId);
        if (systemdelmap) {
            boolean systemintmap= systemMapperWithService(insertedcoreServiceId,insertedsharedServiceId,systemId);
            if(systemintmap) {


                boolean delappmap = deleteAppMappingWithOriginOgranogram(deletedoriginOrgId, systemId);
                if (delappmap) {
                    boolean insertappmap = appMapperWithOriginOgranogram(insertedoriginOrgId, systemId);
                    if (insertappmap) {
                        boolean delexppmap = deleteappMappingWithExceptionOriginOgranogram(deletedorganograms,systemId);
                        if(delexppmap){
                            boolean insexpmap=appMapperWithExceptionOriginOgranogram(insertedorganograms,systemId);
                            if(insexpmap){
                                success=true;
                            }else {
                                success=false;
                            }


                        }else{
                            success=false;
                        }

                    } else {
                        success = false;

                    }
                }else {
                    success = false;

                }
            }else{
                success=false;

            }

        } else {
            success=false;

        }
        return success;
    }

    public boolean appMapping(int[] coreServiceId, int[]providercoreservice,int[] sharedServiceId,int systemId,int [] originOrgId,ArrayList<HashMap> organograms)throws Exception {
        boolean systemmap= systemMapperWithService(coreServiceId,sharedServiceId,systemId);
        boolean providermap=providerSystemMapperWithService(providercoreservice,systemId);
        boolean success=false;
        if (systemmap&&providermap) {
            boolean appmap = appMapperWithOriginOgranogram(originOrgId, systemId);
            if (appmap) {
                boolean exceptionmap = appMapperWithExceptionOriginOgranogram(organograms, systemId);
                if (exceptionmap) {
                    success=true;

                } else {
                    success=false;

                }
            } else {
                success=false;

            }

        } else {
            success=false;

        }
        return success;
    }


    public void appRoleMapper(int designationId,int[]deleted,int[] inserted) {

        try{
            applicationDAO.appRoleMapper(designationId,deleted,inserted);

        }catch (Exception e){
            e.printStackTrace();
        }

    }
    public void appRoleMapperForPolicyGroup(int policygroupid,int[]deleted,int[] inserted) {

        try{
            applicationDAO.appRoleMapperForPolicyGroup(policygroupid,deleted,inserted);

        }catch (Exception e){
            e.printStackTrace();
        }

    }
    //endregion

    public int[] convertJsonArraytoIntegerArray(JSONArray array){
        if (array == null) {return new int[0];}

        int[] numbers = new int[array.size()];

        for (int i = 0; i < array.size(); ++i) {
            Long num =(Long) array.get(i);
            Integer it = num.intValue();
            numbers[i] = it;
        }
        return numbers;
    }

    public String[] convertJsonArraytoStringArray(JSONArray array) {
        if (array == null) {return new String[0];}

        String[] numbers = new String[array.size()];

        for (int i = 0; i < array.size(); ++i) {
            String num =(String) array.get(i);
            numbers[i] = num;
        }
        return numbers;
    }






    public int isPublished(int id) {
        int ispublished=-1;
        try{
           ispublished=applicationDAO.isPublished(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ispublished;
    }

    public boolean publishApplication(int id,  int publish) throws Exception {
        boolean success=false;
        try{
            success=applicationDAO.publishApplication(id,publish);
        }catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }



}
