{config_load file="store.conf" scope="global"}
<html>
    {include file="_meta.tpl"}
    <body id="{$view}" class="popup">
        <div class="container">
<hr class="text-center">{$type|ucfirst}</hr>

{if $type == 'products'}
{if $result}
<table width="100%" border="0" cellpadding="3" cellspacing="0">
  <tr bgcolor="{$smarty.config.color_header_row}">
    <th align="center" class="headerRow">
       <b>Product</b>
    </th>
    <th align="center" class="headerRow">
       <b>SKU</b>
    </th>
    <th align="center" class="headerRow">
       <b>Qty</b>
    </th>
    <th align="center" class="headerRow">
       <b>Total Price</b>
    </th>
   </tr>
   {foreach from=$result.prods item=list}
     <tr bgcolor="{cycle values="`$smarty.config.color_row`,`$smarty.config.color_row_alt`"}">
         <td class="normaltext">
            {$list.prod_name}
         </td>
         <td align="center" class="normaltext">
            {$list.sku}
         </td>
         <td align="center" class="normaltext">
            {$list.qty}
         </td>
         <td align="center" class="normaltext">
            {$currency_type}{$list.price|string_format:"%.2f"}
         </td>
      </tr>
   {/foreach}
   <tr bgcolor="{cycle values="`$smarty.config.color_row`,`$smarty.config.color_row_alt`"}">
      <td>
        <b>Total:</b>
      </td>
      <td align="center" class="normaltext">
        &nbsp;
      </td>
      <td align="center" class="normaltext">
        {$result.totals.qty}
      </td>
      <td align="center" class="normaltext">
         {$currency_type}{$result.totals.price|string_format:"%.2f"}
      </td>
   </tr>
</table>
{/if}
{elseif $type == 'destinations'}
{if $result}
<table width="100%" border="0" cellpadding="3" cellspacing="0">
  <tr bgcolor="{$smarty.config.color_header_row}">
    <th align="center" class="headerRow">
       <b>View</b>
    </th>
    <th align="center" class="headerRow">
       <b>Hits</b>
    </th>
   </tr>
   {foreach from=$result key=view item=hits}
     <tr bgcolor="{cycle values="`$smarty.config.color_row`,`$smarty.config.color_row_alt`"}">
         <td class="normaltext" align="center">
            {$view}
         </td>
         <td align="center" class="normaltext">
            {$hits}
         </td>
      </tr>
   {/foreach}
</table>
{/if}
{/if}
        </div>
    </body>
</html>