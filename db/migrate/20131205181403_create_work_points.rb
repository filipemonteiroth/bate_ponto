class CreateWorkPoints < ActiveRecord::Migration
  def change
    create_table :work_points do |t|
      t.timestamp :entrada
      t.timestamp :almoco
      t.timestamp :volta_almoco
      t.timestamp :saida

      t.timestamps
    end
  end
end
