class SurveyController < ApplicationController
  def view
  	@number = params[:number].to_i
  	if params[:follow] == "false"
  		@number += 1
  		questionArr = nil
  		questionArr = Question.where(:order => @number, :follow => false)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit"
  		end
  	else
  		answer = params[:answer].to_i
  		questionArr = nil
  		questionArr = Question.where(:follows => answer, :follow => true)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit"
  		end
  	end
  end

  def next
  end

  def limit
  end
end
