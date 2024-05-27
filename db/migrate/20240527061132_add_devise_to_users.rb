# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    unless column_exists?(:users, :email)
      change_table :users do |t|
        ## Database authenticatable
        t.string :email,              null: false, default: ""
      end
      add_index :users, :email, unique: true
    end
    
    unless column_exists?(:users, :encrypted_password)
      change_table :users do |t|
        t.string :encrypted_password, null: false, default: ""
      end
    end
    
    unless column_exists?(:users, :reset_password_token)
      change_table :users do |t|
        ## Recoverable
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at
      end
      add_index :users, :reset_password_token, unique: true
    end
    
    unless column_exists?(:users, :remember_created_at)
      change_table :users do |t|
        ## Rememberable
        t.datetime :remember_created_at
      end
    end
    
    # You can similarly add checks for other columns
    
    # Uncomment below if timestamps were not included in your original model.
    # add_timestamps :users, null: false
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
