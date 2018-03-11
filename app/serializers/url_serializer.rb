class UrlSerializer < ActiveModel::Serializer
  attributes :id, :original, :short_url, :created_at

  def short_url
    BASE_URL + '/' + self.object.key
  end
end
