require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

require 'nokogiri'
require 'open-uri'

require './models/model'

get '/' do
  url = "https://news.ycombinator.com/news"
  data = Nokogiri::HTML(open(url))

  articles = data.css('.athing')

  articles.each do |article|
    Model.find_or_create_by(url: article.at_css('.title > a')[:href] ) do |new_article|
      new_article.name = article.at_css('.title > a').content
      new_article.points = article.next.at_css('.score') ? article.next.at_css('.score').text : 0
      new_article.user = article.next.at_css('a').content || "Anon"
    end
  end

  @models = Model.last(100)

  erb :models
end
