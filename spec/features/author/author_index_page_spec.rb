require "rails_helper"

describe "Author Show Index Pape", type: :feature do
  it "should display a table with the headings Name and Homepage, listing the full name of authors and links to homepages. Should contain a link to add new authors" do
    @author_details = FactoryBot.create :author

    visit authors_path

    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'Homepage'

    expect(page).to have_text @author_details.name
    expect(page).to have_link nil, href: @author_details.homepage


    expect(page).to have_link 'Create a new author', href: new_author_path
  end
end