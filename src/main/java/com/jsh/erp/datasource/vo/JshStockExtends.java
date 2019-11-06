package com.jsh.erp.datasource.vo;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableField;

/**
 * <p>
 * 
 * </p>
 *
 * @author lhq
 * @since 2019-11-06
 */
public class JshStockExtends extends BaseVo {

    private static final long serialVersionUID = 1L;

    @TableField("meterialId")
    private Long meterialId;

    @TableField("prevSum")
    private BigDecimal prevSum;

    @TableField("InSum")
    private BigDecimal InSum;

    @TableField("OutSum")
    private BigDecimal OutSum;

    @TableField("thisSum")
    private BigDecimal thisSum;

    public Long getMeterialId() {
        return meterialId;
    }

    public void setMeterialId(Long meterialId) {
        this.meterialId = meterialId;
    }
    public BigDecimal getPrevSum() {
        return prevSum;
    }

    public void setPrevSum(BigDecimal prevSum) {
        this.prevSum = prevSum;
    }
    public BigDecimal getInSum() {
        return InSum;
    }

    public void setInSum(BigDecimal InSum) {
        this.InSum = InSum;
    }
    public BigDecimal getOutSum() {
        return OutSum;
    }

    public void setOutSum(BigDecimal OutSum) {
        this.OutSum = OutSum;
    }
    public BigDecimal getThisSum() {
        return thisSum;
    }

    public void setThisSum(BigDecimal thisSum) {
        this.thisSum = thisSum;
    }

    @Override
    public String toString() {
        return "JshStockExtends{" +
        "meterialId=" + meterialId +
        ", prevSum=" + prevSum +
        ", InSum=" + InSum +
        ", OutSum=" + OutSum +
        ", thisSum=" + thisSum +
        "}";
    }
}
