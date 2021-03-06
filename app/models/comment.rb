# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text
#  display_name :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  post_id      :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :content, presence: true, length: {maximum: 500}
    validates :user_id, presence: true
    validates :post_id, presence: true

    def to_api_format
        json = {}
        json[:_id] = self.id
        json[:displayName] = self.display_name
        json[:createdTime] = self.created_at
        json[:content] = self.content
        json[:postId] = self.post_id
        json
    end
end
