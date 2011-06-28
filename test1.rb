require 'rubygems'
require 'bundler/setup'
require 'sequel'
require 'benchmark'

DB = Sequel.connect('postgres://localhost/test')

Items = DB[:items] # Create a dataset

Benchmark.bm do |x|
  x.report "fetch" do
    10.times do
      Items.each { }
    end
  end
end
