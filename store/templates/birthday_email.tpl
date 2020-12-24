{*************************************************
 * Purpose: send birthday wishes and/or promos to customers on their birthday
 * Available Fields:
 * {$first_name}
 * {$last_date}
 * {$email}
 * {$birthdate} - "YYYY-MM-DD"
 * {$birthday} - Day of birth
 * {$birthmonth} - Month of birth
 * {$birthyear} - Year of birth
 * {$age} - How young they are.
 **************************************************}
<html>
  <body>
   {if substr($age,-1,1) == '1'}
     {assign var="age_suffix" value="st"}
   {elseif substr($age,-1,1) == '2'}
     {assign var="age_suffix" value="nd"}
   {else}
     {assign var="age_suffix" value="th"}
   {/if}

    Happy birthday, {$first_name}!
    <br /><br />
    Wishing you all the best on your {$age}{$age_suffix} birthday!
    <br /><br />
  </body>
</html>

