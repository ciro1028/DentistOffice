/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;
import java.sql.*;

/****************************
 *
 * Class to select procedures from database.
 * 
 * @author Ciro
 **************************/
public class Procedures {
    private String procCode;
    private String procName;
    private String procDesc;
    private String cost;
    
    public void Procedures(){
        procCode = "";
        procName = "";
        procDesc = "";
        cost = "";
    }
    /******************
     * 
     * @param procCode
     * @param procName
     * @param procDesc
     * @param cost 
     ******************/
    public void Procedures(String procCode, String procName, String procDesc, String cost) {
        this.procCode = procCode;
        this.procName = procName;
        this.procDesc = procDesc;
        this.cost = cost;
    }

    public String getProcCode() {
        return procCode;
    }

    public void setProcCode(String procCode) {
        this.procCode = procCode;
    }

    public String getProcName() {
        return procName;
    }

    public void setProcName(String procName) {
        this.procName = procName;
    }

    public String getProcDesc() {
        return procDesc;
    }

    public void setProcDesc(String procDesc) {
        this.procDesc = procDesc;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }
    /****************************
     * 
     * Select procedures from database.
     * 
     * @param procCode 
     ***************************/
    public void selectProcedure(String procCode){
        String sql = "select * from Procedures where procCode = '" + procCode + "'";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://"
                    + "localhost:3306/DentistOfficeDB", "root", "Cc102807");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while (rs.next()){
                setProcCode(rs.getString(1));
                setProcName(rs.getString(2));
                setProcDesc(rs.getString(3));
                setCost(rs.getString(4));
            }
            
            conn.close();
       
        } catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    /*public static void main(String[] args){
        Procedures procedure = new Procedures();
        procedure.selectProcedure("P114");
        System.out.println("Code: " + procedure.getProcCode());
        System.out.println("Name: " + procedure.getProcName());
        System.out.println("Description: " + procedure.getProcDesc());
        System.out.println("Cost: $" + procedure.getCost());
    }*/
}
