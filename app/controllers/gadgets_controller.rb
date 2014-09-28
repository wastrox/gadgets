class GadgetsController < ApplicationController

  	before_action :set_gadget, only: [ :show, :edit, :update, :destroy ]

	def index
	    @gadgets = Gadget.all
	end

	def new
	    @gadget = Gadget.new
	end

	def create
	    @gadget = Gadget.new(gadget_params)

	    respond_to do |format|
	      if @gadget.save
	        format.html { redirect_to @gadget, notice: 'Gadget was successfully created.' }
	      else
	        format.html { render action: 'new' }
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
      params.require(:gadget).permit(:title)
    end
end
