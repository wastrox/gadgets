require 'spec_helper'

describe User do

  it "can be created" do
    expect { 10.times { create(:user) } }.to change(User, :count).by(10)
  end

end
