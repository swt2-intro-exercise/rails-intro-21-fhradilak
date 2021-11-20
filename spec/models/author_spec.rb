require 'rails_helper'

describe "Author Model", type: :model do
  it "should have the attributes first and last name and website and the method name wihch returns the full name of an author" do
    author = Author.new(first_name: "Herbert", last_name: "Herbertson", homepage: "Herbertson.com")
    expect(author.first_name).to eq("Herbert")
    expect(author.last_name).to eq("Herbertson")
    expect(author.homepage).to eq("Herbertson.com")
    expect(author.name).to eq("Herbert Herbertson")
  end
end