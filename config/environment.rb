# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

include FactoryGirl::Syntax::Methods unless Rails.env.production?  #make FactoryGirl syntax methods available in console unless production env
