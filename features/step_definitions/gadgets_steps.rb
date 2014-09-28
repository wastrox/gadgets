Given /^I have gadgets titled (.+)$/ do |gadget_titles|
  gadget_titles.split(', ').each do |title|
    create(:gadget, title: title)
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending
end