{config_load file="store.conf" scope="global"}
<html>
    {include file="_meta.tpl"}
    <body id="qanda_thanks">
        <h3>Thank You for Your {$type|ucwords}</h3>
        <p>
            {if $type == 'question'}
                {* Enter your message for question askers here. *}
                {#qa_asker#}
            {elseif $type == 'answer'}
                {* Enter your message for question answerers here. *}
                {#qa_answerer#}

            {/if}
        </p>
    </body>
</html>