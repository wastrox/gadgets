require 'rails_helper'

describe Gadget do
	it "can be created" do
    	expect { 10.times { create(:gadget) } }.to change(Gadget, :count).by(10)
	end
	it "should belong to user" do
		expect { create(:gadget, user: @user) }.to change(@user.gadgets, :count).by(1)
	end
	it "should be linked to user" do
		gadget = create(:gadget, user: @user)
		expect(gadget.user).to be(@user)
	end
end
