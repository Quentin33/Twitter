class Post < ActiveRecord::Base
	validates :twit, :presence => true, :length => { :maximum => 140 }
end
