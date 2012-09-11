require "yaml"

class QuestionsController < ApplicationController
  @masterFollow = nil

  def main
    @follow = params[:follow]
    @followUps = params[:followUps]
  end

  def add
    	
    question = Question.new
    question.follow = params[:follow]
    question.follows = params[:follows]
  	question.ask = params[:quest]
  	question.save
    logger.debug "START"
    logger.debug "#{params[:followUps]}"
    logger.debug "END"
    if params[:followUps] != nil
      followUps = JSON.parse(params[:followUps])
    else
      followUps = Array.new
    end
    if (params[:answer1].length > 0) 
      answer1 = Answer.new
      answer1.reply = params[:answer1]
      answer1.question = question.id
      answer1.save
      question.a1 = answer1.id
      if params[:answer1_follow] == "yes"
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer1.id
        followUp[:choice] = answer1.reply
        followUps = followUps.append(followUp)
      end
    end
    if (params[:answer2].length > 0) 
  	 answer2 = Answer.new
  	 answer2.reply = params[:answer2]
  	 answer2.question = question.id
  	 answer2.save
  	 question.a2 = answer2.id
     if params[:answer2_follow] == "yes"
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer2.id
        followUp[:choice] = answer2.reply
        followUps = followUps.append(followUp)
      end
    end
    if (params[:answer3].length > 0) 
  	 answer3 = Answer.new
  	 answer3.reply = params[:answer3]
  	 answer3.question = question.id
  	 answer3.save
  	 question.a3 = answer3.id
     if params[:answer3_follow] == "yes"
        followUp = Hash.new
        followUp[:qestion] = question.ask
        followUp[:answerID] = answer3.id
        followUp[:choice] = answer3.reply
        followUps = followUps.append(followUp)
      end
    end
    if (params[:answer4].length > 0) 
      answer4 = Answer.new
      answer4.reply = params[:answer4]
      answer4.question = question.id
      answer4.save
      question.a4 = answer4.id
      if params[:answer4_follow] == "yes"
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer4.id
        followUp[:choice] = answer4.reply
        followUps = followUps.append(followUp)
      end
    end
  	question.save
    if (followUps.length > 0)
      @masterFollow = followUps
      redirect_to :controller => "questions", :action => "main", :followUps => followUps, :follow =>true 
    else
      @masterFollow = nil
      redirect_to :controller => "questions", :action => "main", :follow => false
    end
  end
end
