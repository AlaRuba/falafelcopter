require "yaml"

class QuestionsController < ApplicationController
  @masterFollow = nil

  def main
    @language = params[:language]
    @follow = params[:follow]
    @followUps = params[:followUps]
  end

  def language
    
  end

  def edit
  end

  def save

    id = params[:id].to_i
    question = Question.find(id)

    answerArr = Answer.where("question = ?", question.id)
    if answerArr.any?
      answerArr.each do |a|
        Answer.destroy(a.id)
      end
    end
    newAttr = Hash.new

    newAttr[:ask] = params[:quest]
    newAttr[:order] = params[:order]


    if (params[:answer1].length > 0) 
      answer1 = Answer.new
      answer1.reply = params[:answer1]
      answer1.question = question.id
      newAttr[:a1] = answer1.id
      if params[:answer1_follow] == "yes"
        answer1.hasfq = true
        answer1.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer1.id
        followUp[:choice] = answer1.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
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
     newAttr[:a2] = answer2.id

      if params[:answer2_follow] == "yes"
        answer2.hasfq = true
        answer2.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer2.id
        followUp[:choice] = answer2.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
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
     newAttr[:a3] = answer3.id
     if params[:answer3_follow] == "yes"
        answer3.hasfq = true
        answer3.save
        followUp = Hash.new
        followUp[:qestion] = question.ask
        followUp[:answerID] = answer3.id
        followUp[:choice] = answer3.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
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
      newAttr[:a4] = answer4.id
      if params[:answer4_follow] == "yes"
        answer4.hasfq = true
        answer4.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer4.id
        followUp[:choice] = answer4.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
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
    if (params[:answer5].length > 0) 
      answer5 = Answer.new
      answer5.reply = params[:answer5]
      answer5.question = question.id
      newAttr[:a5] = answer5.id
      if params[:answer5_follow] == "yes"
        answer5.hasfq = true
        answer5.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer5.id
        followUp[:choice] = answer5.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
        followUps = followUps.append(followUp)
      else
        answer5.hasfq = false
      end
      if params[:resource5_follow] == "yes"
        answer5.resource_bool = true
      else
        answer5.resource_bool = false
      end
      answer5.save
      if params[:resource5_follow] == "yes"
        resource5 = Resources.new
        resource5.name = params[:resource5_name]
        resource5.address1 = params[:resource5_address1]
        resource5.address2 = params[:resource5_address2]
        resource5.city = params[:resource5_city]
        resource5.zipcode = params[:resource5_zip]  
        resource5.phone1 = params[:resource5_phone1]
        resource5.phone2 = params[:resource5_phone2] 
        resource5.phone3 = params[:resource5_phone3] 
        resource5.website = params[:resource5_website] 
        resource5.instructions = params[:resource5_area] 
        resource5.answer_id = answer5.id
        resource5.save
      end
    end
    if (params[:answer6].length > 0) 
      answer6 = Answer.new
      answer6.reply = params[:answer6]
      answer6.question = question.id
      newAttr[:a6] = answer6.id
      if params[:answer6_follow] == "yes"
        answer6.hasfq = true
        answer6.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer6.id
        followUp[:choice] = answer6.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
        followUps = followUps.append(followUp)
      else
        answer6.hasfq = false
      end
      if params[:resource6_follow] == "yes"
        answer6.resource_bool = true
      else
        answer6.resource_bool = false
      end
      answer6.save
      if params[:resource6_follow] == "yes"
        resource6 = Resources.new
        resource6.name = params[:resource6_name]
        resource6.address1 = params[:resource6_address1]
        resource6.address2 = params[:resource6_address2]
        resource6.city = params[:resource6_city]
        resource6.zipcode = params[:resource6_zip]  
        resource6.phone1 = params[:resource6_phone1]
        resource6.phone2 = params[:resource6_phone2] 
        resource6.phone3 = params[:resource6_phone3] 
        resource6.website = params[:resource6_website] 
        resource6.instructions = params[:resource6_area] 
        resource6.answer_id = answer6.id
        resource6.save
      end
    end
    if (params[:answer7].length > 0) 
      answer7 = Answer.new
      answer7.reply = params[:answer7]
      answer7.question = question.id
      newAttr[:a7] = answer7.id
      if params[:answer7_follow] == "yes"
        answer7.hasfq = true
        answer7.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer7.id
        followUp[:choice] = answer7.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
        followUps = followUps.append(followUp)
      else
        answer7.hasfq = false
      end
      if params[:resource7_follow] == "yes"
        answer7.resource_bool = true
      else
        answer7.resource_bool = false
      end
      answer7.save
      if params[:resource7_follow] == "yes"
        resource7 = Resources.new
        resource7.name = params[:resource7_name]
        resource7.address1 = params[:resource7_address1]
        resource7.address2 = params[:resource7_address2]
        resource7.city = params[:resource7_city]
        resource7.zipcode = params[:resource7_zip]  
        resource7.phone1 = params[:resource7_phone1]
        resource7.phone2 = params[:resource7_phone2] 
        resource7.phone3 = params[:resource7_phone3] 
        resource7.website = params[:resource7_website] 
        resource7.instructions = params[:resource7_area] 
        resource7.answer_id = answer7.id
        resource7.save
      end
    end
    if (params[:answer8].length > 0) 
      answer8 = Answer.new
      answer8.reply = params[:answer8]
      answer8.question = question.id
      newAttr[:a8] = answer8.id
      if params[:answer8_follow] == "yes"
        answer8.hasfq = true
        answer8.save
        followUp = Hash.new
        followUp[:question] = question.ask
        followUp[:answerID] = answer8.id
        followUp[:choice] = answer8.reply
        followUps = followUps
        if (followUps.nil?)
          followUps = Array.new
        end
        followUps = followUps.append(followUp)
      else
        answer8.hasfq = false
      end
      if params[:resource4_follow] == "yes"
        answer8.resource_bool = true
      else
        answer8.resource_bool = false
      end
      answer8.save
      if params[:resource8_follow] == "yes"
        resource8 = Resources.new
        resource8.name = params[:resource8_name]
        resource8.address1 = params[:resource8_address1]
        resource8.address2 = params[:resource8_address2]
        resource8.city = params[:resource8_city]
        resource8.zipcode = params[:resource8_zip]  
        resource8.phone1 = params[:resource8_phone1]
        resource8.phone2 = params[:resource8_phone2] 
        resource8.phone3 = params[:resource8_phone3] 
        resource8.website = params[:resource8_website] 
        resource8.instructions = params[:resource8_area] 
        resource8.answer_id = answer4.id
        resource8.save
      end
    end
    Question.update(id, newAttr)
    redirect_to :controller => "questions", :action => "edit"
  end

  def change
    id = params[:id].to_i
    @question = Question.find(id)
  end

  def delete
    id = params[:id].to_i
    Question.destroy(id)
    redirect_to :controller => "questions", :action => "edit"
  end

  def add
    @language = params[:language]
    question = Question.new
    question.follow = params[:follow]
    question.follows = params[:follows]
  	question.ask = params[:quest]
    question.order = params[:order]
    question.category = params[:category]
    question.language = params[:language]
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
      redirect_to :controller => "questions", :action => "main", :followUps => followUps, :follow =>true, :language => @language 
    else
      @masterFollow = nil
      redirect_to :controller => "questions", :action => "main", :follow => false, :language => @language 
    end
  end
end
