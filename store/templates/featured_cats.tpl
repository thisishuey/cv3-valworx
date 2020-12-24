{*************************
 * available variables:
 *  $acat.cat_id
 *  $acat.url_name
 *  $acat.cat_name
 *  $acat.cat_description
 *  $acat.image
 *************************}

{if $featured_cats|@count > 0}
{assign var=fcat_displayed value="6"}
<section id="featured_categories" class="clearfix">
<header>
  <div id="cap"><h2>Featured Categories</h2></div>
</header>
<ul class="pad_tp20 pdd_rt0 pdd_lt0 col-lg-12 col-sm-12 col-md-12 col-xs-12">
  {counter start=1 assign=fcat_num}
  {foreach from=$featured_cats item=acat}
    {if $fcat_num <= $fcat_displayed}
      <li class="col-lg-3 col-md-4 col-sm-6 col-xs-6 mar_btm">
        <div class='thumb-product'>
          <div class='image'><a href="/{$prod_display_type}/{if $acat.url_name != ''}{$acat.url_name}{else}{$acat.cat_id}{/if}"><img src="{$acat.image|img_prefix}" alt="{$acat.cat_name}" /></a></div>
          <div class='info'>
            <div class='name'><a href="/{$prod_display_type}/{if $acat.url_name != ''}{$acat.url_name}{else}{$acat.cat_id}{/if}">{$acat.cat_name}</a></div>
          </div>
        </div>
      </li>
      {counter assign=fcat_num}
    {/if}
  {/foreach}
</ul>
</section>
{/if}