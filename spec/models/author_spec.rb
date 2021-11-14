require 'rails helper'

describe "Author Model", type: :model do
  it "should have the method name wich retruns the full name of an author" do
    author = Author.new(first_name: "Herbert")
    expect(author.first_name).to eq("Herbert")
  end
end