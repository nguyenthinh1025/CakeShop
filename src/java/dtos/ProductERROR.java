/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author Phu Thinh
 */
public class ProductERROR {

    private String productIDERROR;
    private String productNameERROR;
    private String imageERROR;
    private String descriptionERROR;
    private String createDateERROR;
    private String expirationDateERROR;
    private int quantityERROR;
    private float priceERROR;
    private String catagoryIDERROR;

    public ProductERROR() {
        this.productIDERROR = "";
        this.productNameERROR = "";
        this.imageERROR = "";
        this.descriptionERROR = "";
        this.createDateERROR = "";
        this.expirationDateERROR = "";
        this.quantityERROR = 0;
        this.priceERROR = 0;
        this.catagoryIDERROR = "";

    }

    public ProductERROR(String productIDERROR, String productNameERROR, String imageERROR, String descriptionERROR, String createDateERROR, String expirationDateERROR, int quantityERROR, float priceERROR, String catagoryIDERROR) {
        this.productIDERROR = productIDERROR;
        this.productNameERROR = productNameERROR;
        this.imageERROR = imageERROR;
        this.descriptionERROR = descriptionERROR;
        this.createDateERROR = createDateERROR;
        this.expirationDateERROR = expirationDateERROR;
        this.quantityERROR = quantityERROR;
        this.priceERROR = priceERROR;
        this.catagoryIDERROR = catagoryIDERROR;
    }

    public String getProductIDERROR() {
        return productIDERROR;
    }

    public void setProductIDERROR(String productIDERROR) {
        this.productIDERROR = productIDERROR;
    }

    public String getProductNameERROR() {
        return productNameERROR;
    }

    public void setProductNameERROR(String productNameERROR) {
        this.productNameERROR = productNameERROR;
    }

    public String getImageERROR() {
        return imageERROR;
    }

    public void setImageERROR(String imageERROR) {
        this.imageERROR = imageERROR;
    }

    public String getDescriptionERROR() {
        return descriptionERROR;
    }

    public void setDescriptionERROR(String descriptionERROR) {
        this.descriptionERROR = descriptionERROR;
    }

    public String getCreateDateERROR() {
        return createDateERROR;
    }

    public void setCreateDateERROR(String createDateERROR) {
        this.createDateERROR = createDateERROR;
    }

    public String getExpirationDateERROR() {
        return expirationDateERROR;
    }

    public void setExpirationDateERROR(String expirationDateERROR) {
        this.expirationDateERROR = expirationDateERROR;
    }

    public int getQuantityERROR() {
        return quantityERROR;
    }

    public void setQuantityERROR(int quantityERROR) {
        this.quantityERROR = quantityERROR;
    }

    public float getPriceERROR() {
        return priceERROR;
    }

    public void setPriceERROR(float priceERROR) {
        this.priceERROR = priceERROR;
    }

    public String getCatagoryIDERROR() {
        return catagoryIDERROR;
    }

    public void setCatagoryIDERROR(String catagoryIDERROR) {
        this.catagoryIDERROR = catagoryIDERROR;
    }

}
