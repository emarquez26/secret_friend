FactoryGirl.define do
  factory :user do
    name "Edwin"
    like "chocolates, cervezas, dulces y mas"
    dislike "panela, yuca, ñame"
    email "c@koombea.com"
    password "1234567890"
    relation "false"
  end

  factory :relation do
    relation "true"
  end
end
