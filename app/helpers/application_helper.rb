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

end
