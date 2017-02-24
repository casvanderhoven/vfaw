FactoryGirl.define do
  factory :recipe do
    name { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    instructions "Play Eminem song"
    association(:user)
  end
end
