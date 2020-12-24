{config_load file="store.conf" scope="global"}
<html>
    {include file="_meta.tpl"}
    <body id="{$view}" class="popup">

        <h2>{$prod_name} Details</h2> 

        {foreach from=$info key=field item=value}
            <div class="clearfix">
                <b>{$field}:</b> {$value}
            </div>
        {/foreach}

        <div class="popupbuttons">
            <button onClick="window.close();" class="btn btn-primary btn-sm">Close Window</button>
        </div>

    </body>
</html>