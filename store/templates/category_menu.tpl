{if $forpos=='left'}
    <div id="category_menu">
        <h4 class="catmenuheader">Products</h4> 
        <div class="list-group">       
            <ul>
                {foreach from=$categories key=key item=category}
                    {if $category.parent == '' && $category.inactive != 'y'}
                        <li{if $cid == $key} class="category_top_active"{/if}>
                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" title="{$category.name|replace:"& ":"&amp; "}">{$category.name|replace:"& ":"&amp; "}</a>
                        {*{if $category.sub_cats.0 != ''}
                        {include file="cat_menu_recur.tpl" cat_id=$key prefix="sub"}
                        {/if}*}
                        </li>
                    {/if}
                {/foreach}
            </ul>
        </div>
    </div>
{else} 
    {assign var=count value=0}
    <nav>

        <h4> {if $from==1}Category Links{else} &nbsp; {/if} </h4>

        <ul>
            {foreach from=$categories key=key item=category}
                {if $category.parent == '' && $category.inactive != 'y'}
                    {assign var=count value=$count+1}
                    {if $count >= $from && $count <= $to }
                        <li{if $cid == $key} class="category_top_active"{/if}>
                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" title="{$category.name|replace:"& ":"&amp; "}">{$category.name|replace:"& ":"&amp; "}</a>
                        {*if $category.sub_cats.0 != ''}
                        {include file="cat_menu_recur.tpl" cat_id=$key prefix="sub"}
                        {/if*}
                        </li>
                    {/if}
                {/if}
            {/foreach}
        </ul>

    </nav>

{/if}
