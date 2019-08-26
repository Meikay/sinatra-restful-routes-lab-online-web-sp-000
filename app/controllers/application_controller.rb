class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    erb :index
  end

  get '/index' do
    @recipe = Recipe.create(name: params[:name], recipe: params[:recipe])
    @recipe.save
  end

end
