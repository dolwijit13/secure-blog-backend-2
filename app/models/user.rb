# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  display_name :text
#  password     :text
#  user_name    :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
    validates :display_name, presence: true, length: {maximum: 50}
    validates :password, presence: true, length: {maximum: 50}
    validates :user_name, presence: true, length: {maximum: 50}
end
