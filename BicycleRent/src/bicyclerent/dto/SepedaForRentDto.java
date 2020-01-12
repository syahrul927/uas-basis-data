/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User-PC
 */
public class SepedaForRentDto {
    
    private String sepedaId;
    private String namaSepeda;
    private String jenisSepeda;

    public SepedaForRentDto() {
    }

    public SepedaForRentDto(ResultSet rs) throws SQLException{
        this.sepedaId = rs.getString("SEPEDAID");
        this.namaSepeda =  rs.getString("NAMASEPEDA");
        this.jenisSepeda =  rs.getString("NAMAJENIS");
    }

    
    
    public String getSepedaId() {
        return sepedaId;
    }

    public void setSepedaId(String sepedaId) {
        this.sepedaId = sepedaId;
    }

    public String getNamaSepeda() {
        return namaSepeda;
    }

    public void setNamaSepeda(String namaSepeda) {
        this.namaSepeda = namaSepeda;
    }

    public String getJenisSepeda() {
        return jenisSepeda;
    }

    public void setJenisSepeda(String jenisSepeda) {
        this.jenisSepeda = jenisSepeda;
    }
    
    
    
}
