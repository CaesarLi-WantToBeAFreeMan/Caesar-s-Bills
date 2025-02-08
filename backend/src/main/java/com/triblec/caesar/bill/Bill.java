package com.triblec.caesar.bill;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "bills")
public class Bill{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String item;
    private BigDecimal price;
    private LocalDate date;

    //getters
    public Long getId(){
        return id;
    }

    public String getItem(){
        return item;
    }

    public BigDecimal getPrice(){
        return price;
    }

    public LocalDate getDate(){
        return date;
    }

    //setters
    public void setId(Long id){
        this.id = id;
    }

    public void setItem(String item){
        this.item = item;
    }

    public void setPrice(BigDecimal price){
        this.price = price;
    }

    public void setDate(LocalDate date){
        this.date = date;
    }
}