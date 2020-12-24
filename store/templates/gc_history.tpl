{config_load file="store.conf" scope="global"}
<html>
  {include file="_meta.tpl"}
  <body id="{$view}" class="popup">
    <div class="page-header">
      <h1>Gift Certificate History for Code: {$history.code}<small>{$type|ucfirst}</small></h1>
    </div>
    {if $history.history|@count < 1}
      <div class="alert alert-info" role="alert">
        There were no results for your search
      </div>
    {else}
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="text-center">
              <b>Date</b>
            </th>
            <th class="text-center">
              <b>Action</b>
            </th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$history.history item=hist}
            <tr>
              <td class="text-center">
                {$hist.0}
              </td>
              <td class="text-center">
                {$hist.1}
              </td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    {/if}

  </body>
</html>

{*include file="footer.tpl"*}