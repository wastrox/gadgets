require 'rails_helper'

describe Gadget do
	it "can be created" do
    	expect { 10.times { create(:gadget) } }.to change(Gadget, :count).by(10)
	end
end
