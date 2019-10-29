package com.jsh.erp.datasource.vo;

import java.math.BigDecimal;

import com.jsh.erp.annotation.ExcelVOAttribute;

public class SaleOrderExcelVO {  
	
    @ExcelVOAttribute(name = "仓库名称", column = "A")  
    private String depotName;  

    @ExcelVOAttribute(name = "品名", column = "B")  
    private String materialName;  

    @ExcelVOAttribute(name = "库存", column = "C")  
    private BigDecimal stock;  

    @ExcelVOAttribute(name = "单位", column = "D")  
    private String unit;  

    @ExcelVOAttribute(name = "数量", column = "E")  
    private BigDecimal operNumber;

    @ExcelVOAttribute(name = "分批数量", column = "F")  
    private BigDecimal finishNumber;
    
    @ExcelVOAttribute(name = "单价", column = "G")  
    private BigDecimal unitPrice;
    
    @ExcelVOAttribute(name = "金额", column = "H")  
    private BigDecimal allPrice;

    @ExcelVOAttribute(name = "备注", column = "I")  
    private String remark;

	public String getDepotName() {
		return depotName;
	}

	public void setDepotName(String depotName) {
		this.depotName = depotName;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	

	public BigDecimal getStock() {
		return stock;
	}

	public void setStock(BigDecimal stock) {
		this.stock = stock;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public BigDecimal getOperNumber() {
		return operNumber;
	}

	public void setOperNumber(BigDecimal operNumber) {
		this.operNumber = operNumber;
	}

	public BigDecimal getFinishNumber() {
		return finishNumber;
	}

	public void setFinishNumber(BigDecimal finishNumber) {
		this.finishNumber = finishNumber;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public BigDecimal getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(BigDecimal allPrice) {
		this.allPrice = allPrice;
	}

	
	
	
    
    
    public static void main(String[] args) {
		String t = "1573.000000";
		System.out.println(t.indexOf("."));
		System.out.println(t.substring(0, t.indexOf(".")));
	}



}
