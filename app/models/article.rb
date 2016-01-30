
class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true

#					length: { minimum: 5}

	def goalDifference
		goalDifference = (goals_for - goals_against)
					#update goal_difference in database with its value
		update_column(:goal_difference, goalDifference)	

	end
	
	def points
		points = (games_won * 3) + (games_drew * 1)
		update_column(:total_points, points) 	#update total_points in database with its value
	end


end
