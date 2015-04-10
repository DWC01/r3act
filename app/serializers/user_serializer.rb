class UserSerializer < ActiveModel::Serializer
  attributes :id,  :first_name, :last_name, :email, :avatar,
        :position, :title, :admin, :company_id,
        :created_at, :updated_at
end