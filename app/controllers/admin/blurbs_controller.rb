class Admin::BlurbsController < Admin::ApplicationController

	before_filter :find_blurb, :except => [:index, :new, :create]

	def index
		@blurbs = Blurb.scoped
	end

	def show

	end

	def new
     @blurb = Blurb.new

	end

	def create
      @blurb = Blurb.create(:params[:blurb])
      if @blurb.save
      	respond_with [:admin, @blurb], "Successfully created new blurb"
      else
      	render :new
      end
	end

	def edit

	end

	def update
	  @blurb.update_attributes(:params[:blurb])
      if @blurb.save
      	respond_with [:admin, @blurb], "Successfully updated blurb"
      else
      	render :edit
      end

	end


	def destroy
	  if @blurb.destroy
      	respond_with [:admin, @blurb], :notice => "Successfully deleted blurb"
      else
      	render :show
      end

	end

	def find_blurb
		@blurb = Blurb.find params[:id]
	end


end