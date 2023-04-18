package entity;

import java.sql.Date;

public class Item {

    private Long id;
    private String name;
    private String description;
    private Double price;
    private Integer sold;
    private Long categoryId;
    private Date date;

    public Item() {
    }

    public Item(Long id, String name, String description, Double price, Integer sold, Long categoryId, Date date) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.sold = sold;
        this.categoryId = categoryId;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getSold() {
        return sold;
    }

    public void setSold(Integer sold) {
        this.sold = sold;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
