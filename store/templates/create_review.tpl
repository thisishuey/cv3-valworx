{include file="_top.tpl"}

<h1>Add a Review</h1>

<div class="form-container">

    {if $valid.return == '1'}
        <div class="errors">
            <p><em>There was an error.</em></p>
            <p>Please double-check any highlighted fields.</p>
            <p><em>{$error}</em></p>
        </div>
    {/if}

    <p class="legend"><strong>Note:</strong> * Indicates a required field</p>

    <form method="post" action="index.php"> 
        <input type="hidden" name="action" value="CreateReview" />

        <fieldset><legend>Review Information</legend>

            <div class="form-group {if $valid.return and $valid.creator_name == ''} has-error{/if}">
                <label for="creator_name"><span class="req">*</span> Your Name:</label>
                <input type="text" name="creator_name" id="creator_name" class="form-control" value="{$valid.creator_name}" />
            </div>

            <div class="form-group {if $valid.return and $valid.creator_email == ''} has-error{/if}">
                <label for="creator_email"><span class="req">*</span> Your Email:</label>
                <input type="email" class="form-control" id="creator_email" name="creator_email" value="{$valid.creator_email}" />
                <small class="help-block">(email address will not be displayed)</small>
            </div>

            <div class="form-group {if $valid.return and $valid.city == ''} has-error{/if}">
                <label for="city"><span class="req">*</span> Your City:</label>
                <input type="text" id="city" name="city" class="form-control" value="{$valid.city}" />
            </div>

            <div class="form-group {if $valid.return and $valid.state == ''} has-error {/if}">
                <label for="state"><span class="req">*</span> Your State:</label>
                <select name="state" id="state" class="form-control">
                    {html_options options=$options.state selected=$valid.state}
                </select>
            </div>

            <div class="form-group {if $valid.return and $valid.country == ''} has-error{/if}">
                <label for="country"><span class="req">*</span> Your Country:</label>
                <select name="country" id="country" class="form-control">
                    {html_options options=$options.country selected=$valid.country}
                </select>
            </div>

            <div class="form-group {if $valid.return and $valid.title == ''} has-error{/if}">
                <label for="title"><span class="req">*</span> Your Review Title:</label>
                <input type="text" name="title" id="title" value="{$valid.title}" class="form-control" />
            </div>

            <div class="form-group {if $valid.return and $valid.comments == ''} has-error{/if}">
                <label for="comments"><span class="req">*</span> Your Comments:</label>
                <textarea name="comments" id="comments" class="form-control">{$valid.comments}</textarea>
            </div>

        </fieldset>

        <fieldset><legend>Your Rating</legend>

            <div class="radio">
                <label>
                    <input type="radio" name="rating" value="1" {if $valid.rating == '1'}selected{/if} />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="rating" value="2" {if $valid.rating == '2'}selected{/if} />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="rating" value="3" {if $valid.rating == '3'}selected{/if} />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="rating" value="4" {if $valid.rating == '4'}selected{/if} />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="rating" value="5" {if $valid.rating == '5'}selected{/if} />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                    <img src="{$img_prefix}/images/rating100.png" alt="Star rating" />
                </label>
            </div>
        </fieldset>

        {if $use_captcha}
            <fieldset><legend>CAPTCHA Verification</legend>
                <div{if $valid.return} class="error"{/if}>
                    {if $captcha_method == '2'}
                        <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
                        <noscript>
                        <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
                        <br />
                        <textarea name="recaptcha_challenge_field" id="recaptcha_challenge_field" rows="3" cols="40" class="form-control"></textarea>
                        <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
                        </noscript>
                    {else}
                    {if !$smarty.session.mobile}<label for="captcha_test"><span class="req">*</span> Type image characters:</label>{/if}
                    <input type="text" name="captcha_test" id="captcha_test" class="form-control"/>
                {/if}
                {if $captcha_method == '1'}
                    <img src="/get_captcha_image" alt="Captcha authorization" />
                {/if}
            </div>
        </fieldset>
    {/if}

    <div class="buttonrow form-group">
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{$cat_id}" />
        <input type="submit" name="submit"  value="Add Review" class="btn btn-primary" />
    </div>

</form>

</div>

{include file="_bottom.tpl"}
