class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :recipe_id, :user

  belongs_to :user
  belongs_to :recipe


end
