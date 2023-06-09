/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author minhthuy
 */
@Entity
@Table(name = "Order_Product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderProduct.findAll", query = "SELECT o FROM OrderProduct o"),
    @NamedQuery(name = "OrderProduct.findById", query = "SELECT o FROM OrderProduct o WHERE o.id = :id"),
    @NamedQuery(name = "OrderProduct.findByQuantity", query = "SELECT o FROM OrderProduct o WHERE o.quantity = :quantity"),
    @NamedQuery(name = "OrderProduct.findByProductId", query = "SELECT o FROM OrderProduct o WHERE o.productId = :productId"),
    @NamedQuery(name = "OrderProduct.findByOrderId", query = "SELECT o FROM OrderProduct o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "OrderProduct.findByProductPrice", query = "SELECT o FROM OrderProduct o WHERE o.productPrice = :productPrice")})
public class OrderProduct implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_id")
    private int productId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_id")
    private int orderId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_price")
    private long productPrice;
     @Column(name = "status_review")
    private int statusReview;
    
    public OrderProduct() {
    }

    public OrderProduct(Integer id) {
        this.id = id;
    }

    public OrderProduct(Integer id, int quantity, int productId, int orderId, long productPrice) {
        this.id = id;
        this.quantity = quantity;
        this.productId = productId;
        this.orderId = orderId;
        this.productPrice = productPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(long productPrice) {
        this.productPrice = productPrice;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderProduct)) {
            return false;
        }
        OrderProduct other = (OrderProduct) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.cp2296f02_group2onlineshoppingsystem.entities.OrderProduct[ id=" + id + " ]";
    }

    public int getStatusReview() {
        return statusReview;
    }

    public void setStatusReview(int statusReview) {
        this.statusReview = statusReview;
    }
    
}
