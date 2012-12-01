class Patient < ActiveRecord::Base
  attr_accessible :answers
  attr_accessible :entry
  attr_accessible :exit
end
