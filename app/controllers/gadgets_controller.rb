class GadgetsController < ApplicationController

  	before_action :set_gadget, only: [:show, :edit, :update, :destroy]
  	before_action :set_view_mode, :search_gadget, only: [:index]

	def index
	    @user_gadgets = Gadget.where(user: current_user)
	    gadgets_conditions = {user: current_user}
	    gadgets_conditions.merge!(id: @search_gadget) if @search_gadget


	    @gadgets = Gadget.where(gadgets_conditions)
	    respond_to do |format|
	        format.html { }
			format.js { }
	    end
	end

	def new
	    @gadget = Gadget.new
	end

	def create
	    @gadget = Gadget.new(gadget_params.merge(user: current_user))

	    respond_to do |format|
	      if @gadget.save
	        format.html { redirect_to @gadget, notice: 'Gadget was successfully created.' }
	      else
	        format.html { render action: 'new' }
	      end
	    end
	end

	def destroy
	    @gadget.destroy
	    respond_to do |format|
	      format.html { redirect_to gadgets_url }
	      format.json { head :no_content }
	    end
	end

	def update
		respond_to do |format|
		  if @gadget.update(gadget_params)
		    format.json { head :no_content }
		  else
		    format.json { render json: @gadget.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
	end

  private

    def set_gadget
      @gadget = Gadget.find(params[:id])
    end

    def search_gadget
      @search_gadget = params[:gadget][:gadget_id] if params[:gadget]
    end

    def gadget_params
      params.require(:gadget).permit(:title, :photo, :id)
    end

    def set_view_mode
    	@view_mode = params[:view_mode]
    	@view_mode ||= "cover"
    	@view_mode.to_sym
    end

	def xeditable? object = nil
	  true
	end
end
