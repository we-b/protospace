class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :prototype, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
