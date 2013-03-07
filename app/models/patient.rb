class Patient < ActiveRecord::Base
  attr_accessible :answers, :entry, :exit, :created_at

  def entry=(value)
  	@entry = value
  end

  def exit=(value)
  	@entry = value
  end
end
