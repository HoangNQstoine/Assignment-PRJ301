/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import javax.naming.NamingException;
import sample.users.UserDTO;
import sample.utils.DBUtils;
import shopping.dto.OrderDTO;

/**
 *
 * @author HoangNQ
 */
public class ShoppingDAO {

    private static final String SEARCH = "SELECT productID, productName, productPrice, productQuantity FROM tblProduct WHERE productName like ? ";
    private static final String UPDATE = "UPDATE tblProduct SET  productName = ?, productPrice = ?, productQuantity = ? WHERE productID = ? ";
    private static final String DELETE = "DELETE tblProduct WHERE productID = ? ";
    private static final String INSERT = "INSERT INTO tblProduct (productID, productName, productPrice, productQuantity) VALUES (?,?,?,?) ";
    private static final String CHECKPRODUCTID = "SELECT productID FROM tblProduct WHERE productID = ? ";
    private static final String GETLISTPRODUCT = "SELECT productID, productName, productPrice, productQuantity FROM tblProduct WHERE productName like ? ";
    private static final String INSERTORDERDETAILS = "INSERT INTO tblOrderDetail (orderDetailID ,orderID, productID, producPrice , productQuantity) VALUES (?,?,?,?,?) ";
    private static final String INSERTORDER = "INSERT INTO tblOrder (orderID, userID, date, total) VALUES (?,?,?,?) ";

    private static final String UPDATEPRODUCT = "UPDATE tblProduct SET productQuantity = ? WHERE productID = ? ";

    private static final String GET_ORDERID = "SELECT orderID FROM tblOrder WHERE orderDetailID LIKE ?";

    private static final String GET_QUANTITY = "SELECT quantity FROM product WHERE productID = ?";

    public int getQuantity(String id) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                quantity = Integer.parseInt(rs.getString("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;

    }

    public List<Comestic> SearchListProduct(String search) throws SQLException {
        List<Comestic> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int productQuantity = rs.getInt("productQuantity");
                    listProduct.add(new Comestic(productID, productName, productPrice, productQuantity));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listProduct;
    }

    public boolean updateProduct(Comestic comestic) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, comestic.getName());
                ptm.setDouble(2, comestic.getPrice());
                ptm.setInt(3, comestic.getQuantity());
                ptm.setString(4, comestic.getId());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean insertProduct(Comestic comestic) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, comestic.getId());
                ptm.setString(2, comestic.getName());
                ptm.setDouble(3, comestic.getPrice());
                ptm.setInt(4, comestic.getQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean CheckProductID(String productID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKPRODUCTID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<Comestic> ListProduct() throws SQLException {
        List<Comestic> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETLISTPRODUCT);
                ptm.setString(1, "%" + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int productQuantity = rs.getInt("productQuantity");
                    listProduct.add(new Comestic(productID, productName, productPrice, productQuantity));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listProduct;

    }

    public boolean insertOrder(OrderDTO orderdto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        LocalDate currentDate = LocalDate.now();
        Date sqlDate = Date.valueOf(currentDate);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTORDER);
                ptm.setInt(1, orderdto.getOrderID());
                ptm.setString(2, orderdto.getUserID());
                ptm.setDate(3, sqlDate);
                ptm.setDouble(4, orderdto.getTotal());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public int getId() throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        int index = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select orderID from tblOrder where orderID = (select max(orderID) from tblOrder)";

                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                while (rs.next()) {
                    index = rs.getInt("orderID");
                    return index;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public boolean insertDetails(int i, int id, String productID, double price, int quantity) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTORDERDETAILS);
                ptm.setInt(1, i);
                ptm.setInt(2, id);
                ptm.setString(3, productID);
                ptm.setDouble(4, price);
                ptm.setInt(5, quantity);
                check = ptm.executeUpdate() > 0 ? true : false;
                if (ptm != null) {
                    ptm.close();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean upDateQuantity(int quanUpDate) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setInt(1, quanUpDate);
                rs = ptm.executeQuery();
                check = ptm.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean CheckQuantityByProductID(String id, Cart cart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Comestic> ListProduct = ListProduct();
        try {
            conn = DBUtils.getConnection();
            for (Comestic ca : ListProduct) {
                if (ca.getId().equals(id)) {
                    if (ca.getQuantity() < cart.getCart().get(id).getQuantity()) {
                        return false;
                    }

                }
            }

            for (Comestic comestic : ListProduct) {
                if (comestic.getId().equals(id)) {
                    ptm = conn.prepareStatement(UPDATEPRODUCT);
                    ptm.setInt(1, comestic.getQuantity() - cart.getCart().get(id).getQuantity());
                    ptm.setString(2, comestic.getId());
                    check = ptm.executeUpdate() > 0 ? true : false;
                    if (check) {
                        ptm.close();
                    } else {
                        return false;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
