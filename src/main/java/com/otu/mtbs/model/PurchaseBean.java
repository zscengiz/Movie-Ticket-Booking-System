/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.model;

/**
 *
 * @author zcengiz
 */
public class PurchaseBean {

    private Integer id;
    private Integer userId;
    private Integer sessionId;
    private String movieName;
    private Integer quantity;
    private Integer seatNumber;

    public PurchaseBean() {

    }

    public PurchaseBean(Integer id, Integer userId, Integer sessionId, String movieName, Integer quantity, Integer seatNumber) {
        this.id = id;
        this.userId = userId;
        this.sessionId = sessionId;
        this.movieName = movieName;
        this.quantity = quantity;
        this.seatNumber = seatNumber;
    }

    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(Integer seatNumber) {
        this.seatNumber = seatNumber;
    }

}
