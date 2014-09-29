FactoryGirl.define do
  factory :gadget do
  	sequence :title do |n| "test gadget #{n}" end
  	user @user
    after(:create) do |gadget, evaluator|
        @photo = create_list(:photo, 1, imageable: gadget)
    end
  end
end
