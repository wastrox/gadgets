module ApplicationHelper
	def i str, _class="", _id="", _title=""
		case str
		when "trash", "delete", "destroy"
			content_tag :span, "", class: "glyphicon glyphicon-trash #{_class}", id: _id
		when "edit", "pencil"
			content_tag :span, "", class: "glyphicon glyphicon-pencil #{_class}", id: _id
		when "ok", "succes", "create"
			content_tag :span, "", class: "glyphicon glyphicon-ok-circle #{_class}", id: _id
		when "remove", "cancel"
			content_tag :span, "", class: "glyphicon glyphicon-remove-circle #{_class}", id: _id
		when "question-sign", "question_sign", "question", "sign", "help"
			content_tag :span, "", class: "glyphicon glyphicon-question-sign #{_class}", id: _id
		when "profile"
			content_tag :span, "", class: "glyphicon glyphicon-user #{_class}", id: _id
		else	
			content_tag :span, "", class: "glyphicon glyphicon-#{str} #{_class}", id: _id
		end
	end
	def active(url) #navbar
		'active' if params[:controller] == url
	end
	def bs_alert(type, id, text)
		raw %Q(<div id="#{id}" class="alert alert-#{type.to_s} alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				#{text}</div>)
	end
	def hint(text)
		raw %Q(<span class="hint">#{text}</span>)
	end
	def gadget_popover_photo(gadget, image) # TODO: refactor this complex method 
		medium_img = image_tag(image.photo.url(:medium))
        link_to image_tag(image.photo.url(:thumb)), image.photo.url(:original), class: "btn btn-default pop", 
        data: {toggle: "popover", trigger: "focus", content: raw(medium_img.gsub(/["]/,"'")) }, title: "#{gadget.title} photo ##{image.id}"
	end
end
