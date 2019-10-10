
require 'nokogiri'
require 'open-uri'



def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
 
arr_n = []
arr_p = []

arr_1 = page.xpath('//*[@class="text-left col-symbol"]')
arr_1.each do |name_link|
arr_n << name_link.text
  end


arr_2 = page.xpath('//*[@class="price"]')
arr_2.each do |price_link|
arr_p << price_link.text
end

zipped_array = arr_n.zip(arr_p)
array_of_hashes = []
zipped_array.each do |element| 
  array_of_hashes << {element[0] => element[1]} 
end
  
  puts array_of_hashes
return array_of_hashes
end

crypto_scrapper









