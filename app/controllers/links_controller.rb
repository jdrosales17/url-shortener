# frozen_string_literal: true

class LinksController < ApplicationController
  helper_method :link

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params.merge(token: SecureRandom.alphanumeric(8)))

    if link.save
      redirect_to link_info_path(link_token: link.token)
    else
      render :new
    end
  end

  def show
    redirect_to link.url
  end

  def info; end

  private

  def link
    @link ||= Link.find_by!(token: link_token)
  end

  def link_params
    params.require(:link).permit(:url)
  end

  def link_token
    params[:token] || params[:link_token]
  end
end
