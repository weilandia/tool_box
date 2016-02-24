class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence:   true,
                       uniqueness: true
  validates :name,     presence:   true
  validates :password, presence:   true
  validates :role,     presence:   true
  has_many :tools, dependent: :delete_all

  enum role: %w(default admin)
end
