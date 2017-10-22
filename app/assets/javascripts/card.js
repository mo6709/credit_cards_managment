var cards = {};
var bankPartners = {};

function Card(attributes){
	this.id = attributes.id;
    this.name = attributes.name;
    this.c_type = attributes.c_type;
    this.bonus = attributes.bonus;
    this.apr = attributes.apr;
    this.anual_fee = attributes.anual_fee;
    this.credit_needed = attributes.credit_needed;
    this.balance_transfer_apr = attributes.balance_transfer_apr;
    this.category = attributes.category.title;
    this.bank_partners = attributes.bank_partners;
    this.balance_transfer_period = attributes.balance_transfer_period;
    this.corp_url = attributes.corp_url;
};

function BankPartner(attributes){
	this.id = attributes.id;
	this.name = attributes.name;
	this.cards = attributes.cards;
};

BankPartner.getCards = function(bankNode){
    $.ajax({
    	url: bankNode.href,
    	dataType: "json",
    	method: "GET"
    })
    .success(function(data){
    	var newBankPartner = BankPartner.makeCards(data);
    	var cardsList = newBankPartner.renderModal();
    	$(`div.banks_list ul li div#bank_partner_cards_list_${data.id}`).append(cardsList);
    	newBankPartner.showCards();   	
    })
};

BankPartner.prototype.renderModal = function(){
    return BankPartner.modalTemplate(this)
};

BankPartner.makeCards = function(json){
  var bankPartner = new BankPartner(json);
  bankPartners[bankPartner.id] = bankPartner;
  return bankPartner;
};

BankPartner.prototype.showCards = function(){
    $(`div.banks_list ul li div#bank_partner_cards_list_${this.id} .modal`)[0].style.display = "block"
};


Card.getCard = function(cardNode){
    $.ajax({
    	url: cardNode.href,
    	dataType: "json",
    	method: 'GET'
    })
    .success(function(data){
    	var newCard = Card.makeCard(data)
    	var cardModal = newCard.renderModal()
    	$('div.cards_list').append(cardModal);
    	newCard.showCard();
    }) 
};

Card.showCard = function(){ 
   $(`#modalCard${this.id}`)[0].style.display = "block";
};

Card.makeCard = function(json){
    var card = new Card(json);
    cards[card.id] = card;
    return card;
};


Card.prototype.renderModal = function(){
    return Card.modalTemplate(this)
};


function closeCard(card){
	card.parentElement.parentElement.style.display = "none"
};


$(function(){

    Card.modalTemplateSource = $('#cardModalTemplate').html();
    Card.modalTemplate = Handlebars.compile(Card.modalTemplateSource); 

    BankPartner.modalTemplateSource = $('#bankPartnerModalTemplate').html();
    BankPartner.modalTemplate = Handlebars.compile(BankPartner.modalTemplateSource);

	$('a.card_name').on("click", function(event){
		event.preventDefault();
	    if(cards[this.dataset.id]){
		    Card.showCard(this.dataset.id)
		}else{
			Card.getCard(this)
		}		
	});


	$('li div strong a.bank_link').on("click", function(event){
        event.preventDefault();
        if (bankPartners[this.dataset.id]){
            // BankPartner.showCards();
        }else{
            BankPartner.getCards(this);
        }        
	});

})




