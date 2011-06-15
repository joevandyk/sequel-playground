require 'rubygems'
require 'bundler/setup'
require 'sequel'
require 'sequel/adapters/postgres'
require 'sequel_pg'
require 'benchmark'

DB = Sequel.connect('postgres://localhost/test')

items = DB[:items] # Create a dataset

Benchmark.bm do |x|
  x.report "transaction" do
    5000.times do
      DB.transaction do
        # Populate the table
        items.insert(:name => 'abc', :price => rand * 100, :sku => 'first')
        items.insert(:name => 'def', :price => rand * 100, :sku => 'second')
        items.insert(:name => 'ghi', :price => rand * 100, :sku => 'third')
      end
    end
  end

  x.report "no transaction" do
    5000.times do
      # Populate the table
      items.insert(:name => 'abc', :price => rand * 100, :sku => 'first')
      items.insert(:name => 'def', :price => rand * 100, :sku => 'second')
      items.insert(:name => 'ghi', :price => rand * 100, :sku => 'third')
    end
  end

end

# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
puts "The average price is: #{items.avg(:price)}"
