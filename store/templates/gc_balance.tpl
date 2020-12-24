{include file="_top.tpl"}

<div class="page-header">
  <h1>Gift Certificate Balance Check</h1>
</div>

{if $result.error != ''}
  <div class="alert alert-danger" role="alert">{$result.error}</div>
{/if}

<div class="row">
  <div class="col-md-6 col-xs-12">
    <form method="post" action="index.php">
      <input type="hidden" name="action" value="CheckGCBalance" />
      <div class="form-group">
        <label for="code">Please enter your gift certificate number:</label>
        <input type="text" name="code" class="form-control" value="" />
        {if $settings.gcv_processor == 'y' && $settings.gcv_version == 'current'}
          <br/><label for="pin">Please enter your gift certificate PIN:</label> 
          <input type="password" name="gc_pin" class="form-control" value="" />
        {/if}
      </div>
      <input type="submit" value="Check Balance" class="btn btn-primary" />
    </form>
      </div>
      <div class="col-md-6 col-xs-12">
    {if is_array($result) && !isset($result.error)}
      <div class="panel panel-default">
        <div class="panel-heading">
          Code: {$result.code}
        </div>
        <div class="panel-body">
          Balance: {$currency_type}{$result.balance}
        </div>
      </div>
    {/if}
  </div>
</div>

{include file="_bottom.tpl"}