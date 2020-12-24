{include file="_top.tpl"}

<h1>Order Tracking</h1>

<div class="form-container">

  {if $print_form=='y'}

  <p class="legend"><strong>Note:</strong><span class="req"> *</span> Indicates a required field</p>

  <form method="post" action="index.php" role="form"> 
   <input type="hidden" name="action" value="Tracking" />

   {if $order == "e"}
   <div class="alert alert-danger">
     <em>No match found - please enter order id, billing email address and billing zip code - must match exactly what is on the order.</em>
   </div>
   {elseif $order == "i"}
   <div class="alert alert-danger">
     <em>You must complete all fields.</em>
   </div>
   {/if}

  <fieldset>
    <div class="row">
      <div class="col-sm-6 col-lg-4">
        <div class="form-group {if $valid.return and $valid.order_id == ''} has-error has-feedback bg-danger{/if}">
          <label for="order_id"><span class="req">*</span> Order ID:</label>
          <input class="form-control" type="text" name="order_id" id="order_id" value="{$valid.order_id}" />{if $valid.return and $valid.order_id == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group {if $valid.return and $valid.email == ''} has-error has-feedback bg-danger{/if}">
          <label for="email"><span class="req">*</span> Billing Email:</label>
          <input class="form-control" type="email" name="email" id="email" value="{$valid.email}" />{if $valid.return and $valid.email == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group {if $valid.return and $valid.zip == ''} has-error has-feedback bg-danger{/if}">
          <label for="zip"><span class="req">*</span> Billing Zip Code:</label>
          <input class="form-control" type="text" name="zip" id="zip" value="{$valid.zip}" />{if $valid.return and $valid.zip == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
    </div>
  </fieldset>

<div class="buttonrow">
  <input type="submit" name="submit" value="Submit" class="btn btn-primary" />
</div>

</form>

{else}

<section class="order">
  <h3>Order: {$tracking.order_id}</h3>
  <div><strong>Date Ordered:</strong> {$tracking.date_ordered}</div>
  <div><strong>Status:</strong> {$tracking.status}</div>
  <div><strong>Tracking:</strong> {$tracking.tracking}</div>
</section>

{/if}

</div>

{include file="_bottom.tpl"}