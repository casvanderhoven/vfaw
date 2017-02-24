FactoryGirl.define do
  factory :recipe do
    name "Mom's Spaghetti"
    description "The best pasta in the world"
    instructions "Play Eminem song"
    ingredients { {  "eminem song"=>"1" } }
    association(:user)
  end
end
