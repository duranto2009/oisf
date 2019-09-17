/**
 * @(#)LoginDTO.java
 * @author <>
 * @history
 *          created : <>  Date : MMM-DD-YYYY <venue>
 * @version <>
 *
 * Copyright <YYYY> <company>.
 *
 * All rights reserved.
 *
 * This software is the confidential and proprietdary information
 * of <company>("Confidential Information").
 * You shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement
 * you entered into with <company>.
 *
 */

package com.revesoft.springboot.web.login;

import java.util.*;

//import role.*;

public class LoginDTO {
	private String m_username;
	private String m_password;
	private long m_userID;
	private HashMap m_permissionMap;
	private HashMap m_columnPermissionMap;

	private ArrayList m_childClientAccountIDList;
	private ArrayList m_childResellerAccountIDList;

	private String m_mailAddress;
	private String m_mailServer;
	private long m_accountID;
	private long m_employeeRecordID;//Added By Anisuuzzaman
	private long m_officeID;//Added By Anisuzzaman
	private long m_designationID; //Added By Anisuzzaman
	private long m_officerOfficeDesignationID; //Added By Sharif
	private int m_roleID;
	private int m_LocalAdmin;
	private long m_employeeOfficeId;

	private String m_webRoot;
	private String m_genericPage;
	private String m_loginSourceIP;
	private int m_languageID;
	private int m_status;
	private HashMap m_loginIP;

	private long m_currentParentAccount;

	private long m_dataLoadingTime;
	private int m_passwordExpirationType;
	private long m_passwordExpirationTime;
	private String m_loginURL;
	private String m_OTPSerial, m_OTPToken;
	public long callShopID;
	public int loginPort;
	

	public LoginDTO() {
		m_permissionMap = new HashMap();
		m_columnPermissionMap = new HashMap();
		m_loginIP = null;

		m_accountID = -1;
		m_roleID = -1;
		m_userID = -1;
		m_status = -1;
		m_webRoot = null;
		m_genericPage = null;

		m_languageID = 1;
		m_currentParentAccount = -1;
		m_dataLoadingTime = -1;
		m_passwordExpirationType = -1;
		m_OTPSerial = m_OTPToken = null;
		callShopID = -1;
	}

	public String getLoginURL() {
		return m_loginURL;
	}

	public void setLoginURL(String p_LoginURL) {
		m_loginURL = p_LoginURL;
	}

	public long getpasswordExpirationTime() {
		return m_passwordExpirationTime;
	}

	public void setpasswordExpirationTime(long p_passwordExpirationTime) {
		m_passwordExpirationTime = p_passwordExpirationTime;
	}

	public int getpasswordExpirationType() {
		return m_passwordExpirationType;
	}

	public void setpasswordExpirationType(int p_passwordExpirationType) {
		m_passwordExpirationType = p_passwordExpirationType;
	}

	public long getDataLoadingTime() {
		return m_dataLoadingTime;
	}

	public void setDataLoadingTime(long p_dataLoadingTime) {
		m_dataLoadingTime = p_dataLoadingTime;
	}

	public void setCurrentParentAccount(long p_currentParentAccount) {
		m_currentParentAccount = p_currentParentAccount;
	}

	public long getCurrentParentAccount() {
		return m_currentParentAccount;
	}

	public void setUserStatus(int p_status) {
		m_status = p_status;
	}

	public int getUserStatus() {
		return m_status;
	}

	public void setUserID(long userID) {
		m_userID = userID;
	}

	public long getUserID() {
		return m_userID;
	}

	public void addLoginIP(String p_loginIP) {
		if (m_loginIP == null)
			m_loginIP = new HashMap();
		m_loginIP.put(p_loginIP, p_loginIP);
	}

	public void addLoginIP(HashMap<String, String> p_loginIPMap) {
		m_loginIP = p_loginIPMap;
	}

	public boolean checkLoginSourceIP() {
		if (m_loginIP == null) {
			return true;
		}
		if (m_loginIP.get(m_loginSourceIP) != null)
			return true;
		return false;
	}

	public String getLoginSourceIP() {
		return m_loginSourceIP;
	}

	public void setLoginSourceIP(String p_sourceIP) {
		m_loginSourceIP = p_sourceIP;
	}

	public int getLanguageID() {
		return m_languageID;
	}

	public void setLanguageID(int p_languageID) {
		m_languageID = p_languageID;
	}

	public void setWebRoot(String p_webRoot) {
		m_webRoot = p_webRoot;
	}

	public String getWebRoot() {
		return m_webRoot;
	}

	public void setGenericPage(String p_genericPage) {
		m_genericPage = p_genericPage;
	}

	public String getGenericPage() {
		return m_genericPage;
	}

	public void setRoleID(int p_roleID) {
		m_roleID = p_roleID;
	}

	public int getRoleID() {
		return m_roleID;
	}

/*	public ArrayList<client.ClientDTO> getChildClientAccountIDList() {
		// LoginDAO dao = new LoginDAO();
		// return dao.getChieldAccountIDList(this);
		return m_childClientAccountIDList;
	}

	public void setChildClientAccountIDList(
			ArrayList<client.ClientDTO> p_childClientAccountIDList) {
		m_childClientAccountIDList = p_childClientAccountIDList;
	}*/

	public ArrayList getChildResellerAccountIDList() {
		// LoginDAO dao = new LoginDAO();
		// return dao.getChieldAccountIDList(this);
		return m_childResellerAccountIDList;
	}

	public void setChildResellerAccountIDList(
			ArrayList p_childResellerAccountIDList) {
		m_childResellerAccountIDList = p_childResellerAccountIDList;
	}

	public long getAccountID() {
		return m_accountID;
	}

	public void setAccountID(long p_accountID) {
		m_accountID = p_accountID;
	}

	public String getMailAddress() {
		return m_mailAddress;
	}

	public void setMailAddress(String p_mailAddress) {
		m_mailAddress = p_mailAddress;
	}

	public String getMailServer() {
		return m_mailServer;
	}

	public void setMailServer(String p_mailServer) {
		m_mailServer = p_mailServer;
	}

/*	public void setPermissionList(ArrayList list) {
		for (int i = 0; i < list.size(); i++) {
			PermissionDTO dto = (PermissionDTO) list.get(i);
			m_permissionMap.put(dto.getMenuID() + "", dto.getPermissionType()
					+ "");
		}
	}*/

	public boolean getColumnPermission(String columnID) {
		Boolean b = (Boolean) m_columnPermissionMap.get(columnID);
		if (b == null) {
			return false;
		}
		return b.booleanValue();
	}

	public int getMenuPermission(String menuId) {
		int permission = -1;

		String pers = (String) m_permissionMap.get(menuId);
		if (pers != null) {
			permission = Integer.parseInt(pers);
		}
		return permission;
	}

	public String getUsername() {
		return m_username;
	}

	public void setUsername(String p_username) {
		m_username = p_username;
	}

	public String getPassword() {
		return m_password;
	}

	public void setPassword(String p_password) {
		m_password = p_password;
	}

	// ////////////////////////////////////////////////////////////////////////rahat's
	// codes for
	// Repository///////////////////////////////////////////////////////
	public boolean getColumnPermission(int columnID) {
		return getColumnPermission(columnID + "");
	}

	public void setColumnPermission(String columnID) {
		m_columnPermissionMap.put(columnID, new Boolean(true));
	}

	public int getMenuPermission(int menuId) {
		return getMenuPermission(menuId + "");
	}

	public void setOTPSerial(String p_serial) {
		m_OTPSerial = p_serial;
	}

	public String getOTPSerial() {
		return m_OTPSerial;
	}

	public void setOTPToken(String p_token) {
		m_OTPToken = p_token;
	}

	public String getOTPToken() {
		return m_OTPToken;
	}

	
	/*
	 * public void setColumnPermission(String columnID) {
	 * RoleRepository.getInstance().setColumnPermission(m_roleID,
	 * Integer.parseInt(columnID)); }
	 * 
	 * public boolean getColumnPermission(int columnID) { return
	 * RoleRepository.getInstance().getColumnPermission(m_roleID, columnID); }
	 * public int getMenuPermission(int menuId) { return
	 * RoleRepository.getInstance().getMenuPermission(m_roleID,menuId); }
	 */

	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public long getOfficeID() {
		return m_officeID;
	}

	public void setOfficeID(long p_officeID) {
		m_officeID = p_officeID;
	}

	public long getDesignationID() {
		return m_designationID;
	}

	public void setDesignationID(long p_designationID) {
		m_designationID = p_designationID;
	}

	public long getEmployeeRecordID() {
		return m_employeeRecordID;
	}

	public void setEmployeeRecordID(long p_employeeRecordID) {
		m_employeeRecordID = p_employeeRecordID;
	}

	public long getOfficerOfficeDesignationID() {
		return m_officerOfficeDesignationID;
	}

	public void setOfficerOfficeDesignationID(long p_officerOfficeDesignationID) {
		this.m_officerOfficeDesignationID = p_officerOfficeDesignationID;
	}
	
	public int getLocalAdmin() {
		return m_LocalAdmin;
	}

	public void setLocalAdmin(int m_LocalAdmin) {
		this.m_LocalAdmin = m_LocalAdmin;
	}

	public String toString() {
		String out = "";
		out += "\n" + "m_username " + m_username;
		out += "\n" + "m_password " + m_password;

		return out;
	}

	public long getEmployeeOfficeId() {
		return m_employeeOfficeId;
	}

	public void setEmployeeOfficeId(long m_employeeOfficeId) {
		this.m_employeeOfficeId = m_employeeOfficeId;
	}
	
	
}
