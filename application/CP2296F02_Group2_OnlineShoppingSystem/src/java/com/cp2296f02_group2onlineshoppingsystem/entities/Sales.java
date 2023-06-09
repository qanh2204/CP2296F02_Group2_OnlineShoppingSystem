/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author minhthuy
 */
@Entity
@Table(name = "Sales")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sales.findAll", query = "SELECT s FROM Sales s"),
    @NamedQuery(name = "Sales.findBySaleId", query = "SELECT s FROM Sales s WHERE s.saleId = :saleId"),
    @NamedQuery(name = "Sales.findByStartDate", query = "SELECT s FROM Sales s WHERE s.startDate = :startDate"),
    @NamedQuery(name = "Sales.findByEndDate", query = "SELECT s FROM Sales s WHERE s.endDate = :endDate"),
    @NamedQuery(name = "Sales.findByDecreasePercent", query = "SELECT s FROM Sales s WHERE s.decreasePercent = :decreasePercent")})
public class Sales implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "sale_id")
    private Integer saleId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "content_sale")
    private String contentSale;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "decrease_percent")
    private String decreasePercent;

    public Sales() {
    }

    public Sales(Integer saleId) {
        this.saleId = saleId;
    }

    public Sales(Integer saleId, Date startDate, Date endDate, String contentSale, String decreasePercent) {
        this.saleId = saleId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contentSale = contentSale;
        this.decreasePercent = decreasePercent;
    }

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getContentSale() {
        return contentSale;
    }

    public void setContentSale(String contentSale) {
        this.contentSale = contentSale;
    }

    public String getDecreasePercent() {
        return decreasePercent;
    }

    public void setDecreasePercent(String decreasePercent) {
        this.decreasePercent = decreasePercent;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (saleId != null ? saleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sales)) {
            return false;
        }
        Sales other = (Sales) object;
        if ((this.saleId == null && other.saleId != null) || (this.saleId != null && !this.saleId.equals(other.saleId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.cp2296f02_group2onlineshoppingsystem.entities.Sales[ saleId=" + saleId + " ]";
    }
    
}
