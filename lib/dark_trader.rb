require 'rubygems'
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


my_hash = {}

arr_n.zip(arr_p) {|key,value| my_hash[key] = value}
p my_hash

 end   
  


crypto_scrapper