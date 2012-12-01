class Patient < ActiveRecord::Base
  attr_accessible :answers, :entry, :exit

  def entry=(value)
  	self.entry = value
  end
end
