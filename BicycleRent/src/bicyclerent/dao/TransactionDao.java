/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.dao;

import bicyclerent.Func.Koneksi;
import bicyclerent.entity.TransactionEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author User-PC
 */
public class TransactionDao {
    private Connection conn = null;
    private TransactionEntity transactionEntity = null;

    public TransactionDao() throws SQLException{
        conn = Koneksi.getKoneksi();
    }
    
    
    public Boolean insert(TransactionEntity t) throws SQLException{
        String sql = "insert into TRANSACTION values(?,?,?,?,?,?)";
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, "");
        state.setString(2, t.getUserId());
        SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        state.setString(3, t.getSepedaId());
        state.setString(4, s.format(t.getStartedDate()));
        state.setString(5, null);
        state.setString(6, String.valueOf(t.getStatus()));
        int sukses = state.executeUpdate();
        return sukses>0;
    }
    
    public TransactionEntity checkUser(String userId) throws SQLException, ParseException{
        String sql = "select *from TRANSACTION where USERID =? and STATUS= 1";
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, userId);
        ResultSet rs = state.executeQuery();
        if(rs.next()){
            transactionEntity = new TransactionEntity(rs);
        }
        return transactionEntity;
    }

    public boolean update(TransactionEntity t) throws SQLException {
        String sql = "update TRANSACTION set ENDDATE=?, STATUS=? where TRANSACTIONID=?";
        PreparedStatement state = conn.prepareStatement(sql);
        SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        state.setString(1, s.format(t.getEndDate()));
        state.setString(2, String.valueOf(t.getStatus()));
        state.setString(3, t.getInvoice());
        int sukses = state.executeUpdate();
        return sukses>0;
    }
}
