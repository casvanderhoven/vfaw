FactoryGirl.define do
  factory :meal_plan do
    start_date { Date.today }

    association(:user)
  end
end
