#this will guess the Member class
FactoryGirl.define do
  factory :member, aliases: [:author] do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "wikitpassword"
  end

  factory :article do
    author
    title "Article Title"
    contents "Article Contents"
  end
end