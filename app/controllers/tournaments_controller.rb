class TournamentsController < ApplicationController
	before_action :find_tournament, only: [:show, :edit, :update, :destroy]


	def index
		@tournaments = Tournament.all.order("created_at Desc")
	end

	def show

	end



	def new
		@tournament = current_user.tournaments.build
	end

	def create
		@tournament = current_user.tournaments.build(tournament_params)

		if @tournament.save
			redirect_to @tournament, notice: "Succesfully created Tournament"
		else
			render 'new'
		end

	end

	def edit

		
	end

	def update
		if @tournament.update(tournament_params)
			redirect_to @tournament, notice: "Tournament was Succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@tournament.destroy
		redirect_to root_path
	end



	private
		def tournament_params
			params.require(:tournament).permit(:title, :description, :image)
			
		end
		def find_tournament
			@tournament = Tournament.find(params[:id])
			
		end
end
