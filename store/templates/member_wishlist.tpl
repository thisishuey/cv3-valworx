{include file="_top.tpl"}

<h1>Wishlist</h1>

<div class="form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">

  {if $valid.return == '1'}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
  {/if}

  <p class="legend"><strong>Note:</strong><span class="req">*</span> Indicates a required field</p>

  <form method="post" action="index.php" name="checkout" role="form"> 
    <input type="hidden" name="action" value="MemberWishlist" />

    <fieldset>
      <legend>Wishlist Information</legend>

      <div class="form-group">
        <label for="name"><span class="req">*</span> Name:</label>
        <input type="hidden" value="y" name="req_name">
        <input class="form-control" type="text" name="name" size="20" value="{$valid.name}" id="name" />
      </div>

      <div class="form-group">
        <label for="description"><span class="req">*</span> Description:</label>
        <input type="hidden" value="y" name="req_description">
        <textarea class="form-control" name="description" cols="20" rows="6" id="description">{$valid.description}</textarea>
      </div>

      <div class="checkbox">
        <label for="private"><input type="checkbox" name="is_private" value="y" {if $valid.is_private=='y'}checked="checked"{/if}/>Private?</label>
        <span class="help-block">(if checked, your wishlist will not be available for other people to view)</span>
      </div>

      <div class="form-group">
        <label for="expires"><span class="req">*</span> Expires:</label>
        <input type="hidden" value="y" name="req_expiration_year">
        <div class="row">
          <div class="col-xs-6 col-sm-4 col-md-3">
            <select class="form-control" name="expiration_mon">
              {html_options options=$options.date.month selected=$valid.expiration_mon}
            </select>
          </div>
          <div class="col-xs-6 col-sm-4 col-md-3 mar_btm">
            <select class="form-control" name="expiration_day">
              {html_options options=$options.date.day selected=$valid.expiration_day}
            </select>
          </div>
          <div class="col-xs-6 col-sm-4 col-md-4">
            <select class="form-control" name="expiration_year">
              {html_options options=$options.date.year selected=$valid.expiration_year}
            </select>
          </div>
        </div>
      </div>
      <div class="row">
        {if $valid.is_private != 'y' && $valid.id != ''}
        <div class="col-lg-4 mar_btm">
          <a class="btn btn-default" href="/member_wlsend/{$valid.id}">E-mail wishlist to friends</a>    
        </div>
        {/if}

        {if $valid.id != ''}
        <div class="col-lg-4">
          <a class="btn btn-primary" href="/wishlist/{$valid.id}/{$valid.password}">View wishlist</a>    
        </div>
        {/if}
      </div>
    </fieldset>

    {**************************************************************}

    <fieldset><legend>Shipping Address</legend>

      <div class="form-group {if $valid.return and $valid.first_name == ''} error{/if}">
        <label for="first_name"><span class="req">*</span> First Name:</label>
        <input type="hidden" name="req_first_name" value="y"/>
        <input class="form-control" type="text" name="first_name" id="first_name" value="{$valid.first_name}"/>
      </div>
      <div class="form-group {if $valid.return and $valid.last_name == ''} error{/if}">
        <label for="last_name"><span class="req">*</span> Last Name:</label>
        <input type="hidden" name="req_last_name" value="y"/>
        <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}"/>
      </div>
      <div class="form-group {if $valid.return and $valid.address1 == ''} error{/if}">
        <label for="address1"><span class="req">*</span> Address 1:</label>
        <input class="form-control" type="text" name="address1" id="address1" value="{$valid.address1}"/>
      </div>
      <div class="form-group {*if $valid.return and $valid.address2 == ''} error{/if*}">
        <label for="address2">{*<span class="req">*</span> *}Address 2:</label>
        <input class="form-control" type="text" name="address2" id="address2" value="{$valid.address2}"/>
      </div>
      <div class="form-group {if $valid.return and $valid.city == ''} error{/if}">
        <label for="city"><span class="req">*</span> City:</label>
        <input class="form-control" type="text" name="city" id="city" value="{$valid.city}"/>
      </div>
      <div class="form-group {if $valid.return and !$valid.country} error{/if}">
        <label for="country"><span class="req">*</span> Country:</label>
        <select class="form-control" name="country" id="country">
          {html_options options=$options.country selected=$valid.country}
        </select>
      </div>
      <div class="form-group {if $valid.return and !$valid.state} error{/if}">
        <label for="state"><span class="req">*</span> State/Province:</label>
        <select class="form-control" name="state" id="state">
          {html_options options=$options.state selected=$valid.state}
        </select>
        <select class="form-control" id='ca_province'>
          {html_options options=$ca_provinces selected=$valid.state}
        </select>
        <input class="form-control" type='text' id="province" name="state" value="{$valid.state}"  />
      </div>
      <div class="form-group {if $valid.return and !$valid.zip} error{/if}">
        <label for="zip"><span class="req">*</span> Postal Code:</label>
        <input class="form-control" type="text" name="zip" id="zip" value="{$valid.zip}"/>
      </div>

    </fieldset>

    {**************************************************************}

    <div class="wishlist clearfix">
      <h3>Items</h3>
      <div class="row lead hidden-xs hidden-sm">
        <div class="col-md-2">Rank</div>
        <div class="col-md-2 col-lg-1">Sku</div>
        <div class="col-md-2 col-lg-3"><span class="visible-lg">Description</span><span class="visible-md">Descr.</span></div>
        <div class="col-md-2">Qty Needed</div>
        <div class="col-md-2">Qty Purchased</div>
        <div class="col-md-2 col-lg-2">Remove</div>
      </div>

      {foreach from=$valid.prods item=prod key=key}
      <div class="row mar_btm well">
        <div class="form-group col-xs-3 col-md-2 col-lg-2">
          <label class="visible-xs visible-sm"><strong >Rank: </strong></label>
          <input class="form-control" type="text" name="rank_{$key}" value="{$prod.rank}"/>
        </div>
        <div class="col-xs-12 col-md-2">
          <strong class="visible-xs visible-sm">Sku: </strong>
          {if $prod.att_sku != ''}{$prod.att_sku}{else}{$prod.sku}{/if}
        </div>
        <div class="form-group col-xs-12 col-md-2 col-lg-3">
          {if $prod.parent != '' && $prod.parent != 0}
          {assign var=par value=$prod.parent}
          {$parent_names.$par.prod_name}
          &nbsp;-&nbsp;
          {/if}
          {$prod.prod_name} 
          {if $prod.attribute1 != ''}
          &nbsp;-&nbsp;
          {$prod.attribute1} {$prod.attribute2} {$prod.attribute3} {$prod.attribute4}
          {/if} 
          {if $prod.child_attribute != ''}
          &nbsp;-&nbsp;
          {$prod.child_attribute}
          {/if}
          {if $prod.custom_form_data}
          <div><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info_wl/{$valid.id}/{$prod.rank}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details &raquo;</a></div>
          {/if}
        </div>
        <div class="form-group col-xs-6 col-md-2">
          <strong class="visible-xs visible-sm">Qty Needed: </strong>
          <input class="form-control" type="text" name="qty_needed_{$key}" value="{$prod.qty_needed}"/>
        </div>
        <div class="form-group col-xs-6 col-md-2">
          <strong class="visible-xs visible-sm">Qty Purchased: </strong>
          <input class="form-control" type="text" name="qty_purchased_{$key}" value="{$prod.qty_purchased}"/>
        </div>
        <div class="col-xs-3 col-md-2 col-lg-1">
          <strong class="visible-xs visible-sm">Remove: </strong>
          <input type="checkbox" name="del_{$key}" value="y"/>
        </div>
      </div>
      {/foreach}

    </div>

    <input type="hidden" name="id" value="{$valid.id}" />
    <input type="submit" name="submit" value="{if $valid.id == ''}Create{else}Update{/if}" class="btn btn-default" />

  </form>

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
 {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}
