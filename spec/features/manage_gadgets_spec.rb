require 'spec_helper'
require 'set'
include Warden::Test::Helpers
Warden.test_mode!

shared_examples "visually creatable" do |target, title|
  it "should create #{target}" do
  	expect {
		visit gadgets_path
		click_link "Add Gadget"
		fill_in "Title", with: title
		click_button "Save"
		expect(page).to have_text("Gadget was successfully created")
		expect(page).to have_text(title)
	}.to change(Gadget, :count).by(1)
  end
end

feature "Gadgets Management" do
	describe "In order to manage my gadgets collection" do
		describe "As unregistered user" do
			scenario "I can sign up" do
				visit root_path
				expect(page).to have_text("You need to sign in or sign up before continuing")
			end
		end
		describe "As a registered user" do
			scenario "I can sign in" do
				visit root_path
				fill_in "Email", with: "tester@test.com"
				fill_in "Password", with: "123"
				# save_and_open_page
				click_button "Sign in"
				expect(page).to have_text("Welcome to Gadgets")
			end
			describe "I want to create and manage gadgets" do
				before(:each) do
				    login_as(@user, :run_callbacks => false)
				end
				describe "If I don't have any gadgets yet" do
					describe "When I visit gadgets collection page" do
						before(:each) do
							Gadget.destroy_all
							visit gadgets_path
						end
						it_should_behave_like "visually creatable", "gadget", "iPhone"

						scenario "I see that my gadgets list is empty" do
							expect(page).to have_text("You don't have any gadgets yet")
						end
						scenario "I can add my first gadget" do
							expect(page).to have_text("Add Gadget")
						end

					end
				end
				describe "I can see my gadgets collection #1079" do
					# make sure we can add additional gadgets when we already have some
					it_should_behave_like "visually creatable", "gadget", "iPhone2"

					before(:each) do
						expect {
							create(:gadget, title: "iPhone", user: @user)
							create(:gadget, title: "iPad", user: @user)
							visit gadgets_path
							expect(page).to have_text("iPhone")
							expect(page).to have_text("iPad")
						}.to change(Gadget, :count).by(2)
					end
					scenario "COVER FLOW mode available #1080" do
						click_button "Cover Flow View"
					end
					scenario "LIST mode available #1081" do
						click_button "List View"
					end
					scenario "only MY OWN gadgets are listed" do
						expect { 
							create(:gadget, title: "Another user's gadget", user: @another_user)
						}.to change(Gadget, :count).by(1)
						visit gadgets_path
						expect(page).not_to have_text("Another user's gadget")						
					end
				end

				describe "I can add new gadget" do
					before(:each) do
						visit create_gadgets_path
					end
					scenario "I can upload many gadget images #1082" do
						visit upload_gadget_images_path
					end
				end
				describe "I can view existing gadget images" do
					scenario "In different sizes #1083" do
						visit show_gadgets_path
					end
				end
			end
		end

	end	

end