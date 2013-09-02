class PopulateScoreFieldForUsers < ActiveRecord::Migration
  def change
    user_scores = KarmaPoint.group(:user_id).sum(:value)
    user_scores.each do |user_id, total|
      user = User.find(user_id)
      user.update_attribute :score, total
    end
  end
end
