{include file="_top.tpl"}

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

{include file="display_product_group.tpl" label="Related Products" products=$recipe.prods max=4}

{include file="_bottom.tpl"}