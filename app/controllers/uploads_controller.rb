class UploadsController < ApplicationController
  def direct_upload
    current_user.update(image: params[:image])

    render json: {success: "Success"}
  end
end
