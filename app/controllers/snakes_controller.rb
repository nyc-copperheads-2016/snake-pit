get '/' do
  @snakes = Snake.all
  erb :'snakes/index'
end
