class InstructorsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor, status: 200
    end

    def create
        instructor = Instructor.create!(instructor_params)

        if instructor.valid?
            instructor.save
            redirect_to instructor_path(instructor)
        else
            redirect_to new_instructor_path
        end
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)

        render json: instructor, status: :ok
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy

        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end


    # def record_not_found(error)
    #     render json: {'error': error.message }, status: :not_found
    # end
end