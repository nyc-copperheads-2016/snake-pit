require 'pry'
get '/' do
  snakes = Snake.all
  update_visited_counter!
  erb :'snakes/index', locals: { all_snakes: snakes }
end

get '/snakes/new' do
  if request.xhr?
    erb :'snakes/form', layout: false
  else
    erb :'snakes/form'
  end
  # once the above makes sense to you, you can shortcut it like this (This is equivalent)
  # erb :'snakes/form', layout: !request.xhr?
end

get '/snakes/:id' do
  ## Find a snake
  # erb the snake
end

post '/snakes' do
  snake = Snake.new(name: params[:name], species: params[:species])
  if snake.save
    redirect '/'
  else
    erb :'snakes/form', locals: { errors: snake.errors.full_messages }
  end
end

delete '/snakes/:id' do
  snake = Snake.find_by(id: params[:id])
  if snake.delete
    redirect '/'
  else
    erb :'snakes/show_snake', locals: { errors: [ 'Could not delete snake' ] }
  end
end
