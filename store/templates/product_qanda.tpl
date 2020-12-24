{config_load file="store.conf" scope="global"}
<html>
    {include file="_meta.tpl"}

    {if $use_captcha && $captcha_method == '2'}
        <script type="text/javascript" src="//www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
    {/if}

    <body id="product_qanda">
        <div class="container">
            {if $valid.return}
                <span class="error">There has been an error:<br />{$error}</span>
                {/if}

            <ul id="qa_box">
                <li class="ask clearfix">
                    <div><a href="javascript: void(0);" onclick="javascript: showHideQA('response', 0);{if $use_captcha && $captcha_method == '2'}Recaptcha.create('{$recaptcha_key}', 'captcha0',{ldelim}callback: Recaptcha.focus_response_field{rdelim});{/if}"><h3>Have a question?</h3></a></div>
                    <ul id="response_0" style="display:none;">
                        <li class="response">
                            <form method="POST" action="index.php" class="form-inline">
                                <input type="hidden" name="action" value="QAResponse" />
                                <input type="hidden" name="member_id" value="{if isset($memberinfo.id) && $memberinfo.id != ''}{$memberinfo.id}{else}0{/if}" />
                                <input type="hidden" name="question_id" value="0" />
                                <input type="hidden" name="prod_id" value="{$product.prod_id}" />
                                {if $verified}
                                    <div class="pull-right">
                                        <img src="{$img_prefix}/images/verified.gif" /> - Verified buyer.
                                    </div>
                                {/if}
                                {assign var="field_name" value="email_"|cat:"0"}
                                <div class="row">
                                    <div class="col-md-12 col-xs-12 col-sm-12">
                                        <span class="qa_info"><span{if $valid.return && $valid.is_valid.$field_name == 'n'} class="error"{/if}><b>E-mail:</b></span> <input type="text" class="formtext form-control" value="{if isset($memberinfo.email) && $memberinfo.email != ''}{$memberinfo.email}{elseif $valid.return && $valid.$field_name != ''}{$valid.$field_name}{/if}" size="20" name="email_0" />
                                            {assign var="field_name" value="name_"|cat:"0"}
                                            &nbsp;(will not be shared)&nbsp;&nbsp;<span{if $valid.return && $valid.is_valid.$field_name == 'n'} class="error"{/if}><b>Name:</b></span> <input type="text" class="formtext form-control" value="{if $valid.return && $valid.$field_name != ''}{$valid.$field_name}{/if}" size="20" name="name_0" /> (optional)</span>
                                    </div>
                                </div>
                                <hr class="qa_rule" />
                                <div class="row mar_top10">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="pull-right">
                                            Characters remaining: <span id="count_0">500</span>
                                        </div>
                                        <p class="mar_0 padd_0"><strong>Type your question below:</strong></p>
                                        {assign var="field_name" value="answer_"|cat:"0"}
                                        <textarea name="answer_0" cols="30" rows="5" id="answer_0" onkeyup="javascript: return remainingCharacters(this, 0);" class="form-control">{if isset($valid.$field_name)}{$valid.$field_name}{/if}</textarea>
                                    </div>
                                </div>
                                {if $use_captcha && $captcha_method == '2'}
                                    <hr class="qa_rule" />
                                    <b>CAPTCHA Verification:</b>
                                    <div{if $valid.return} class="error"{/if}>
                                        <div id="captcha0"></div><br/>
                                    {/if}
                                    <div class="pull-right">
                                        <input type="submit" name="submit" value="Submit Your Question" class="sitesearch_btn btn btn-primary btn-sm mar_top10" />
                                    </div>
                                    {if $valid.return && $valid.is_valid.$field_name == 'n'}
                                        <div class="error">
                                            Your response was invalid or blank.<br />
                                            This error is usually caused by invalid characters in your resopnse.
                                        </div>
                                    {/if}
                            </form>
                        </li>
                    </ul>
                </li>
                {if $qanda|@count == 0}
                    <li class="question">No questions have been asked.</li>
                    {/if}
                    {foreach from=$qanda key="q_id" item="q"}
                    <li class="question">
                        {assign var="special" value=""}
                        {if $q.special == 'verified'}
                            {assign var="special" value='<img src="{$img_prefix}/images/verified.gif" />'}
                        {elseif $q.special == 'customer_service'}
                            {assign var="special" value='<img src="{$img_prefix}/images/customer_service.gif" />'}
                        {/if}
                        <span class="qa_info">Asked by {$special} <b>{$q.name}</b>, {$q.date|date_format:"%B %e, %Y"} at {$q.date|date_format:"%r %Z"}</span>.
                        <hr class="qa_rule" />
                        <b>Q:</b> {$q.body|nl2br}
                        <hr class="qa_rule" />
                        <div class="right qa_info">Know the answer? <a href="javascript: void(0);" onclick="javascript: showHideQA('response',{$q_id});
                            {if $use_captcha && $captcha_method == '2'}Recaptcha.create('{$recaptcha_key}', 'captcha{$q_id}',{ldelim}callback: Recaptcha.focus_response_field{rdelim});{/if}">Submit your response</a>.</div>
                    <div class="qa_info">
                        <script type="text/javascript">
                                // This is in the template for easy removal/access
                                function swapQAImage(id) {ldelim}
                                    var img = (document.getElementById) ? document.getElementById(id) : document.all('id');
                                    if (img != 'undefined' && img.src.substr(-13, 13) == 'ans_right.gif') {ldelim}
                                        img.src = '{$img_prefix}/images/ans_down.gif';
                            {rdelim} else {ldelim}
                                        img.src = '{$img_prefix}/images/ans_right.gif';
                            {rdelim}
                            {rdelim}
                        </script>
                        <a href="javascript: void(0);"{if $q.answers|@count > 0} onclick="javascript: showHideQA('answers',{$q_id});
                                    swapQAImage('image_{$q_id}');"{/if}><img src="{$img_prefix}/images/ans_right.gif" alt="Click here to show answers." style="display: inline;" align="bottom" height="9" id="image_{$q_id}" /> {$q.answers|@count} Answer{if $q.answers|@count != 1}s{/if}</a>
                    </div>

                    <ul id="response_{$q_id}" style="display: none;">
                        <li class="response">
                            <form method="POST" action="index.php">
                                <input type="hidden" name="action" value="QAResponse" />
                                <input type="hidden" name="member_id" value="{if isset($memberinfo.id) && $memberinfo.id != ''}{$memberinfo.id}{else}0{/if}" />
                                <input type="hidden" name="question_id" value="{$q_id}" />
                                <input type="hidden" name="prod_id" value="{$product.prod_id}" />
                                {if $verified}
                                    <div class="right">
                                        <img src="{$img_prefix}/images/verified.gif" /> - Verified buyer.
                                    </div>
                                {/if}
                                {assign var="field_name" value="email_"|cat:$q_id}
                                <span class="qa_info"><span{if $valid.return && $valid.is_valid.$field_name == 'n'} class="error"{/if}><b>E-mail:</b></span> <input type="text" class="formtext form-control" value="{if isset($memberinfo.email) && $memberinfo.email != ''}{$memberinfo.email}{elseif $valid.return && $valid.$field_name != ''}{$valid.$field_name}{/if}" size="20" name="email_{$q_id}" />
                                    {assign var="field_name" value="name_"|cat:$q_id}
                                    &nbsp;<span{if $valid.return && $valid.is_valid.$field_name == 'n'} class="error"{/if}><strong>Name:</strong></span> <input type="text" class="formtext form-control" value="{if $valid.return && $valid.$field_name != ''}{$valid.$field_name}{/if}" size="20" name="name_{$q_id}" /> (optional)</span>
                                <hr class="qa_rule" />
                                <div class="right">
                                    Characters remaining: <span id="count_{$q_id}">500</span>
                                </div>
                                <p><b>Type your response below:</b></p>
                                {assign var="field_name" value="answer_"|cat:$q_id}
                                <textarea name="answer_{$q_id}" cols="30" rows="5" id="answer_{$q_id}" onkeyup="javascript: return remainingCharacters(this,{$q_id});" class="form-control">{if isset($valid.$field_name)}{$valid.$field_name}{/if}</textarea>
                                {if $use_captcha && $captcha_method == '2'}
                                    <hr class="qa_rule" />
                                    <b>CAPTCHA Verification:</b>
                                    <div{if $valid.return} class="error"{/if}>
                                        <div class="mar_btm" id="captcha{$q_id}"></div>
                                    {/if}
                                    <div class="pull-right">
                                        <input type="submit" name="submit" value="Submit Your Answer" class="sitesearch_btn btn btn-primary" />
                                    </div>
                                    {if $valid.return && $valid.is_valid.$field_name == 'n'}
                                        <div class="error">
                                            <p>Your response was invalid or blank.</p>
                                            This error is usually caused by invalid characters in your response.
                                        </div>
                                    {/if}
                            </form>
                        </li>
                    </ul>
                    <ul id="answers_{$q_id}" style="display: none;">
                        {foreach from=$q.answers key="a_id" item="a"}
                            <li class="answer">
                                {assign var="special" value=""}
                                {if $a.special == 'verified'}
                                    {assign var="special" value='<img src="{$img_prefix}/images/verified.gif" />'}
                                {elseif $a.special == 'customer_service'}
                                    {assign var="special" value='<img src="{$img_prefix}/images/customer_service.gif" />'}
                                {/if}
                                <span class="qa_info">Answered by {$special} <b>{$a.name}</b>, {$a.date|date_format:"%B %e, %Y"} at {$a.date|date_format:"%r %Z"}</span>.
                                <hr class="qa_rule" />
                                <b>A:</b> {$a.body|nl2br}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>

        <div>
            &nbsp;&nbsp;<img src="{$img_prefix}/images/ans_right.gif" /> - Click the arrow or text to reveal answers.<br />
            &nbsp;<img src="{$img_prefix}/images/customer_service.gif" /> - Customer service representatives.<br />
            &nbsp;<img src="{$img_prefix}/images/verified.gif" /> - Verified purchasers of this product.
        </div>

        {if $valid.return}
            <script type="text/javascript">
                                showHideQA('response',{$valid.question_id});
                                Recaptcha.create('{$recaptcha_key}', 'captcha{$valid.question_id}',{ldelim}theme: 'red', callback: Recaptcha.focus_response_field{rdelim});
            </script>
        {/if}
    </div>
</body>
</html>