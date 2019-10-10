
require 'nokogiri'
require 'open-uri'





def get_original_data_crypto
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  arr_crypto_name = []
  arr_crypto_name_original = page.xpath('//*[@class="text-left col-symbol"]')
  
  arr_crypto_name_original.each do |crypto_link|
	
      arr_crypto_name << crypto_link.text
    end

return arr_crypto_name
end


def get_original_data_price
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  arr_prices = []
  arr_prices_original = page.xpath('//*[@class="price"]')

arr_prices_original.each do |price_link|
	arr_prices << price_link.text
end
return arr_prices

end

def crypto_scrapper (arr_crypto_name, arr_prices)

  my_hash = {}
  arr_crypto_name.zip(arr_prices){|key,value| my_hash[key] = value}
  puts my_hash
end

arr_crypto_name = get_original_data_crypto
arr_prices = get_original_data_price
crypto_scrapper(arr_crypto_name,arr_prices)
