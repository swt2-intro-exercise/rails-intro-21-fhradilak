require 'rails_helper'

 describe "New author page", type: :feature do

     first_name = 'Alanson'
     last_name = 'Turingson'
     homepage = 'http://wikipedia.org/Alan_Turing'

   it "should exist at 'new_author_path' and render without error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end

   it "should have text inputs for an author's first name, last name and homepage" do
     visit new_author_path
     # these are the standard names given to inputs by the Rails form builder
     expect(page).to have_field(name: 'author[first_name]')
     expect(page).to have_field(name: 'author[last_name]')
     expect(page).to have_field(name: 'author[homepage]')
   end

   it "should submit a new author" do
     visit new_author_path
     page.fill_in 'author[first_name]', with: first_name
     page.fill_in 'author[last_name]', with: last_name
     page.fill_in 'author[homepage]', with: homepage
     find('input[type="submit"]').click

     expect(Author.exists?(first_name: first_name, last_name: last_name, homepage: homepage)).to be_truthy

   end
     it "should pass the check that an authors last name is not an empty string" do
       visit new_author_path
       @author = Author.new(first_name: 'Alan', homepage: 'Alan@Alan.com')
       expect(@author).to_not be_valid
     end

     it "should show an error message when non valid data is entered" do
       visit new_author_path
       @author = Author.new(first_name: 'Alan', homepage: 'Alan@Alan.com')
       page.fill_in 'author[first_name]', with: @author.first_name
       page.fill_in 'author[homepage]', with: @author.homepage
       find('input[type="submit"]').click

       expect(page).to have_text 'error'
     end
 end
