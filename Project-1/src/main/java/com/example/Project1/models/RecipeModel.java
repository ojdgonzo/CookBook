package com.example.Project1.models;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
//import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;



@Entity
@Table(name="recipes")
public class RecipeModel {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message="Name cannot be empty")
    private String rname;
	@NotEmpty(message="Your recipe cannot be empty and must be more than 10 characters")
	@Size(min=10)
    private String description;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
//    @ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(
//        name = "users_recipes", 
//        joinColumns = @JoinColumn(name = "recipe_id"), 
//        inverseJoinColumns = @JoinColumn(name = "user_id")
//    )
//    private List<User> chefs;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="chef_id")
    private User chef;
    
    
//    potentially add a method in the repository



	public RecipeModel() {
    }
	
	
	public RecipeModel(String rname, String description) {
		super();
		this.rname = rname;
		this.description = description;
	}
	
	
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


	public Long getId() {
		return id;
	}


	public String getRname() {
		return rname;
	}


	public String getDescription() {
		return description;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setRname(String rname) {
		this.rname = rname;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public User getChef() {
		return chef;
	}


	public void setChef(User chef) {
		this.chef = chef;
	}


	

    
	
	
    
    
    

}
