#encoding utf-8
require 'yaml'
events = [
  {
    :when => "16-18/OUT",
    :who => "Softa [DB, JM, LT & PA]",
    :title => "Rails Rumble",
    :title_link => "http://railsrumble.com/teams/softa",
    :where => "Worldwide",
    :desc => "Not defined yet.",
    :event_title => "Rails Rumble MMX",
    :event_site => "http://railsrumble.com/"
  },{
    :when => "26/OUT",
    :who => "Juan Maiz",
    :title => "Treetop - O parser de Ruby",
    :title_link => "http://www.rubyconf.com.br/pt-BR/pages/speakers#juan_maiz",
    :where => "São Paulo, SP",
    :desc => "A minha idéia é explicar o que é um analisador de PEG e porque é útil. Então, vou escrever um parser para uma linguagem simples e formal. No final, podemos discutir o crescente uso de analisadores pela comunidade (Mail, Cucumber …) e onde isso nos levará.",
    :event_title => "RubyConf 2010",
    :event_site => "http://www.rubyconf.com.br/"
  },{
    :when => "29-30/OUT",
    :who => "Juan Maiz",
    :title => "Treetop – O parser de Ruby",
    :title_link => "http://rubyconfuruguay.org/en/speakers#joaomilho",
    :where => "Montevideo, Uruguay",
    :desc => "A minha idéia é explicar o que é um analisador de PEG e porque é útil. Então, vou escrever um parser para uma linguagem simples e formal. No final, podemos discutir o crescente uso de analisadores pela comunidade (Mail, Cucumber …) e onde isso nos levará.",
    :event_title => "RubyConf Uruguay 2010",
    :event_site => "http://rubyconfuruguay.org/"
  }
]
File.open('schedule.yml','w+'){|f| f.write events.to_yaml }