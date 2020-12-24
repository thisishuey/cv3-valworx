{***PRODUCT TABS***}
{*<!-- {array_debug var=$product} -->*}

<div class="clearfix"></div>
<div id="product_tabs">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
      {if $product.prod_description}<li id='section1_tab' role="presentation" class='active'><a href="#section1_tab_{$product.prod_id}" role="tab" data-toggle="tab">Description</a></li>{/if}
        {if $product.cust_5}<li id='section2_tab' role="presentation"><a href="#section2_tab_{$product.prod_id}" role="tab" data-toggle="tab">Specifications</a></li>{/if}
        {if $product.additional_prods|@count > 0 && $product.cust_17 !=''}<li id='section3_tab' role="presentation"><a href="#section3_tab_{$product.prod_id}" role="tab" data-toggle="tab">Accessories</a></li>{/if}
        {if $product.cust_6}<li id='section4_tab' role="presentation"><a href="#section4_tab_{$product.prod_id}" role="tab" data-toggle="tab">Data Sheets</a></li>{/if}
        {if $product.cust_7}<li id='section5_tab' role="presentation"><a href="#section5_tab_{$product.prod_id}" role="tab" data-toggle="tab">CAD</a></li>{/if}
        {if $product.cust_8}<li id='section6_tab' role="presentation"><a href="#section6_tab_{$product.prod_id}" role="tab" data-toggle="tab">Video</a></li>{/if}
        {if $product.additional_prods|@count > 0 && $product.cust_12 !=''}<li id='section7_tab' role="presentation"><a href="#section7_tab_{$product.prod_id}" role="tab" data-toggle="tab">Repair Parts</a></li>{/if}
    </ul>

    <!-- Tab panes -->
    <div class="tab-content tab_data_container">
        <div role="tabpanel" class="tab-pane active" id="section1_tab_{$product.prod_id}">
            {if $product.prod_description}{$product.prod_description}{/if}
        </div>
        {if $product.cust_5} 
        <div role="tabpanel" class="tab-pane" id="section2_tab_{$product.prod_id}">
          {assign var=customfive value="<BR><BR>"|explode:$product.cust_5}
            <div id="spectable">
            {assign var='rowcounter' value="oddrow"}
            {foreach from=$customfive key=key item=fiveinfo}
             <div class="{$rowcounter} row">
              <div class="col-xs-4 col-sm-3"><strong>{$fiveinfo|replace:"|":"</div><div class='col-xs-8 col-sm-9'></strong>"}</div>
             </div>
            {if $rowcounter == "oddrow"}
             {assign var=rowcounter value="evenrow"}
            {else}
             {assign var=rowcounter value="oddrow"}
            {/if}
            {/foreach} 
            </div> 
        </div>
      {/if} 
      {if $product.additional_prods|@count > 0 && $product.cust_17 !=''}
        <div role="tabpanel" class="tab-pane" id="section3_tab_{$product.prod_id}">
           {include file="display_product_group_additional.tpl" label="Additional Products" products=$product.additional_prods max=10 fromoption="additionalproducts" mainpId=$product.prod_id}
        </div>
      {/if}
      {if $product.cust_6}
        <div role="tabpanel" class="tab-pane" id="section4_tab_{$product.prod_id}">
            {$product.cust_6}
        </div>
      {/if}
      {if $product.cust_7}
        <div role="tabpanel" class="tab-pane" id="section5_tab_{$product.prod_id}">
            {$product.cust_7}
        </div>
      {/if}
      {if $product.cust_8}
        <div role="tabpanel" class="tab-pane video" id="section6_tab_{$product.prod_id}">
            <div id="video">{$product.cust_8}</div>
        </div>
      {/if}
      {if $product.additional_prods|@count > 0 && $product.cust_12 !=''}
        <div role="tabpanel" class="tab-pane" id="section7_tab_{$product.prod_id}">
            {include file="display_product_group_additional.tpl" label="Related Additional Products" products=$product.additional_prods max=10 fromoption="additionalproductsforrepairparts" mainpId=$product.prod_id}            

        </div>
      {/if}
    </div>

</div>
{*** TAB JS MOVED TO extra-js.tpl ***}