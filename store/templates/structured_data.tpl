{** updated 0119 for ValidUntil, sku, review **}
{** updated 0319 for nested dependents **}
{** 0719 added FB support for productID and URL and InStock**}
{** INCLUDE FROM META **} 

{** test on all types of product pages using https://search.google.com/structured-data/testing-tool **}

{** set safe URLs **}
{if $view == 'category' || $view == 'prod_detail_list'}
  {if $categories.$cid.linked_to_url_name != ''}
    {assign var="cat_url" value=$categories.$cid.linked_to_url_name}
  {elseif $categories.$cid.url_name != ''}
    {assign var="cat_url" value=$categories.$cid.url_name}
  {else}
    {assign var="cat_url value=$cid}
  {/if}
  {assign var="url_ender" value="/"|cat:$view|cat:"/"|cat:$cat_url}
{elseif $view == 'product' || $view =='product_builder' || ($meta.review_qanda == 'y' && ($view == 'product_qanda' || $view == 'create_review'))}
  {if $product.url_name != ''}
    {assign var="prod_url" value=$product.url_name}
  {else}
    {assign var="prod_url" value=$product.prod_id}
  {/if}
  {if $settings.include_cat_prod_links == 'y'}
    {assign var="cat_url" value="/"}
    {if $canon_cat.url_name != ''}
      {assign var="cat_url" value=$cat_url|cat:$canon_cat.url_name}
    {else}
      {assign var="cat_url" value=$cat_url|cat:$canon_cat.cat_id}
    {/if}
  {else}
    {assign var="cat_url" value=""}
  {/if}
  {assign var="url_ender" value="/"|cat:$view|cat:"/"|cat:$prod_url|cat:$cat_url}
{else}
  {assign var="url_ender" value=$SCRIPT_NAME}
{/if}

{if $view != 'product_qanda'}


{** SET ARRAYS **}

{if $view == 'product' && $product.content_only == 'n'}
{assign var="pricevaliduntil" value="+1 month"|date_format:"%Y-%m-%d"}
{*assign var="pricevaliduntil" value="+2 weeks"|date_format:"%Y-%m-%d"*}
{*assign var="pricevaliduntil" value="+30 days"|date_format:"%Y-%m-%d"*}
  {if $product.is_parent != 'y' && $product.has_attributes != '' && $product.price != '0.00' && $product.additional_prods == '' && $attys == ''}
	{assign var='prodprice' value=$currency_type|$product.price|commify}
    {/if}

  {if $product.is_parent != 'y' && $product.has_attributes == '' && $product.additional_prods}
	<script async type="application/ld+json">
    {* //PRODS WITH ADDITIONAL PRODUCTS *}
      {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "image": "{$protocol}://{$smarty.server.HTTP_HOST}{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
     "productID": "{$product.sku}",
     "mpn": "{$product.sku}",
     "sku": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}
   	"aggregateRating": {ldelim}
   	   "@type": "AggregateRating",
   	   "ratingValue": "{$product.reviews.rating|commify:1}",
   	   "reviewCount": "{if $product.reviews.num > 0}{$product.reviews.num}{else}0{/if}",
   	   "worstRating": "1",
   	   "bestRating": "5"
   	{rdelim},
      {/if}
	"offers": [
	{foreach from=$product.additional_prods key=key item=adds name=adds}
		{if $adds.min_qty != '0'}
		 {math equation='x*y' x=$adds.min_qty y=$adds.price assign='addprice'}
		{else}
		 {assign var='addprice' value=$adds.price}
		{/if}
		   {*assign var='addprice' value=$adds.price*}
		   {assign var='addsku' value=$adds.sku}
		   {assign var='addname' value=$adds.prod_name}
		   {assign var='addbrand' value=$adds.brand}
		{if $attribute.status == 'active'}
			   {assign var='addstock_status' value='In Stock'}
		   {else}
			   {assign var='addstock_status' value='Out of Stock'}
		   {/if}
			 {ldelim}
			 "@type": "Offer",
			 "name": "{$addname|strip_tags|escape:'html'}",
			 "priceCurrency": "USD",
			 "price": "{$addprice|commify:2|replace:",":""}",
			 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
			 "availability": "https://schema.org/{if $addstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
			 "itemOffered": "{$addname|strip_tags|escape:'html'}",
			 "itemCondition": "https://schema.org/NewCondition",
			 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
			 "seller": {ldelim}
			  "@type": "Organization",
			  "name": "{#store_name#|strip_tags|escape:'html'}"
			  {rdelim}
		   {rdelim}{if !$smarty.foreach.adds.last},{/if}
		 {/foreach}

                  ]
        {if $product.reviews.num > 0}, 
        "review":	[
        {foreach from=$product.review_data key=key item=rev name=rev}
		{assign var='reviewbody' value=$rev.comments}
		{assign var='reviewname' value=$rev.title}
		{assign var='reviewauthor' value=$rev.creator_name}
		{assign var='reviewdate' value=$rev.date_created}
		{assign var='reviewrating' value=$rev.rating}
			{ldelim}
				"@type": "Review",
				"author": "{$reviewauthor|strip_tags|escape:'html'}",
				"datePublished": "{$reviewdate}",
				"reviewBody": "{$reviewbody|strip_tags|escape:'html'}",
				"name": "{$reviewname|strip_tags|escape:'html'}",
				"reviewRating": {ldelim}
				"@type": "Rating",
				"bestRating": "5",
				"ratingValue": "{$reviewrating|commify:1}",
				"worstRating": "1"
				{rdelim}
            {rdelim}{if !$smarty.foreach.rev.last},{/if}
        {/foreach}
		]
        {/if}
    {rdelim}
	{*assign var='prodprice' value=$prodprice*}
	</script>
    
  {elseif $product.is_parent != 'y' && $product.has_attributes == 'y' && $attys}
	<script async type="application/ld+json">
        {* //PRODS WITH ATTYS *}
      {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "image": "{$protocol}://{$smarty.server.HTTP_HOST}{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
     "productID": "{$product.sku}",
     "mpn": "{$product.sku}",
     "sku": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}
   	"aggregateRating": {ldelim}
   	   "@type": "AggregateRating",
   	   "ratingValue": "{$product.reviews.rating|commify:1}",
   	   "reviewCount": "{if $product.reviews.num > 0}{$product.reviews.num}{else}0{/if}",
   	   "worstRating": "1",
   	   "bestRating": "5"
   	{rdelim},
      {/if}
	"offers": [
	{foreach from=$attys key=key item=atty name=atty}


		{foreach from=$atty.attributes key=key item=atts name=atts}
		   {assign var='attname' value=$atts.name}
		   {assign var='attbrand' value='Legal Sea Foods'}
           {assign var='price' value=$atts.standard_price}
		   {assign var='sku' value=$atts.sku}
		   {assign var='stock' value=$atts.oos}

		{if $atts.dependents}
		{foreach from=$atts.dependents key=key item=dep1 name=dep1}
		   {assign var='dep1name' value=$dep1.name}
           {assign var='dep1stock' value=$dep1.oos}
		   {assign var='sku' value=$dep1.sku}
		   {assign var='price' value=$dep1.standard_price}


			{if $dep1.dependents}
			{foreach from=$dep1.dependents key=key item=dep2 name=dep2}
					   {assign var='dep2name' value=$dep2.name}
					   {assign var='dep2stock' value=$dep2.oos}
					   {assign var='sku' value=$dep2.sku}
					   {assign var='price' value=$dep2.standard_price}

					{if $dep2.dependents}
							{foreach from=$dep2.dependents key=key item=dep3 name=dep3}
								   {assign var='dep3name' value=$dep3.name}
								   {assign var='dep3stock' value=$dep3.oos}
								   {assign var='sku' value=$dep3.sku}
								   {assign var='price' value=$dep3.standard_price}

							   {if $dep3stock == 'n'}
								   {assign var='attstock_status' value='In Stock'}
							   {else}
								   {assign var='attstock_status' value='Out of Stock'}
							   {/if}
								 {ldelim}
								 "@type": "Offer",
								 "name": "{$product.prod_name|strip_tags|escape:'html'} {$dep2name|strip_tags|escape:'html'} {$dep3name|strip_tags|escape:'html'} - {$attname|strip_tags|escape:'html'}, {$dep1name|strip_tags|escape:'html'}",
								 "priceCurrency": "USD",
								 "price": "{$price|commify:2|replace:",":""}",
								 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
								 "sku": "{$sku|strip_tags|escape:'html'}",
								 "availability": "https://schema.org/{if $attstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
								 "itemOffered": "{$attname|strip_tags|escape:'html'}",
								 "itemCondition": "https://schema.org/NewCondition",
								 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
								 "seller": {ldelim}
								  "@type": "Organization",
								  "name": "{#store_name#|strip_tags|escape:'html'}"
								  {rdelim}
								 {rdelim}
								{if !$smarty.foreach.dep3.last},{/if}
							{/foreach}{*//DEP3 FE*}
					{else}{*//DEP3 END*}

					   {if $dep2stock == 'n'}
						   {assign var='attstock_status' value='In Stock'}
					   {else}
						   {assign var='attstock_status' value='Out of Stock'}
					   {/if}
						 {ldelim}
						 "@type": "Offer",
						 "name": "{$product.prod_name|strip_tags|escape:'html'} {$dep2name|strip_tags|escape:'html'} - {$attname|strip_tags|escape:'html'}, {$dep1name|strip_tags|escape:'html'}",
						 "priceCurrency": "USD",
						 "price": "{$price|commify:2|replace:",":""}",
						 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
						 "sku": "{$sku|strip_tags|escape:'html'}",
						 "availability": "https://schema.org/{if $attstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
						 "itemOffered": "{$attname|strip_tags|escape:'html'}",
						 "itemCondition": "https://schema.org/NewCondition",
						 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
						 "seller": {ldelim}
						  "@type": "Organization",
						  "name": "{#store_name#|strip_tags|escape:'html'}"
						  {rdelim}
						 {rdelim}
					{/if}{*//DEP2 END*}

					{if !$smarty.foreach.dep2.last},{/if}
					{/foreach}{*//DEP2 FE*}

				{else}{*//DEP1 BEGIN*}
					   {if $dep1stock == 'n'}
						   {assign var='attstock_status' value='In Stock'}
					   {else}
						   {assign var='attstock_status' value='Out of Stock'}
					   {/if}
						 {ldelim}
						 "@type": "Offer",
						 "name": "{$product.prod_name|strip_tags|escape:'html'} - {$attname|strip_tags|escape:'html'}, {$dep1name|strip_tags|escape:'html'}",
						 "priceCurrency": "USD",
						 "price": "{$price|commify:2|replace:",":""}",
						 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
						 "sku": "{$sku|strip_tags|escape:'html'}",
						 "availability": "https://schema.org/{if $attstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
						 "itemOffered": "{$attname|strip_tags|escape:'html'}",
						 "itemCondition": "https://schema.org/NewCondition",
						 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
						 "seller": {ldelim}
						  "@type": "Organization",
						  "name": "{#store_name#|strip_tags|escape:'html'}"
						  {rdelim}
						 {rdelim}
				{/if}{*//DEP1 END*}
				{if !$smarty.foreach.dep1.last},{/if}
			   {/foreach}{*//DEP1 FE*}
			   
			{else}{*//ATTS BEGIN*}
				   {if $stock == 'n'}
					   {assign var='attstock_status' value='In Stock'}
				   {else}
					   {assign var='attstock_status' value='Out of Stock'}
				   {/if}
					 {ldelim}
					 "@type": "Offer",
					 "name": "{$product.prod_name|strip_tags|escape:'html'} - {$attname|strip_tags|escape:'html'}",
					 "priceCurrency": "USD",
					 "price": "{$price|commify:2|replace:",":""}",
					 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
					 "sku": "{$sku|strip_tags|escape:'html'}",
					 "availability": "https://schema.org/{if $attstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
					 "itemOffered": "{$attname|strip_tags|escape:'html'}",
					 "itemCondition": "https://schema.org/NewCondition",
					 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
					 "seller": {ldelim}
					  "@type": "Organization",
					  "name": "{#store_name#|strip_tags|escape:'html'}"
					  {rdelim}
					 {rdelim}
			{/if}{*//ATTS END*}
			{if !$smarty.foreach.atts.last},{/if}
		   {/foreach}{*//ATTS FE*}
			{if !$smarty.foreach.atty.last},{/if}
		 {/foreach}{*//ATTY*}
                  ]
        {if $product.reviews.num > 0}, 
        "review":	[
        {foreach from=$product.review_data key=key item=rev name=rev}
		{assign var='reviewbody' value=$rev.comments}
		{assign var='reviewname' value=$rev.title}
		{assign var='reviewauthor' value=$rev.creator_name}
		{assign var='reviewdate' value=$rev.date_created}
		{assign var='reviewrating' value=$rev.rating}
			{ldelim}
				"@type": "Review",
				"author": "{$reviewauthor|strip_tags|escape:'html'}",
				"datePublished": "{$reviewdate}",
				"reviewBody": "{$reviewbody|strip_tags|escape:'html'}",
				"name": "{$reviewname|strip_tags|escape:'html'}",
				"reviewRating": {ldelim}
				"@type": "Rating",
				"bestRating": "5",
				"ratingValue": "{$reviewrating|commify:1}",
				"worstRating": "1"
				{rdelim}
            {rdelim}{if !$smarty.foreach.rev.last},{/if}
        {/foreach}
		]
        {/if}
    {rdelim}
	{*assign var='prodprice' value=$prodprice*}
	</script>    


  {elseif $product.is_parent == 'y'}{** PRODS WITH SUBS/CHILDREN **}
	<script async type="application/ld+json">
{*//PRODS WITH SUBCHILDREN*}
    {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "image": "{$protocol}://{$smarty.server.HTTP_HOST}{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
     "productID": "{$product.sku}",
     "mpn": "{$product.sku}",
     "sku": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}
   	"aggregateRating": {ldelim}
   	   "@type": "AggregateRating",
   	   "ratingValue": "{$product.reviews.rating|commify:1}",
   	   "reviewCount": "{if $product.reviews.num > 0}{$product.reviews.num}{else}0{/if}",
   	   "worstRating": "1",
   	   "bestRating": "5"
   	{rdelim},
      {/if}
     "offers": [
   	 {foreach from=$product.children key=key item=child name=children}
   	   {assign var='childprice' value=$child.price}
   	   {assign var='childsku' value=$child.sku}
   	   {assign var='childname' value=$child.prod_name}
   	   {assign var='childbrand' value=$child.brand}
   	   {assign var='childstock_status' value=$child.stock_status}
   		 {ldelim}
   		 "@type": "Offer",
   		 "name": "{$childname|strip_tags|escape:'html'}",
   		 "priceCurrency": "USD",
   		 "price": "{$childprice|commify:2|replace:",":""}",
   		 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
   		 "availability": "https://schema.org/{if $childstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
   		 "itemOffered": "{$childprod_name|strip_tags|escape:'html'}",
   		 "itemCondition": "https://schema.org/NewCondition",
   		 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
   		 "seller": {ldelim}
   		  "@type": "Organization",
   		  "name": "{#store_name#|strip_tags|escape:'html'}"
   		  {rdelim}
   	   {rdelim}{if !$smarty.foreach.children.last},{/if}
   	 {/foreach}
      ]
{if $product.reviews.num > 0}, 
        "review":	[
        {foreach from=$product.review_data key=key item=rev name=rev}
		{assign var='reviewbody' value=$rev.comments}
		{assign var='reviewname' value=$rev.title}
		{assign var='reviewauthor' value=$rev.creator_name}
		{assign var='reviewdate' value=$rev.date_created}
		{assign var='reviewrating' value=$rev.rating}
			{ldelim}
				"@type": "Review",
				"author": "{$reviewauthor|strip_tags|escape:'html'}",
				"datePublished": "{$reviewdate}",
				"reviewBody": "{$reviewbody|strip_tags|escape:'html'}",
				"name": "{$reviewname|strip_tags|escape:'html'}",
				"reviewRating": {ldelim}
				"@type": "Rating",
				"bestRating": "5",
				"ratingValue": "{$reviewrating|commify:1}",
				"worstRating": "1"
				{rdelim}
            {rdelim}{if !$smarty.foreach.rev.last},{/if}
        {/foreach}
		]
        {/if}
    {rdelim}
    </script>
  {else} {** STANDARD PRODS - NO SUB/CHILDREN **}
    {if $product.min_qty != '0'}
     {math equation='x*y' x=$product.min_qty y=$product.price assign='productprice'}
    {else}
     {assign var='productprice' value=$product.price}
    {/if}
    <script async type="application/ld+json">
        {*//STANDARD PRODS*}
    {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "image": "{$protocol}://{$smarty.server.HTTP_HOST}{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
     "productID": "{$product.sku}",
     "mpn": "{$product.sku}",
     "sku": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}    
		"aggregateRating": {ldelim}
		   "@type": "AggregateRating",
		   "ratingValue": "{$product.reviews.rating|commify:1}",
		   "reviewCount": "{$product.reviews.num}",
		   "worstRating": "1",
		   "bestRating": "5"
		{rdelim},
      {/if}
     "offers": {ldelim}
   	 "@type": "Offer",
   	 "priceCurrency": "USD",
   	 "price": "{$productprice|commify:2|replace:",":""}",
   	 "priceValidUntil": "{$pricevaliduntil|date_format:'%Y-%m-%d'}",
   	 "itemCondition": "https://schema.org/NewCondition",
   	 "availability": "https://schema.org/{if $product.stock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
   	 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$url_ender}",
   	 "itemOffered": "{$product.prod_name|strip_tags|escape:'html'}",
   	 "seller": {ldelim}
   	  "@type": "Organization",
   	  "name": "{#store_name#|strip_tags|escape:'html'}"
   	  {rdelim}
   	{rdelim}
    {if $product.reviews.num > 0}, 
        "review":	[
        {foreach from=$product.review_data key=key item=rev name=rev}
		{assign var='reviewbody' value=$rev.comments}
		{assign var='reviewname' value=$rev.title}
		{assign var='reviewauthor' value=$rev.creator_name}
		{assign var='reviewdate' value=$rev.date_created}
		{assign var='reviewrating' value=$rev.rating}
			{ldelim}
				"@type": "Review",
				"author": "{$reviewauthor|strip_tags|escape:'html'}",
				"datePublished": "{$reviewdate}",
				"reviewBody": "{$reviewbody|strip_tags|escape:'html'}",
				"name": "{$reviewname|strip_tags|escape:'html'}",
				"reviewRating": {ldelim}
				"@type": "Rating",
				"bestRating": "5",
				"ratingValue": "{$reviewrating|commify:1}",
				"worstRating": "1"
				{rdelim}
            {rdelim}{if !$smarty.foreach.rev.last},{/if}
        {/foreach}
		]
        {/if}
    {rdelim}

    </script>
  {/if}
{/if}


{** BLOG - CONTENT ONLY PRODUCTS **}
{if $view == 'product' && $product.content_only =='y'}
    <script async type="application/ld+json">
    {ldelim}
      "@context": "https://schema.org",
      "@type": "NewsArticle",
      "mainEntityOfPage": {ldelim}
        "@type": "WebPage",
        "@id": "{$protocol}://{$smarty.server.HTTP_HOST}{$SCRIPT_NAME}"
      {rdelim},
      "headline": "{$product.prod_name|strip_tags|escape:'htmlall'}",
      "image": {ldelim}
        "@type": "ImageObject",
        "url": "https://s3.amazonaws.com/cdn.DOMAIN_NAME.com/images/{$product.large_image}",{** DATA ENTRY **}
        "height": 525,{** DATA ENTRY **}
        "width": 700{** DATA ENTRY - MIN WIDTH 696 **}
      {rdelim},
      "datePublished": "{$product.cust_21}",{** DATA ENTRY - FORMAT MUST BE 2015-02-05T08:00:00+08:00 **}
      "dateModified": "{$product.cust_22}",{** RECOMMENDED - FORMAT MUST BE 2015-02-05T08:00:00+08:00 **}
      "author": {ldelim}
        "@type": "Person",
        "name": "{$product.cust_22|strip_tags|escape:'htmlall'}"
      {rdelim},
       "publisher": {ldelim}
        "@type": "Organization",
        "name": "{#store_name#|strip_tags|escape:'htmlall'}",
        "logo": {ldelim}
          "@type": "ImageObject",
          "url": "{$protocol}://{$smarty.server.HTTP_HOST}/images/LOGO.png",{** DATA ENTRY **}
          "width": 400,{** DATA ENTRY **}
          "height": 45{** DATA ENTRY **}
        {rdelim}
      {rdelim},
      "description": "{$product.prod_description|strip_tags|escape:'htmlall'|truncate:350}"
    {rdelim}
    </script>
{/if}


<script async type="application/ld+json">
{*// ORGANIZATION*}
  {ldelim}
    "@context": "https://schema.org",
    "@type": "Organization",
    "url": "{$protocol}://{$smarty.server.HTTP_HOST}",
    "logo": "{$protocol}://{$smarty.server.HTTP_HOST}/images/logo.jpg",
    "contactPoint": [{ldelim}
      "@type": "ContactPoint",
      "telephone": "+1-800-511-0100",
      "contactType": "customer service",
      "contactOption": "TollFree",
      "areaServed": "US"
    {rdelim}]
  {rdelim}
</script>




{** VIDEO **}
{** REQUIRES CUSTOM FIELD DATA **}
{if $view == 'product' && ($product.cust_35 == 'video' || $product.cust_35 == 'Video')}
    <script async type="application/ld+json">
     {ldelim}
        "@context": "https://schema.org",
        "@type": "VideoObject",
        "name": "{$product.prod_name|strip_tags|escape:'htmlall'}",
        "description": "{$product.meta_description|strip_tags|escape:'htmlall'}",//use meta description to avoid pulling embed code if vid placed there
        "thumbnailUrl": "{$protocol}://{$smarty.server.HTTP_HOST}{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",//uploaded as product image in cv3
        "uploadDate": "{$product.cust_30}",{** 2015-02-05T08:00:00+08:00 **}
        "duration": "{$product.cust_31}",{** PT1M33S **}
        "contentUrl": "{$product.cust_32}",{** actual url of video file **}
        "embedUrl": "{$product.cust_33}",{** from src= in embed code **}
        "interactionCount": "{$product.cust_34}"{** dynamic data not available **}
     {rdelim}
   </script>
{/if}
{** END VIDEO **}



{/if}{** END QANDA EXCLUDE **}

