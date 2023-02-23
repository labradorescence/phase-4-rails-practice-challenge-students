class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_data

    private

    def record_not_found(error)
        render json: {'error': error.message }, status: :not_found
    end

    def invalid_data(error)
    # byebug
        render json: {'error': error.message}, status: 422
    end

end
