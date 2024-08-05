package DAO;

import Utils.DBContext;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Models.Customer;
import Models.TypeCustomer;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class CustomerDAO extends DBContext implements BaseDAO<Customer> {

    @Override
    public boolean insert(Customer newCustomer) {
        try {
            String hashedPassword = hashPassword(newCustomer.getPassword());
            String sql = "INSERT INTO Customer (type_customer ,first_name, last_name, email, password, phone, address, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, 1);  //Luôn gán cho khách mới type id=1 khi tạo tài khoản
                pstmt.setString(2, newCustomer.getFirstName());
                pstmt.setString(3, newCustomer.getLastName());
                pstmt.setString(4, newCustomer.getEmail());
                pstmt.setString(5, hashedPassword);
                pstmt.setString(6, newCustomer.getPhone());
                pstmt.setString(7, newCustomer.getAddress());
                pstmt.setString(8, newCustomer.getStatus());
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedHash = digest.digest(password.getBytes());

        StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
        for (byte b : encodedHash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        return hexString.toString();
    }

    public Customer findByEmail(String email) {
        String query = "SELECT * FROM Customer WHERE email=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int customerId = rs.getInt("customer_id");
                    TypeCustomer typeCustomer = getTypeCustomerById(rs.getInt("type_customer"));
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String status = rs.getString("status");

                    return new Customer(customerId, typeCustomer, firstName, lastName, email, password, phone, address, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private TypeCustomer getTypeCustomerById(int id) {
        String query = "SELECT * FROM Type_customer WHERE type_customer = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int typeCustomer = rs.getInt("type_customer");
                    String typeCustomerName = rs.getString("type_customer_name");
                    float moneyLevel = rs.getFloat("money_level");
                    float discount = rs.getFloat("discount");

                    return new TypeCustomer(typeCustomer, typeCustomerName, moneyLevel, discount);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Customer findById(int id) {
        CustomerDAO dao = new CustomerDAO();
        for (Customer c : dao.getAll()) {
            if (c.getCustomerId() == id) {
                return c;
            }
        }
        return null;
    }

    @Override
    public List<Customer> getAll() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Customer";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt(1);
                int type_cusname_id = rs.getInt("type_customer");
                TypeCustomer type_cus = getTypeCustomerById(type_cusname_id);
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String status = rs.getString("status");

                customers.add(new Customer(customerId,type_cus, firstName, lastName, email, password, phone, address, status));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return customers;
    }

    @Override
    public boolean update(Customer customer) {
        String sql = "UPDATE Customer SET type_customer = ?, first_name = ?, last_name = ?, email = ?, password = ?, phone = ?, address = ?, status = ? WHERE customer_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customer.getTypeCustomer().getTypeCustomerId());
            statement.setString(2, customer.getFirstName());
            statement.setString(3, customer.getLastName());
            statement.setString(4, customer.getEmail());
            statement.setString(5, hashPassword(customer.getPassword()));
            statement.setString(6, customer.getPhone());
            statement.setString(7, customer.getAddress());
            statement.setString(8, customer.getStatus());
            statement.setInt(9, customer.getCustomerId());

            statement.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    public boolean updateProfile(Customer customer) {
        String sql = "UPDATE Customer SET type_customer = ?, first_name = ?, last_name = ?, email = ?, password = ?, phone = ?, address = ?, status = ? WHERE customer_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customer.getTypeCustomer().getTypeCustomerId());
            statement.setString(2, customer.getFirstName());
            statement.setString(3, customer.getLastName());
            statement.setString(4, customer.getEmail());
            statement.setString(5, customer.getPassword());
            statement.setString(6, customer.getPhone());
            statement.setString(7, customer.getAddress());
            statement.setString(8, customer.getStatus());
            statement.setInt(9, customer.getCustomerId());

            statement.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    public boolean updateStatus(Customer customer) {
        String sql = "UPDATE Customer SET status = ? WHERE customer_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getStatus());
            statement.setInt(2, customer.getCustomerId());

            statement.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    @Override
    public boolean delete(String id) {
        String query = "DELETE FROM Customer WHERE customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            return ps.executeUpdate() == 1;
        } catch (NumberFormatException | SQLException e) {
        }
        return false;
    }

    public Customer getCustomerByMail(String mail) {
        TypeCustomerDAO daoType = new TypeCustomerDAO();
        String sql = """
                     SELECT [customer_id]
                           ,[type_customer]
                           ,[first_name]
                           ,[last_name]
                           ,[email]
                           ,[password]
                           ,[phone]
                           ,[address]
                           ,[status]
                       FROM [Customer] where [email] like ?;""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt(1), daoType.getTypeById(rs.getString(2)), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateCustomerPassword(String newPassword, String email) throws NoSuchAlgorithmException, Exception {
        String sql = """
                     UPDATE [dbo].[Customer]
                     SET  [password] = ? WHERE [email] like ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hashPassword(newPassword));
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Ko doi ");
        }

    }
    
     public boolean addWaitCustomer(String email, String firstName, String lastName) {
        String sql = """
                     INSERT INTO [Customer]
                                ([type_customer]
                                ,[first_name]
                                ,[last_name]
                                ,[email]
                                ,[status])
                          VALUES
                                (1, ?, ?, ?, 'wait')""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstName);
            st.setString(2, lastName);
            st.setString(3, email);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
    //Main Test
    public static void main(String[] args) throws NoSuchAlgorithmException, Exception {
        CustomerDAO dao = new CustomerDAO();
//        System.out.println(dao.getTypeCustomerById(1).getTypeCustomerName());
        System.out.println(dao.addWaitCustomer("123", "123", "123"));
    }
}
