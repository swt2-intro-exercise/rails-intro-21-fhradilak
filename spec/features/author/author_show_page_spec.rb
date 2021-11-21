require 'rails_helper'

describe "Author Show Page", type: :feature do
  it "should display an author's first and last name and homepage" do
    @author_details = FactoryBot.create :author
    #@id = @author_details.__id__
    #visit "authors/#{@id}"
    visit author_path(@author_details)

    expect(page).to have_text @author_details.first_name
    expect(page).to have_text @author_details.last_name
    expect(page).to have_text @author_details.homepage
  end
end