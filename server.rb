require 'sinatra'
	require 'csv'
	require 'pry'


	set :bind, '0.0.0.0'  # bind to all interfaces

	get '/' do
	  redirect '/articles'
	end

	get '/articles/new' do
	  # @articles = File.readlines('news.txt')
	  erb :articles
	end

	get '/articles' do

	  @csvarticles = CSV.readlines("articles.csv")
	  erb :index
	end

	post '/articles/new' do
	  article_title = params['article_title']
	  article_url = params['article_url']
	  article_description = params['article_description']
	  individual_article = [article_title, article_url, article_description]

	  # @objectarray = []
	  # CSV.foreach('articles.csv') do |row|
	  #   newsobject = Object.new(row[0], row[1], row[2])
	  #   @objectarray << newsobject

	  CSV.open("articles.csv", "a") do |csv|
	    csv << individual_article

	  end
	  redirect '/articles'
	end
