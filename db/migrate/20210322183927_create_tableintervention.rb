class CreateTableintervention < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author, null: false
      t.datetime :intervention_start, default:""
      t.datetime :intervention_end, default:""
      t.string :result, default:"Incomplete"
      t.text :report 
      t.string :status, default:"Pending"
      t.timestamps
    end
  end
end
