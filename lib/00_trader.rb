require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'



page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
#puts page.class   # => Nokogiri::HTML::Document

def recolte_monnaie
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
#puts page.class   # => Nokogiri::HTML::Document
#téléchargement de l'ensemble des symboles
monnaie_temp = page.xpath('//*[@id]/td[3]')
# conservation du texte
monnaie_final = monnaie_temp.map { |string| string.text  }
end

def recolte_prix
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
#puts page.class   # => Nokogiri::HTML::Document
    #Téléchargement de l'ensemble des prix
    prix_temp = page.xpath('//*[@id]/td[5]/a')
    # conservation des prix
    prix_final = prix_temp.map { |price| price.text  }
    prix_final.map! do |value| 
        value[1..-1].to_f # enlève le $
    end
    prix_final
end

def perform
    monnaie_final = recolte_monnaie
    prix_final = recolte_prix
    crypto_array = []
    monnaie_final.each do |symbol|
    result = { symbol => prix_final[monnaie_final.index(symbol)].to_f }
        crypto_array << result #Création de l'array final (contenant les hashes)
    end
    return crypto_array
end
perform
