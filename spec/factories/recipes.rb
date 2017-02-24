FactoryGirl.define do
  factory :recipe do
    name { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    instructions "Play Eminem song"
    mealtype { [:breakfast, :lunch, :dinner].sample }
    association(:user)
  end
end
