/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author User-PC
 */
public class HistoryTransactionDto {
    private String invoice;
    private String namaSepeda;
    private Date startedDate;
    private Date endDate;

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public String getNamaSepeda() {
        return namaSepeda;
    }

    public void setNamaSepeda(String namaSepeda) {
        this.namaSepeda = namaSepeda;
    }

    public Date getStartedDate() {
        return startedDate;
    }

    public void setStartedDate(Date startedDate) {
        this.startedDate = startedDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public Object getObject(int columnIndex){
        switch(columnIndex){
            case 0 : return invoice;
            case 1 : return namaSepeda;
            case 2 : return startedDate;
            case 3 : return endDate;
            default:return null;
        }
    }

    public HistoryTransactionDto(ResultSet rs) throws SQLException, ParseException{
        
        this.invoice = rs.getString("TRANSACTIONID");
         this.namaSepeda = rs.getString("NAMASEPEDA");
         if(rs.getString("STARTEDDATE") != null){
          this.startedDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(rs.getString("STARTEDDATE"));   
         }
         if(rs.getString("ENDDATE") != null){
          this.endDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(rs.getString("ENDDATE"));   
         }
    }
    
    
}
