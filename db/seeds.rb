# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    Transaction.destroy_all
    Currency.destroy_all
    Wallet.destroy_all 
    User.destroy_all

    # demo user
    toby = User.create!(email:"toby@email.com", fname: "Toby", lname: "Dundridge", password: "password")
    
    # users
    andy = User.create!(email:"andy@email.com", fname: "Andy", lname: "Minucos", password: "password")

    # used for deposits/withdrawals
    bank = User.create!(email:"vault@transferyikes.com", fname: "Scrooge", lname: "McDuck", password: "no1dime")

    # transactions
    # andy deposits
    deposit1 = Transaction.create!(name: "Deposit", sent_amount: 1000, from_currency: "USD", to_currency: "USD", sender_id: bank.id, receiver_id: andy.id, exchange_rate: 1)
    deposit2 = Transaction.create!(name: "Deposit", sent_amount: 1200, from_currency: "AUD", to_currency: "AUD", sender_id: bank.id, receiver_id: andy.id, exchange_rate: 1)
    deposit3 = Transaction.create!(name: "Deposit", sent_amount: 800, from_currency: "GBP", to_currency: "GBP", sender_id: bank.id, receiver_id: andy.id, exchange_rate: 1)
    # toby deposits
    deposit4 = Transaction.create!(name: "Deposit", sent_amount: 3400, from_currency: "USD", to_currency: "USD", sender_id: bank.id, receiver_id: toby.id, exchange_rate: 1)
    deposit5 = Transaction.create!(name: "Deposit", sent_amount: 5600, from_currency: "AUD", to_currency: "AUD", sender_id: bank.id, receiver_id: toby.id, exchange_rate: 1)
    deposit6 = Transaction.create!(name: "Deposit", sent_amount: 450, from_currency: "GBP", to_currency: "GBP", sender_id: bank.id, receiver_id: toby.id, exchange_rate: 1)
    # andy to toby

end
