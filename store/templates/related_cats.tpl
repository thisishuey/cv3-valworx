{*************************
* available variables:
*  $acat.cat_id
*  $acat.url_name
*  $acat.cat_name
*  $acat.cat_description
*  $acat.image
*************************}

{if $related_cats != '' && $related_cats|@count > 0}
    <section id="related_categories" class="clearfix">
        <header><h2>Related Categories<h2></header>
                    <ul class="grid pad_tp20 pdd_rt0 pdd_lt0 col-lg-12 col-sm-12 col-md-12 col-xs-12">
                        {foreach from=$related_cats item=acat}
                            {cycle values="left,center,right" assign=pos name=pos}
                            <li class="{$pos} iefix col-lg-3 col-md-4 col-sm-6 col-xs-6 mar_btm">
                                <div class='thumb-product'>
                                    <div class='image'><a href="/{$prod_display_type}/{if $acat.url_name != ''}{$acat.url_name}{else}{$acat.cat_id}{/if}"><img src="{$acat.image|img_prefix}" alt="{$acat.cat_name}" /></a></div>
                                    <div class='info'>
                                        <div class='name'><a href="/{$prod_display_type}/{if $acat.url_name != ''}{$acat.url_name}{else}{$acat.cat_id}{/if}">{$acat.cat_name}</a></div>
                                    </div>
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                    </section>
                {/if}