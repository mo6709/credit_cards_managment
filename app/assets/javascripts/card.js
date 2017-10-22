var cards = {};

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
    	debugger;
    })
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
    	Card.showCard(newCard.id)
    }) 
};

Card.showCard = function(cardId){ 
   $(`#modalCard${cardId}`)[0].style.display = "block";
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

    Card.modalTemplateSource = $('#modalTemplate').html();
    Card.modalTemplate = Handlebars.compile(Card.modalTemplateSource); 

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
        BankPartner.getCards(this);
        // BankPartner.showCards();
	});

})




