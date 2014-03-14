# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supplier_comment do
    body "MyText"
    supplier nil
  end
end
