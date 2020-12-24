{*** CHILD PRODUCTS PRICE RANGE ***}
{if $p.is_parent == 'y'}{* array_debug var=$p *}
 {assign var="tmpSpecial" value='1'}
 {counter assign="childNums" name="childNums" start=0 step=1}
 {assign var="arPrices" value=""}
 {if $view == 'category' || $view == 'prod_detail_list' || $view == 'product' || $view == 'index'}
   {if $view != 'index'}
	{assign var='child' value=$p.children}
   {else}
	{assign var='child' value=$p.child_prices}
   {/if}
 {else}
   {assign var='child' value=$p.child_prices}
 {/if}
 {foreach from=$child item=child}
  {if $childNums == 0}
   {assign var="minSpecial" value="0"}
   {assign var="maxSpecial" value="0"}
   {assign var="minPrice" value="0"}
   {assign var="maxPrice" value="0"}
   {assign var="minPoints" value="0"}
   {assign var="maxPoints" value="0"}
   {assign var="child_special_ongoing" value="n"}
  {/if}

 {*if ($child.stock_status == 'In Stock' || ($child.stock_status == 'Backordered' && $child.backordered_date != '')) && $product.outseason != 'y' && $child.outseason != 'y'*}
      {*if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($child.inventory_control > $child.out_of_stock_point || $child.on_order > 0 || ($child.stock_status == 'Backordered' && $child.backordered_date != '')))*}
  {if $arPrices == ''}
   {assign var="arPrices" value=$child.price|replace:"$":""}
  {else}
   {assign var="arPrices" value="$arPrices,"|cat:$child.price|replace:"$":""}
  {/if}
  {if $child.price > $maxPrice && $child.price != $minPrice && $minPrice != '0'}
   {assign var="maxPrice" value=$child.price|replace:"$":""}
  {/if}
  {if $child.price < $minPrice || $minPrice == '0'}
   {assign var="minPrice" value=$child.price|replace:"$":""}
  {/if}
  {if $child.rewards_points > $maxPoints && $child.rewards_points != $minPoints && $minPoints != '0'}
   {assign var="maxPoints" value=$child.rewards_points}
  {/if}
  {if $child.rewards_points < $minPoints || $minPoints == '0'}
   {assign var="minPoints" value=$child.rewards_points}
  {/if}
  {if $child.special_price == '' || $child.special_price == "0.00" || $child.special != 'y'}
   {assign var="tmpSpecial" value="0"}
  {/if}
  {if $child.special_ongoing || ($child.special_start|strtotime < $smarty.now && $child.special_stop|strtotime > $smarty.now)}
   {assign var="child_special_ongoing" value="y"}
  {/if}
{*/if*}
{*/if*}
  {counter assign="childNums" name="childNums"}
 {/foreach}

 {* Set subproduct price ranges *}
 
 {if $child_special_ongoing == 'y'}
   {assign var="child_minPrice" value="0"}
   {assign var="child_maxPrice" value="0"}
   {assign var="child_minSpecial" value="0"}
   {assign var="child_maxSpecial" value="0"}

   {foreach from=$p.children item=child}  {* TODO?  Wholesale price_category = $child.prices.2.standard_price *}
	 {assign var="retailPrice" value=$child.prices.1.standard_price|replace:"$":""}
	 {if $retailPrice < $child_minPrice || $child_minPrice == "0"}
   	   {assign var="child_minPrice" value=$retailPrice|replace:"$":""}
  	 {/if}
	 {if $retailPrice > $child_maxPrice || $child_maxPrice == "0"}
   	   {assign var="child_maxPrice" value=$retailPrice|replace:"$":""}
  	 {/if}
	 {if $child.special_ongoing == "y" || ($child.special_start|strtotime < $smarty.now && $child.special_stop|strtotime > $smarty.now)}
	 	{assign var="specialPrice" value=$child.prices.1.special_price|replace:"$":""}
	 {else}
	 	{assign var="specialPrice" value=$child.prices.1.standard_price|replace:"$":""}
	 {/if}
	 {if $specialPrice < $child_minSpecial || $child_minSpecial == "0"}
   	   {assign var="child_minSpecial" value=$specialPrice|replace:"$":""}
  	 {/if}
	 {if $specialPrice > $child_maxSpecial || $child_maxSpecial == "0"}
   	   {assign var="child_maxSpecial" value=$specialPrice|replace:"$":""}
  	 {/if}
   {/foreach}
 {/if}
 
 {if $arPrices != ''}
  {assign var="arPrices" value=","|explode:$arPrices}
 {/if}
 
 {if $arPrices|@count > 1}
   {$arPrices|@sort_array:sort}
   {assign var="minPrice" value=$arPrices.0}
   {assign var="maxPrice" value=$arPrices|@end}
 {/if}

 {*** PRINTED PRICES ***}
 {if $p.rewards_program == 'y'}
   Rewards Points: {$minPoints}{if $maxPrice != '0' && $maxPrice != $minPrice}&ndash;{$maxPoints}{/if}
 {else}
   {if ($p.special == 'y' && $child_special_ongoing == 'y')} {* && ($minSpecial != $minPrice || $maxSpecial != $maxPrice) *}
     <del>{$currency_type}{$child_minPrice|commify}{if $child_maxPrice != '0' && $child_maxPrice != $child_minPrice}&ndash;{$currency_type}{$child_maxPrice|commify}{/if}</del><br />
     <span class="sale-price">{$currency_type}{$child_minSpecial|commify}{if $child_maxSpecial != '0' && $child_maxSpecial != $child_minSpecial}&ndash;{$currency_type}{$child_maxSpecial|commify}{/if}</span>
   {else}
     <span class="price-label">Price:</span> {$currency_type}{$minPrice|commify}{if $maxPrice != '0' && $maxPrice != $minPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if}
   {/if}
 {/if}

{*** ATTRIBUTE PRICE RANGE ***}
{elseif $p.has_attributes == 'y'}
 {*** ATTRIBUTE PRICES ARE NOT AVAILABLE TO THE HOME PAGE OR RELATED PRODUCTS ***}
 {if $view == 'index' || ($view == 'product' && $label == 'Related Products') || ($view == 'viewcart' && $label == 'Related Products')}

  {if $p.standard_price != '0' && $p.standard_price != ''}
   {if $p.special == 'y' && $p.standard_price != $p.price}
    <del>{$currency_type}{$p.standard_price|commify}</del></span><br />
    <span class="sale-price">{$currency_type}{$p.special_price|commify}</span>
   {else}
    <span class="price-label">Price:</span> {$currency_type}{$p.standard_price|commify}
   {/if}
  {else}
   <div class="more-link"><a href="{$url}">View Product Options &gt;</a></div>
  {/if}

 {*** SIMPLE PRICE RANGE FOR CATEGORY PAGE ***}
 {elseif $view == category || $view == prod_detail_list}

  {assign var="attPrices" value="y"}
  {foreach from=$p.attributes.attributes item=attribute key=key}
   {if $attribute.standard_price == 0 || $attribute.standard_price == '' || $attribute.standard_price == 0.00}
    {assign var="attPrices" value="n"}
   {/if}
  {/foreach}
  {assign var="minPrice" value="999999"}
  {assign var="maxPrice" value="0"}
  {assign var="sminPrice" value="999999"}
  {assign var="smaxPrice" value="0"}
  {assign var="allAttSpecial" value=1}
  {assign var="minSpecial" value="0"}
  {assign var="maxSpecial" value="0"}
  {assign var="range" value="0"}
  {assign var="factorinparent" value=0}
  {if $settings.prod_details_on_category == 'y'}
  {foreach from=$p.attributes.attributes item=attribute key=key}
    {if $p.attributes.num > 1}
      {foreach from=$attribute.dependents item=attribute2 key=key2}
        {if $p.attributes.num > 2}
          {foreach from=$attribute2.dependents item=attribute3 key=key3}
            {if $p.attributes.num > 3}
              {foreach from=$attribute3.dependents item=attribute4 key=key4}
                {if $attribute4.price > $maxPrice}
                  {assign var="maxPrice" value=$attribute4.price}
                {/if}
                {if $attribute4.price != '' && isset($attribute4.price) && $attribute4.price < $minPrice}
                  {assign var="minPrice" value=$attribute4.price}
                {/if}
                {if $attribute4.standard_price > $smaxPrice}
                  {assign var="smaxPrice" value=$attribute4.standard_price}
                {/if}
                {if $attribute4.standard_price != '' && isset($attribute4.price) && $attribute4.standard_price < $sminPrice}
                  {assign var="sminPrice" value=$attribute4.standard_price}
                {/if}
                {if !isset($attribute4.price)}
                  {assign var="factorinparent" value=1}
                {/if}
              {/foreach}
            {else} {* just 3 attys *}
              {if $attribute3.price > $maxPrice}
                {assign var="maxPrice" value=$attribute3.price}
              {/if}
              {if $attribute3.price != '' && isset($attribute3.price) && $attribute3.price < $minPrice}
                {assign var="minPrice" value=$attribute3.price}
              {/if}
              {if $attribute3.standard_price > $smaxPrice}
                {assign var="smaxPrice" value=$attribute3.standard_price}
              {/if}
              {if $attribute3.standard_price != '' && isset($attribute3.price) && $attribute3.standard_price < $sminPrice}
                {assign var="sminPrice" value=$attribute3.standard_price}
              {/if}
              {if !isset($attribute3.price)}
                {assign var="factorinparent" value=1}
              {/if}
            {/if}
          {/foreach}
        {else} {* just 2 attys *}
          {if $attribute2.price > $maxPrice}
            {assign var="maxPrice" value=$attribute2.price}
          {/if}
          {if $attribute2.price != '' && isset($attribute2.price) && $attribute2.price < $minPrice}
            {assign var="minPrice" value=$attribute2.price}
          {/if}
          {if $attribute2.standard_price > $smaxPrice}
            {assign var="smaxPrice" value=$attribute2.standard_price}
          {/if}
          {if $attribute2.standard_price != '' && isset($attribute2.price) && $attribute2.standard_price < $sminPrice}
            {assign var="sminPrice" value=$attribute2.standard_price}
          {/if}
          {if !isset($attribute2.price)}
            {assign var="factorinparent" value=1}
          {/if}
        {/if}
      {/foreach}
    {else} {* just 1 atty *}
      {if $attribute.price > $maxPrice}
        {assign var="maxPrice" value=$attribute.price}
      {/if}
      {if $attribute.price != '' && isset($attribute.price) && $attribute.price < $minPrice}
        {assign var="minPrice" value=$attribute.price}
      {/if}
      {if $attribute.standard_price > $smaxPrice}
        {assign var="smaxPrice" value=$attribute.standard_price}
      {/if}
      {if $attribute.standard_price != '' && isset($attribute.price) && $attribute.standard_price < $sminPrice}
        {assign var="sminPrice" value=$attribute.standard_price}
      {/if}
      {if !isset($attribute.price)}
       {assign var="factorinparent" value=1}
      {/if}
    {/if}
  {/foreach}

  {if $factorinparent == 1}
    {if $p.price < $minPrice}
      {assign var="minPrice" value=$p.price}
    {/if}
    {if $p.price > $maxPrice}
      {assign var="maxPrice" value=$p.price}
    {/if}
  {/if}
{if $factorinparent == 0}
   {* special at attribute level*}
  {if ($sminPrice != $minPrice || $smaxPrice != $maxPrice) }
    <span class="prefix_was"></span><del>{$currency_type}{$sminPrice|commify}{if $sminPrice != $smaxPrice}&ndash;{$currency_type}{$smaxPrice|commify}{/if}</del><br />   
  {/if}
   {* special at parent level*}
{elseif $p.special == 'y' && ($p.special_price < $p.standard_price)}
    <span class="prefix_was"></span><del>{$currency_type}{$p.standard_price|commify}</del><br />   
{/if}
{if $factorinparent == 0 && ($sminPrice != $minPrice || $smaxPrice != $maxPrice) || ($p.special == 'y' && ($p.special_price < $p.standard_price))}
  <span class="sale-price" id="saleprice_{$p.prod_id}">{$currency_type}{$minPrice|commify}{if $minPrice != $maxPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if}</span> <br />
{else}
  <span class="origprice" id="origprice_{$p.prod_id}">{$currency_type}{$minPrice|commify}{if $minPrice != $maxPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if}</span> <br />
{/if}

  {else} {* no prod details available, use parent price if possible *}
    {if $p.price > 0}
      <span class="origprice" id="origprice_{$p.prod_id}">{$currency_type}{$p.price|commify}</span> <br />
    {else}
      <span class="origprice" id="origprice_{$p.prod_id}">View for pricing</span> <br />
    {/if}
  {/if}

 {elseif $view == product }

  {assign var="attPrices" value="n"}
  {foreach from=$attributes.attributes item=attribute key=key}
   {if $attribute.standard_price >= 0 && $attribute.standard_price != ''}
    {assign var="attPrices" value="y"}
   {/if}
  {/foreach}
  {assign var="minPrice" value="0"}
  {assign var="maxPrice" value="0"}
  {assign var="allAttSpecial" value=1}
  {assign var="minSpecial" value="0"}
  {assign var="maxSpecial" value="0"}
  {assign var="range" value="0"}
  {assign var="minPoints" value="0"}
  {assign var="minPoints" value="0"}

  {if $p.has_attributes == 'y' && $attPrices == 'y'}
   {foreach from=$attributes.attributes item=attribute key=key}
    {if $p.rewards_program == 'y' && $attribute.status != 'discontinued' && $attribute.rewards_points > $maxPoints}
     {assign var="maxPoints" value=$attribute.rewards_points}
    {/if}
    {if $attribute.status != 'discontinued' && $attribute.price > $maxPrice}
     {assign var="maxPrice" value=$attribute.price}
    {/if}
    {if $attribute.status != 'discontinued' && ($attribute.price < $minPrice || $minPrice == '0')}
     {assign var="minPrice" value=$attribute.price}
    {/if}
    {if $attribute.status != 'discontinued' && ($attribute.rewards_points < $minPoints || $minPoints== '0')}
     {assign var="minPoints" value=$attribute.rewards_points}
    {/if}
    {if $attribute.special == 'y'}
     {if $attribute.standard_price > $maxSpecial}
      {assign var="maxSpecial" value=$attribute.standard_price}
     {/if}
     {if $attribute.standard_price < $minSpecial || $minSpecial == '0'}
      {assign var="minSpecial" value=$attribute.standard_price}
     {/if}
    {/if}
    {if $attribute.special != 'y'}
     {assign var="allAttSpecial" value=0}
    {/if}
   {/foreach}
   {if $p.attributes.attributes|@count == 0}
    {assign var="allAttSpecial" value=0}	
   {/if}

   {*** PRINTED PRICES ***}
   {if $minPrice != $maxPrice}
    {if $maxSpecial != $maxPrice && $maxSpecial != '0'}
     <span class="prefix_was"></span><del> <span class="origprice" id="origprice_{$p.prod_id}">{$currency_type}{$minSpecial|commify}{if $minSpecial != $maxSpecial}&ndash;{$currency_type}{$maxSpecial|commify}{/if}</span></del>
     <del>{$currency_type}{$minSpecial|commify}{if $minSpecial != $maxSpecial}&ndash;{$currency_type}{$maxSpecial|commify}{/if}</del>{/if}
     <input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{$currency_type}{$minPrice|commify}{if $minPrice != $maxPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if}" readonly="readonly" onfocus="this.blur()" />
   {else}
    {if $p.special == 'y' && $p.standard_price != $p.price}<del>{$currency_type}{$p.standard_price|commify}</del>{/if}
    <input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{$currency_type}{if $p.min_qty > 1}{math equation="x*y" x=$p.price y=$p.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$p.price|commify}{/if}" readonly="readonly" onfocus="this.blur()" />
   {/if}

  {elseif $p.has_attributes == 'y' && $attPrices != 'y'}
   {foreach from=$attributes.attributes item=attribute key=key}
    {foreach from=$attribute.dependents item=dependent key=dkey}
     {if $dependent.status != 'discontinued' && $dependent.price > $maxPrice}
      {assign var="maxPrice" value=$dependent.price}
     {/if}
     {if $dependent.status != 'discontinued' && ($dependent.price < $minPrice || $minPrice == '0') && $dependent.price!=""}
      {assign var="minPrice" value=$dependent.price}
     {/if}
     {if $p.rewards_program == 'y' && $dependent.status != 'discontinued' && $dependent.rewards_points > $maxPoints}
      {assign var="maxPoints" value=$dependent.rewards_points}
     {/if}
     {if $p.rewards_program == 'y' && $dependent.status != 'discontinued' && ($dependent.rewards_points < $minPoints || $minPoints== '0')}
      {assign var="minPoints" value=$dependent.rewards_points}
     {/if}
     {if $dependent.special == 'y'}
      {if $dependent.standard_price > $maxSpecial}
       {assign var="maxSpecial" value=$dependent.standard_price}
      {/if}
      {if $dependent.standard_price < $minSpecial || $minSpecial == '0'}
       {assign var="minSpecial" value=$dependent.standard_price}
      {/if}
     {/if}
     {if $dependent.special != 'y'}
      {assign var="allAttSpecial" value=0}
     {/if}
    {/foreach}
   {/foreach}

   {*** PRINTED PRICES ***}
   {if $p.rewards_program && $cid == 'rp'}
     Reward Points: <input type="text" class="dynamic_qty reward" id="price_{$prod_id}" value="{$minPoints}{if $minPoints != $maxPoints}&ndash;{$maxPoints}{/if}" readonly="readonly" onfocus="this.blur()" />
   {else}
     {if ($minPrice != $maxPrice || $minSpecial != $maxSpecial) && ($minPrice != '' || $minPrice != 0 || $minPrice != 0.00)}
      {if $maxSpecial != $maxPrice && $maxSpecial != '0'}
       <del>{$currency_type}{$minSpecial|commify}{if $minSpecial != $maxSpecial}&ndash;{$currency_type}{$maxSpecial|commify}{/if}</del>
       <input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{$currency_type}{$minPrice|commify}{if $minPrice != $maxPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if}" readonly="readonly" onfocus="this.blur()" />
      {else}
       <input type="text" class="dynamic_qty sale_price" id="origprice_{$p.prod_id}"{$currency_type}{$minPrice|commify}{if $minPrice != $maxPrice}&ndash;{$currency_type}{$maxPrice|commify}{/if} />
       <input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $minPrice == $maxPrice}{$currency_type}{$maxPrice|commify}{else}{$currency_type}{$minPrice|commify}&ndash;{$currency_type}{$maxPrice|commify}{/if}" readonly="readonly" onfocus="this.blur()" />
      {/if}
     {else}
      <del id="sprice_{$prod_id}"></del>
      {if $p.prod_id == $prod_id}
        <span class="price-label">Price:</span><input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{$currency_type}{if $p.min_qty > 1}{math equation="x*y" x=$p.price y=$p.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{*$p.price|commify*}{/if}" {*readonly="readonly"*} onfocus="this.blur()" />
       <script type="text/javascript">
         $(document).ready(function() {ldelim}
           if(minPrice != maxPrice){ldelim}
             $("#price_{$prod_id}").val('{$currency_type}' + minPrice + '-' + '{$currency_type}' + maxPrice);
           {rdelim}else{ldelim}
             $("#price_{$prod_id}").val('{$currency_type}' + minPrice);
           {rdelim}

           if(sminPrice != minPrice || smaxPrice != maxPrice){ldelim}
             if(sminPrice != smaxPrice){ldelim}
               $("#sprice_{$prod_id}").html('{$currency_type}' + sminPrice + '-' + '{$currency_type}' + smaxPrice);
             {rdelim}else{ldelim}
               $("#sprice_{$prod_id}").val('{$currency_type}' + sminPrice);
             {rdelim}
           {rdelim}else{ldelim}
             $("#sprice_{$prod_id}").hide();
           {rdelim}

         {rdelim});
       </script>
      {else}
        <span class="price-label">Price:</span> <input type="text" class="dynamic_qty{if $p.special == 'y' && $p.is_donation != 'y'} sale-price{elseif $p.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" {if $p.price > 0}value="{$currency_type}{if $p.min_qty > 1}{math equation="x*y" x=$p.price y=$p.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$p.price|commify}{/if}"{else}value="View for pricing"{/if} readonly="readonly" onfocus="this.blur()" />
      {/if}
     {/if}
   {/if}
 

  {/if}

 {/if}
 
{/if}