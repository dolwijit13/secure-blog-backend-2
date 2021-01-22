# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  content      :text
#  display_name :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#

class Post < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :content, presence: true, length: {maximum: 500}
    validates :user_id, presence: true
    validates :display_name, presence: true

    def to_api_format
        json = {}
        json[:_id] = self.id
        json[:displayName] = self.display_name
        json[:createdTime] = self.created_at
        json[:content] = self.content
        json
    end
end
