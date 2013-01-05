#!/bins/bash
APP_NAME=$1
if [ -e "$1" ]; then
	rm -fr $1
fi

echo "Creating $1 rails app with with Test::Unit (enable rspec) and Active Record (enable Mongodb)"
rails new $1 -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb -T -O && echo "Successfully created $1"
