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
    question.order = params[:order]
  	question.save
    if params[:followUps] != nil
      followUps = JSON.parse(params[:followUps])
    else
      question.follow = false
      followUps = Array.new
    end
    if (params[:answer1].length > 0) 
      answer1 = Answer.new
      answer1.reply = params[:answer1]
      answer1.question = question.id
      question.a1 = answer1.id
      if params[:answer1_follow] == "yes"
        answer1.hasfq = true
        answer1.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer1.id
        followUp[:choice] = answer1.reply
        followUps = followUps.append(followUp)
      else
        answer1.hasfq = false
      end
      if params[:resource1_follow] == "yes"
        answer1.resource_bool = true
      else
        answer1.resource_bool = false
      end
      answer1.save
      if params[:resource1_follow] == "yes"
        resource1 = Resources.new
        resource1.name = params[:resource1_name]
        resource1.address1 = params[:resource1_address1]
        resource1.address2 = params[:resource1_address2]
        resource1.city = params[:resource1_city]
        resource1.zipcode = params[:resource1_zip]  
        resource1.phone1 = params[:resource1_phone1]
        resource1.phone2 = params[:resource1_phone2] 
        resource1.phone3 = params[:resource1_phone3] 
        resource1.website = params[:resource1_website] 
        resource1.instructions = params[:resource1_area] 
        resource1.answer_id = answer1.id
        resource1.save
      end
    end
    if (params[:answer2].length > 0) 
  	 answer2 = Answer.new
  	 answer2.reply = params[:answer2]
  	 answer2.question = question.id
  	 question.a2 = answer2.id
      if params[:answer2_follow] == "yes"
        answer2.hasfq = true
        answer2.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer2.id
        followUp[:choice] = answer2.reply
        followUps = followUps.append(followUp)
      else
        answer2.hasfq = false
        
      end
      if params[:resource2_follow] == "yes"
        answer2.resource_bool = true
      else
        answer2.resource_bool = false
      end
      answer2.save
      if params[:resource2_follow] == "yes"
        resource2 = Resources.new
        resource2.name = params[:resource2_name]
        resource2.address1 = params[:resource2_address1]
        resource2.address2 = params[:resource2_address2]
        resource2.city = params[:resource2_city]
        resource2.zipcode = params[:resource2_zip]  
        resource2.phone1 = params[:resource2_phone1]
        resource2.phone2 = params[:resource2_phone2] 
        resource2.phone3 = params[:resource2_phone3] 
        resource2.website = params[:resource2_website] 
        resource2.instructions = params[:resource2_area] 
        resource2.answer_id = answer2.id
        resource2.save
      end
    end
    if (params[:answer3].length > 0) 
  	 answer3 = Answer.new
  	 answer3.reply = params[:answer3]
  	 answer3.question = question.id
  	 question.a3 = answer3.id
     if params[:answer3_follow] == "yes"
        answer3.hasfq = true
        answer3.save
        followUp = Hash.new
        followUp[:qestion] = question.ask
        followUp[:answerID] = answer3.id
        followUp[:choice] = answer3.reply
        followUps = followUps.append(followUp)
      else
        answer3.hasfq = false
      end
      if params[:resource3_follow] == "yes"
        answer3.resource_bool = true
      else
        answer3.resource_bool = false
      end
      answer3.save
      if params[:resource3_follow] == "yes"
        resource3 = Resources.new
        resource3.name = params[:resource3_name]
        resource3.address1 = params[:resource3_address1]
        resource3.address2 = params[:resource3_address2]
        resource3.city = params[:resource3_city]
        resource3.zipcode = params[:resource3_zip]  
        resource3.phone1 = params[:resource3_phone1]
        resource3.phone2 = params[:resource3_phone2] 
        resource3.phone3 = params[:resource3_phone3] 
        resource3.website = params[:resource3_website] 
        resource3.instructions = params[:resource3_area] 
        resource3.answer_id = answer3.id
        resource3.save
      end
    end
    if (params[:answer4].length > 0) 
      answer4 = Answer.new
      answer4.reply = params[:answer4]
      answer4.question = question.id
      question.a4 = answer4.id
      if params[:answer4_follow] == "yes"
        answer4.hasfq = true
        answer4.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer4.id
        followUp[:choice] = answer4.reply
        followUps = followUps.append(followUp)
      else
        answer4.hasfq = false
      end
      if params[:resource4_follow] == "yes"
        answer4.resource_bool = true
      else
        answer4.resource_bool = false
      end
      answer4.save
      if params[:resource4_follow] == "yes"
        resource4 = Resources.new
        resource4.name = params[:resource4_name]
        resource4.address1 = params[:resource4_address1]
        resource4.address2 = params[:resource4_address2]
        resource4.city = params[:resource4_city]
        resource4.zipcode = params[:resource4_zip]  
        resource4.phone1 = params[:resource4_phone1]
        resource4.phone2 = params[:resource4_phone2] 
        resource4.phone3 = params[:resource4_phone3] 
        resource4.website = params[:resource4_website] 
        resource4.instructions = params[:resource4_area] 
        resource4.answer_id = answer4.id
        resource4.save
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
