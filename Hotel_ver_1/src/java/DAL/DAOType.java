/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.TypeCustomer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Acer
 */
public class DAOType extends DBContext {

    
    // Lấy type customer bằng id
    public TypeCustomer getTypeById(String id) {
        String sql = """
                     SELECT TOP 1000 [type_customer]
                           ,[type_customer_name]
                           ,[money level]
                           ,[discount]
                       FROM [Hotel].[dbo].[Type_customer] where [type_customer] = ?;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery(); 
            if(rs.next()){
                return new TypeCustomer(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getFloat(4));
            }
        } catch (SQLException e) {
        }
        
        return null;
    }
    
    public static void main(String[] args) {
        DAOType t = new DAOType();
        System.out.println(t.getTypeById("1").getDiscount());
    }
}
