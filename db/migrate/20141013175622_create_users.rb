class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.boolean :agreement_accepted, default: false
      t.string :bitcoin_address

      t.timestamps
    end
  end
end
