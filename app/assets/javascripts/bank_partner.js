var bankPartners = {};

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

$(function(){
	BankPartner.modalTemplateSource = $('#bankPartnerModalTemplate').html();
    BankPartner.modalTemplate = Handlebars.compile(BankPartner.modalTemplateSource);

    $('li div strong a.bank_link').on("click", function(event){
        event.preventDefault();
        if (bankPartners[this.dataset.id]){
            bankPartners[this.dataset.id].showCards();
        }else{
            BankPartner.getCards(this);
        }        
	});
})