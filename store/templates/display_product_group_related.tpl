{if $products|@count > 0}
    {if !$max}
        {assign var=max value=999}
    {/if}
    {* this $group reassignment puts the array into an ordered list,
    rather than having the prod_id as the key.
    This is needed for the section loop to function properly.
    *}
    {assign var=products value=$products|@array_values}

    <section{if $label} id="{$label|replace:' ':'_'|lower}"{/if} class="clearfix">
        {if $label}
        	{if $label != 'Additional Products'}
            <header>
                <h2>{if $label == 'Recently Viewed'}Recently Viewed Items{else}{if $label=='RelatedProductsForFloatingCart'}Commonly Purchased Together{else}{$label}{/if}{/if}</h2>
            </header>
            {/if}
        {/if}
        <ul{if $label != 'Recently Viewed'} class="row"{/if}>
            {section name=tmp_id loop=$products max=$max}
                <li {if $label != 'Recently Viewed'}class="col-md-3 col-sm-6 col-xs-12 mar_btm"{/if}>{include file="display_miniproduct.tpl" p=$products[$smarty.section.tmp_id.index]}</li>
            {/section}
        </ul>
    </section>
{/if}