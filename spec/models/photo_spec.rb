require 'spec_helper'

describe Photo do
	it "can be mass-created for gadget" do
	    gadget = create(:gadget)
	    files = Dir.glob(Rails.root.join "spec/fixtures/files/gadgets/iPhone4s/**/*")

		files.map do |file| 
			photo = build(:photo, filename: file)
			gadget.photos.new(photo.attributes)
			gadget.save
		end

		expect(gadget.photos.count).to be files.count+1 # 1 photo is automatically created by factory on gadget create
	end
end
