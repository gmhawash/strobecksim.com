class AddCreatedAtToOrganizationsUsers < ActiveRecord::Migration
  def change
    add_column :organizations_users, :created_at, :timestamp
  end
end
