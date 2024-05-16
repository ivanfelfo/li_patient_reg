class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :document_photo

      t.timestamps
    end
  end
end
