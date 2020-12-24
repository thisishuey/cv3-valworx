{if $searchtype == 'prod' || $searchtype == 'prodcat' || $searchtype == ''}
    {if $categories.$cid.url_name}{assign var=urlname value=$categories.$cid.url_name}
    {else}{assign var=urlname value=$cid}
    {/if}

    <form name="category_sort" action="" class="form-inline">
        <div class="form-group">
            <label class="sort_by">Sort by</label> <select name="range" class="form-control input-sm" onchange="document.location = this.value;">
                {*  <option value="/category_sort/default/{$urlname}--{$range}">Choose --</option>*}
                <option value="/category_sort/inc_price/{$urlname}--{$range}" {if $category_sort=="inc_price"}selected{/if}>$-$$$$</option>
                <option value="/category_sort/dec_price/{$urlname}--{$range}" {if $category_sort=="dec_price"}selected{/if}>$$$$-$</option>
                <option value="/category_sort/sku/{$urlname}--{$range}" {if $category_sort=="sku"}selected{/if}>Item #</option>
                <option value="/category_sort/prod_name/{$urlname}--{$range}" {if $category_sort=="prod_name"}selected{/if}>Name</option>
                <option value="/category_sort/best_rating/{$urlname}--{$range}" {if $category_sort=="best_rating"}selected{/if}>Rating</option>
                <option value="/category_sort/most_reviews/{$urlname}--{$range}" {if $category_sort=="most_reviews"}selected{/if}>Reviews</option>
                <option value="/category_sort/manufacturer/{$urlname}--{$range}" {if $category_sort=="manufacturer"}selected{/if}>Manufacturer</option>
                <option value="/category_sort/brand/{$urlname}--{$range}" {if $category_sort=="brand"}selected{/if}>Brand</option>
                <option value="/category_sort/best_seller/{$urlname}--{$range}" {if $category_sort=="best_seller"}selected{/if}>Best Seller</option>
                <option value="/category_sort/date_created_desc/{$urlname}--{$range}" {if $category_sort=="date_created_desc"}selected{/if}>Newest</option>
                <option value="/category_sort/date_created_asc/{$urlname}--{$range}" {if $category_sort=="date_created_asc"}selected{/if}>Oldest</option>
                <option value="/category_sort/on_special/{$urlname}--{$range}" {if $category_sort=="on_special"}selected{/if}>On Sale</option>

                {* example to add a user_defined field to drop-down: just replace all instances of "cust_1" with the name of the field you are sorting by and "Cust 1" with the display name
                <option value="/category_sort/user_defined:cust_1/{$urlname}--{$range}" {if $category_sort=="user_defined" && $category_sort_ud == 'cust_1'}selected{/if}>Cust 1</option>*}
            </select>
        </div>
    </form>
{/if}