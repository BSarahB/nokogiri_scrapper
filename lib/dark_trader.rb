require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))



def get_original_data_crypto
  arr_crypto = []
  arr_crypto_original = page.xpath('//*[@class="text-left col-symbol"]')
  
  arr_crypto_original.each do |crypto_link|
	
    puts crypto_link
      arr_crypto << crypto_link.text
    end
return arr_crypto
end


def get_original_data_price
  arr_prices = []
  arr_prices_original = page.xpath('//*[@class="price"]')

arr_prices_original.each do |price_link|
	arr_prices << price_link.text
end
return arr_prices
end

def crypto_scrapper (arr_crypto, arr_prices)

  my_hash = {}
  arr_crypto.zip(arr_prices){|key,value| my_hash[key] = value}
	return my_hash
  puts my_hash
end

arr_crypto = get_original_data_crypto
arr_prices = get_original_data_price
crypto_scrapper(arr_original,arr_prices)
