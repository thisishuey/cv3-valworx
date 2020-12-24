{include file="_wholesaletop.tpl"}

<h1>Wholesaler Password</h1>

<form method="post" action="index.php"> 
<input type="hidden" name="action" value="WholesalePW">

<div class="row">

<div class="col-sm-12">
  <div class="form-group {if $valid.return and $valid.oldpw == ''}error{/if}">
    <label class="control-label" for="oldpw"> Old Password:</label>
    <input type="password" name="oldpw" value="" class="form-control">
  </div>
</div>
</div>

<div class="row">
<div class="col-sm-6">
  <div class="form-group {if $valid.return and $valid.newpw1 == ''}error{/if}">
    <label class="control-label" for="newpw1"> New Password:</label>
    <input type="password" name="newpw1" value="" class="form-control">
  </div>
</div>

<div class="col-sm-6">
  <div class="form-group {if $valid.return and $valid.newpw2 == ''}error{/if}">
    <label class="control-label" for="newpw2"> Confirm New Password:</label>
    <input type="password" name="newpw2" value="" class="form-control">
  </div>
</div>

</div>

<div class="buttonrow">
  <input type="submit" name="submit" value="Update" class="btn btn-primary">
</div>

</form>

{include file="_wholesalebottom.tpl"}