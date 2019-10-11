#CODE NON ACHEVE (PAS EU LE TEMPS ET LIMITES ATTEINTES) :D

require 'nokogiri'
require 'open-uri'

def get_congres_email
  
  array_list_urls = get_congres_urls
  deputes_emails = []
  n = 0
  576.times do #576 est array_list.urls.length
    page = Nokogiri::HTML(open(array_list_urls[n]))
    deputes_emails << page.xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[2]/a/text()")
    n = n+1
  end
  p deputes_emails
  return deputes_emails
#ajoutons le hash
 #{ array_urls => list_deputes } #
end

def get_congress_names
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  list_deputes = page.xpath("//ul[@class='col3']//li//a")
   array_list_urls = get_congres_urls

  array_list_deputes = []
   
  list_deputes.each do |depute|
p array_list_deputes
  

end
  return array_list_deputes

end
  
def get_congres_urls
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

  list_urls = page.xpath("//ul[@class='col3']//li//a")
  array_list_urls = []

  list_urls.each do |depute_url|
      array_list_urls << "http://www2.assemblee-nationale.fr" + depute_url['href'] #je remplis l array des liens href url de chaque depute
 #p array_list_urls

	end
 return array_list_urls
end
def hash(array_list_urls,array_list_deputes)

  zipped_array = array_list_urls.zip(array_list_deputes)
  array_of_hashes = []
  zipped_array.each do |element| 
    array_of_hashes << {element[0] => element[1]} 
end
p array_of_hashes
	end
array_list_urls = get_congres_urls
array_list_deputes = get_congress_names
hash(array_list_urls,array_list_deputes)




