require 'rails_helper'

RSpec.describe "decks/new", type: :view do
  before(:each) do
    assign(:deck, Deck.new(
      :language => "MyString",
      :title => "MyString",
      :description => "MyString",
      :category => nil
    ))
  end

  it "renders new deck form" do
    render

    assert_select "form[action=?][method=?]", decks_path, "post" do

      assert_select "input[name=?]", "deck[language]"

      assert_select "input[name=?]", "deck[title]"

      assert_select "input[name=?]", "deck[description]"

      assert_select "input[name=?]", "deck[category_id]"
    end
  end
end
