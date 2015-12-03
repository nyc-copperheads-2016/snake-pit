get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params)
  if user.save
    redirect '/'
  else
    redirect '/errors=couldnt_make_a_user'
  end
end
