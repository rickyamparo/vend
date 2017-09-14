require 'rails_helper'

feature "When a user visits a specific snack page" do
  before(:each) do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    turing = sam.machines.create(location: "Turing Basement")

    chips = don.snacks.create(name: "Boulder Chips", price: 3.50)
    twizzlers = don.snacks.create(name: "Twizzlers", price: 2.00)
    cookie = don.snacks.create(name: "Ms. Fields Awesome Cookies", price: 9.50)

    turing.snacks << chips
    turing.snacks << twizzlers

    visit snack_path(don.snacks.first)

  end

  scenario "they see the name of that snack" do
    expect(page).to have_content("Boulder Chips")
  end

  scenario "they see the price of that snack" do
    expect(page).to have_content(3.50)
  end

  scenario "they see a list of vending machiens that carry that snack" do
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end

  scenario "they see the average price for snacks in those vending machines" do
    expect(page).to have_content(5.0)
    expect(page).to have_content(2.75)
  end

  scenario "they see a count of the different kinds of snacks in those machines" do
    expect(page).to have_content("There are 3 kinds of snacks in this machine")
    expect(page).to have_content("There are 2 kinds of snacks in this machine")
  end
end
