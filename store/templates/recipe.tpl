{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}
<body id="{$view}" class="popup">

<div class="page-header">
  <h1>{$recipe.title|stripslashes}</h1>
</div>

<div class="row">
  <div class="col-md-12">
    <div class="pull-right"><img src="{$recipe.image|img_prefix}" class="img-responsive img-thumbnail"></div>
    <h3>Ingredients:</h3>
    <ul>
      {foreach from=$recipe.ingredients item=ingredient}
        <li>
          {$ingredient.amount}&nbsp;{if $ingredient.measurement != 'none'}{$ingredient.measurement}&nbsp;{/if}{$ingredient.description|stripslashes}
        </li>
      {/foreach}
    </ul>
    <h3>Directions:</h3>
    <div>{$recipe.recipe|stripslashes}</div>
  </div>
</div>

{*
<div class="recipeinfo">
 <b>Ingredients:</b>
 {if $recipe.image}<img src="{$recipe.image|img_prefix}">{/if}
 <ul>
 {foreach from=$recipe.ingredients item=ingredient}
  <li>
   {$ingredient.amount}&nbsp;{if $ingredient.measurement != 'none'}{$ingredient.measurement}&nbsp;{/if}{$ingredient.description|stripslashes} 
  </li>
 {/foreach}
 </ul>
 <br />
 <b>Directions:</b><br />{$recipe.recipe|stripslashes}<br />
 <br />
</div>
*}

<div class="pull-left">
 <button onClick="window.print();" class="btn btn-default">Print</button>
 <button onClick="window.location='/tellfriend/{$prod_id}/{$cat_id}'" class="btn btn-default">Send to a Friend</button>
 <button onClick="window.close();" class="btn btn-primary">Close Window</button>
</div>

</body>
</html>