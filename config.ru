require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# PATCH and DELETE requests to use with hidden input
use Rack::MethodOverride
#mount other controllers with 'use'
use UsersController

run ApplicationController
