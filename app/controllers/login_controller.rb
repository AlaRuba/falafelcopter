class LoginController < ApplicationController
  def main
  	patient = Patient.new
  	patient.start = Time.now.to_i
  	patient.answers = ""
  	patient.save
  	@patient_id = patient.id
  end
end
