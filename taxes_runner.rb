#!/usr/bin/env ruby
require 'byebug'
require_relative 'product'

if ARGV.length > 0
  ARGV.each do |filename|
    taxes = 0
    total = 0
    File.read(filename).split("\n").map do |line|
      quantity, name, price = line.match(/(\d+) (.+) at (\d+\.\d+)/).captures
      product = Product.new(name, price.to_f, quantity.to_i)
      taxes += product.calculate_tax - product.price
      total += product.calculate_total
      puts product.to_s
    end
    puts "Sales Taxes: #{taxes.round(2)}"
    puts "Total: #{total.round(2)}"
  end
else
  puts "Usage: taxes_runner.rb <filename> <filename> ..."
end

