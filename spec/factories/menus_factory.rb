FactoryGirl.define do
  factory :menu do
    meal "Brunch"
    start  DateTime.strptime("09:00", "%H:%M")
    stop  DateTime.strptime("11:00", "%H:%M")
  end
end
