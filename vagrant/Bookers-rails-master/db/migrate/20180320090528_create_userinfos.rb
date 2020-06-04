class CreateUserinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :userinfos do |t|
      t.string :name
      t.string :introduction
      t.timestamps
    end
  end
end
