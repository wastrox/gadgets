require 'spec_helper'
require 'set'
include Warden::Test::Helpers
Warden.test_mode!

shared_examples "visually creatable" do |target, title|
  it "should create #{target}" do
  	expect {
		visit gadgets_path
		click_link "Add Gadget"
		fill_in "gadget_title", with: title
		click_button "Save"
		expect(page).to have_text("Gadget was successfully created")
		expect(page).to have_text(title)
	}.to change(Gadget, :count).by(1)
  end
end

shared_context "multiple files for upload" do
	let(:files) { Dir.glob(Rails.root.join "spec/fixtures/files/gadgets/iPhone4s/**/*") }
	let(:files_count) {files.count} # save files count for checking outside expect
	def gadget_with_photos
		expect { @gadget = create(:gadget, title: "iPhone4s", user: @user) }.to change(Gadget, :count).by(1)
		visit gadget_path(@gadget)
		files.map {|file| 
		    execute_script('$("#photo").show()') # make sure to make file_upload field visible or selenium will fail attaching files to it
			attach_file "photo[photo]", file
		}
		wait_for_ajax
		expect(@gadget.title).to eq("iPhone4s")
		expect(@gadget.photos.count).to eq(files_count+1)
		return @gadget
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
				    login_as(@user, run_callbacks: false)
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
					scenario "COVER FLOW mode available #1080", js: true do
						click_link "View in Cover Flow mode"
						expect(page).to have_text("Cover Flow View")
					end
					scenario "LIST mode available #1081", js: true do
						click_link "View in List mode"
						expect(page).to have_text("List View")
					end
					scenario "only MY OWN gadgets are listed" do
						expect { create(:gadget, title: "Another user's gadget", user: @another_user) }.to change(Gadget, :count).by(1)
						visit gadgets_path
						expect(page).not_to have_text("Another user's gadget")						
					end
				end

				include_context "multiple files for upload" # this shared context is used to DRY two following specs which both rely on shared method gadget_with_photos

					describe "I can add new gadget" do
						scenario "I can upload many gadget images #1082", :js => true do
							gadget_with_photos
						end
					end

					describe "I can view existing gadget images" do
						scenario "In different sizes #1083", js: true do
							@gadget = gadget_with_photos
							[:full, :medium, :thumb].map { |size| expect(@gadget.photos.first.photo.exists?(size)).to be true }
						end
					end

				describe "In Cover Flow mode" do
					describe "I can search my gadgets by name #1096", js: true do 
						before(:each) do
							@gadets = ["iPhone 4s", "iPad mini", "iPad Air"]
							@gadets.map { |gadget| create(:gadget, title: gadget, user: @user)}
							visit gadgets_path
						end
						scenario "I click search input and see all my gadgets in list" do
							page.all('select#gadget_gadget_id option').map(&:text).should == ["", "iPhone 4s", "iPad mini", "iPad Air"]
						end
						scenario "I enter name of gadget which is not in collection and see no mathes", js: true do
							execute_script(' $("#gadget_gadget_id").select2("open")')
							expect(find('.select2-results')).to have_text @gadets.join(" ")
						end
						scenario "I enter part of existing gadget 'mini' and see 'iPad mini' only", js: true do
							execute_script(' $("#gadget_gadget_id").select2("open")')
							find("input.select2-input").set 'mini'
							expect(find('.select2-results')).to have_text "iPad mini"
						end
						scenario "With 'iPad mini' selected, I click 'go' button and only iPad mini is displayed", js: true do
							execute_script(' $("#gadget_gadget_id").select2("open")')
							find("input.select2-input").set 'mini'
							find("input.select2-input").native.send_keys(:return)
							expect(find('tr.collection_title')).to have_text "iPad mini"
							expect(page.all('tr.collection_title').map(&:text)).not_to have_text "iPhone 4s"
						end
						describe "I search for iPad mini by term 'mini'" do
							before(:each) do
								execute_script(' $("#gadget_gadget_id").select2("open")')
								find("input.select2-input").set 'mini'
								find("input.select2-input").native.send_keys(:return)
							end

							scenario "With 'iPad mini' selected, only iPad mini is displayed", js: true do
								expect(find('tr.collection_title')).to have_text "iPad mini"
								expect(page.all('tr.collection_title').map(&:text)).not_to have_text "iPhone 4s"
							end
							scenario "With 'iPad mini' selected, I click 'x' button to clear search, and ALL gadgets are displayed", js: true do
								expect(page.all('tr.collection_title').map(&:text)).not_to have_text "iPhone 4s"
								find(".clear_search").click
								expect(page.all('tr.collection_title').map(&:text).join()).to have_text @gadets.join(" Add Photos")
							end
						end
					end
				end
			end
		end

	end	

end