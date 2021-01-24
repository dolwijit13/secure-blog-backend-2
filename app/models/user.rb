# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  display_name    :text
#  is_admin        :boolean
#  password_digest :string
#  user_name       :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password

    has_many :posts
    has_many :comments

    validates :display_name, presence: true, length: {maximum: 50}, uniqueness: true
    validates :password, presence: true, length: {maximum: 50, minimum: 8}
    validates :user_name, presence: true, length: {maximum: 50}, uniqueness: true
    validates :is_admin, absence: true

    def self.login(user_name, password)
        User.find_by(user_name: user_name, password: password)
    end
end
