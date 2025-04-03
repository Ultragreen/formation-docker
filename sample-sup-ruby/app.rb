require 'sinatra'
require 'prometheus/client'

require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

prometheus = Prometheus::Client.registry
$counter = Prometheus::Client::Counter.new(:my_app_requests_total, docstring: 'Total number of requests')
prometheus.register($counter)

class MyService < Sinatra::Base


  use ::Prometheus::Middleware::Collector
  use ::Prometheus::Middleware::Exporter

  get '/' do
    $counter.increment
    'Hello, World!'
  end

end
