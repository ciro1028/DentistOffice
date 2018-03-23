/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.sql.*;
import java.util.ArrayList;
import Business.*;


/**
 *
 * @author Ciro
 */
public class Dentists {
    private String id;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String office;
    
    public void Dentists(){
        id = "";
        password = "";
        firstName = "";
        lastName = "";
        email = "";
        office = "";
    }

    public void Dentists(String id, String password, String firstName, String lastName, String email, String office) {
        this.id = id;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.office = office;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }
    
    /************************
     * 
     * Method to select dentists from the database. 
     * 
     * @param id 
     ***********************/
    public void selectDentist(String id){
        String sql = "select * from Dentists where id = '" + id + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while (rs.next()){
                setId(rs.getString(1));
                setPassword(rs.getString(2));
                setFirstName(rs.getString(3));
                setLastName(rs.getString(4));
                setEmail(rs.getString(5));
                setOffice(rs.getString(6));
            }
            
            conn.close();
       
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        
        getAppointmentList(id);
    }
    
    /********************
     * 
     * Method to insert new Dentist into database.
     * 
     * @param id
     * @param password
     * @param firstName
     * @param lastName
     * @param email
     * @param office 
     ********************/
    public void insertDentist(String id, String password, String firstName, String lastName, String email, String office){
        String sql = "insert into Dentists (id, password, firstName, lastName, email, office) values (?, ?, ?, ?, ?, ?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, id);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6, office);
            
            ps.execute();
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    /*********************
     * 
     * Method to aquire a list of appointment by dentist.
     * 
     * @param dentId
     * @return 
     *********************/
    public ArrayList getAppointmentList(String dentId){
        
        ArrayList aList = new ArrayList();
        
        String sql = "select * from Appointments where dentId = '" + dentId + "'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while(rs.next()){
                String patId = "";
                Appointments appointment = new Appointments();
                patId = rs.getString(2);
                appointment.selectAppointment("patId", patId);
                aList.add(appointment);
            }
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return aList;
    }
    
    /**********************
     * 
     * Method to update dentist information.
     * 
     * @param patId 
     *********************/
    public void updateDentist(String id, String password, String firstName, String lastName, String email,
            String office){
        String sql = "update dentists set firstName = ?, lastName = ?, email = ?, office = ? where id = '" + id + "'";
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, office);
            
            ps.executeUpdate();
            
            conn.close();
            
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        
    }
    
    public static void main(String[] args){
        Dentists dentist = new Dentists();
        dentist.selectDentist("D201");
        System.out.println(dentist.getFirstName() + " " + dentist.getLastName());
    }
}

