class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :recipe_id, :user_name

  belongs_to :user
  belongs_to :recipe

  def user_name
    this.user.username
  end
end
