class AddUserToWorkPoints < ActiveRecord::Migration
  def change
    add_column :work_points, :user_id, :integer
  end
end
