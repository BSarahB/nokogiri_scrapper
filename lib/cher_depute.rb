#CODE NON ACHEVE (PAS EU LE TEMPS ET LIMITES ATTEINTES) :D

require 'nokogiri'
require 'open-uri'

def get_congres_email(congress_URL)
  
  array_list_urls = congress_URL
  deputes_emails = []
  n = 0
  576.times do # mettre un valeur 10 par exemple pour faire le test
    page = Nokogiri::HTML(open(array_list_urls[n]))# ouverture d'une nouvelle page pour chaque élément du tableau
    deputes_emails << page.xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[2]/a/text()")
    n = n+1
  end
  p deputes_emails
  return deputes_emails

  #array_urls = page #
 #{ array_urls => list_deputes } #
end

def get_congress_names
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  list_deputes = page.xpath("//ul[@class='col3']//li//a")
  array_list_deputes = []
    #p list_deputes
  list_deputes.each do |depute|
	array_list_deputes << depute.text

end
  return array_list_deputes
p array_list_deputes
end
  
def get_congres_urls
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

  list_urls = page.xpath("//ul[@class='col3']//li//a")
  array_list_urls = []

  list_urls.each do |depute_url|
      array_list_urls << "http://www2.assemblee-nationale.fr" + depute_url['href'] #je remplis l array des liens href url de chaque depute

	end

	#get_congress_emails(url) #on envoie sur la methode du haut
 return array_list_urls
 p array_list_urls
end
 #array_final << get_congres_email(depute.)

congress_URL = get_congres_urls

get_congres_email(congress_URL)
  