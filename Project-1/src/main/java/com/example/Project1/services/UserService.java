package com.example.Project1.services;

import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Project1.models.RecipeModel;
import com.example.Project1.models.User;
import com.example.Project1.respositories.RecipeRepository;
import com.example.Project1.respositories.UserRepository;


@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	private RecipeRepository recipeRepo;
	
	public UserService(
			UserRepository userRepo,
			RecipeRepository recipeRepo) {
		this.userRepo = userRepo;
		this.recipeRepo = recipeRepo;
	}
	
	// register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
//    find user by name
    public User findByName(String username) {
    	return userRepo.findByUsername(username);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	return userRepo.findById(id).orElse(null);
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

	
//    Recipe stuff
    public RecipeModel createRecipe(RecipeModel recipe) {
    	return recipeRepo.save(recipe);
    }
    
    public List<RecipeModel> allRecipes(){
    	return recipeRepo.findAll();
    }
    
    public RecipeModel findRecipe(Long id) {
    	return recipeRepo.findById(id).orElse(null);
    }
    
    public void deleteRecipe(Long id) {
    	recipeRepo.deleteById(id);
    }
    
	
}
