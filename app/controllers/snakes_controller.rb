get '/' do
  snakes = Snake.all
  erb :'snakes/index', locals: { all_snakes: snakes }
end

get '/snakes/new' do
  erb :'snakes/form'
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
    erb :'snakes/form'
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
