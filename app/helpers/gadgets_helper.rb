module GadgetsHelper
	def view_mode_selector(view_mode, title, image)
		raw (link_to gadgets_path(view_mode: view_mode, format: :js), title: "View in #{title} mode", class: "btn btn-xs btn-warning", remote: true do
			i image
		end)
	end
end