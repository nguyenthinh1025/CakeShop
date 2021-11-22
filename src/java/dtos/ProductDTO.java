/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author Phu Thinh
 */
public class ProductDTO implements Serializable {

    private String productID;
    private String productName;
    private String image;
    private String description;
    private String createDate;
    private String expirationDate;
    private int quantity;
    private float price;
    private String catagoryID;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, String image, String description, String createDate, String expirationDate, int quantity, float price, String catagoryID) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.description = description;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
        this.quantity = quantity;
        this.price = price;
        this.catagoryID = catagoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

}
