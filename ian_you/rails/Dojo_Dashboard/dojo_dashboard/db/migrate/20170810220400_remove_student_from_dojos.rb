class RemoveStudentFromDojos < ActiveRecord::Migration
  def change
    remove_reference :dojos, :students, index: true, foreign_key: true
  end
end
