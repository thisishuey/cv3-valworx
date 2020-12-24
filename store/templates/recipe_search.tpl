<div class="row">
  <div class="col-md-12">
    <form method="post" action="index.php" name="recipeform" class="form-inline">
      <h3>Recipe Search</h3>
     <input type="hidden" name="action" value="RecipeSearch">
     <input type="hidden" name="fields" value="title,recipe,ingredients">
     <input type="hidden" name="andor" value="or">
     <div class="form-group">
       <label for="keyword" class="sr-only">Recipe Search Keyword</label>
       <input type="text" class="form-control" name="keyword" value="" placeholder="Search by Keyword" >
     </div>
     <input type="submit" name="submit" value="Search" class="btn btn-default">
    </form>
  </div>
</div>