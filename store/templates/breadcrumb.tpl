{if $view == category || $view == 'prod_detail_list'}
    <div id="breadcrumb">
    <a href="/">Home</a><span class="separator">/</span>{if $cid != 's' && $cid != 'p' && $cid != 'r' && $cid != 'o' && $cid != 'n' && $cid != 'f' && $cid != 'e' && $cid != 'w' && $cid != 'b'  && $cid != 'rp'}{if $categories.$cid.all_parents.0 != ''}{include file="breadcrumb_recur.tpl" cat_id=$categories.$cid.all_parents.0}{/if}{$categories.$cid.name|replace:"& ":"&amp; "}{elseif $cid == 'p'}Shop by Price{elseif $cid == 'r'}Shop by Rating{elseif $cid == 'f'}Search Results{elseif $cid == 's' && $products.keyword == ''}Search Results{elseif $cid == 'rp'}Rewards Program{else}results for "{$products.keyword|stripslashes|replace:"& ":"&amp; "}"{/if}
    </div>
{elseif ($view == product || $view == product_builder) && $cid != '341'}
    <div id="breadcrumb">
    <a href="/">Home</a><span class="separator">/</span>{if $cid != 's' && $cid != 'p' && $cid != 'r' && $cid != 'f'}{if $categories.$cid.all_parents.0 != ''}{include file="breadcrumb_recur.tpl" cat_id=$categories.$cid.all_parents.0}{/if}<a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}">{if $cid == 'rp'}Rewards Program{else}{$categories.$cid.name|replace:"& ":"&amp; "}{/if}</a><!-- <span class="separator">/</span>{$product.prod_name|replace:"& ":"& "} -->{elseif $cid == 'p'}Shop by Price{elseif $cid == 'r'}Shop by Rating{elseif $cid == 'f'}Search Results{elseif $cid == 's' && $products.keyword == ''}Search Results{else}results for "{$products.keyword|stripslashes|replace:"& ":"&amp; "}"{/if}
    </div>
{elseif $view == index}
{** CUSTOMER SERVICE **}
{elseif $view == 'aboutus' || $view == 'contact' || $view == 'why_choose_valworx' || $view == 'ordering' || $view == 'payment' || $view == 'shipping' || $view == 'returns' || $view == 'warranty' || $view == 'privacy' || $view == 'terms-and-conditions' || $view == 'careers'}
       <div id="breadcrumb">
        <a href="/" title="valworx">Home</a><span class="separator">/</span><a href="/category/customer-service" title="valworx customer service">Customer Service</a><span class="separator">/</span>{$common_name|capitalize:true}
    </div>
{** TECH SUPPORT **}
{elseif $view == 'how_does_it_work' || $view == 'faqs' || $view == 'technical_resources' || $view == 'comparison' || $view == 'installation_instructions' || $view == 'troubleshooting' || $view == 'cad_drawings' || $view == 'safety' || $view == 'data_sheets'|| $view == 'videos'|| $view == 'approvals_certifications'||$view == 'protips'}
        <div id="breadcrumb">
            <a href="/" title="valworx">Home</a><span class="separator">/</span><a href="/category/technical-support" title="actuated valves tech support">Technical Support</a><span class="separator">/</span>{$common_name|capitalize:true}
        </div>
{** VIDEOS **}
{elseif $view == 'videos'}
  <div id="breadcrumb">
    <a href="/" title="valworx">Home</a>&nbsp;/&nbsp;<a href="/videos">Product Videos</a>
  </div>
{elseif $cid == '341' && $product.content_only == 'y'}
  <div id="breadcrumb">
    <a href="/">Home</a>&nbsp;/&nbsp;<a href="/videos">Product Videos</a>&nbsp;/&nbsp;{$product.prod_name|replace:"& ":"&amp; "}
  </div>
{elseif $view == site_map}
    {if $bc_cat != ''}
        <div id="breadcrumb">
        <a href="/">Home</a><span class="separator">/</span><a href="/site_map">Site Map</a>{if $categories.$bc_cat.all_parents.0 != ''}{include file="site_map_breadcrumb_recur.tpl" cat_id=$categories.$bc_cat.all_parents.0}{/if}
        </div>
    {else}
        <div id="breadcrumb">
        <a href="/">Home</a><span class="separator">/</span>{$view|replace:'_':' '}
        </div>
    {/if}
{elseif $view == recipe_view}
    <div id="breadcrumb">
    <a href="/recipes">Recipes</a><span class="separator">/</span>
    <a href="/recipe_category/{$recipe.id}">{$recipe.name|stripslashes}</a><span class="separator">/</span>
    {$recipe.title|stripslashes}
    </div>
{elseif $view == recipe_category}
    <div id="breadcrumb">
    <a href="/recipes">Recipes</a><span class="separator">/</span>{$recipe_category} 
    </div>
{else}
    <div id="breadcrumb" class="checkout_hide">
    <a href="/">Home</a><span class="separator">/</span>{$view|replace:'_':' '}
    </div>
{/if}