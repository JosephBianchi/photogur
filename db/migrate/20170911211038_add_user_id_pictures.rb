class AddUserIdPictures < ActiveRecord::Migration[5.0]
  def change
    change_table :pictures do |t|
      t.references :user
    end
  end
end
