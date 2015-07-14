#this will guess the Member class
FactoryGirl.define do
  factory :member, aliases: [:author] do |user|
    user.email {"user_#{rand(1000).to_s}@factory.com" }
    user.password "wikitpassword"
  end

  factory :article do
    author
    title "Article Title"
    contents "Article Contents"
  end
end