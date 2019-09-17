package com.revesoft.springboot.web.geo.history;

import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDAO;
import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDTO;
import com.revesoft.springboot.web.geo.citycorporationward.CityCorporationWardDAO;
import com.revesoft.springboot.web.geo.citycorporationward.CityCorporationWardDTO;
import com.revesoft.springboot.web.geo.district.DistrictDAO;
import com.revesoft.springboot.web.geo.district.DistrictDTO;
import com.revesoft.springboot.web.geo.division.DivisionDAO;
import com.revesoft.springboot.web.geo.division.DivisionDTO;
import com.revesoft.springboot.web.geo.municipality.MunicipalityDAO;
import com.revesoft.springboot.web.geo.municipality.MunicipalityDTO;
import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDAO;
import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDTO;
import com.revesoft.springboot.web.geo.postoffice.PostOfficeDAO;
import com.revesoft.springboot.web.geo.postoffice.PostOfficeDTO;
import com.revesoft.springboot.web.geo.thana.ThanaDAO;
import com.revesoft.springboot.web.geo.thana.ThanaDTO;
import com.revesoft.springboot.web.geo.union.UnionDAO;
import com.revesoft.springboot.web.geo.union.UnionDTO;
import com.revesoft.springboot.web.geo.upazilla.UpazillaDAO;
import com.revesoft.springboot.web.geo.upazilla.UpazillaDTO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.DateFormatter;
import com.revesoft.springboot.web.util.Policy;
//
// import databasemanager.DatabaseManager;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Bony on 11/22/2017.
 */
@Repository
public class HistoryDAO {


    public HashMap<String, ArrayList<HistoryDTO>> currentDetails(int Id, int type) throws Exception {
        HashMap<Integer, String> list = new HashMap<Integer, String>();

        Connection cn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "select type_id from geo_policy where parent_id" + type;
        ArrayList<Integer> childtype = new ArrayList<>();

        HashMap<String, ArrayList<HistoryDTO>> allMap = new HashMap<>();
        try {
            cn = DatabaseManager.getInstance().getConnection();
            statement = cn.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                childtype.add(rs.getInt("type_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (int eachchild : childtype) {

            if (eachchild == 2) {
                ArrayList<DistrictDTO> data = new DistrictDAO().get(Id);
                ArrayList<HistoryDTO> history = new ArrayList<>();

                for (DistrictDTO districtDTO : data) {
                    HistoryDTO geoHistoryDTO = new HistoryDTO();
                    geoHistoryDTO.setNameBng(districtDTO.getDistrictNameBng());
                    geoHistoryDTO.setNameEng(districtDTO.getDistrictNameEng());
                    geoHistoryDTO.setSourcType(eachchild);

                    history.add(geoHistoryDTO);

                }
                allMap.put("district", history);
            }

        }
        return allMap;


    }

    public GenericDTO currentChain(int Id, int type) throws Exception {
        GenericDTO genericDTO = new GenericDTO();

        Connection cn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;


        if (type == Policy.DIVISION_TYPE) {
            DivisionDTO divisionDTO = new DivisionDAO().get(Id);
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());
        } else if (type == Policy.DISTRICT_TYPE) {

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(Id);
            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else if (type == Policy.UPAZILA_TYPE) {
            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(Id);

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else if (type == Policy.CITY_TYPE) {

            CityCorporationDTO cityCorporationDTO = new CityCorporationDAO().getCity(Id);

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(cityCorporationDTO.getDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else if (type == Policy.THANA_TYPE) {

            ThanaDTO thanaDTO = new ThanaDAO().getOneThana(Id);

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(thanaDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else if (type == Policy.UNION_TYPE) {

            UnionDTO unionDTO = new UnionDAO().getOneUnion(Id);

            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(unionDTO.getGeoUpazilaId());
            genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
            genericDTO.setUpazilaId(upazillaDTO.getId());

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());


        } else if (type == Policy.MUNICIPALITY_TYPE) {

            MunicipalityDTO municipalityDTO = new MunicipalityDAO().getOneMunicipality(Id);
            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(municipalityDTO.getGeoUpazilaId());
            genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
            genericDTO.setUpazilaId(upazillaDTO.getId());

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else if (type == Policy.POST_OFFICE_TYPE) {

            PostOfficeDTO postOfficeDTO = new PostOfficeDAO().getOnePostOffice(Id);

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(postOfficeDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());


        } else if (type == Policy.CITY_WARD_TYPE) {

            CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDAO().getOneById(Id);
            CityCorporationDTO cityCorporationDTO = new CityCorporationDAO().getCity(cityCorporationWardDTO.getCityCorporationId());
            genericDTO.setCityCorporationName(cityCorporationDTO.getNameBng());
            genericDTO.setCityCorporationId(cityCorporationDTO.getId());

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(cityCorporationDTO.getDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());


        } else if (type == Policy.MUNI_WARD_TYPE) {

            MunicipalityWardDTO municipalityWardDTO = new MunicipalityWardDAO().getOneMunicipalityWard(Id);


            MunicipalityDTO municipalityDTO = new MunicipalityDAO().getOneMunicipality(municipalityWardDTO.getGeoMunicipalityId());
            genericDTO.setMunicipalityName(municipalityDTO.getMunicipalityNameBng());
            genericDTO.setMunicipalityId(municipalityDTO.getId());
            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(municipalityDTO.getGeoUpazilaId());
            genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
            genericDTO.setUpazilaId(upazillaDTO.getId());

            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
            genericDTO.setDistrictId(districtDTO.getId());

            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
            genericDTO.setDivisionId(divisionDTO.getId());

        } else {

        }
        return genericDTO;


    }

    public GenericDTO dtoSetter(DivisionDTO divisionDTO, DistrictDTO districtDTO) {
        GenericDTO genericDTO = new GenericDTO();
        genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
        genericDTO.setDivisionId(divisionDTO.getId());
        genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());

        genericDTO.setDivisionStatus(divisionDTO.getStatus()); //newly added


        genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
        genericDTO.setDistrictId(districtDTO.getId());
        genericDTO.setDistrictBbsCode(districtDTO.getBbsCode());

        genericDTO.setDistrictStatus(districtDTO.getStatus());  //newly added

        return genericDTO;
    }

    public ArrayList<GenericDTO> allPreviousHistory(int Id, int type) throws Exception {


        Connection cn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<GenericDTO> data = new ArrayList<>();


        try {
            cn = DatabaseManager.getInstance().getConnection();

            if (type == Policy.DIVISION_TYPE) {

                String sql = "SELECT  h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ?   ORDER BY  expired  DESC ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {
                    GenericDTO genericDTO = new GenericDTO();
                    genericDTO.setDivisionName(rs.getString("name_eng"));
                    genericDTO.setDivisionNameEng(rs.getString("name_bng"));
                    genericDTO.setDivisionBbsCode(rs.getString("bbs_code"));

                }

            }

            if (type == Policy.DISTRICT_TYPE || type == Policy.CITY_TYPE) {
                String sql = "SELECT h.parent_id , h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ?   ORDER BY  expired  DESC ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {
                    DivisionDTO divisionDTO = new DivisionDAO().get(rs.getInt("parent_id"));
                    GenericDTO genericDTO = new GenericDTO();
                    genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                    genericDTO.setDivisionId(divisionDTO.getId());
                    genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                    genericDTO.setDivisionStatus(divisionDTO.getStatus());
                    if (type == 2) {
                        genericDTO.setDistrictName(rs.getString("name_bng"));
                        genericDTO.setDistrictNameEng(rs.getString("name_eng"));
                        genericDTO.setDistrictBbsCode(rs.getString("bbs_code"));

                    } else {

                        genericDTO.setCityCorporationName(rs.getString("name_bng"));
                        genericDTO.setCityCorporationNameEng(rs.getString("name_eng"));
                        genericDTO.setCityCorporationBbsCode(rs.getString("bbs_code"));

                    }

                    String formDate = rs.getString("modified");
                    genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                    String toDate = rs.getString("expired");
                    genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                    genericDTO.setTypeName("Division");
                    data.add(genericDTO);

                }

            } else if (type == Policy.UPAZILA_TYPE || type == Policy.THANA_TYPE || type == Policy.POST_OFFICE_TYPE) {
                String sql = "SELECT h.parent_id, h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h " +
                        "INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ?  ORDER BY   expired  DESC ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {


                    DistrictDTO districtDTO = new DistrictDAO().getDistrict(rs.getInt("parent_id"));
                    DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());

                    GenericDTO genericDTO = dtoSetter(divisionDTO, districtDTO);

                    if (type == 3) {
                        genericDTO.setUpazilaName(rs.getString("name_bng"));
                        genericDTO.setUpazilaNameEng(rs.getString("name_eng"));
                        genericDTO.setUpazilaBbsCode(rs.getString("bbs_code"));
                    } else if (type == 5) {
                        genericDTO.setThanaName(rs.getString("name_bng"));
                        genericDTO.setThanaNameEng(rs.getString("name_eng"));
                        genericDTO.setThanaBbsCode(rs.getString("bbs_code"));
                    } else {


                    }

                    String formDate = rs.getString("modified");
                    genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                    String toDate = rs.getString("expired");
                    genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                    genericDTO.setTypeName("District");
                    data.add(genericDTO);

                }

            } else if (type == Policy.UNION_TYPE || type == Policy.MUNICIPALITY_TYPE) {
                String sql = "SELECT h.parent_id , h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h " +
                        "INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ?   ORDER BY  expired  DESC  ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {
                    UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(rs.getInt("parent_id"));
                    DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
                    DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());

                    GenericDTO genericDTO = dtoSetter(divisionDTO, districtDTO);

                    genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
                    genericDTO.setUpazilaId(upazillaDTO.getId());
                    genericDTO.setUpazilaBbsCode(upazillaDTO.getBbsCode());

                    if (type == Policy.UNION_TYPE) {

                        genericDTO.setUnionName(rs.getString("name_bng"));
                        genericDTO.setUnionNameEng(rs.getString("name_eng"));
                        genericDTO.setUnionBbsCode(rs.getString("bbs_code"));

                    } else if (type == Policy.MUNICIPALITY_TYPE) {
                        genericDTO.setMunicipalityName(rs.getString("name_bng"));
                        genericDTO.setMunicipalityNameEng(rs.getString("name_eng"));
                        genericDTO.setMunicipalityBbsCode(rs.getString("bbs_code"));
                    }
                    String formDate = rs.getString("modified");
                    genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                    String toDate = rs.getString("expired");
                    genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                    genericDTO.setTypeName("Upazila");
                    data.add(genericDTO);

                }

            } else if (type == Policy.CITY_WARD_TYPE) {
                String sql = "SELECT h.parent_id, h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ?  ORDER BY  expired  DESC ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {
                    CityCorporationDTO cityCorporationDTO = new CityCorporationDAO().getCity(rs.getInt("parent_id"));
                    DistrictDTO districtDTO = new DistrictDAO().getDistrict(cityCorporationDTO.getDistrictId());
                    DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
                    GenericDTO genericDTO = dtoSetter(divisionDTO, districtDTO);

                    genericDTO.setCityCorporationName(cityCorporationDTO.getNameBng());
                    genericDTO.setCityCorporationId(cityCorporationDTO.getId());
                    genericDTO.setCityCorporationBbsCode(cityCorporationDTO.getBbsCode());

                    genericDTO.setCityCorporationWardName(rs.getString("name_bng"));
                    genericDTO.setCityCorporationWardNameEng(rs.getString("name_eng"));
                    genericDTO.setCityCorporationWardBbsCode(rs.getString("bbs_code"));

                    String formDate = rs.getString("modified");
                    genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                    String toDate = rs.getString("expired");
                    genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                    genericDTO.setTypeName("City");
                    data.add(genericDTO);

                }

            } else if (type == Policy.MUNI_WARD_TYPE) {
                String sql = "SELECT DISTINCT (h.parent_id), h.name_bng,h.name_eng, h.bbs_code ,h.modified,h.expired FROM geo_history h INNER JOIN geo_mappings m ON h.id=m.geo_history_id" +
                        "  WHERE  m.geo_current_id= ? GROUP BY h.parent_id   ORDER BY  expired  DESC ";
                statement = cn.prepareStatement(sql);

                statement.setInt(1, Id);
                rs = statement.executeQuery();
                while (rs.next()) {
                    MunicipalityDTO municipalityDTO = new MunicipalityDAO().getOneMunicipality(rs.getInt("parent_id"));
                    DistrictDTO districtDTO = new DistrictDAO().getDistrict(municipalityDTO.getGeoDistrictId());
                    DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
                    GenericDTO genericDTO = new GenericDTO();
                    genericDTO.setMunicipalityName(municipalityDTO.getMunicipalityNameBng());
                    genericDTO.setMunicipalityId(municipalityDTO.getId());
                    genericDTO.setMunicipalityBbsCode(municipalityDTO.getBbsCode());
                    String formDate = rs.getString("modified");
                    genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                    String toDate = rs.getString("expired");
                    genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                    genericDTO.setTypeName("Municipality");
                    data.add(genericDTO);

                }

            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return data;

    }


    public ArrayList<GenericDTO> childDetail(int Id, int type) throws Exception {


        Connection cn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<GenericDTO> data = new ArrayList<>();


        try {
            cn = DatabaseManager.getInstance().getConnection();

            if (type == Policy.CITY_TYPE) {


                String sql = "select h.id as id ,h.parent_id,source_id,name_eng,name_bng,h.bbs_code as bbs_code ,h.status  as status , " +
                        " m.geo_source_type as source_type, p.parent_id as parent_type from geo_history h " +
                        "inner join geo_mappings m on h.id=m.geo_history_id " +
                        "inner join geo_city_corporations c on c.id=m.geo_current_id" +
                        " inner join geo_policy p on p.type_id=m.geo_source_type" +
                        " where c.id= " + Id;

                statement = cn.prepareStatement(sql);
                rs = statement.executeQuery();
                while (rs.next()) {
                    GenericDTO genericDTO = new GenericDTO();
                    genericDTO.setCityCorporationId(Id);
                    genericDTO.setUpazilaId(rs.getInt("parent_id"));
                    if (rs.getInt("source_type") == Policy.UNION_TYPE) {
                        genericDTO.setUnionId(rs.getInt("source_id"));
                        genericDTO.setUnionName(rs.getString("name_bng"));
                        genericDTO.setUnionNameEng(rs.getString("name_eng"));
                        genericDTO.setUnionBbsCode(rs.getString("bbs_code"));
                        //genericDTO.setUnionStatus();
                    } else if (rs.getInt("source_type") == Policy.MUNICIPALITY_TYPE) {
                        genericDTO.setMunicipalityId(rs.getInt("source_id"));
                        genericDTO.setMunicipalityNameEng(rs.getString("name_eng"));
                        genericDTO.setMunicipalityName(rs.getString("name_bng"));
                        genericDTO.setMunicipalityBbsCode(rs.getString("bbs_code"));
                    }
                    genericDTO.setSourceType(rs.getInt("source_type"));
                    genericDTO.setParentType(rs.getInt("parent_type"));
                    data.add(genericDTO);
                }


            } else if (type == Policy.MUNICIPALITY_TYPE) {


                String sql = "select h.id as id ,h.parent_id,source_id,name_eng,name_bng,h.bbs_code as bbs_code ,h.status  as status , " +
                        " m.geo_source_type as source_type, p.parent_id as parent_type from " + AllTable.TBL_GEO_HISTORY + " h " +
                        " inner join " + AllTable.TBL_GEO_MAPPING + " m on h.id=m.geo_history_id " +
                        "inner join " + AllTable.TBL_GEO_MUNICIPALITY + " c on c.id=m.geo_current_id" +
                        " inner join " + AllTable.TBL_GEO_POLICY + " p on p.type_id=m.geo_source_type" +
                        " where c.id= " + Id;

                statement = cn.prepareStatement(sql);
                rs = statement.executeQuery();
                while (rs.next()) {
                    GenericDTO genericDTO = new GenericDTO();
                    genericDTO.setMunicipalityId(Id);
                    genericDTO.setUpazilaId(rs.getInt("parent_id"));
                    if (rs.getInt("source_type") == Policy.UNION_TYPE) {
                        genericDTO.setUnionId(rs.getInt("source_id"));
                        genericDTO.setUnionName(rs.getString("name_bng"));
                        genericDTO.setUnionNameEng(rs.getString("name_eng"));
                        genericDTO.setUnionBbsCode(rs.getString("bbs_code"));
                    }
                    genericDTO.setSourceType(rs.getInt("source_type"));
                    genericDTO.setParentType(rs.getInt("parent_type"));
                    data.add(genericDTO);
                }


            } else if (type == Policy.DIVISION_TYPE) {
                ArrayList<DistrictDTO> disList = new DistrictDAO().get(Id);
                ArrayList<Integer> parentList = new ArrayList<>();

                String disname = "";
                int sourceId = -1;

                for (DistrictDTO districtDTO : disList) {

                    String query = "SELECT h.source_id,h.parent_id,h.name_eng,h.name_bng,h.modified,h.expired FROM geo_history h " +
                            "INNER JOIN geo_mappings m ON m.geo_history_id=h.id " +
                            "INNER JOIN geo_districts d ON d.id=m.geo_current_id WHERE h.source_id= ? AND m.geo_source_type= " + Policy.DISTRICT_TYPE + " ORDER BY expired DESC LIMIT 1";
                    System.out.println(query);
                    statement = cn.prepareStatement(query);
                    statement.setInt(1, districtDTO.getId());
                    rs = statement.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("parent_id");
                        if (Id != id) {
                            parentList.add(rs.getInt("parent_id"));
                            DivisionDTO divisionDTO = new DivisionDAO().get(id);
                            GenericDTO genericDTO = new GenericDTO();
                            genericDTO.setDivisionId(divisionDTO.getId());
                            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                            genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                            //newly added
                            genericDTO.setDivisionStatus(divisionDTO.getStatus());
                            //
                            genericDTO.setDistrictId(rs.getInt("source_id"));
                            genericDTO.setDistrictName(rs.getString("name_bng"));
                            String formDate=rs.getString("modified");
                            genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                            String toDate=rs.getString("expired");
                            genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                            data.add(genericDTO);

                        } else
                            continue;
                    }
                }
//                for (int parent : parentList) {
//
//
//                }


            }
            //district history
            else if (type == Policy.DISTRICT_TYPE) {

                ArrayList<UpazillaDTO> upList = new UpazillaDAO().getUpazillaListbyDistrictId(Id);
                ArrayList<Integer> parentList = new ArrayList<>();

                String upaname = "";
                int sourceId = -1;

                for (UpazillaDTO upazillaDTO : upList) {

                    String query = " SELECT h.source_id,h.parent_id,h.name_eng,h.name_bng,h.modified,h.expired FROM geo_history h " +
                            "INNER JOIN geo_mappings m ON m.geo_history_id=h.id " +
                            "INNER JOIN geo_upazilas d ON d.id=m.geo_current_id WHERE h.source_id= ? AND m.geo_source_type=3  ORDER BY expired ASC LIMIT 1 ";
                    statement = cn.prepareStatement(query);
                    statement.setInt(1, upazillaDTO.getId());
                    rs = statement.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("parent_id");
                        if (Id != id) {
                            parentList.add(rs.getInt("parent_id"));
                            sourceId = rs.getInt("source_id");
                            DistrictDTO districtDTO = new DistrictDAO().getDistrict(id);
                            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
                            GenericDTO genericDTO = new GenericDTO();
                            genericDTO.setDivisionId(divisionDTO.getId());
                            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                            genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                            //newly added
                            genericDTO.setDivisionStatus(divisionDTO.getStatus());
                            //
                            genericDTO.setDistrictId(districtDTO.getId());
                            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
                            genericDTO.setDistrictBbsCode(districtDTO.getBbsCode());
                            //newly added
                            genericDTO.setDistrictStatus(districtDTO.getStatus());
                            //
                            genericDTO.setUpazilaId(sourceId);
                            genericDTO.setUpazilaName(rs.getString("name_bng"));
                            String formDate=rs.getString("modified");
                            genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                            String toDate=rs.getString("expired");
                            genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                            genericDTO.setTypeName("3");
                            data.add(genericDTO);

                        } else
                            continue;
                    }
                }

                ArrayList<ThanaDTO> thanaList = new ThanaDAO().getThanaListbyDistrictId(Id);
                ArrayList<Integer> parentLists = new ArrayList<>();
                String thname = "";

                for (ThanaDTO thanaDTO : thanaList) {

                    String query = "SELECT h.source_id,h.parent_id,h.name_eng,h.name_bng,h.modified,h.expired FROM geo_history h " +
                            "INNER JOIN geo_mappings m ON m.geo_history_id=h.id " +
                            "INNER JOIN geo_thanas d ON d.id=m.geo_current_id WHERE h.source_id= ? AND m.geo_source_type=5  ORDER BY expired ASC LIMIT 1";
                    statement = cn.prepareStatement(query);
                    statement.setInt(1, thanaDTO.getId());
                    rs = statement.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("parent_id");
                        if (Id != id) {
                            parentList.add(rs.getInt("parent_id"));
                            sourceId = rs.getInt("source_id");
                            DistrictDTO districtDTO = new DistrictDAO().getDistrict(id);
                            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());
                            GenericDTO genericDTO = new GenericDTO();
                            genericDTO.setDivisionId(divisionDTO.getId());
                            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                            genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                            //newly added
                            genericDTO.setDivisionStatus(divisionDTO.getStatus());
                            //
                            genericDTO.setDistrictId(districtDTO.getId());
                            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
                            genericDTO.setDistrictBbsCode(districtDTO.getBbsCode());
                            //newly added
                            genericDTO.setDistrictStatus(districtDTO.getStatus());
                            //
                            genericDTO.setThanaId(sourceId);
                            genericDTO.setThanaName(rs.getString("name_bng"));
                            String formDate=rs.getString("modified");
                            genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                            String toDate=rs.getString("expired");
                            genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                            genericDTO.setTypeName("5");
                            data.add(genericDTO);

                        } else
                            continue;
                    }
                }


            } else if (type == 3) {

                ArrayList<UnionDTO> uniList = new UnionDAO().getUnionListByUpazillaId(Id);
                ArrayList<Integer> parentList = new ArrayList<>();

                int sourceId = -1;

                for (UnionDTO unionDTO : uniList) {

                    String query = " SELECT h.source_id,h.parent_id,h.name_eng,h.name_bng,h.modified,h.expired FROM geo_history h " +
                            "INNER JOIN geo_mappings m ON m.geo_history_id=h.id " +
                            "INNER JOIN geo_unions d ON d.id=m.geo_current_id WHERE h.source_id= ? AND m.geo_source_type=6  ORDER BY expired ASC LIMIT 1";
                    statement = cn.prepareStatement(query);
                    statement.setInt(1, unionDTO.getId());
                    rs = statement.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("parent_id");
                        if (Id != id) {
                            parentList.add(rs.getInt("parent_id"));
                            sourceId = rs.getInt("source_id");
                            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(id);

                            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
                            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());

                            GenericDTO genericDTO = new GenericDTO();

                            genericDTO.setDivisionId(divisionDTO.getId());
                            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                            genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                            //newly added
                            genericDTO.setDivisionStatus(divisionDTO.getStatus());
                            //

                            genericDTO.setDistrictId(districtDTO.getId());
                            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
                            genericDTO.setDistrictBbsCode(districtDTO.getBbsCode());
                            //newly added
                            genericDTO.setDistrictStatus(districtDTO.getStatus());
                            //

                            genericDTO.setUpazilaId(upazillaDTO.getId());
                            genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
                            //newly added
                            genericDTO.setUpazilaStatus(upazillaDTO.getStatus());
                            //

                            genericDTO.setUnionId(rs.getInt("source_id"));
                            genericDTO.setUnionName(rs.getString("name_bng"));

                            String formDate=rs.getString("modified");
                            genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                            String toDate=rs.getString("expired");
                            genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                            genericDTO.setTypeName("6");
                            data.add(genericDTO);

                        } else
                            continue;
                    }
                }

                ArrayList<MunicipalityDTO> muniList = new MunicipalityDAO().getMunicipalityListbyUpazillaId(Id);
                ArrayList<Integer> parentLists = new ArrayList<>();
                String thname = "";

                for (MunicipalityDTO municipalityDTO : muniList) {

                    String query = "SELECT h.source_id,h.parent_id,h.name_eng,h.name_bng,h.modified,h.expired FROM geo_history h " +
                            "INNER JOIN geo_mappings m ON m.geo_history_id=h.id " +
                            "INNER JOIN geo_municipalities d ON d.id=m.geo_current_id WHERE h.source_id= ? AND m.geo_source_type=7  ORDER BY expired ASC LIMIT 1";
                    statement = cn.prepareStatement(query);
                    statement.setInt(1, municipalityDTO.getId());
                    rs = statement.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("parent_id");
                        if (Id != id) {
                            parentList.add(rs.getInt("parent_id"));
                            sourceId = rs.getInt("source_id");
                            UpazillaDTO upazillaDTO = new UpazillaDAO().getUpazillabyId(id);

                            DistrictDTO districtDTO = new DistrictDAO().getDistrict(upazillaDTO.getGeoDistrictId());
                            DivisionDTO divisionDTO = new DivisionDAO().get(districtDTO.getDivisionId());

                            GenericDTO genericDTO = new GenericDTO();

                            genericDTO.setDivisionId(divisionDTO.getId());
                            genericDTO.setDivisionName(divisionDTO.getDivisionNameBng());
                            genericDTO.setDivisionBbsCode(divisionDTO.getBbsCode());
                            //newly added
                            genericDTO.setDivisionStatus(divisionDTO.getStatus());
                            //

                            genericDTO.setDistrictId(districtDTO.getId());
                            genericDTO.setDistrictName(districtDTO.getDistrictNameBng());
                            genericDTO.setDistrictBbsCode(districtDTO.getBbsCode());
                            //newly added
                            genericDTO.setDistrictStatus(districtDTO.getStatus());
                            //

                            genericDTO.setUpazilaId(upazillaDTO.getId());
                            genericDTO.setUpazilaName(upazillaDTO.getUpazillaNameBng());
                            //newly added
                            genericDTO.setUpazilaStatus(upazillaDTO.getStatus());
                            //

                            genericDTO.setMunicipalityId(sourceId);
                            genericDTO.setMunicipalityName(rs.getString("name_bng"));

                            String formDate=rs.getString("modified");
                            genericDTO.setFromDate(new DateFormatter().dateFormatWithoutDay(formDate));
                            String toDate=rs.getString("expired");
                            genericDTO.setToDate(new DateFormatter().dateFormatWithoutDay(toDate));
                            genericDTO.setTypeName("7");
                            data.add(genericDTO);

                        } else
                            continue;
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (statement != null) statement.close();
            if (cn != null) cn.close();

        }


        return data;


    }

    public ArrayList<HistoryDTO> allhistoryCityDetails(int parentId, int type) throws Exception {
        HashMap<Integer, String> list = new HashMap<Integer, String>();

        HistoryDTO geoHistoryDTO = new HistoryDTO();
        ArrayList<HistoryDTO> data = new ArrayList<>();
        String tableName = " ";
        String nameBng = " ";
        String parentName = " ";
        int parentType = -1;
        int id = parentId;
        if (type == 1) {

            tableName = "geo_divisions";
            nameBng = "division_name_bng";
            parentType = 0;

        } else if (type == 2) {
            tableName = "geo_districts";
            nameBng = "district_name_bng";
            parentType = 1;
            parentName = "geo_division_id";

        } else if (type == 3) {

            tableName = "geo_upazilas";
            nameBng = "upazila_name_bng";
            parentType = 2;
            parentName = "geo_district_id";

        } else if (type == 4) {

            tableName = "geo_city_corporations";
            nameBng = "city_corporation_name_bng";
            parentType = 2;
            parentName = "geo_division_id";

        } else if (type == 5) {

            tableName = "geo_city_corporations";
            nameBng = "city_corporation_name_bng";
            parentType = 2;
            parentName = "geo_division_id";

        } else if (type == 6) {

        } else if (type == 7) {

        } else if (type == 8) {

        } else if (type == 9) {

        } else if (type == 10) {

        }

        Connection cn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "select id," + nameBng + " from " + tableName + " where id= " + id;
        String sq = " select id , " + parentName + " , " + nameBng + " from " + tableName + " where id= " + id;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            if (type == 1) {
                statement = cn.prepareStatement(sql);

            } else
                statement = cn.prepareStatement(sq);

            rs = statement.executeQuery();
            while (rs.next()) {


                geoHistoryDTO.setId(rs.getInt("id"));
                if (type == 1)
                    geoHistoryDTO.setParentId(-1);
                else geoHistoryDTO.setParentId(rs.getInt(parentName));

                geoHistoryDTO.setNameBng(rs.getString(nameBng));
                geoHistoryDTO.setParentType(parentType);


            }
            data.add(geoHistoryDTO);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement != null) statement.close();
            if (cn != null) cn.close();
        }

        return data;
    }

}