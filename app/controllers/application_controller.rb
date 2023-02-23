class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

private

    def record_not_found(error)
        #byebug
         render json: {error: error.message }, status: :not_found
    end

    def record_invalid_message(error)
      
        render json: {error: error.message}, status: 422
    end

end
