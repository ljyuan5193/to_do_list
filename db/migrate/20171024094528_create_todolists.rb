class CreateTodolists < ActiveRecord::Migration[5.1]
  def change
    create_table :todolists do |t|
        t.string :name
        t.string :note
        t.date :duedate
        t.text :errmsg
        t.text :description
        t.timestamps
    end
  end
end
