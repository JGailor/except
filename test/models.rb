ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => File.join(File.dirname(__FILE__), "test.db")
)

class CreateSchema < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string :email, :password
      t.timestamps
    end

    create_table :profiles, :force => true do |t|
      t.string :firstname, :lastname
      t.integer :user_id, :age
      t.timestamps
    end
  end
end

CreateSchema.suppress_messages { CreateSchema.migrate(:up) }

class User < ActiveRecord::Base
  has_one :profile
end

class Profile < ActiveRecord::Base
  belongs_to :user
end
