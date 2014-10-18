class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :github_id
      t.string :name
      t.integer :registed_by_id
    end
  end
end
