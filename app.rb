require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

require 'nokogiri'
require 'open-uri'

require './models/model'

get '/' do
  url = "https://news.ycombinator.com/news"
  data = Nokogiri::HTML(open(url))

  articles = data.css('td.title > a')

  articles.each do |article|
    Model.find_or_create_by(name: article.content.strip)
  end

  @models = Model.last(100)

  erb :models
end
