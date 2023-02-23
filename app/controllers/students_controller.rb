class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_data

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def show 
        student = Student.find(params[:id])
        render json: student, status: :ok
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find_by(id: params[:id])
        student.update(student_params)
        render json: student, status: :ok
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        render json: student, status: :ok
    end

    private

    def student_params
        params.permit(:name, :age, :instructor_id, :major)
    end


end