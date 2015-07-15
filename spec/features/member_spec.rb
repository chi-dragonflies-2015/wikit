require 'rails_helper'

feature "User visits the website" do
  scenario "when user visits the index as a member" do
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    visit '/members'
    expect(page).to have_content("All members")
    expect(page.has_link?("delete")).to be false
  end

  scenario "when user visits the index as an admin" do
    member = FactoryGirl.create(:member)
    member.admin = true
    member.save
    puts member.admin
    login_as(member, :scope => :member)
    visit '/members'
    expect(page).to have_content("All members")
    expect(page.has_link?("delete")).to be true
  end
end