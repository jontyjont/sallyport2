class Admin::BlurbsController < Admin::ApplicationController

	before_filter :find_blurb, :except => [:index, :new, :create]

	def index
		@blurbs = Blurb.order(:cat, :id)
	end

	
	def new
     @blurb = Blurb.new

	end

	def create
      @blurb = Blurb.create(blurb_params)
      if @blurb.save
      	redirect_to admin_blurbs_path, notice: "Successfully created new blurb"
      else
      	render :new
      end
	end

	def edit

	end

	def update
	  @blurb.update_attributes(blurb_params)
      if @blurb.save
      	redirect_to admin_blurbs_path, notice: "Successfully updated blurb"
      else
      	render :edit
      end

	end


	def destroy
	  if @blurb.destroy
      	redirect_to admin_blurbs_path, :notice => "Successfully deleted blurb"
      else
      	redirect_to admin_blurbs_path, :notice => "Sorry failed to delete because: #{@blurb.errors.full_messages.to_sentence}"
      end

	end


	def find_blurb
		@blurb = Blurb.find params[:id]
	end

    private 

    def blurb_params
       params.require(:blurb).permit(:name, :cat, :content)
    end

end