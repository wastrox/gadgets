include ActionDispatch::TestProcess

FactoryGirl.define do
	factory :photo do
		ignore do
			filename Rails.root.join("spec/fixtures/files/gadgets/iPhone4s/iPhone4s_1.jpg")
		end
	  	photo { fixture_file_upload filename, 'image/jpeg' }
	end
end
