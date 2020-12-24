<section id="refined_search">
<header><h2>REFINED SEARCH</h2></header>

{* to use include "{include file="refined_search.tpl" ref_name="name of search"|escape:"quotes"}" in any template *}

<div class="form-container">
  <form method="post" action="index.php" style="margin:0px;padding:0px;" name="searchform">
  <input type="hidden" name="action" value="Refined Search">

   {assign var=ref_search value=$refined_search.$ref_name}
   {foreach from=$ref_search.titles key=title_id item=title name="refined_search"}
		<div class="form-group">
     		<select class="form-control" name="refined_search_{$ref_search.id}_{$smarty.foreach.refined_search.iteration}" id="refined_search_{$ref_search.id}_{$smarty.foreach.refined_search.iteration}" {if $title_id != 0}disabled{/if} onchange="getInfo('refined','Category_Class','displayRefinedSearchNext',this);">
       			<option value=''>---Choose {$title}---</option>
                 {if $title_id == 0}
                   {html_options options=$ref_search.detail}
                 {/if}
     		</select>
     	</div>
   {/foreach}

</form>
</div>
</section>