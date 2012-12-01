class Patient < ActiveRecord::Base
  attr_accessible :answers, :entry, :exit

  def entry=(value)
  	@entry = value
  end
end
