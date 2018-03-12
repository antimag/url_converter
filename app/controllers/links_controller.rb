class LinksController < ApplicationController
  before_action :authenticate
  before_action :set_link, only: :show

  def create
    @link = @user.links.create(link_params)
    render json: @link.as_json.merge("shorted_url" => @link.display_short_url), status: :created
  end

  def show
    respond_to do |format|
      if @link.present?
        format.html { redirect_to @link.given_url }
        format.json { render @link.given_url }
      end
    end
  end

  private
  
  def link_params
    params.permit(:given_url)
  end

  def set_link
    @link = Link.where(short_url: params[:short_url]).first
  end
end
