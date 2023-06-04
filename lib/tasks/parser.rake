require 'open-uri'
require 'nokogiri'
require 'faker'

namespace :parser do
  desc "Parse libraries"
  task :parse_wiki =>:environment do
    url = 'https://en.wikipedia.org/wiki/List_of_libraries'
    html = URI.open(url, :read_timeout => 10).read
    doc = Nokogiri::HTML(html)

    libraries = doc.xpath('//h2[1]/following-sibling::*[following::h2[2]]')

    libraries.css('li').each do |library|
      link = library.css('a').first
      if link
        name = link.text
        year_of_creation = Faker::Date.between(from: '1700-01-01', to: '2023-04-27')
        p name
        Library.create(name: name, year_of_creation: year_of_creation)
      end
    end
  end
end