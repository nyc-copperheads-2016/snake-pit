helpers do
  def update_visited_counter!
    session[:counter] ||= 0
    session[:counter] += 1
    logger.warn("The counter is #{session[:counter]}")
  end

  def visit_counter
    session[:counter]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
