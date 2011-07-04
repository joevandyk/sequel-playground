require 'rubygems'
require 'bundler/setup'
require 'sequel'
require 'benchmark'

DB = Sequel.connect(ENV['DATABASE_URL'])

items = DB[:orders] # Create a dataset
puts items.count

DB.run "set search_path to myschema;"
items = DB[:distributors;] # Create a dataset
puts items.count
