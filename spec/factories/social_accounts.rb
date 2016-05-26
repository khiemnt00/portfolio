# == Schema Information
#
# Table name: social_accounts
#
#  id        :integer          not null, primary key
#  author_id :integer          not null
#  name      :string(255)      not null
#  url       :string(255)      not null
#

FactoryGirl.define do
  factory :social_account do
    association :author, factory: :author
    url { Faker::Internet.url }
    sequence(:account_type) { |i| SocialAccount.account_types.keys[i] }
  end
end