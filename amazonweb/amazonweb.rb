require 'httparty'

#(2)

def request_url(term)
	#(1)
	#(3) term
	return request_url
end

def search_items(word)	#(4)
	resonse = HTTParty.get(request_url(search_term))
	item_hash = response["ItemSearchResponse"]["Items"]["Item"]	#returns an array
	return item_hash
end

class AmazonProduct #(5)
	attr_accessor :title, :price, :image_url, :url
	def initialize(weird_stuff)
		self.title = weird_stuff["ItemAttributes"]["Title"]
		self.price = weird_stuff["OfferSummary"]["LowestNewPrice"]["Amount"].to_i
		self.image_url = weird_stuff["LargeImage"]["URL"]
		self.url = weird_stuff["DetailPageURL"]
	end

	def formatted_price	# formats price i.e. $2799 -> $27.99
		# devide price by 100
	end
end

def amazon_search(term) #(6)

	array_of_item_hashes = search_items(term)
	array_of_Amazon_Products = []

	array_of_item_hashes.each do |item|

		a = AmazonProduct.new(item)
		array_of_Amazon_Products << a

	end

	return array_of_Amazon_Products
end

amazon_search("example").each do |item|

	a = AmazonProduct.new(item)

end 

#NOTES

=begin
	
	- something with secret key to get items from amazon copy paste (1)
		-scratchpad
	- set constants from '1' outside of function (2)
	- whatever item used to genereate code for '1' replace with variable (3)
	- search_items gets an array of items related to you search term (4)
	- make a class to hold product details (5)
	- get an array of products using a search term (6)

	----got lost at views html shit----

	-use web.rb to run the functions
	-use views.erb to display

	** Google: amazon product api ruby **
	** Google: httparty xml**
=end



