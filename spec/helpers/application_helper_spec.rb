require 'spec_helper'
 include ActionView::Helpers::TagHelper
 include ActionView::Context 
 include ApplicationHelper

describe ApplicationHelper, :type => :helper do
	describe "image helper i" do
		describe "for predefined alias classes (not existing in glyphicon styles list)" do
			it "should work without optional parameters" do
				expect(i("edit")).to eq(%Q(<span class="glyphicon glyphicon-pencil " id=""></span>))
			end
			it "should work with :class, :id and :title specified" do
				expect(i("edit", "some_class", "some_id")).to eq(%Q(<span class="glyphicon glyphicon-pencil some_class" id="some_id"></span>))
			end
		end
		describe "for default glyphicon styles" do
			it "should work with only class name, without glyphicon- prefix" do
				expect(i("search")).to eq(%Q(<span class="glyphicon glyphicon-search " id=""></span>))
			end
			it "should work with only class name specified as symbol" do
				expect(i(:search)).to eq(%Q(<span class="glyphicon glyphicon-search " id=""></span>))
			end
		end
	end
end
