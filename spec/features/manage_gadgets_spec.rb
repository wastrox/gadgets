require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

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
						scenario "I see that my gadgets list is empty" do
							expect(page).to have_text("You don't have any gadgets yet")
						end
						scenario "I can add my first gadget" do
							expect(page).to have_text("Add Gadget")
						end
						scenario "New gadget can be created" do
							click_link "Add Gadget"
							fill_in "Title", with: "iPhone"
							click_button "Save"
							expect(page).to have_text("Gadget was successfully created")
							expect(page).to have_text("iPhone")
						end
					end
				end
				describe "I can see my gadgets collection #1079" do
					before(:each) do
						create(:gadget, title: "iPhone")
						create(:gadget, title: "iPad")
						visit gadgets_path
						expect(page).to have_text("iPhone")
						expect(page).to have_text("iPad")
					end
					scenario "in COVER FLOW mode #1080" do
						click_button "Cover Flow View"
					end
					scenario "in LIST mode #1081" do
						click_button "List View"
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