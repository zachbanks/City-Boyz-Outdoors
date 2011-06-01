class CreateSocialMessages < ActiveRecord::Migration
  def self.up
    create_table :social_messages do |t|
      t.text :body
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :social_messages
  end
end
