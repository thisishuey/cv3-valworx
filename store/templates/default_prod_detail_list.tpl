{if $print == "y"}
 {include file="print_top.tpl"}
{else}
 {include file="_top.tpl"}
{/if}

{include file="catbreadcrumb.tpl"}<br>

{if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
 <h3>{$categories.$cid.name}</h3><br>
 {include file="catcascmenu.tpl"}

 {if $categories.$cid.image != ''}
  <img src="{$categories.$cid.image|img_prefix}" alt="{$categories.$cid.name}">
 {/if}

{else}
 <h3>Search Results</h3><br>
 {if $products.error != ''}
    <div class="normaltext">{$products.error}</div>
 {/if}
{/if}

{if $print != "y" && $products.data|@count != ''}
  <div class="normaltext">
   {include file="category_filter.tpl}<br />
   {*include file="category_sort.tpl}
   {include file="prods_per_page.tpl*}
  </div>
{/if}

{if $compare}
<div align="right">
  <form method="post" action="index.php">
    <input type="hidden" name="action" value="CompareProducts" />
    <input type="hidden" id="compare_ids" name="prod_ids" value="" />
    <input type="submit" value="Compare Selected" class="addtocart_btn btnstyle2" />
  </form>
</div>
{/if}

{if $print != "y" && $products.data|@count != ''}
 <div class="sort_area">
 <table width="100%" cellspacing="0" cellpadding="0">
  <tr>
   <td align="left">{include file="category_sort.tpl"}</td>
   <td align="left">{include file="prods_per_page.tpl"}</td>
  {if $products.total > #category_num_displayed# && $var2 != 'a'}
   <td align="right">{include file="prevnextmenu.tpl"}</td>
  {/if}
  </tr>
 </table>
 </div>
{/if}


{foreach from=$products.data item=product}
{if $product.cid > 0}
  {assign var="prodcid" value=$product.cid}
  {assign var="prod_id" value=$product.prod_id}
{else}
  {assign var="prodcid" value=$cid}
{/if}
 {assign var="prod_id" value=$product.prod_id}
 {assign var="results" value=$product.recipes}
 {assign var="attributes" value=$attys.$prod_id}
 {assign var="valid" value=$valid.$prod_id}

{if $product.build_product != 'y' && $product.content_only != 'y'}
{include file="product_main.tpl"}

<form method="post" name="product_form" action="index.php" style="margin:0;padding:0;">
<input type="hidden" name="action" value="AddCart">

  {include file="gc_send.tpl"}

  {assign var="custom_form_num" value=$product.form_id}
  {assign var="custom_form" value=$custom_forms.$custom_form_num}
  {include file="custom_form.tpl"}

  {if $product.is_parent != 'y' && $product.gift_set != 'y'}

  {include file="prodparent.tpl"}

  {elseif $product.gift_set != 'y'}

  {if $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) }
    {include file="prodchild2.tpl"}
  {else}
    {include file="prodchild.tpl"}
  {/if}

  {elseif $product.gift_set == 'y'}

{include file="prodgiftset.tpl"}

  {/if}
</form>
{else}
 {include file="content_product.tpl"}
{/if}

<br><hr noShade size="1"><br>

{/foreach}

{if $compare}
<div align="right">
  <form method="post" action="index.php">
    <input type="hidden" name="action" value="CompareProducts" />
    <input type="hidden" id="compare_ids_2" name="prod_ids" value="" />
    <input type="submit" value="Compare Selected" class="addtocart_btn btnstyle2" />
  </form>
</div>
{/if}

{if $settings.sub_category_display == 'y'}
 {include file="sub_cat_detail_list.tpl"} 
{/if}

{include file="prevnextmenu.tpl"}

{include file="related_cats.tpl"}

{if $print == "y"}
 {include file="print_bottom.tpl"}
{else}
 {include file="_bottom.tpl"}
{/if}
