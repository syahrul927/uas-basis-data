/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.dao;

import bicyclerent.Func.Koneksi;
import bicyclerent.dto.SepedaForRentDto;
import bicyclerent.entity.UserEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User-PC
 */
public class SepedaDao {
    
    private Connection conn = null;
    private SepedaForRentDto dto = null;

    public SepedaDao() throws SQLException {
        conn = Koneksi.getKoneksi();
    }
    
    public List<SepedaForRentDto> getAllForRent() throws SQLException{
        String sql = "select *from SEPEDAACTIVE ";
        List<SepedaForRentDto> list = new ArrayList<>();
        PreparedStatement state = conn.prepareStatement(sql);
        ResultSet rs = state.executeQuery();
        while(rs.next()){
             SepedaForRentDto s= new SepedaForRentDto(rs);
             list.add(s);
        }
        return list;
    }
            
}
