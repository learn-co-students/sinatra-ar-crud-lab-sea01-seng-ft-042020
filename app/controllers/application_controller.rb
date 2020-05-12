
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get('/articles/new') do
    erb(:new)
  end

  post('/articles') do
    @article = Article.create(params)
    redirect('/articles/'+@article.id.to_s)
    erb(:show)
  end

  get('/articles') do
    erb(:index)
  end

  get('/articles/:id') do
    @article = Article.find_by_id(params[:id])
    erb(:show)
  end

  get('/articles/:id/edit') do
    @article = Article.find_by_id(params[:id])
    erb(:edit)
  end

  patch('/articles/:id') do
    @article = Article.find_by_id(params[:id])
    @article.update(params.slice(:title,:content))
    redirect('/articles/'+@article.id.to_s)
    erb(:show)
  end

  delete('/articles/:id/delete') do
    Article.find_by_id(params[:id]).destroy
    redirect('/articles')
    erb(:index)
  end

end
