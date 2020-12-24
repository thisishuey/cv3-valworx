{include file="_top.tpl"}

<h1>Compare Products</h1>
<br />
{if $products|@count > 0}
{if $compare_error != ''}<div align="center"><span class="normaltext" style="color: red;">{$compare_error}</span></div><br />{/if}
{assign var="fields" value="prod_name,web_image,price,rating,review_data,remove_compare"|array}
{assign var="field_labels" value="Name,Image,Price,Rating,Reviews,Remove"|array}
<form name="compare">
<table class="table">
{section loop=$fields|@count step=1 name="compare_products"}
  <tr>
  {assign var="index" value=$smarty.section.compare_products.index}
  {assign var="ar_key" value=$fields.$index}
  
    <td style="width: 50px;" class="normaltext" align="right" />
      {if $ar_key != 'prod_name'}<b>{$field_labels.$index}:</b>{else}&nbsp;{/if}
    </td>
  {foreach from=$products item=product key=key}
    <{if $ar_key == 'prod_name'}th{else}td{/if}>
      {if $ar_key == 'web_image'}
        <img class="img-responsive" src="{if $product.$ar_key == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.$ar_key|img_prefix}{/if}" width="138" alt="{$product.prod_name}" />
      {else}
        {if $ar_key == 'prod_name'}
          <b>{$product.$ar_key}</b>
        {elseif $ar_key == 'rating'}
          {if $product.reviews.num > 0}
            {assign var="rating" value=$product.reviews.rating}
            {section loop=$rating_max step=1 name="rating_loop"}
              {if $rating < .13}
                <img src="{$img_prefix}/images/rating000.png" style="display:inline;" />
              {elseif $rating < .38}
                <img src="{$img_prefix}/images/rating025.png" style="display:inline;" />
              {elseif $rating < .63}
                <img src="{$img_prefix}/images/rating050.png" style="display:inline;" />
              {elseif $rating < .88}
                <img src="{$img_prefix}/images/rating075.png" style="display:inline;" />
              {else}
                <img src="{$img_prefix}/images/rating100.png" style="display:inline;" />
              {/if}
              {math equation="x-1" x=$rating assign="rating"}
            {/section}
          {else}
            No Rating
          {/if}
        {elseif $ar_key == 'review_data'}
          {if $product.reviews.num > 0}
            <a href="/view_reviews/{$product.prod_id}/{if $product.url_name != ''}{$product.url_name}{/if}">Customer Reviews ({$product.reviews.num})
          {else}
            No Customer Reviews
          {/if}
        {elseif $ar_key == 'remove_compare'}
          <input type="checkbox" name="remove_compare_{$product.prod_id}" value="{$product.prod_id}" />
        {else}
            {*ar_key == price*}
            {if $product.special == 'y' && $product.standard_price > $product.special_price}<del>${*$currency_type*}{$product.standard_price|commify:2}</del><span class="sale-price"> ${*$currency_type*}{$product.special_price|commify:2}</span>
            {else}
            <span>{if is_numeric($product.standard_price)}${*$currency_type*}{/if}{$product.standard_price|commify:2}</span>
            {/if} 
            
        {/if}
      {/if}
    </{if $ar_key == 'prod_name'}th{else}td{/if}>
  {/foreach}
  </tr>
{/section}
</table>
</form>
{else}
  {if $compare_error != ''}
    <div align="center"><span class="normaltext" style="color: red;">{$compare_error}</span></div><br />
  {else}
    <span class="normaltext">You haven't selected any products to compare!</span>
  {/if}
{/if}

<div class="row mar_btm">
  <div class="col-xs-6">
<input type="button" name="continue_shopping" value="&lt; Continue Shopping" onclick="javascript: parent.location='{$continue_shopping}';" class="btn btn-default pull-right" />
</div>

  {if $products|@count > 0}
<div class="col-xs-6">
    <input type="button" name="remove_selected" value="Remove Selected" class="btn btn-default" onclick="javascript: removeCompareProducts();" />
</div>
  {/if}
</div>
      
{include file="_bottom.tpl"}
