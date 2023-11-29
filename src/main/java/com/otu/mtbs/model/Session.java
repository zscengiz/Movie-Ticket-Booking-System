/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.model;

/**
 *
 * @author zcengiz
 */
public class Session {
    
    private String id;
    private String movieId;
    private String saloonId;

    public Session() {
    }

    public Session(String id, String movieId, String saloonId) {
        this.id = id;
        this.movieId = movieId;
        this.saloonId = saloonId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getSaloonId() {
        return saloonId;
    }

    public void setSaloonId(String saloonId) {
        this.saloonId = saloonId;
    }

    
    
    
    
}
