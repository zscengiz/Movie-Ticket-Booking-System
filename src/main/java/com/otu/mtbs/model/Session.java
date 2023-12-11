/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.model;

public class Session {
    
    private Integer id;
    private Integer movieId;
    private Integer saloonId;
    private String movieName;

    public Session() {
    }

    public Session(Integer id, Integer movieId, Integer saloonId) {
        this.id = id;
        this.movieId = movieId;
        this.saloonId = saloonId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getSaloonId() {
        return saloonId;
    }

    public void setSaloonId(Integer saloonId) {
        this.saloonId = saloonId;
    }
    
    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
    
    public String getMovieName() {
        return movieName;
    }

    
    
}
