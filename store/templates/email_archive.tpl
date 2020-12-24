{if $blast == ''}

  {include file="_top.tpl"}

  <div class="page-header">
    <h1>Email Archive</h1>
  </div>

  {if $hide > 0}
    {if $show == 'y'}
      <p><a href="/email_archive" class="btn btn-primary">Hide</a></p>
    {else}
      <p><a href="/email_archive/h" class="btn btn-primary">Show Hidden</a></p>
    {/if}
  {/if}

  <ul>
  {foreach from=$emails item=email key=key}
    {if $show == 'y' || $email.hide != 'y'}
      <li><a href="/email_archive/{$email.blast_id}" target="_blank">{$email.subject}</a> - {$email.date_sent|date_format:"%B %e, %Y"}</li>
    {/if}
  {/foreach}
  </ul>

  {include file="_bottom.tpl"}

{else}

  {$blast}

{/if}