package Business;


import java.sql.*;
import javax.servlet.http.HttpSession;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ciro
 */

/******************************
 * 
 * Class to handle Patients. Select patient and insert new patient.
 * 
 *****************************/

public class Patients {
    private String patId;
    private String password;
    private String firstName;
    private String lastName;
    private String address;
    private String email;
    private String insCo;
    
    public void Patients(){
        patId = "";
        password = "";
        firstName = "";
        lastName = "";
        address = "";
        email = "";
        insCo = "";
    }
    
    
    /**********************
     * 
     * Method to initialize variables.
     * 
     * @param patId
     * @param password
     * @param firstName
     * @param lastName
     * @param address
     * @param email
     * @param insCo 
     ***********************/
    public void Patients(String patId, String password, String firstName, String lastName, String address, String email, String insCo){
        this.patId = patId;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.email = email;
        this.insCo = insCo;
    }

    public String getPatId() {
        return patId;
    }

    public void setPatId(String patId) {
        this.patId = patId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInsCo() {
        return insCo;
    }

    public void setInsCo(String insCo) {
        this.insCo = insCo;
    }
    
    /****************
     * 
     * Method to select patients from the database.
     * 
     * @param id 
     ****************/
    public void selectPatient(String id){
        String sql = "select * from Patients where patId = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DentistOfficeDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next()){
                setPatId(rs.getString(1));
                setPassword(rs.getString(2));
                setFirstName(rs.getString(3));
                setLastName(rs.getString(4));
                setAddress(rs.getString(5));
                setEmail(rs.getString(6));
                setInsCo(rs.getString(7));
            }
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
   /*******************
    * 
    * Method to insert new patient into the database.
    * 
    * @param patId
    * @param password
    * @param firstName
    * @param lastName
    * @param address
    * @param email
    * @param insCo 
    *******************/
    public void insertPatient(String patId, String password, String firstName, String lastName, String address, String email, String insCo){
        String sql = "insert into Patients (patId, password, firstName, lastName, address, email, insCo) values (?, ?, ?, ?, ?, ?, ?)";
        try{
            
            /********************
             * Connection to mySql Database
             *******************/
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, patId);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, insCo);
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    /**********************
     * 
     * Method to update patient information.
     * 
     * @param patId 
     *********************/
    public void updatePatient(String patId, String password, String firstname, String lastName, String address,
            String email, String insCo){
        String sql = "update patients set firstName = ?, lastName = ?, address = ?, email = ?, insCo = ? where patId = '" + patId + "'";
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, insCo);
            
            ps.executeUpdate();
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        
    }
    
    /*public static void main(String[] args){
        Patients patient = new Patients();
        patient.selectPatient("A905");
        System.out.println(patient.getFirstName() + " " + patient.getLastName());
    }*/
}
