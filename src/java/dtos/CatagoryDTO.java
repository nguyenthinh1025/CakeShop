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
public class CatagoryDTO {

    private String catagoryID;
    private String catagoryName;

    public CatagoryDTO() {
    }

    public CatagoryDTO(String catagoryID, String catagoryName) {
        this.catagoryID = catagoryID;
        this.catagoryName = catagoryName;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getCatagoryName() {
        return catagoryName;
    }

    public void setCatagoryName(String catagoryName) {
        this.catagoryName = catagoryName;
    }
}
