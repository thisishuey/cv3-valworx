{*Remove if included in another template*}{include file="_top.tpl"}

{if $error != ''}
 <div class="alert alert-danger">
  <em>{$error}</em>
 </div>
{/if}

<section id="wtg">
<form method="post" action="index.php" name="wtgform" onsubmit="if (wtg.keyword.value=='Enter Gift Card/Certificate') searchform.keyword.value='';" role="form">
 <input type="hidden" name="action" value="WTG" />
 <div class="row">
 	<div class="col-sm-6">
		<div class="form-group">
		 	<label>Enter Gift Card/Certificate: </label>
			<input class="inputBox form-control" type="text" name="giftCertNumber" size="23" alt="Enter your gift certificate number"  value="&nbsp;&nbsp;Enter Gift Card/Certificate" onFocus="this.value='';"/>
		</div>
	</div>
</div>
 <input type="submit" name="submit" value="Go" class="btn btn-primary" />
</form>
</section>

{*Remove if included in another template*}{include file="_bottom.tpl"}