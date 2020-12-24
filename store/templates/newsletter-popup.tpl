<div id="npfade" ></div>
<div id="popcontainer" class="container">
        <div id="close"></div>
        <div id="form_part">
                <div id="news-signup-dialog" >
                        <h2>Sign up for eMail</h2>
                        <h1 class="text_uppercase">SPECIAL OFFERS</h1>
                        <form name="newsletter" action="index.php" method="post" id="news-popup-form">
                                <input type="hidden" name="action" value="NewsletterRequest" />
                                <input type="hidden" name="to_email" value="{#form_newsletter_to#}" />
                                <input type="hidden" name="from_email" value="{#form_newsletter_from#}" />
                                <input type='hidden' name='marketing_cat' value='Newsletter Requests' />
                                <div class="form-group">
                                    <label for="add_email" class="sr-only">Email address</label>
                                    <input type="email" name="add_email" maxlength="50" class="form-control" value="" placeholder="Enter your email address">
                                </div>
                                <input type="submit" name="submit" value="Sign Up" alt="Sign Up" class="btn btn-primary">
                        </form>
                </div>
        </div>
</div>