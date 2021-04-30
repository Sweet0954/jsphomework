package com.sweet.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private int id;
    private String name;
    private String author;
    private String version;
    private BigDecimal price;
    private int sales;
    private String imgPath;
    private String link;
    private String extractioncode;

    public Book(int id, String name, String author, String version, BigDecimal price) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.version = version;
        this.price = price;
    }

    public Book(String name, String author, String version, BigDecimal price, String imgPath, String link, String extractioncode) {
        this.name = name;
        this.author = author;
        this.version = version;
        this.price = price;
        this.imgPath = imgPath;
        this.link = link;
        this.extractioncode = extractioncode;
    }

    public Book(String name, String author, String version, BigDecimal price, String link, String extractioncode) {
        this.name = name;
        this.author = author;
        this.version = version;
        this.price = price;
        this.link = link;
        this.extractioncode = extractioncode;
    }
}
