class StudentsController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        students = Student.all
        render json: students, status: :ok
        #render json: "hello"
        #byebug
    end

    def show
        student = Student.find(params[:id])
        render json: student, status: 200
    end

    def create
        student = Student.create!(student_params)

        render json: student, status: :created
    end

    def update
        student = Student.find_by(id: params[:id])
        student.update(student_params)

        render json: "hello", status: :ok
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy

        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    # def record_not_found(error)
    #     byebug
    #     render json: {'error': error.message }, status: :not_found
    # end
end