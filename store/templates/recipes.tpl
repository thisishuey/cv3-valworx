{include file="_top.tpl"}

<div class="pull-right">
  <button onClick="window.location='/suggestrecipe'" class="btn btn-default">Submit a Recipe</button>
</div>

<div class="page-header">
  <h1>Recipes</h1>
</div>

{include file="recipe_search.tpl"}

{if $type == 'search'}
  <div class="row">
    <div class="col-md-12">
      <p class="lead">Your search returned {$recipes.num_recipes} recipes</p>
      <a href="/recipes">View all Recipes</a>
    </div>
  </div>
{/if}

{foreach from=$recipes.recipes item=category}
  {cycle values="on,off" assign=bg name=bg}
  <div class="row {$bg}">
    <div class="col-md-12">
      <h3><a href="/recipe_category/{$category.id}">{$category.name|stripslashes}</a></h3>
      {foreach from=$category.recipes item=recipe}
        <div><a href="/recipe_view/{$recipe.rec_id}">{$recipe.title|stripslashes}</a></div>
      {/foreach}
    </div>
  </div>
{/foreach}

<div class="pull-right">
  <button onClick="window.location='/suggestrecipe'" class="btn btn-default">Submit a Recipe</button>
</div>

{include file="_bottom.tpl"}