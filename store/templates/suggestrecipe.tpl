{include file="_top.tpl"}

<h1>Suggest a Recipe</h1>

 <div class="form-container">
  <p class="legend"><strong>Note:</strong> * Indicates a required field</p>

  <form method="post" action="index.php" name="checkout" class="form-horizontal"> 
  <input type="hidden" name="action" value="SuggestRecipe">

 <fieldset>

  <legend>Recipe Information</legend>

  <div>
   <label for="first_name"><span class="req">*</span> First Name:</label>
    <input type="text" name="first_name" class="form-control" value="{$valid.first_name}" size="30" maxlength="50">
  </div>

  <div>
   <label for="XXXX"><span class="req">*</span> Last Name:</label>
   <input type="text" name="last_name" class="form-control" value="{$valid.last_name}" size="30" maxlength="50">
  </div>

  <div>
   <label for="XXXX"><span class="req">*</span> Email Address:</label>
   <input type="text" name="email" value="{$valid.email}" class="form-control" size="30" maxlength="255">
  </div>

  <div>
   <label for="XXXX"><span class="req">*</span> Title:</label>
   <input type="text" name="title" value="{$valid.title}" class="form-control" size="30" maxlength="50">
  </div>

  <div>
   <label for="XXXX"><span class="req">*</span> Recipe:</label>
   <textarea name="recipe" rows="7" cols="25" class="form-control">{$valid.recipe}</textarea>
  </div>

  <div class="controlset">
   <span class="label">&nbsp;</span>
   <label for="opt_out">I would like to receive email updates.</label>
  </div>

  <div class="controlset">
   <span class="label">&nbsp;</span>
   <label for="opt_out">
    <input type="radio" name="opt_out" value="n" checked="checked"> Yes
    <input type="radio" name="opt_out" value="y"> No
   </label>
  </div>

 </fieldset>

 <div class="buttonrow">
  <input type="hidden" name="to" value="{#form_suggestrecipe_to#}">
  <input type="hidden" name="from" value="{#form_suggestrecipe_from#}">
  <input type="submit" name="submit" value="Submit" class="btn btn-default" />
 </div>

 </form>

</div>

{include file="_bottom.tpl"}
