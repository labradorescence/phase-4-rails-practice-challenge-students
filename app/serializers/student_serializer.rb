class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :age, :instructor_id, :created_at, :updated_at

  belongs_to :instructor
end
