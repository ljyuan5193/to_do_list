class Todolist < ApplicationRecord
  validates_presence_of :name, :duedate, :note
end
