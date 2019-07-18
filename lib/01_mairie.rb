require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#definition de la méthode

def get_townhall_urls
#récupère les URLs de chaque ville du Val d'Oise
page_2 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")) 

    #téléchargement de l'ensemble des symboles
    full_website_mairie = page_2.xpath('//a[contains(@href, "./95/")]') 
    name_mairie = full_website_mairie.map { |string| string.text  } #recupère les noms

    website_mairie = full_website_mairie.map { |url| url['href'] } #url incomplet
    website_mairie.each do |i|
        i.slice!(0)
    end
    url_temp = [] #liste de tous les url complets
    website_mairie.each do  |part|
        resultat =  "https://www.annuaire-des-mairies.com#{part}"
        url_temp << resultat
    end
    [name_mairie, url_temp] # array comprenant les array avec les nom et un array avec les url
    
end




def get_townhall_email(name, url) #récupère l’e-mail d'une mairie à partir de l'URL de mairies
page_1 = Nokogiri::HTML(open("#{url}"))
#("https://www.annuaire-des-mairies.com/95/avernes.html"))   
#puts page.class   # => Nokogiri::HTML::Document
    
    #téléchargement de l'ensemble des symboles
email = page_1.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]') #xpath qui mène au mail
email_mairie = email.text
{name => email_mairie} # definition du hash name renvoie a la valeur mail
end

def perform #permet de faire la liste de mail 
    liste_final = []
    #appelle get towhall url
    array_nom_url = get_townhall_urls #array_nom_url comprend [name_mairie, url_temp]
    array_nom_url[1].length.times do |i|
        liste_final<<get_townhall_email(array_nom_url[0][i], array_nom_url[1][i])# ajoute dans le array final les hash{array_nom_url[0][i], array_nom_url[1][i]}
    end   
    return liste_final
end
perform



