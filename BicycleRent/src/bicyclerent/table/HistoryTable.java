/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.table;

import bicyclerent.dto.HistoryTransactionDto;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author User-PC
 */
public class HistoryTable extends AbstractTableModel{
    private List<HistoryTransactionDto> list;
    private String[] colName={"INVOICE", "NAMA SEPEDA", "PINJAM", "BALIKIN"};

    public HistoryTable(List<HistoryTransactionDto> list) {
        this.list = list;
    }
    
    @Override
    public int getRowCount() {
        return list.size();
    }

    @Override
    public int getColumnCount() {
    return 4;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        return list.get(rowIndex).getObject(columnIndex);
    }
    
    @Override
    public String getColumnName(int column) {
        return colName[column];
    }
    
}
