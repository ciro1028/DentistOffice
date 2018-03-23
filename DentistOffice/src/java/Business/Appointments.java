/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.sql.*;

/**
 *
 * @author Ciro
 */
/************************
 * 
 * Class to select, insert, and delete appointments from database
 * 
 * @author Ciro
 ***********************/
public class Appointments {
    private String apptDateTime;
    private String patId;
    private String dentId;
    private String procCode;
    
    public void Appointments(){
        apptDateTime = "";
        patId = "";
        dentId = "";
        procCode = "";
    }
    
    /*******************
     * 
     * @param apptDateTime
     * @param patId
     * @param dentId
     * @param procCode 
     *******************/
    public void Appointments(String apptDateTime, String patId, String dentId, String procCode) {
        this.apptDateTime = apptDateTime;
        this.patId = patId;
        this.dentId = dentId;
        this.procCode = procCode;
    }

    public String getApptDateTime() {
        return apptDateTime;
    }

    public void setApptDateTime(String apptDateTime) {
        this.apptDateTime = apptDateTime;
    }

    public String getPatId() {
        return patId;
    }

    public void setPatId(String patId) {
        this.patId = patId;
    }

    public String getDentId() {
        return dentId;
    }

    public void setDentId(String dentId) {
        this.dentId = dentId;
    }

    public String getProcCode() {
        return procCode;
    }

    public void setProcCode(String procCode) {
        this.procCode = procCode;
    }
    
    /***********************
     * 
     * Select appointments from database depending on who requested. 
     * 
     * @param column
     * @param field 
     * 
     ***********************/
    public void selectAppointment(String column, String field){
        String sql = "select * from appointments where " + column + "= '" + field + "'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setApptDateTime(rs.getString(1));
                setPatId(rs.getString(2));
                setDentId(rs.getString(3));
                setProcCode(rs.getString(4));
            }
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    /*********************
     * 
     * Method to insert new appointment into database
     * 
     * @param apptDateTime
     * @param patId
     * @param dentId
     * @param procCode 
     * 
     *******************/
    public void insertDB(String apptDateTime, String patId, String dentId,
            String procCode){
        
        String sql = "insert into appointments (apptDateTime, patId, dentId, procCode) value (?, "
                + "?, ?, ?)";
        
        System.out.println(sql);
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, apptDateTime);
            ps.setString(2, patId);
            ps.setString(3, dentId);
            ps.setString(4, procCode);
            
            ps.executeUpdate();
            conn.close();
            
        } catch(ClassNotFoundException | SQLException e){
            System.out.println("Error: " + e.getMessage());
        }  
    }
    /***********************
     * 
     * Method to delete appointment from database
     * 
     * @param patId 
     * 
     **********************/
    public void deleteDB(String patId){
        String sql = "delete from appointments where patId = '" + patId + "'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e){
            System.out.println("Error: " + e.getMessage());
        }
    }
}
