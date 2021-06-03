package com.example.Project1.controllers;


import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.Project1.models.RecipeModel;
import com.example.Project1.models.User;
import com.example.Project1.services.UserService;
import com.example.Project1.validators.UserValidator;





@Controller
public class RecipeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator userValid;
	
	@GetMapping("")
	public String index(@ModelAttribute("userObj")User emptyUser) {
		return "index.jsp";
	}
	
	@GetMapping("login")
	public String log(@ModelAttribute("userObj")User emptyUser) {
		return "login.jsp";
	}
	
	@GetMapping("/register")
	public String test(
			@ModelAttribute("userObj")User emptyUser) {
		return "register.jsp";
	}
	
	
	 @GetMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/login";
	 }
	
	@PostMapping("/registration")
	public String register(
			@Valid @ModelAttribute("userObj") User filledUser, BindingResult results,
			HttpSession session
	) {
		userValid.validate(filledUser,results );
		if(results.hasErrors()) {
			return "register.jsp";
		}
		else {
			User newUser = userService.registerUser(filledUser);
			session.setAttribute("user_id", newUser.getId());
			return "redirect:/chef";
		}
	}
	
	@PostMapping("/loggingon")
	public String login(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes
	) {
		if(userService.authenticateUser(email, password)) {
			User user = userService.findByEmail(email);
			session.setAttribute("user_id", user.getId());
			 return "redirect:/chef";
		}
		else {
			redirectAttributes.addFlashAttribute("error", "Username/Password didnt match our records");
			return "redirect:/login";
		}
	}

	
//	Recipe Routes
	
	@GetMapping("/chef")
	public String ramsey(
			Model model, HttpSession session
			) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/register";
		}
		 List<RecipeModel> recipes = userService.allRecipes();
	     model.addAttribute("recipe", recipes);
	     User chef = userService.findUserById((Long) session.getAttribute("user_id"));
	     model.addAttribute("user", chef);
		 return "mynameachef.jsp";
	}
	
	@GetMapping("/cookbook")
	public String recipeList(
			@ModelAttribute("recipeObj") RecipeModel allRecipes,
			Model model, HttpSession session
			) {
//		Long user_id = (Long) session.getAttribute("user_id");
//		model.addAttribute("user_id", user_id);
		model.addAttribute("recipes", userService.allRecipes());
		return "list.jsp";
	}
	
	@GetMapping("/recipe/{id}")
	public String details(
			@PathVariable("id") Long id, Model model, HttpSession session
			) {
		RecipeModel recipeObj = userService.findRecipe(id);
		model.addAttribute("recipes", recipeObj);
		model.addAttribute("users", recipeObj.getRname());
		return "info.jsp";
	}
	
	@GetMapping("/testkitchen")
	public String cookItUp(@ModelAttribute("newRecipe") RecipeModel recipeObj, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/register";
		}
		return "create.jsp";
	}
	
	
	@PostMapping("/createrecipe")
	public String createShow(@Valid @ModelAttribute("newRecipe") RecipeModel recipeObj, Model model,
			BindingResult results, HttpSession session) {
		if (results.hasErrors()) {
			System.out.println("Did not create recipe");
			return "create.jsp";
		} else {
			userService.createRecipe(recipeObj);
			System.out.println("Created recipe");
			return "redirect:/chef";
		}
	}


	@GetMapping("/recipes/{id}/delete")
	public String dropShow(
			@PathVariable("id") Long id) {
		userService.deleteRecipe(id);
		return "redirect:/chef";
	}
	
	@GetMapping("/recipe/{id}/edit")
	public String editShow(
			@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/register";
		}
		RecipeModel recipe = userService.findRecipe(id);
		model.addAttribute("recipes", recipe);
		Long user_id = (Long) session.getAttribute("user_id");
		model.addAttribute("user_id", user_id);
		return "update.jsp";
	}
	
	@PutMapping("/recipe/{id}/update")
	public String updateShow(@Valid @ModelAttribute("recipes")RecipeModel recipeObj,
			BindingResult results, Model model, @PathVariable("id") Long id) {
		if (results.hasErrors()) { 
			return "update.jsp";
		} else {
			userService.createRecipe(recipeObj);
			return "redirect:/recipe/" + id;
	}

}
	
	
}