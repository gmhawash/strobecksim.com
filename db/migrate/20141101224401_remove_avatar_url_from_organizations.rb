class RemoveAvatarUrlFromOrganizations < ActiveRecord::Migration
  def change
    change_table :organizations do |t|
      t.remove :avatar_url
      t.remove :registed_by_id
    end
  end
end
