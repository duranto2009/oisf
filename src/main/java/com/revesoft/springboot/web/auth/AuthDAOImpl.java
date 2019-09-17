package com.revesoft.springboot.web.auth;

import databasemanager.DatabaseManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAOImpl implements AuthDAO {

    @Override
    public Map getIdPasswordByUsername(String username) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map idPassword = null;
        String sql = "SELECT id, password FROM system WHERE user_name = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                idPassword = new HashMap(2);
                idPassword.put("id", resultSet.getInt(1));
                idPassword.put("password", resultSet.getString(2));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return idPassword;
    }

    @Override
    public Map getSystemInfo(int userId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map info = null;
        String sql = "SELECT id, name, email, contact, description  FROM system WHERE id = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                info = new HashMap(5);
                info.put("id", resultSet.getInt("id"));
                info.put("name", resultSet.getString("name"));
                info.put("email", resultSet.getString("email"));
                info.put("contact", resultSet.getString("contact"));
                info.put("description", resultSet.getString("description"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return info;
    }

    @Override
    public Map getSystemInfo(String username) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map info = null;
        String sql = "SELECT id, name, email, contact, description  FROM system WHERE user_name = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                info = new HashMap(5);
                info.put("id", resultSet.getInt("id"));
                info.put("name", resultSet.getString("name"));
                info.put("email", resultSet.getString("email"));
                info.put("contact", resultSet.getString("contact"));
                info.put("description", resultSet.getString("description"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return info;
    }

    @Override
    public String getSharedSecret(int userId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sharedSecret = null;
        String sql = "SELECT secret  FROM system WHERE id = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                sharedSecret = resultSet.getString("secret");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return sharedSecret;
    }

    @Override
    public String getSharedSecret(String userName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sharedSecret = null;
        String sql = "SELECT secret  FROM system WHERE user_name = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                sharedSecret = resultSet.getString("secret");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return sharedSecret;
    }

    @Override
    public boolean updateSharedSecret(int userId, String sharedSecret) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE system set secret = ? WHERE id = ?;";
        boolean status = false;

        try {
            connection = DatabaseManager.getInstance().getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, sharedSecret);
            preparedStatement.setLong(2, userId);
            preparedStatement.executeUpdate();
            connection.commit();
            status = true;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (Exception ex2) {
                ex.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            clearResources(connection, preparedStatement, null);
        }
        return status;
    }

    @Override
    public boolean updateAPIToken(String username, String api_token) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE system set token = ? WHERE user_name = ?;";
        boolean status = false;

        try {
            connection = DatabaseManager.getInstance().getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, api_token);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
            connection.commit();
            status = true;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (Exception ex2) {
                ex.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            clearResources(connection, preparedStatement, null);
        }
        return status;
    }

    @Override
    public boolean updateAPIToken(int uid, String api_token) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE system set token = ? WHERE id = ?;";
        boolean status = false;

        try {
            connection = DatabaseManager.getInstance().getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, api_token);
            preparedStatement.setInt(2, uid);
            preparedStatement.executeUpdate();
            connection.commit();
            status = true;
        } catch (Exception ex) {
            try {
                connection.rollback();
            } catch (Exception ex2) {
                ex.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            clearResources(connection, preparedStatement, null);
        }
        return status;
    }

    @Override
    public String getAPIToken(String userName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sharedSecret = null;
        String sql = "SELECT token  FROM system WHERE user_name = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                sharedSecret = resultSet.getString("token");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return sharedSecret;
    }

    @Override
    public String getAPIToken(int uid) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sharedSecret = null;
        String sql = "SELECT token  FROM system WHERE id = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, uid);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                sharedSecret = resultSet.getString("token");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }
        return sharedSecret;
    }

    private void clearResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            DatabaseManager.getInstance().freeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
