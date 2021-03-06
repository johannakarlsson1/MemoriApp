require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :original => "MyString",
      :target => "MyString",
      :language => "MyString"
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "input[name=?]", "card[original]"

      assert_select "input[name=?]", "card[target]"

      assert_select "input[name=?]", "card[language]"
    end
  end
end
