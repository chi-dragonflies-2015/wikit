require 'rails_helper'

feature 'Should see tags' do

  scenario 'When visiting an article' do
    art = Article.create(title: "Example Title Purple", contents: "a fish called harold", author: build(:author))
    art.tags.create(name: "Jack")
    visit "/articles/#{art.id}"
    expect(page).to have_content("Jack")
  end

  scenario 'After adding a new tag a user should be able to see it' do
    art = Article.create(title: "Example Title Purple", contents: "a fish called harold", author: build(:author))
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    visit "/articles/#{art.id}"
    click_link("add tag")
    within('#tag-form-element') do
      fill_in('tag_name', :with => 'Jack')
      click_button('Create Tag')
    end
    expect(page).to have_content("Jack")
  end

  scenario 'User can delete a tag on the Article show page' do
    art = Article.create(title: "Example Title Purple", contents: "a fish called harold", author: build(:author))
    art.tags.create(name: "hello")
    art.tags.create(name: "goodbye")
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    visit "/articles/#{art.id}"
    first('.delete-tag').click
    expect(page).to_not have_content("hello")
    expect(page).to have_content("goodbye")
  end


end