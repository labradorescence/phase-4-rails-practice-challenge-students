class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students, status: :ok
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
        student = Student.find(params[:id])
        student.update(student_params)
        render json: student, status: :ok
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        
        render json: student, status: :ok
        #head :no_content
    end


    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

 


end
