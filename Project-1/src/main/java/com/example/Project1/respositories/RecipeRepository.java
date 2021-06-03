package com.example.Project1.respositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.example.Project1.models.RecipeModel;



@Repository
public interface RecipeRepository extends CrudRepository<RecipeModel, Long> {
	List<RecipeModel> findAll();

}
