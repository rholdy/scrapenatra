require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

require 'nokogiri'
require 'open-uri'

require './models/model'

get '/' do
  url = "https://news.ycombinator.com/news"
  data = Nokogiri::HTML(open(url))
  @models = []

  articles = data.css('td.title > a')

  articles.each do |article|
    new_model = Model.create(name: article.content.strip)
    @models << new_model
  end

  erb :models
end
