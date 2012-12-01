class Patient < ActiveRecord::Base
  attr_accessible :answers, :entry, :exit
end
