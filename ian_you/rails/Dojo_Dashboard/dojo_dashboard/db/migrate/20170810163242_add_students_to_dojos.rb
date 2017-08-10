class AddStudentsToDojos < ActiveRecord::Migration
  def change
    add_reference :dojos, :students, index: true, foreign_key: true
  end
end
