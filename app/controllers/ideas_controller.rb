class IdeasController < ApplicationController
	
	before_action :set_idea, :only =>[:show , :edit, :update, :destroy]

	def index
		@ideas = Idea.page(params[:page]).per(5)
	end

	def new
		@idea = Idea.new
	end

	def create
		@idea = Idea.new(idea_params)
		
		if @idea.save
			flash[:notice] = "idea was successfully created"
			redirect_to ideas_url		
		else
			render :action => :new
		end	
	end

	def show
		@page_title = @idea.title
		
	end

	def edit
	end	

	def update
		if @idea.update(idea_params)
			flash[:notice] = "idea was successfully updated"
			redirect_to idea_url(@idea)
		else 
			render :action => :edit
		end	
	end	

	def destroy
		@idea.destroy
		flash[:alert] = "idea was successfully deleted"
		redirect_to ideas_url
	end

	private

	def set_idea
		@idea = Idea.find(params[:id])
	end

	def idea_params
		params.require(:idea).permit(:title , :description, :analysis_content)
	end
end
