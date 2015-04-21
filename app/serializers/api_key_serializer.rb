class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :access_token,
        :created_at, :updated_at
end