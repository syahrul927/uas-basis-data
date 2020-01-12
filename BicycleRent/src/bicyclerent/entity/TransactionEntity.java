/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author User-PC
 */
public class TransactionEntity {
    private String invoice;
    private String userId;
    private String sepedaId;
    private Date startedDate;
    private Date endDate;
    private int status;

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSepedaId() {
        return sepedaId;
    }

    public void setSepedaId(String sepedaId) {
        this.sepedaId = sepedaId;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public TransactionEntity() {
    }

    public TransactionEntity(ResultSet rs) throws SQLException, ParseException{
        this.invoice = rs.getString("TRANSACTIONID");
        this.userId = rs.getString("USERID");
        this.sepedaId = rs.getString("SEPEDAID");
        this.startedDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(rs.getString("STARTEDDATE"));
        if(rs.getString("ENDDATE")!= null){
        this.endDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(rs.getString("ENDDATE"));
        }
        this.status = Integer.valueOf(rs.getString("STATUS"));
    }
    
    
    
}
