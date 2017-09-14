require 'rails_helper'

feature "When a user visits a specific vending machine page" do
  scenario "they see the average price of all snacks in the vending machine" do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    turing = sam.machines.create(location: "Turing Basement")
    don.snacks.create(name: "Boulder Chips", price: 3.50)
    don.snacks.create(name: "Twizzlers", price: 2.00)
    don.snacks.create(name: "Ms. Fields Awesome Cookies", price: 9.50)

    visit machine_path(don)

    expect(page).to have_content("The average price of snacks is $5.0")
  end
end
