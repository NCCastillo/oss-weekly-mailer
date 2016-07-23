class CreateGithubs < ActiveRecord::Migration[5.0]
  def change
    create_table :githubs do |t|
      t.timestamps
    end
  end
end
