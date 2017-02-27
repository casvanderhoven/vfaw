FactoryGirl.define do
  factory :recipe do
    name { Faker::Hipster.sentence }
    description "easy, 20 minutes"
    instructions "Play Eminem song"
    ingredient_list "Sample ingredient 1, sample ingredient 2, sample ingredient 3, sample ingredient 4, SAMPLE ingredient 5"
    mealtype { [:breakfast, :lunch, :dinner].sample }
    association(:user)
  end
end
