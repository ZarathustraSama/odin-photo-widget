class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    return if params[:search].nil?

    @photos = if params[:search].empty?
                flickr.photos.getRecent
              else
                flickr.photos.search(api_key: ENV['FLICKR_API_KEY'], user_id: params[:search])
              end
  end
end
