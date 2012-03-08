class Entry < ActiveRecord::Base
	def self.print_all
		Entry.find(:all, :conditions =>['created_at < ?', Time.now])
	end
	# scope :print_all, lambda { find(:all, :conditions =>['created_at < ?', Time.now]) }  
	def self.print_one(entry)
     find(entry)	
	end
	
	def self.update_one(entry)
		 find(entry)
	end
 
end
