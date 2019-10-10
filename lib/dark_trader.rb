require 'nokogiri'
require 'open-uri'



def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
 
  crypto_names = []
  crypto_prices = []

  arr_collecting_names = page.xpath('//*[@class="text-left col-symbol"]')
  arr_collecting_names.each do |name_link|
    crypto_names << name_link.text
  end


  arr_collecting_prices = page.xpath('//*[@class="price"]')
  arr_collecting_prices.each do |price_link|
    crypto_prices << price_link.text
end

  zipped_array = crypto_names.zip(crypto_prices)
  array_of_hashes = []
  zipped_array.each do |element| 
    array_of_hashes << {element[0] => element[1]} 
end
  
  puts array_of_hashes
  return array_of_hashes
end

crypto_scrapper









