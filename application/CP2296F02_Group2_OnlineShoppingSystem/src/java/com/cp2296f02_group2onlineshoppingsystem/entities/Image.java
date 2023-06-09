/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author minhthuy
 */
@Entity
@Table(name = "Image")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Image.findAll", query = "SELECT i FROM Image i"),
    @NamedQuery(name = "Image.findByImageproductId", query = "SELECT i FROM Image i WHERE i.imageproductId = :imageproductId"),
    @NamedQuery(name = "Image.findByNameFile", query = "SELECT i FROM Image i WHERE i.nameFile = :nameFile"),
    @NamedQuery(name = "Image.findByProductId", query = "SELECT i FROM Image i WHERE i.productId = :productId")})
public class Image implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "image_product_Id")
    private Integer imageproductId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "name_file")
    private String nameFile;
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_id")
    private int productId;

    public Image() {
    }

    public Image(Integer imageproductId) {
        this.imageproductId = imageproductId;
    }

    public Image(Integer imageproductId, String nameFile, int productId) {
        this.imageproductId = imageproductId;
        this.nameFile = nameFile;
        this.productId = productId;
    }

    public Integer getImageproductId() {
        return imageproductId;
    }

    public void setImageproductId(Integer imageproductId) {
        this.imageproductId = imageproductId;
    }

    public String getNameFile() {
        return nameFile;
    }

    public void setNameFile(String nameFile) {
        this.nameFile = nameFile;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imageproductId != null ? imageproductId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Image)) {
            return false;
        }
        Image other = (Image) object;
        if ((this.imageproductId == null && other.imageproductId != null) || (this.imageproductId != null && !this.imageproductId.equals(other.imageproductId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.cp2296f02_group2onlineshoppingsystem.entities.Image[ imageproductId=" + imageproductId + " ]";
    }
    
}
