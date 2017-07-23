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











