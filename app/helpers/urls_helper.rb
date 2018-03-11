module UrlsHelper
  def short_url(key)
    request.base_url + '/' + key
  end   
end
