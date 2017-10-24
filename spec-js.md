# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      When specific link to a credit card is clicked(on the card index page) an ajax request is fire. The backend API sends back a serialized card with the necessary info. 
- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      When specific link to a Bank Partner is clicked(on the bank partner index page) an ajex request is fire. The backend API sends back serialized bank partner with all its associated cards.
- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      The serialized bank partner returns all its associated cards. 
- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
      Create new card use ajax to render a form and use ajax to submit the form plus it render the card on the page. 
- [X] Translate JSON responses into js model objects.
      Card being interpreted to Card prototype object. Bank Partner being interpreted to a BanPatner prototype object.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      Card has prototype.renderModal(). BankPartner has prototype.renderModal(); 
Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
