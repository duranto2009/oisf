package com.revesoft.springboot.web.geo.policy;

import com.revesoft.springboot.web.geo.division.DivisionDTO;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by Bony on 11/21/2017.
 */
@Repository
public class GeoPolicyDAO {

    public ArrayList<GeoPolicyDTO> get() throws Exception{
        ArrayList<GeoPolicyDTO>data=new ArrayList<>();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from geo_policy ";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                GeoPolicyDTO geoPolicyDTO=new GeoPolicyDTO();
                geoPolicyDTO.setId(rs.getInt("type_id"));
                geoPolicyDTO.setTypeNameEng(rs.getString("type_name_eng"));
                geoPolicyDTO.setTypeNameBng(rs.getString("type_name_bng"));
                data.add(geoPolicyDTO);


            }
            rs.close();
            ps.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        connection.close();
        return data;

    }
}
