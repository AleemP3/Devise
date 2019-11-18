class Add < ActiveRecord::Migration[6.0]
  def change
    add_reference :hobbies, :user 
  end
end
