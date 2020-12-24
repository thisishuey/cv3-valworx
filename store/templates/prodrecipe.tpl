{if $results.list == 'y'}
 {foreach from=$results.recipes key=key item=recipe}
  <a href="javascript:void(0);" onclick="javascript:window.open('/recipe/{$key}/{$prod_id}|{$cid}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes,resizable=yes');">{$recipe|stripslashes}</a><br />
 {/foreach}
{/if}