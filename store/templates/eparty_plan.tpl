{include file="_top.tpl"}

<h1>Plan an E-Party</h1>
<div class="mar_btm"><a href="eparty">E-Party Report</a>&nbsp;|&nbsp;<a href="eparty_create_gc">Create Gift Certificate</a>&nbsp;|&nbsp;<a href="eparty_history">Track Gift Certificates</a>&nbsp;|&nbsp;<a href="eparty_login/1">Log Out</a></div>

<div class="mar_btm">Use this form to set the date of your next E-Party.  The information regarding your party will be emailed to you.</div>

{if !$active}
<form method="post" action="index.php" role="form"> 
<input type="hidden" name="action" value="EpartyPlan">

{if $error}
<div class="alert alert-danger">{$error}</div>
{/if}
  <div class="row">
    <div class="col-sm-6">
      <div class="form-group">
        <label>Date of the E-Party (mm/dd/yyyy):</label>
        <input class="form-control" type="text" name="date" value="{$valid.date}" maxlength="30"/>
      </div>
    </div>
  </div>
  <div class="">
    <input type="submit" name="submit" value="Submit" class="addtocart_btn btn btn-primary mar_btm">
  </div>
</form>
{else}
  <div class="mar_btm">
    <b>The previous E-Party must be complete before a new one can be planned.</b>
  </div>
{/if}

{include file="_bottom.tpl"}

