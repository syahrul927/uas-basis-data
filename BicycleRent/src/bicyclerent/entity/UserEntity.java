/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User-PC
 */

public class UserEntity {

    public UserEntity() {
    }
    
    private String userId;
    private String nama;
    private String phone;
    private String password;
    private Integer isActive = 0;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

    public UserEntity(ResultSet rs) throws SQLException {
        this.userId = rs.getString("USERID");
        this.nama = rs.getString("NAMA");
        this.password = rs.getString("PASSWORD");
        this.phone = rs.getString("PHONE");
        this.isActive = Integer.parseInt(rs.getString("ISACTIVE"));
        
    }
    
    
}
