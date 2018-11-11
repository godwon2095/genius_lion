class TinymceAssetsController < ApplicationController
  def create
    file = params[:file]
    uploader = TinymceUploader.new #업로더라는 이름으로 좀업로더 객체 생성

    uploader.store!(file)
    render json: {
      image: {
        url: uploader.url
      }
    }, content_type: "text/html"
  end
end
