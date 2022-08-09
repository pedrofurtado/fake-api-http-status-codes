require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'sinatra/multi_route'

set :port, ENV.fetch('PORT', 4567)
set :bind, '0.0.0.0'

route :get, '/' do
  'Usage: GET|POST|PUT|PATCH|DELETE /sleep/:sleep/code/:code/whatever-you-want?parameter_with=any-value'
end

route :get, :post, :put, :patch, :delete, '/sleep/:sleep/code/:code/?*' do
  sleep_time = params['sleep'].to_i rescue 0
  sleep sleep_time if sleep_time > 0

  code = params['code']

  status code

  json({ code: code })
end
