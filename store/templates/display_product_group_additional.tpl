{if $products|@count > 0}
    {if !$max}
        {assign var=max value=999}
    {/if}
    {* this $group reassignment puts the array into an ordered list,
    rather than having the prod_id as the key.
    This is needed for the section loop to function properly.
    *}
    {assign var=products value=$products|@array_values}
    {* Set additional_prods_skus so we can access by sku easily *}
        {set var=$additional_prods_skus value=array()}
        {foreach from=$product.additional_prods key=key item=prod}
          {assign var='addsku' value=$prod.sku}
          {set var=$additional_prods_skus.$addsku value=$prod}
        {/foreach}

       
    <section{if $label} id="{$label|replace:' ':'_'|lower}"{/if} class="clearfix">
        {if $label}
        	{if $label != 'Additional Products'}
            <header>
                <h2>{if $label == 'Recently Viewed'}Recently Viewed Items{else}{$label}{/if}</h2>
            </header>
            {/if}
        {/if}
        <ul{if $label != 'Recently Viewed'} class="row"{/if}>
        
            {*<!-- {section name=tmp_id loop=$products max=$max} -->*}
            {assign var=prodsku value=$products[$smarty.section.tmp_id.index].sku}
             
           
                {* For accessories display *}
               {if $fromoption=='additionalproducts'  && $label=='Additional Products'}
                {assign var='cust_17' value=','|explode:$product.cust_17}
                {foreach from=$cust_17 item=addsku}
                  {assign var='addsku' value=$addsku|trim}
                  {assign var='display_product_accessories' value=$additional_prods_skus.$addsku}

                  <li {if $label != 'Recently Viewed'}class="col-md-3 col-sm-6 col-xs-12 mar_btm"{/if}>{include file="display_miniproduct.tpl" p=$display_product_accessories prddisplay="show"}</li>

                {/foreach}
                 
                  
                {/if}

                {* For repair display *}
                {if $fromoption=='additionalproductsforrepairparts'  && $label=='Related Additional Products'}
                
                    {assign var='cust_12' value=','|explode:$product.cust_12}
                    {foreach from=$cust_12 item=addsku}
                      {assign var='addsku' value=$addsku|trim}
                      {assign var='display_product' value=$additional_prods_skus.$addsku}
                      <li {if $label != 'Recently Viewed'}class="col-md-3 col-sm-6 col-xs-12 mar_btm"{/if}>{include file="display_miniproduct.tpl" p=$display_product prddisplay="show"}</li>

                    {/foreach}
                {/if}

            {*<!-- {/section} -->*}
        </ul>
    </section>
{/if}