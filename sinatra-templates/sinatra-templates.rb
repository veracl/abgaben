#################################################################################
## Programming challenge 6: Rendering templates in Sinatra                      #
## For this programming exercise you should have created a 'hello world'        #
## program in sinatra and you should know what routes are                       #
## Learn more about sinatra here: http://www.sinatrarb.com/intro.html           #
## Short ERb overview: http://fireapp.kkbox.com/doc/tutorial_2.html             #
#################################################################################

require 'sinatra'

class Person
  attr_reader :first_name, :last_name, :phone_number # a person has these 3 methods

  def initialize(name, phone_number)
    @first_name, @last_name = name.split(" ")
    @phone_number = phone_number
  end
end



get '/' do
  participants = [
    Person.new("Laura Liegener" , 999) ,
    Person.new("Leo Eckwert"    , 123) ,
    Person.new("Meike Fischer"  , 567) ,
  ]
  erb :index, :locals => {:participants => participants}
end
