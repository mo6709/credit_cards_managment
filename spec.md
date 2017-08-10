# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project - 
  Of course!
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) -
   A category has_many cards
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) -
  An account belongs_to user
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - 
   A bank_partner has_many cards through cards_bank_partners
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) 
   An account which is a join table has many properties i.e account number, and credit line.
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -  Account, BankPartner, Card, CardBankPartner, Category, User.
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Card has type class method to query the db for all cards that belongd to sortain type.
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - 
  BankPartner can create a new card in the new form for BankPartner
- [X] Include signup (how e.g. Devise) -
   User can signup, Omniauth with Google 
- [X] Include login (how e.g. Devise) - 
  User can login 
- [X] Include logout (how e.g. Devise) - 
   User can logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) - 
   Google Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - 
  bank_partners/1/cards
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - 
   admin/cards/new
- [X] Include form display of validation errors (form URL e.g. /recipes/new) - 
   All model will display errors on top of the page
Confirm:
- [X] The application is pretty DRY - 
  Tryed my best there is alot more to do.
- [X] Limited logic in controllers - 
  Most of the loging implemented on the model level.
- [] Views use helper methods if appropriate - 
   Cards view user helper method i.e add_card method, Admin view user helper method i.e admin_buttons_for method
- [X] Views use partials if appropriate -
  partial used in cards, and bank_partner mainly 
