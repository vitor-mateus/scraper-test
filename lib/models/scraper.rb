require "open-uri"
require "nokogiri"


class Scraper

	attr_accessor :parse_page

	def initialize
		conn = open('http://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3').read
		@parse_page = Nokogiri::HTML(conn)
	end	
	
	def get_names
		parse_page.css(".product-name").css("p").children.map {|name| name.text}.compact
	end

	def get_prices
		parse_page.css(".product-price").css("span.local").children.map {|price| price.text}.compact	
	end

	def print_values
		names = get_names
		prices = get_prices

		prices.each_with_index do |p,i|
 		  puts ' --- index: ' + (i + 1).to_s + ' --- '
                  puts "Name: #{names[i]} | Price: #{p}"
		end
	    return true
	end


end


