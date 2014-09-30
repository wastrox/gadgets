module GadgetsHelper
	def view_mode_selector(view_mode, title, image, current_view_mode)
		list_view = view_mode.equal?(:list)
		list_options = {view_mode: :list, format: :js} if list_view
	   	link_to i(image), gadgets_path(list_options), remote: (true if list_view), title: "View in #{title} mode", class: "btn btn-xs #{active_class(view_mode, current_view_mode)}"
    end
    	
	def active_class(view_mode, current_view_mode)
		view_mode.equal?(current_view_mode.to_sym) ? "btn-success active disabled" : "btn-default"
	end
	
	def gadget_popover_photo(gadget, image, index) # TODO: refactor this complex method 
		medium_img = image_tag(image.photo.url(:medium))
        link_to image_tag(image.photo.url(:thumb)), image.photo.url(:original), class: "btn btn-default pop", 
        data: {toggle: "popover", trigger: "focus", content: raw(medium_img.gsub(/["]/,"'")) }, title: gadget_title(gadget, index+1)
	end

	def gadgets_count(gadget)
		gadget.photos.count > 0 ? hint("(#{gadget.photos.count} photos)") : ""
	end

	def gadget_title(gadget, index)
		"#{gadget.title} photo ##{index}"
	end

end