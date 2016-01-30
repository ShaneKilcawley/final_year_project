class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :games_played, :integer
    add_column :articles, :games_won, :integer
    add_column :articles, :games_drew, :integer
    add_column :articles, :games_lost, :integer
    add_column :articles, :goals_for, :integer
    add_column :articles, :goals_against, :integer
    add_column :articles, :goal_difference, :integer
    add_column :articles, :total_points, :integer
  end
end
