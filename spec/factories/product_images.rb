# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_image, :class => 'ProductImages' do
    path "MyText"
    product nil
  end
end
