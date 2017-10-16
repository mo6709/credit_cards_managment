1) dispaly all accounts when a user loggedin
2) add buttons delete and edit to each account
3) if user logged in and not an admin 
   *on welcome page display
     *if a card not exist in the user.card  
       *add a button to add an account with the specific card
     *if a card already exist in user.cards
       *add a button to remove an account with the specific card
4) if auser loggdin as an admin
   *on welcome page dispaly
     *on top of the page add a button to create a new card/bank partner
     *remove and edit buttons to each card
   *on bank partenr index page
     *on top of the page add a button to create a new bank partner 
     *remove and edit buttons to each bank partner
   *on cards index page 
     *on top of the page add a button to create a new card
     *remove and edit buttons to each card  


*add a method to prefix a st, nd, rd, st to the due date
*add alerts in all placeces
*cach current user and all other places where possiable
-------------Validations-----------------
*accounts
 1)uniqu account_number
 2)all attributes must be presance 

*bank_partner
 1)uniqu name

*card
 1)uniqu name
 2)all attributes must be presance 

*user
 1)uniqu email
 2)must have password 
 3)password and confirm_password must match

*category
 1)must have a title 


Rails with Jquery

1)Create serializer for Cards

2)render JSON object in CardsController for #create, #index, #show

3)Highjack the following events and handle them.
  #create
    When click on the submit the create card form, the form should submit with AJAX then clear the page and dispaly the new card
  #index
    When page scrolled and reached to the buttom in cards index, make an AJAX request to get 6 more cards (make sure to get the next 6 not the same 6 that alrady on the page) then append them to the index page.
  #show
    When a specific card's name is cliked in the cards index page, clear the index page and show the spesific card.

4)Create Card prototype object
  the object should have:

  A)Card.create(); to handel the submition of the create form
    1)Card.display(); to dispaly the new card that was created when success. (use handel bars).

  B)Card.index(); to handel the scralling event
    1)Card.all(); to display the next 6 cards when success. (use handel bars)

  C)Card.show(); to handel the click event for a specific card
     1)Card.show(); to display a specific card when success. (use handel bars)







