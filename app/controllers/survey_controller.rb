class SurveyController < ApplicationController
  def view
  	@number = params[:number].to_i
    id = params[:patient].to_i
    @patient_id = id
    patient = Patient.find(id)
    answerSoFar = patient.answers
    answerSoFar += ":" + params[:answer]
    patient.answers = answerSoFar
    patient.save
  	if params[:follow] == "false"
  		@number += 1
  		questionArr = nil
      logger.debug "Order number: #{@number}"
  		questionArr = Question.where(:order => @number, :follow => false)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit", :patient => params[:patient]
  		end
  	else
  		answer = params[:answer].to_i
      logger.debug "Order number: #{answer}"
  		questionArr = nil
  		questionArr = Question.where(:follows => answer, :follow => true)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit", :patient => params[:patient]
  		end
  	end
  end

  def next
  end

  def limit
    @patient = params[:patient]
  end

  def map
    @patient_id = params[:patient]
    @number = params[:number].to_i
    answerArr = Answer.where(:id => params[:answer])
    @answer = answerArr[0]
    resourceArr = Resources.where(:answer_id => @answer.id)
    @resource = resourceArr[0]
    @address = @resource.address1.gsub(' ', '+') + ',' + @resource.address2.gsub(' ', '+') + ',' + @resource.city.gsub(' ', '+') + ',' + @resource.zipcode
    @name  = @resource.name
    @website = @resource.website
  end
end
