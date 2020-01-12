/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.dao;

import bicyclerent.Func.Koneksi;
import bicyclerent.entity.UserEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User-PC
 */
public class UserDao {
    private Connection conn = null;
    private UserEntity userEntity = null;

    public UserDao() throws SQLException{
        conn = Koneksi.getKoneksi();
    }
    
public Boolean insert(UserEntity user) throws SQLException{
    String sql = "insert into TB_USER values(?,?,?,?,?)";
    PreparedStatement state = conn.prepareStatement(sql);
    state.setString(1, user.getUserId());
    state.setString(2, user.getNama());
    state.setString(3, user.getPhone());
    state.setString(4, user.getPassword());
    state.setString(5, String.valueOf(user.getIsActive()));
    int sukses = state.executeUpdate();
    return sukses>0;
}

public UserEntity getOne(String userId, String password) throws SQLException{
    String sql = "select *from TB_USER where USERID =? and password = ?";
    PreparedStatement state = conn.prepareStatement(sql);
    state.setString(1, userId);
    state.setString(2, password);
    ResultSet rs = state.executeQuery();
    if(rs.next()){
        userEntity = new UserEntity(rs);
    }
    return userEntity ;
}


    
    
}
