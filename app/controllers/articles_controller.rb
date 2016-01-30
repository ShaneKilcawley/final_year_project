class ArticlesController < ApplicationController
	before_action :authorize, except: [:show, :index]

	def index

		@articles = Article.order(total_points: :desc, goal_difference: :desc)
	end

	def show
		@article = Article.find(params[:id])
#		@article = Article.find(:all, :order => 'created_at')
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			@article.goalDifference 	#Ensure the goal difference figure is updated too
			@article.points 			#Ensure points figure is also updated
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end


	private
		def article_params
			params.require(:article).permit(:title, :text, :games_played, :games_won, :games_drew, :games_lost, :goals_for, :goals_against, :goal_difference, :total_points)
		end

		def authorize
			if (current_user.nil?) || (current_user.admin == false)
				redirect_to sessions_new_path, alert: "Not authorized please log in!"	
			end
		end


end
