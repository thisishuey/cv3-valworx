{*
  use: product block for ship-to in order confirmation email
  provided to Bronto in: %%#ship_prods_#%%
  data provided: email_confirmation variable $shipping.*.prods 
*}
{if $type == 'order_confirm_prods'}
<table style="width:100%;border:none;">
  <tr>
    <td style="text-align:center;font-weight:bold;background-color:grey;">
      Qty
    </td>
    <td style="text-align:center;font-weight:bold;background-color:grey;">
      Item #
    </td>
    <td style="text-align:center;font-weight:bold;background-color:grey;">
      Product Description
    </td>
    <td style="text-align:center;font-weight:bold;background-color:grey;">
      Price
    </td>
  </tr>
  {foreach from=$prods item=prod}
    <tr>
      <td style="text-align:center;">
        {$prod.qty}
      </td>
      <td style="text-align:center;">
        {if $prod.att_sku == ''}
          {assign var="prod_sku" value=$prod.sku}
        {else}
          {assign var="prod_sku" value=$prod.att_sku}
        {/if}
        {$prod_sku}
      </td>
      <td style="text-align:center;">
        {$prod.name}
        {if $prod.gifts|@count > 0}
          {foreach from=$prod.gifts key=i item=glist}
            {if $glist != ''}
              <br />* {$glist}
            {/if}
          {/foreach}
        {/if}
        {if $prod.note != ''}
          <br />Note: {$prod.note}
        {/if}
        {if $prod.att_list != ''}
          {$prod.att_list}
        {/if}
      </td>
      <td style="text-align:center;">
        {$currency_type}{$prod.price|commify}
      </td>
    </tr>
  {/foreach}
</table>

{*
  use: custom data for a ship-to
  provided to Bronto in: %%#ship_extra_#%%
  data provided: email_confirmation variable $shipping.*
*}
{elseif $type == 'order_confirm_ship_extra'}

{*
  use: custom data for entire order
  data provided: all email_confirmation variables
*}
{elseif $type == 'order_confirm_extra'}

{/if}
