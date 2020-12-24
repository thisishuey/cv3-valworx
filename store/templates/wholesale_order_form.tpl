{include file="_wholesaletop.tpl"}

  <h2>Wholesale Order Form</h2>

  <form method="post" action="index.php" name="checkout"> 
    <input type="hidden" name="action" value="WholesaleOrder">
    <table width="100%"  border="0" cellspacing="0" cellpadding="3" class="wholesaleMainTable table-striped">
      {* $wholesale_info *}
      {counter start=0 name=count assign=id}
      {assign_global var="has_printed" value=""}
      {assign_global var="parent_skus" value=""}
      {assign_global var="child_skus" value=""}
      {foreach from=$categories key=cid item=category}
        {if $wholesale_info.$cid.prod_count > 0}
          <thead>
          <tr class="wholesaleCategoryRow">
            <td colspan="5" align="left" class="wholesaleMainCatRow">
              {$category.name}
            </td>
          </tr>
          <tr class="wholesaleProductTitleRow">
            <td width="60%" align="left">
              Product
            </td>
            <td align="center">
              Item Code
            </td>
            <td align="center">
              Qty (cases)
            </td>
            <td align="center">
              Unit
            </td>
            <td align="center">
              Case
            </td>
          </tr>
          </thead>
        {/if}
        <tbody>
        {foreach from=$wholesale_info.$cid.prods key=key item=product}
          {include file="wholesale_product.tpl"}
        {/foreach}
        {foreach from=$category.sub_cats key=scat_key item=scat_id}
          {get_global var="has_printed"}
          {if !preg_match("/\|$scat_id\|/",$has_printed)}
            {assign_global var="has_printed" value=$has_printed|cat:"|$scat_id||$cid|"}
            {include file="wholesale_subcat.tpl" scat_id=$scat_id parent=$cid}
          {/if}
        {/foreach}
        {counter assign="count"}
        </tbody>
      {/foreach}
      <tr>
        <td colspan="5" align="center">
          <input type="submit" name="submit" value="Continue" class="button medium style1 btn btn-default">  
        </td>
      </tr>
    </table>
  </form>

{include file="_wholesalebottom.tpl"}
