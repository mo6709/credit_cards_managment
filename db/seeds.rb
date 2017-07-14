Category.destroy_all
Card.destroy_all
Account.destroy_all

Category.create(title: "hotel")
Category.create(title: "airline")
Category.create(title: "traveling")

BankPartner.create(name: "Visa")
BankPartner.create(name: "Bank of America")
BankPartner.create(name: "American Express")
BankPartner.create(name: "Chase")

counter = 1
5.times do 
	Card.create(name: "name#{counter}",c_type: "personal", category_id: 1)
	counter += 1
end

5.times do 
	Card.create(name: "name#{counter}",c_type: "personal", category_id: 2)
	counter += 1
end

2.times do 
	Card.create(name: "name#{counter}",c_type: "business", category_id: 3)
	counter += 1
end

a_n = Random.new_seed.to_s

Account.create(account_number: a_n, card_id: 2)

Account.create(account_number: a_n, card_id: 3)

Account.create(account_number: a_n, card_id: 13)
