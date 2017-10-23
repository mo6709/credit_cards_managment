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

Card.prototype.showCard = function(){ 
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

//the bankPartner script depends on this function as well
function closeModal(card){
	card.parentElement.parentElement.style.display = "none"
};

Card.renderFormModal = function(){
	var formTemplate = Card.formModalTemplate({name: "cardNewForm"});
    $('#main_page').append(formTemplate);
};

Card.showFormModal = function(){
  $('#newCardForm')[0].style.display = "block"
};

$(function(){
    Card.modalTemplateSource = $('#cardModalTemplate').html();
    Card.modalTemplate = Handlebars.compile(Card.modalTemplateSource); 
    
    Card.modalFormTemplateSource = $('#newCardFormModalTemplate').html();
    Card.formModalTemplate = Handlebars.compile(Card.modalFormTemplateSource)

	$('a.card_name').on("click", function(event){
		event.preventDefault();
	    if(cards[this.dataset.id]){
		    cards[this.dataset.id].showCard()
		}else{
			Card.getCard(this)
		}		
	});

	$('div.admin_section #admin_creat_new_card').on("click", function(event){
		event.preventDefault();
		Card.renderFormModal();
		Card.showFormModal();
	});
})




