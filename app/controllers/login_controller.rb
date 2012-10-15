class LoginController < ApplicationController
  def main
  	patient = Patient.new
  	patient.answers = ""
  	patient.save
  	@patient_id = patient.id
  end
end
