class ApplicationController < ActionController::API
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  private
    def record_not_found
      format.json { render status: :not_found, json: { errors: "Record not found" } }
    end
end
