dir = File.expand_path(File.join(File.dirname(__FILE__), '', 'lib'))
require File.join(dir, 'httparty')
require 'active_support/inflector'
require 'pp'

class CEP
  include HTTParty

  base_uri 'http://cep.correiocontrol.com.br/'

  def self.checkCEP( * dados)
    url = "http://cep.correiocontrol.com.br/" + dados[0] + ".json"
    response = HTTParty.get(url)

    case response.code
      when 200
        parsed_response = JSON.parse(response.body)
        if dados[1].downcase == parsed_response["logradouro"].parameterize.gsub('-', ' ')
          puts 'Logradouro correto'
        else
          puts 'Logradourao incorreto'
        end
        if dados[2].downcase == parsed_response["bairro"].parameterize.gsub('-', ' ')
          puts 'bairro correto'
        else
          puts 'bairro incorreto'
        end
        if dados[3].downcase == parsed_response["localidade"].parameterize.gsub('-', ' ')
          puts 'localidade correto'
        else
          puts 'localidade incorreto'
        end
        if dados[4].downcase == parsed_response["uf"].downcase
          puts 'UF correto'
        else
          puts 'UF incorreto'
        end
      when 404
        puts 'Pagina nao encontrado!'
      when 500...600
        puts "Erro na requisicao: #{response.code}"
    end
  end
end

pp CEP.checkCEP('07910210','Rua Joao Mendes Junior','Jardim Professor Francisco Morato','Francisco Morato','SP')