{include file="_top.tpl"}

<div class="page-header">
  <h1>{$recipe_category}</h1>
</div>

<div class="row">
  <div class="col-md-12">
    <h3>Recipe Name</h3>
    <dl class="dl-horizontal">
      {foreach from=$recipes key=key item=recipe}
        {cycle values="on,off" assign=bg name=bg}
        <dt><a href="/recipe_view/{$recipe.rec_id}">{$recipe.title|stripslashes}</a></dt>
        <dd>
        {foreach from=$recipe.products item=product}
          {assign var="prodcat" value=$product.prod_category}
          <a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcat.url_name != ''}{$categories.$prodcat.url_name}{else}$product.prod_category{/if}">{$product.prod_name}(sku#{$product.sku})</a><br />
        {/foreach}
        </dd>
    {/foreach}
    </dl>
  </div>
</div>

{include file="_bottom.tpl"}