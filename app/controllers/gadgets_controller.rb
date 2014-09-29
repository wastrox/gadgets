class GadgetsController < ApplicationController

  	before_action :set_gadget, only: [:show, :edit, :update, :destroy]
  	before_action :set_view_mode, only: [:index]

	def index
	    @gadgets = Gadget.where(user: current_user)
	    respond_to do |format|
	        format.html { }
			format.js { sleep 0.2 }
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

	def update
		respond_to do |format|
		  if @gadget.update(gadget_params)
		    format.html { redirect_to @gadget, notice: 'Gadget was successfully updated.' }
		    format.json { head :no_content }
		  else
		    format.html { render action: 'edit' }
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

    def gadget_params
      params.require(:gadget).permit(:title, :photo)
    end

    def set_view_mode
    	@view_mode = params[:view_mode]
    	@view_mode ||= "list"
    	@view_mode.to_sym
    end
end
