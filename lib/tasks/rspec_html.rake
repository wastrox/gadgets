require 'rspec/core/rake_task'

namespace :rspec_report do

	desc 'Run all specs and generate RSpec report in HTML'
	RSpec::Core::RakeTask.new(:html) do |t|
		t.rspec_opts = '--format html --out reports/rspec_results.html'
	end


	desc 'Run all specs, generate RSpec report and open it in the browser'
	task :browser do
    	Rake::Task['rspec_report:html'].invoke
    	`open reports/rspec_results.html` # This only works if running OS X.
  	end

end
