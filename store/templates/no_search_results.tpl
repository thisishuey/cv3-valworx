<h1>Sorry!</h1>

Your search for "{$products.keyword}" returned no matching results.
<br /><br />
You can try searching again with more specific terms...
<br /><br />

   <form method="post" action="index.php" name="searchform" class="form-inline" onsubmit="if (searchform.keyword.value=='Item # or Keywords') searchform.keyword.value='';">
    <input type="hidden" name="action" value="Search" />
    <input type="hidden" name="page" value="category" />
    <input type="hidden" name="search_type" value="prodcat" />
    <!-- <input type="hidden" name="category" value="4" />
    <input type="hidden" name="category_andor" value="and" /> -->
    <input type="text" name="keyword" id="search_keyword" class="form-control" value="{if isset($products.keyword) && $products.keyword != ''}{$products.keyword|stripslashes|replace:'"':'&quot;'}{else}Item # or Keywords{/if}" onfocus="javascript: if (this.value=='Item # or Keywords') this.value='';" onblur="if (this.value=='') this.value='Item # or Keywords';" {if $use_suggested_search == 'y'}onkeyup="javascript:suggestedSearchSniff(event,'suggested_search','Product_Ext_Class','getSuggestedSearch',this);" autocomplete="off"{/if} />
    <input type="submit" name="submit" value="Search" class="btn btn-default" />
   </form>

<br /><br />


 {include file="display_product_group.tpl" products=$best_sellers label='Best Sellers' max="10"}

 {*include file="best_sellers.tpl"*}