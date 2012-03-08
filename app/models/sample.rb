class Sample < ActiveRecord::Base
	
validates_presence_of :title, :length => { :minimum => 4, :message => "can't be blank"}
validates :description, :length => { :in => 10..100, :message => "should be greater than 10 and less than 100"}
validates_numericality_of :price, :message => "cant be string/special character"

end
