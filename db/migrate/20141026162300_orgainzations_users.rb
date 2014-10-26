class OrgainzationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users, id: false do |t|
      t.references :user
      t.references :organization
      t.foreign_key :users
      t.foreign_key :organizations
    end

    add_index :organizations_users, [:user_id, :organization_id], unique: true
  end
end
