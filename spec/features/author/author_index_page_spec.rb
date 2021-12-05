require "rails_helper"

describe "Author Show Index Page", type: :feature do
  before :each do
    @author_details = FactoryBot.create :author
  end
  it "should display a table with the headings Name and Homepage, listing the full name of authors and links to homepages. Should contain a link to add new authors" do


    visit authors_path

    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'Homepage'

    expect(page).to have_text @author_details.name
    expect(page).to have_text @author_details.homepage
    #expect(page).to have_link nil, href: @author_details.homepage


    #expect(page).to have_link "Create a new author", href: new_author_path
  end

  it "should show a link to delete an author" do
    visit authors_path

    expect(page).to have_link 'Delete', href: author_path(@author)
  end

  it "should delete author on clicking deletion link" do
    visit authors_path

    find('a[data-method="delete"]', text: 'Delete').click
    expect(Author.exists?(first_name: @author.first_name, last_name: @author.last_name, homepage: @author.homepage)).to be_falsey
  end
end