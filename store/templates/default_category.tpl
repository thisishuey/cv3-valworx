{include file="_top.tpl"}

<section id="cat">
    {if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
      <header><h1>{$categories.$cid.name|replace:"& ":"&amp; "}</h1></header>
        <div class="cat-desc-wrapper">
          <div class="row">
            {if $categories.$cid.image}
              <div class="col-xs-3 hidden-xs">
                <div class="cat-img">
                    <img src="{$categories.$cid.image}" alt="{$categories.$cid.name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="img-responsive center-block">
                </div>
              </div>
            {/if}
            <div class="{if $categories.$cid.image}col-xs-12 col-sm-9{else}col-xs-12{/if}">
              {if $categories.$cid.images.2.image}<img src="{$categories.$cid.images.2.image}" alt="{$categories.$cid.images.2.title}" class="cat-desc-img"/><br />{/if}
              {if $categories.$cid.cat_description}<div class="cat-desc">{$categories.$cid.cat_description|replace:"& ":"&amp; "}</div>{/if}
            </div>
          </div>
        </div>
      
    
    {else}
      {if $products.data|@count < '1'}
        {include file="no_search_results.tpl"}
      {else}
        <header><h1>Search Results</h1></header>
      {/if}
    {/if}

{if $products.error}<div class='error'>{$products.error}</div>{/if}

{if $categories.$cid.cust_3}
  <div class="cat-desc2">
    {$categories.$cid.cust_3}
  </div>
{/if}

{if $products.data|@count != ''}
  {include file="catcascmenu.tpl"}
{/if}

{*** BE SURE TO UNCOMMENT THE JAVASCRIPT IN _BOTTOM.TPL AND _META.TPL IF USING THE GRID/LIST TOGGLE ***}
{*if $products.data|@count}
    <div id="category_options" class="clearfix row">
      <div id="sort" class="col-xs-6 col-sm-4 col-md-3 col-lg-3">{include file="category_sort.tpl"}</div>
      <div id="per-page" class="col-xs-6 col-sm-4 col-md-3 col-lg-3">{include file="prods_per_page.tpl"}</div>
      <div id="toggle" class="col-xs-6 col-sm-4 col-md-1 col-lg-2 hidden-xs"><label class="hidden-md">View&nbsp;&nbsp;</label><a href="#" id="list"><img id="listImg" src="{$img_prefix}/images/list_off.png"></a>  <a href="#" id="grid"><img id="gridImg" src="{$img_prefix}/images/grid_off.png"></a></div>
      <div id="prev-next" class="col-xs-12 col-md-5 col-lg-4">{include file="prevnextmenu.tpl"}</div>
      <div id="compare">
        {if $compare}
          <form class="form-inline" method="post" action="index.php">
            <input type="hidden" name="action" value="CompareProducts" />
            <input type="hidden" id="compare_ids" name="prod_ids" value="" />
           <input type="submit" value="Compare Products" class="btn btn-default" />
         </form>
       {/if}
      </div>
    </div>
{/if*}

{if $cid  == '355' || $cid == '356' || $cid == '357' || $cid == '358' || $cid == '359' || $cid == '360' || $cid == '361'}{* PRO TIPS CATEGORIES *}
{*array_debug*}
{if $products.data|@count}
    <div class="clearfix">
     <table class="cattable table table-responsive table-sm table-xs table-striped">
     {if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
     {*<thead>  
        <tr scope='row' class='protips-row'>
         <th scope='col'>Title</th> 
         <th scope='col'>image</th> 
         <th scope='col'>Excerpt</th>
        </tr>
       </thead>*}
       <tbody>
       {foreach from=$products.data item=product}
       {cycle values="left,center,right" assign=pos name=pos}
       {*if $product.cust_10 != ''}
        <tr>
          <td scope="row" colspan="20" class="subheading">{$product.cust_10}</td>
        </tr>
       {/if*}
        <tr scope='row' class='protips-row'>
         <td scope='col' width="25%" style="text-align:left">{*<a href="/product/{$product.prod_id}">{$product.sku}</a><br>*}<a href="/product/{$product.prod_id}" class="red"><b>{$product.prod_name}</b></a></td>
    <td scope='col'><a href="/product/{$product.prod_id}"><img src="{$product.web_image}" alt="{$product.prod_name}" width="100"></a></td>
    <td scope='col' style="text-align:left">{$product.cust_20|strip_tags|escape:'html'|truncate:200}<a href="/product/{$product.prod_id}"><em>Read More</em></a></td>
{*|replace:'<h3>':'<b>'|replace:'</h3>':'</b>'*}
        </tr>
       {/foreach}
     {/if}
    </tbody>
   </table>

    </div>

  <div id="prev-next2">{include file="prevnextmenu.tpl"}</div> 

{/if}
{* END PRO TIPS CATEGORIES *}

{else}{* REGULAR CATEGORIES *}
{if $products.data|@count}
    <div class="clearfix">
     <table class="cattable table table-responsive table-sm table-xs">
     {if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
     <thead>  
        <tr scope='row'>
         <th scope='col'>Stock #</th>
         <th scope='col' class="visible-xs">Title</th> 
         <th scope='col' class="hidden-xs">Series</th>
         <th scope='col' class="hidden-xs">{$categories.$cid.cust_4|replace:",":"</th><th scope='col' class='hidden-xs'>"}</th>
         <th scope='col'>Price Each</th>
         <th scope='col'>Usually Ships</th>
        </tr>
       </thead>
       <tbody>
       {foreach from=$products.data item=product}
       {cycle values="left,center,right" assign=pos name=pos}
       {if $product.cust_10 != ''}
        <tr>
          <td scope="row" colspan="20" class="subheading">{$product.cust_10}</td>
        </tr>
       {/if}
        <tr>
         <th scope='row'><a href="/product/{$product.prod_id}" class="red">{$product.sku}</a></th>
         <td scope='col' class="visible-xs">{$product.prod_name}</td>
         <td scope='col' class="hidden-xs">{$product.cust_2}</td>
         <td scope='col' class="hidden-xs">{$product.desc_header|replace:",":"</td><th scope='col' class='hidden-xs'>"}</td>
         <td><div class='price'>
          {if $product.special == 'y'}<del>{$currency_type}{$product.standard_price|commify}</del> {$currency_type}{$product.special_price|commify}
          {else}{$currency_type}{$product.standard_price|commify}{/if}
         {* <input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="dynamic_qty{if $product.special == 'y' && $product.is_donation != 'y'} sale-price{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly" onfocus="this.blur()"{/if} /> *}
         </div></td>
         <td>{if $product.inventory_control < 1}{$product.cust_4}{else}Same Day{/if}</td>
        </tr>
       {/foreach}
     {else}
     <thead>
       <tr>
        <th>Stock #</th>
        <th class="visible-xs">Title</th>
        <th class="hidden-xs">Brand</th>
        <th class="hidden-xs">Series</th>
        <th class="hidden-xs">Mfr #</th>
        <th class="hidden-xs">Description</th>
        <th>Price Each</th>
        <th>Usually Ships</th>
       </tr>
     </thead>
     {foreach from=$products.data item=product}
     {cycle values="left,center,right" assign=pos name=pos}
     <tr>
      <th scope="row"><a href="/product/{$product.prod_id}">{$product.sku}</a></th>
      <td class="visible-xs">{$product.prod_name}</td>
      <td class="hidden-xs">{$product.cust_1}</td>
      <td class="hidden-xs">{$product.cust_2}</td>
      <td class="hidden-xs">{$product.cust_3}</td>
      <td>{$product.prod_name}</td>
      <td><div class='price'>
       {if $product.special == 'y'}<del>{$currency_type}{$product.standard_price|commify}</del> {$currency_type}{$product.special_price|commify}
       {else}{$currency_type}{$product.standard_price|commify}{/if}
       
      {* {if $product.is_donation == 'y'}{$currency_type}{/if}<input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="dynamic_qty{if $product.special == 'y' && $product.is_donation != 'y'} sale-price{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly" onfocus="this.blur()"{/if} /> *}
      </div></td>
      <td>{if $product.inventory_control < 1}{$product.cust_4}{else}Same Day{/if}</td>
     </tr>
     {/foreach}
     {/if}
    </tbody>
   </table>
    
   
       
    </div>

  <div id="prev-next2">{include file="prevnextmenu.tpl"}</div> 

{/if}
{/if}{* END REGULAR CATEGORIES *}

</section>
{include file="sub_cat_list.tpl"}
{include file="related_cats.tpl"}

{include file="_bottom.tpl"}