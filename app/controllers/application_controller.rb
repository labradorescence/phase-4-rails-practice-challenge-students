class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

    private

    def record_not_found(error)
        render json: {'error': error.message }, status: :not_found
    end

    def record_invalid_message error
       # byebug
        render json: {errors: error.message }, status: :unprocessable_entity
    end
end
