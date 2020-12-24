  {****************************************************************************************************************************

  Store Locator Information:

  * File should be TAB delimited so addresses with commas will be split properly.
  * File Format:
      Column 1: CustomerID
      Column 2: StoreName
      Column 3: Address1
      Column 4: Address2
      Column 5: Address3
      Column 6: City
      Column 7: State
      Column 8: Zip
      Column 9: Telephone
  * File can be sorted by any field above.  By default it sorts by StoreName field.
  * Headers in the files are not necessary, but the file fields must be in the order listed above.
  * Fields can be omitted (such as Address2, Address3, CustomerID, etc) by leaving the column corresponding with it as an empty column.

  *****************************************************************************************************************************}

  {* Read store_locator.csv file *}
  {get_file_content file="/downloads/store_locator.txt" assign="stores"}

  {* $smarty.get.zip|count_characters *}
  {* $smarty.get.zip|truncate:3:"":true *}

  {* Define searchable info *}
  {assign var='city' value=$smarty.get.city|lower}
  {assign var='state' value=$smarty.get.st}
  {* assign var='zip' value=$smarty.get.zip *}
  {assign var='zip' value=$smarty.get.zip|truncate:3:"":true}

  {* PHP array variable to hold the information for counting and sorting *}
  {set var=$output}

  {* Loop through all stores in the file and figure out which ones should show based on the options selected from the city/state/zip form *}
  {counter name="output" start=0 assign="ctr"}
  {foreach from=$stores item='store'}

    {* Explode the file line to get individual elements *}
    {assign var='store_info' value="\t"|explode:$store}
    {* If $state is all, print everything *}
    {if $state == 'all'}
      {assign var='print' value='1'}
    {else}
      {assign var='print' value='0'}
    {/if}
    {if !$print}
      {* "All" was not selected so need to decide whether or not to show a particular line *}
      {if $city != '' && $state != '' && $zip != ''}
        {if $store_info.5|lower == $city && $store_info.6 == $state && $store_info.7|truncate:3:"":true == $zip}{assign var='print' value='1'}{/if}
      {elseif $city != '' && $state != ''}
        {if $store_info.5|lower == $city && $store_info.6 == $state}{assign var='print' value='1'}{/if}
      {elseif $state != '' && $zip != ''}
        {if $store_info.6 == $state && $store_info.7|truncate:3:"":true == $zip}{assign var='print' value='1'}{/if}
      {elseif $city != '' && $zip != ''}
        {if $store_info.5|lower == $city && $store_info.7|truncate:3:"":true == $zip}{assign var='print' value='1'}{/if}
      {elseif $state != ''}
        {if $store_info.6 == $state}{assign var='print' value='1'}{/if}
      {elseif $city != ''}
        {if $store_info.5|lower == $city}{assign var='print' value='1'}{/if}
      {elseif $zip != ''}
        {if $store_info.7|truncate:3:"":true == $zip}{assign var='print' value='1'}{/if}
      {/if}
    {/if}
    {if $print}
      {* This means we need to print the line because "all" was selected or it met the search criteria *}
      {set var=$output.$ctr}
      {set var=$output.$ctr.name value=$store_info.1}
      {set var=$output.$ctr.address1 value=$store_info.2}
      {set var=$output.$ctr.address2 value=$store_info.3}
      {set var=$output.$ctr.address3 value=$store_info.4}
      {set var=$output.$ctr.city value=$store_info.5}
      {set var=$output.$ctr.state value=$store_info.6}
      {set var=$output.$ctr.zip value=$store_info.7}
      {set var=$output.$ctr.phone value=$store_info.8}
      {counter name="output" assign="ctr"}
    {/if}
  {/foreach}

  {assign var='store_info' value=$output}
  <h2>Search Results</h2>
  {* If there are no results, print a message indicating that.  Otherwise loop through the results *}
  {if !$store_info|@count}
    There are no results from your search.
  {else}
    {* Tell customer how many results were found *}
    <div class="mar_btm">
      There are {$store_info|@count} results from your search.
    </div>
    {* Sort by name *}
    {array_sort var=$store_info sort_by="name" assign="store_info"}

    {* Loop through results *}
    <div class="row">
    {foreach from=$store_info item='store'}
     {cycle values="left,center,right" assign=pos name=pos}
      <div class="{$pos} iefix mar_btm col-sm-4">
      <strong>{$store.name}</strong><br />
      {$store.address1}<br />
      {if $store.address2}{$store.address2}<br />{/if}
      {if $store.address3}{$store.address3}<br />{/if}
      {$store.city}, {$store.state}  {$store.zip}
      {if $store.phone}<br />{$store.phone}{/if}
      </div>
      {if $pos == 'right'}
      </div>
      <div class="row">
      {/if}
    {/foreach}
    </div>
  {/if}
