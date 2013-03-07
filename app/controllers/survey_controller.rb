class SurveyController < ApplicationController

  def physician
    @patient = params[:patient]
    @language = params[:language]
    history = Patient.find(@patient)
    answers = history.answers
    @numbers = answers.split(%r{:\s*})
    @numbers.delete("0")
    @numbers.delete("")
  end

  def view
    @language = params[:language]
  	@number = params[:number].to_i
    id = params[:patient].to_i
    @patient_id = id
    patient = Patient.find(id)
    answerSoFar = patient.answers
    answerSoFar += ":" + params[:answer]
    patient.answers = answerSoFar
    patient.language = @language
    patient.save
  	if params[:follow] == "false"
  		@number += 1
  		questionArr = nil
      logger.debug "Order number: #{@number}"
  		questionArr = Question.where(:order => @number, :follow => false, :language => @language)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit", :patient => params[:patient], :language => params[:language]
  		end
  	else
  		answer = params[:answer].to_i
      logger.debug "Order number: #{answer}"
  		questionArr = nil
  		questionArr = Question.where(:follows => answer, :follow => true, :language => @language)
  		if questionArr.any?
  			@question = questionArr[0]
  			@answers = Answer.where(:question => @question.id)
  		else
  			redirect_to :controller => "survey", :action => "limit", :patient => params[:patient], :language => params[:language]
  		end
  	end
  end

  def language
    patient = Patient.new
    patient.entry = Time.now.to_i
    patient.answers = ""
    patient.save
    @patient_id = patient.id
  end

  def next
  end

  def limit
    @patient = params[:patient]
    @language = params[:language]
    history = Patient.find(@patient)
    history.exit = Time.now.to_i
    history.save
    answers = history.answers
    @numbers = answers.split(%r{:\s*})
    @numbers.delete("0")
    @numbers.delete("")
    questions = Question.where(:language => @language)
    @response = {"language"=> @language}
    questions.each do |q|
      @response[q.id] = ""
    end
    @numbers.each do |index|
      id = Integer(index)
      answer = Answer.find(id)
      reply = answer.reply
      @response[answer.question] = reply
    end
    responseSave = History.new
    responseSave.date = Time.now
 #   responseSave.responses = ActiveSupport::JSON.encode(@response)
    responseSave.language = @language
    responseSave.save
    
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
