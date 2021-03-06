class PhotosController < ApplicationController

  before_filter :load_imageable

	def create
	  @photo = @imageable.photos.new(photos_params)
	  respond_to do |format|
	    if @photo.save
	      format.json {
	        data = {id: @photo.id, thumb: view_context.image_tag(@photo.photo.url(:thumb)), gadget_id: @imageable.id, thumb_path: @photo.photo.url(:thumb), medium: @photo.photo.url(:medium), full: @photo.photo.url(:full), title: "#{@imageable.title} photo #{@photo.photo_file_name}"}
	        render json: data, status: :created
	      }
	    else format.json { render json: @photo.errors, status: :unprocessable_entity } end
	  end
	end


	def photos_params
	  	params.require(:photo).permit(:photo)
	end

  	def load_imageable
    	resource, id = request.path.split('/')[1, 2]
    	@imageable = resource.singularize.classify.constantize.find(id)
  	end

end
