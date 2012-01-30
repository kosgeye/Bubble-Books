require 'spec_helper'

describe "books/new.html.erb" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :price => "MyString",
      :book_class => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path, :method => "post" do
      assert_select "input#book_title", :name => "book[title]"
      assert_select "input#book_price", :name => "book[price]"
      assert_select "input#book_book_class", :name => "book[book_class]"
      assert_select "input#book_user_id", :name => "book[user_id]"
    end
  end
end
