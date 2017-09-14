require 'rails_helper'

feature "When a user visits a specific vending machine page" do
  scenario "they see the names of all the snacks associated with that vending machine along with their price" do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    turing = sam.machines.create(location: "Turing Basement")
    don.snacks.create(name: "Boulder Chips", price: 3.50)
    don.snacks.create(name: "Twizzlers", price: 2.00)
    don.snacks.create(name: "Ms. Fields Awesome Cookies", price: 9.50)

    visit machine_path(don)

    expect(page).to have_content("Don's Mixed Drinks")

    expect(page).to have_content("Boulder Chips")
    expect(page).to have_content(3.50)

    expect(page).to have_content("Twizzlers")
    expect(page).to have_content(2.0)

    expect(page).to have_content("Ms. Fields Awesome Cookies")
    expect(page).to have_content(9.50)
  end
end
