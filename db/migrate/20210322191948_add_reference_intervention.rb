class AddReferenceIntervention < ActiveRecord::Migration[5.2]
  def change
    add_reference :tableinterventions, :customers, foreign_key: true, null: false
    add_reference :tableinterventions, :buildings, foreign_key: true, null: false
    add_reference :tableinterventions, :batteries, foreign_key: true
    add_reference :tableinterventions, :columns, foreign_key: true
    add_reference :tableinterventions, :elevators, foreign_key: true
    add_reference :tableinterventions, :employees, foreign_key: true
  end
end
