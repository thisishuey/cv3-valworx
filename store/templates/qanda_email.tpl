{*

   You can customize your message to the customer by using the $type variable.

    $type will be set to 'question' if the customer asked a question and 'answer' if they answered a question.

*}

{if $type == 'question'}

  {* Enter your message for question askers here. *}

  Thank you for your question!


{elseif $type == 'answer'}

  {* Enter your message for question answerers here. *}

  Thank you for your answer!

{elseif $type == 'response'}

  {* Enter your message for responses to answers below. *}

  {$responder} has left the following response to your question:

  {$response}

  Original question:

  {$question}
{/if}
