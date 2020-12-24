<form name="prods_per_page" action="" class="form-inline">
 {if $categories.$cid.url_name}{assign var=urlname value=$categories.$cid.url_name}
 {else}{assign var=urlname value=$cid}
 {/if}
  
	<div class="form-group">
      <label for="range">Items/Page</label>
      <select class="form-control input-sm" name="range" id="range" onchange="document.location=this.value;">
        <option value="/prods_per_page/default/{$urlname}">Choose --</option>
        <option value="/prods_per_page/10/{$urlname}" {if $prods_per_page == "10"}selected{/if}>10</option>
        <option value="/prods_per_page/20/{$urlname}" {if $prods_per_page == "20"}selected{/if}>20</option>
        <option value="/prods_per_page/30/{$urlname}" {if $prods_per_page == "30"}selected{/if}>30</option>
        <option value="/prods_per_page/40/{$urlname}" {if $prods_per_page == "40"}selected{/if}>40</option>
      </select>
  	</div>
</form>
