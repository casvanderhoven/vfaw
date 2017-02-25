FactoryGirl.define do
  factory :recipe do
    name { Faker::Hipster.sentence }
    description "easy, 20 minutes"
    instructions "Play Eminem song"
    mealtype { [:breakfast, :lunch, :dinner].sample }
    association(:user)
  end
end
