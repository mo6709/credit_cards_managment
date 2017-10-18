var cards = {};

function Card(attributes){
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

Card.getCard = function(cardNode){		
    $.ajax({
    	url: cardNode.href,
    	dataType: "json",
    	method: 'GET'
    })
    .success(function(data){
    	var newCard = Card.makeCard(data)
    	Card.showCard(newCard)
    }) 
};

Card.showCard = function(cardObject){ 
	// make a modal appear on the page with handelbars
};

Card.makeCard = function(json){
    var card = new Card(json);
    cards[card.id] = card;
};


$(function(){
	$('a.card_name').on("click", function(event){
		event.preventDefault();
        
	    if(cards[this.dataset.id]){
		    Card.showCard(cards[this.dataset.id])
		}else{
			Card.getCard(this)
		}		
	});
})