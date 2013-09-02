module UsersHelper
  def calculate_scores
    user_scores = KarmaPoint.group(:user_id).sum(:value)
    user_scores.each do |user_id, total|
      user = User.find(user_id)
      user[:score] = total
      user.save
    end
  end
end
