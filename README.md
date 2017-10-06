# scrapenatra

Make Scraping the web fun again


rbenv  is a ruby version manager. Gotta manage your gems and your rubies. 
`brew install rbenv` 

`rbenv init` 

`rbenv install -l` (see which versions are available)

`rbenv install 2.4.1` (You don't have to use this version. Its just what I'm using)

Go to your projects folder
`git clone git@github.com:rholdy/scrapenatra.git` (copy the files for the sample project)

`cd scrapenatra`

`rbenv local 2.4.1` (tell your system which ruby version to use for this project)

`gem install bundler` (bundler is ruby's package manager. ruby libraries are called 'gems'. cute, huh?)

`bundle install` (this tells bundler to install your dependencies. these are listed in the GEMFILE.)

(You'll need to install postgres if you don't already have it)

Pop open `config/database.yml` and change the username to a postgres user on your system that has permissions to create and modify databases.

`rake db:create` (creates a DB with called 'scrapenatra-development' that you can use to save stuff in)

'rake db:migrate' (runs all the migrations in the db/migrate folder to set up your db)

`bundle exec shotgun` (this is what starts your webserver. head on over to localhost:9393 to see what you've got running
