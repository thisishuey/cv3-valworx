{include file="_top.tpl"}

<h1>E-Party - Create Gift Certificate</h1>
<div class="mar_btm"><a href="eparty">E-Party Report</a>&nbsp;|&nbsp;<a href="eparty_plan">Plan New E-Party</a>&nbsp;|&nbsp;<a href="eparty_history">Track Gift Certificates</a>&nbsp;|&nbsp;<a href="eparty_information">Edit Account Information</a>&nbsp;|&nbsp;<a href="eparty_login/1">Log Out</a></div>

<form method="post" action="index.php" role="form"> 
  <input type="hidden" name="action" value="EpartyCreateGC">
  <div>
    {if $commission > 0}
    <div class="mar_btm">
      You have earned <b>{$currency_type}{$commission}</b> in store credit.  Are you ready to convert your commission into a gift certificate?
    </div>
    <div class="checkcbox">
      <label><input type="checkbox" name="sure" value="y" /> Yes, I want to create a gift certificate. </label>
    </div>
    <div class="mar_btm">
      <input class="btn btn-default" type="submit" name="submit" value="Cancel" />&nbsp; 
      <input class="btn btn-primary" type="submit" name="submit" value="Create Gift Certificate" /> 
    </div>
    {else}
    <div class="mar_btm">
      You have not earned enough commission to create a gift certificate.
    </div>
    {/if}
  </div>
</form>

{include file="_bottom.tpl"}
