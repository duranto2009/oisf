package com.revesoft.springboot.web.geo.division;

import com.revesoft.springboot.web.util.GlobalDAO;
import com.revesoft.springboot.web.office.offices.OfficeDAO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.BatchStatementAdder;
import com.revesoft.springboot.web.util.Policy;
import databasemanager.DatabaseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;

import java.util.ArrayList;

/**
 * Created by Bony on 10/22/2017.
 */
@Repository
public class DivisionDAO {
//    private int id=-1;
    @Autowired
    BatchStatementAdder batchStatementAdder;

    @Autowired
    GlobalDAO globalDAO;
    @Autowired
    OfficeDAO officeDAO;

    private static final String DIV_ID_COlUMN = "geo_division_id";
    private static final String DIS_ID_COlUMN = "geo_district_id";

//    @Autowired
//    UpazillaService upazillaService;
//    @Autowired
//    UnionService unionService;
//    @Autowired
//    MunicipalityService municipalityService;





    private DivisionDTO dtoSetter(DivisionDTO divisionDTO, ResultSet rs) throws Exception{
        divisionDTO.setId(rs.getInt("id"));
        divisionDTO.setDivisionName(rs.getString("division_name_eng"));

        if(rs.getInt("status")==0) divisionDTO.setDivisionNameBng("সাবেক " +rs.getString("division_name_bng"));
        else divisionDTO.setDivisionNameBng(rs.getString("division_name_bng"));

        divisionDTO.setBbsCode(rs.getString("bbs_code"));
        divisionDTO.setStatus(rs.getInt("status"));
        return divisionDTO;
    }


    public ArrayList<DivisionDTO> getAll() throws Exception{
        ArrayList<DivisionDTO> data=new ArrayList<>();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from " + AllTable.TBL_GEO_DIVISION+ " WHERE status=1";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DivisionDTO divisionDTO =new DivisionDTO();
                divisionDTO=dtoSetter(divisionDTO,rs);


                data.add(divisionDTO);

            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }
        return data;

    }
    public DivisionDTO get(int id) throws Exception{
        DivisionDTO divisionDTO=new DivisionDTO();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from " +AllTable.TBL_GEO_DIVISION+  " where id=?";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while(rs.next()){
                divisionDTO=dtoSetter(divisionDTO,rs);

             }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }
        return divisionDTO;

    }
    public long idGen()throws Exception{
        Connection cn = null;
        Long ID=null;
        String sql=null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_DIVISION);
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            if(cn != null)cn.close();
        }
        return ID;

    }
    public int add(DivisionDTO  divisionDTO) throws Exception{
        int success=0;
        Connection cn = null;
        PreparedStatement ps = null;
        long ID=-1;
        String sql=null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "insert into geo_divisions(id,bbs_code,division_name_eng,division_name_bng,status,created_by,created)" +
                    " values (?,?,?,?,?,?,?)";
            ps=cn.prepareStatement(sql);
             ID = DatabaseManager.getInstance().getNextSequenceId("geo_divisions");
            int k=0;
            ps.setLong(++k,ID);
            ps.setString(++k,divisionDTO.getBbsCode());
            ps.setString(++k,divisionDTO.getDivisionName());
            ps.setString(++k,divisionDTO.getDivisionNameBng());
            ps.setInt(++k,divisionDTO.getStatus());
            ps.setInt(++k,divisionDTO.getCreatedBy());
            ps.setTimestamp(++k,divisionDTO.getCreated());
            ps.executeUpdate();
            success=1;



        }catch (Exception ex){
            ex.printStackTrace();
            success=0;
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }
        return success;
    }

//    public void historyForEdit ( String tableName,int)

    public boolean bbsupdate(DivisionDTO  divisionDTO,int userId) throws SQLException{
        boolean success;
        Connection cn = null;
        PreparedStatement ps = null;
        Statement history=null;
        Statement stmt=null;
        Statement check=null;
        // ResultSet rs = null;
        String sql=null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            //          String q1 =  ;
            cn.setAutoCommit(false);
            history=cn.createStatement();
            ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);
            stmt=cn.createStatement();
            check=cn.createStatement();

            String q1 = " insert into " +AllTable.TBL_GEO_HISTORY+   "(id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by,created,modified,expired_by )" +
                    "select " +ID+ ", id,division_name_eng,division_name_bng,bbs_code,status,created_by,modified_by,created,modified," +
                    userId+" from " +AllTable.TBL_GEO_DIVISION+   " d where d.id = " +divisionDTO.getId() ;
            history.addBatch(q1);

            String q20 = " insert into "  +AllTable.TBL_GEO_MAPPING+ "( geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                    " select "+ ID+ " ,m.id, "+ Policy.DIVISION_TYPE+ " , " + Policy.DIVISION_TYPE+ " from "+AllTable.TBL_GEO_DIVISION +
                    " m where m.id = " + divisionDTO.getId() ;
            history.addBatch(q20);







            sql = "UPDATE "  +AllTable.TBL_GEO_DIVISION+ " set bbs_code=?,division_name_eng=?,division_name_bng=?,modified_by=?,modified=? where id=?";
            ps=cn.prepareStatement(sql);
            int k=0;

            ps.setString(++k,divisionDTO.getBbsCode());
            ps.setString(++k,divisionDTO.getDivisionName());
            ps.setString(++k,divisionDTO.getDivisionNameBng());
            // ps.setInt(++k,1);
            ps.setInt(++k,divisionDTO.getModifiedBy());
            ps.setTimestamp(++k,divisionDTO.getModified());
            ps.setInt(++k,divisionDTO.getId());

            //rs.close();
            ps.executeUpdate();
            cn.commit();
            success=true;



        }catch (Exception ex){
            ex.printStackTrace();
            cn.rollback();
            success=false;
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }
        return success;
    }

    public int update(DivisionDTO  divisionDTO) throws SQLException{
        int success=0;
        Connection cn = null;
        PreparedStatement ps = null;
        Statement history=null;
        Statement check=null;
        String sql=null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();

            cn.setAutoCommit(false);
            history=cn.createStatement();
            check=cn.createStatement();
             ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);

            String q1 = " insert into " +AllTable.TBL_GEO_HISTORY+   " (id,source_id,name_eng,name_bng,bbs_code," +
                    "status,created_by,modified_by,created,modified,expired_by )" +
                    " select " +ID+ " , id,division_name_eng,division_name_bng,bbs_code,status,created_by," +
                    "modified_by,created,modified," +
                    divisionDTO.getModifiedBy()+" from " +AllTable.TBL_GEO_DIVISION+   " d where d.id = " +divisionDTO.getId() ;

           System.out.println(q1);
            history.addBatch(q1);


            String q20 = " insert into "  +AllTable.TBL_GEO_MAPPING+ "( geo_history_id,geo_current_id," +
                    "geo_current_type,geo_source_type)" +
                    " select "+ ID+ " ,m.id, "+ Policy.DIVISION_TYPE+ " , " + Policy.DIVISION_TYPE+
                    " from "+AllTable.TBL_GEO_DIVISION +
                    " m where m.id = " + divisionDTO.getId() ;
            System.out.println(q20);
            history.addBatch(q20);
            history.executeBatch();

            sql = "UPDATE  geo_divisions set bbs_code=?,division_name_eng=?,division_name_bng=?," +
                    "modified_by=?,modified=? where id=?";
            ps=cn.prepareStatement(sql);
            int k=0;

            ps.setString(++k,divisionDTO.getBbsCode());
            ps.setString(++k,divisionDTO.getDivisionName());
            ps.setString(++k,divisionDTO.getDivisionNameBng());
            ps.setInt(++k,divisionDTO.getModifiedBy());
            ps.setTimestamp(++k,divisionDTO.getModified());
            ps.setInt(++k,divisionDTO.getId());

            System.out.println(ps.toString());
            ps.executeUpdate();
            cn.commit();
            success=1;



        }catch (Exception ex){
            ex.printStackTrace();
            success=0;
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }
        return success;
    }
    public int delete(DivisionDTO  divisionDTO) throws Exception{
        int success;
        Connection cn = null;
        Statement ps = null;
        String sql="";
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps=cn.createStatement();
            ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);

            String q1 = " insert into " +AllTable.TBL_GEO_HISTORY+
                    "(id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by,created,modified,expired_by )" +
                    "select " +ID+ " , id,division_name_eng,division_name_bng," +
                    "bbs_code,status,created_by,modified_by,created,modified," +
                    divisionDTO.getModifiedBy()+" from " +AllTable.TBL_GEO_DIVISION+   " d where d.id = " +divisionDTO.getId() ;

            System.out.println(q1);
            ps.addBatch(q1);

            String q20 = " insert into "  +AllTable.TBL_GEO_MAPPING+ "( geo_history_id,geo_current_id," +
                    "geo_current_type,geo_source_type)" +
                    " select "+ ID+ " ,m.id, "+ Policy.DIVISION_TYPE+ " , " + Policy.DIVISION_TYPE+ "" +
                    " from "+AllTable.TBL_GEO_DIVISION +
                    " m where m.id = " + divisionDTO.getId() ;
            System.out.println(q20);
            ps.addBatch(q20);


            sql = "UPDATE  geo_divisions set status=0 , modified_by=  " +divisionDTO.getModifiedBy()+ " ,modified= '"
                    +divisionDTO.getModified()+ "' where id= " +divisionDTO.getId();

            ps.addBatch(sql);

            System.out.println(sql);

            //rs.close();
            ps.executeBatch();
            cn.commit();
            success=1;



        }catch (Exception ex){
            cn.rollback();
            ex.printStackTrace();
            success=0;
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }
        return success;
    }


    public void changeTotalGeo
            (int targetDivId,int userId,ArrayList<Integer>disId,ArrayList<Integer> sourceDivIds ,
             int sourceType,int destType) throws Exception{


        Connection cn = null;
        //PreparedStatement ps = null;

        Statement stmt=null;
        String parentName="geo_division_id";

        try{
            cn = DatabaseManager.getInstance().getConnection();
            stmt=cn.createStatement();
            cn.setAutoCommit(false);

            //for (int divid:sourceDivIds) {
                stmt=batchStatementAdder.disStatementAdd(stmt,parentName,targetDivId,userId,disId);

           // }

            stmt.executeBatch();

            ArrayList<Integer>noChild=globalDAO.checkChildCount
                    (cn,sourceDivIds,AllTable.TBL_GEO_DISTRICT,DIV_ID_COlUMN);
            globalDAO.updateStatus(cn,noChild,AllTable.TBL_GEO_DIVISION);


            for (int districtId:disId
                 ) {
                officeDAO.updateOfficeGeo(cn,DIV_ID_COlUMN,targetDivId,DIS_ID_COlUMN,districtId);

            }

            cn.commit();


        }catch (Exception e){
            cn.rollback();
            e.printStackTrace();
        }finally {
            if(stmt != null)stmt.close();
            if(cn != null)cn.close();
        }

    }

    public void  update_db() throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        try {
            cn = DatabaseManager.getInstance().getConnection();

            DatabaseMetaData dbmd = cn.getMetaData();
            String[] types = {"TABLE"};
            rs = dbmd.getTables(null, null, "%", types);
            System.out.println("---------------------------------------------start---------------------------------------------------------------------------");
            while (rs.next()) {
                String table_name = rs.getString("TABLE_NAME");
                System.out.println(table_name);
                System.out.println("---------------------------------------------start---------------------------------------------------------------------------");

                ResultSet resultSet = dbmd.getColumns(null, null,table_name, null);
                while (resultSet.next()) {
                    String col_name = resultSet.getString("COLUMN_NAME");

                    if(col_name.equals("modified"))
                    {
                        String sql = " UPDATE " + table_name + " SEt modified=now(), created=now(), created_by=0, modified_by=0";

                        System.out.println(sql);

                        cn.setAutoCommit(false);
                        ps = cn.prepareStatement(sql);

                        ps.executeUpdate();
                        cn.commit();
                        System.out.println("---------------------------------------------update done---------------------------------------------------------------------------");
                    }

//                    String type = resultSet.getString("TYPE_NAME");
//                    int size = resultSet.getInt("COLUMN_SIZE");
//
//                    System.out.println("Column name: [" + name + "]; type: [" + type + "]; size: [" + size + "]");
                }

                System.out.println();
                System.out.println();

            }

            System.out.println("---------------------------------------------end---------------------------------------------------------------------------");


        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

    }

}
