require 'rails_helper'

RSpec.describe "decks/edit", type: :view do
  before(:each) do
    @deck = assign(:deck, Deck.create!(
      :language => "MyString",
      :title => "MyString",
      :description => "MyString",
      :category => nil
    ))
  end

  it "renders the edit deck form" do
    render

    assert_select "form[action=?][method=?]", deck_path(@deck), "post" do

      assert_select "input[name=?]", "deck[language]"

      assert_select "input[name=?]", "deck[title]"

      assert_select "input[name=?]", "deck[description]"

      assert_select "input[name=?]", "deck[category_id]"
    end
  end
end
