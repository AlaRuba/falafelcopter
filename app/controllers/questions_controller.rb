class QuestionsController < ApplicationController
  def main
  end

  def add
  	question = Question.new
  	question.ask = params[:quest]
  	question.save
    if (params[:answer1] > 0) {
  	 answer1 = Answer.new
  	 answer1.reply = params[:answer1]
  	 answer1.question = question.id
  	 answer1.save
     question.a1 = answer1.id
    }
    if (params[:answer2] > 0) {
  	 answer2 = Answer.new
  	 answer2.reply = params[:answer2]
  	 answer2.question = question.id
  	 answer2.save
  	 question.a2 = answer2.id
    }
    if (params[:answer3] > 0) {
  	 answer3 = Answer.new
  	 answer3.reply = params[:answer3]
  	 answer3.question = question.id
  	 answer3.save
  	 question.a3 = answer3.id
    }
    if (params[:answer4] > 0) {
  	 answer4 = Answer.new
  	 answer4.reply = params[:answer4]
  	 answer4.question = question.id
  	 answer4.save
  	 question.a4 = answer4.id
    }
  	question.save
  	redirect_to :controller => "questions", :action => "main"
  end
end
