class AddInfoToOrganizations < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.string :avatar_url
      t.json :details
    end
  end
end
