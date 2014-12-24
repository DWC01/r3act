class DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :size
end