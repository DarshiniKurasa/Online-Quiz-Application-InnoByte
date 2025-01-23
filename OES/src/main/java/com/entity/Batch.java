package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;  // Jakarta validation imports
import java.time.LocalDate;  // Updated to java.time.LocalDate

@Entity
@Table(name = "batchtable")
public class Batch {
    @Id
    @NotNull
    @Column(name = "batchid")
    private String batchid;

    @NotNull
    @Column(name = "batchname")
    private String batchname;

    @NotNull
    @Column(name = "addedby")
    private String addedby;

    @NotNull
    @Column(name = "date")
    private LocalDate addeddate;  // Changed to LocalDate

    // Default constructor
    public Batch() {
    }

    // Constructor with parameters
    public Batch(String batchid, String batchname, String addedby, LocalDate addeddate) {
        this.batchid = batchid;
        this.batchname = batchname;
        this.addedby = addedby;
        this.addeddate = addeddate;
    }

    // Getter and setter methods
    public String getBatchid() {
        return batchid;
    }

    public void setBatchid(String batchid) {
        this.batchid = batchid;
    }

    public String getBatchname() {
        return batchname;
    }

    public void setBatchname(String batchname) {
        this.batchname = batchname;
    }

    public String getAddedby() {
        return addedby;
    }

    public void setAddedby(String addedby) {
        this.addedby = addedby;
    }

    public LocalDate getAddeddate() {
        return addeddate;
    }

    public void setAddeddate(LocalDate addeddate) {
        this.addeddate = addeddate;
    }
}
