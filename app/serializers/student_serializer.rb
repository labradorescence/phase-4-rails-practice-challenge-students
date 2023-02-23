class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :age, :instructor_id, :created_at

  belongs_to :instructor
end
