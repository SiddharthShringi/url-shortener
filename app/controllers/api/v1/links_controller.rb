class Api::V1::LinksController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :encode

  def index
    @links = Link.order(pinned: :desc, created_at: :desc)
    render status: :ok, json: { links: @links }
  end

  def encode
    @link = Link.find_or_initialize_by(link_params)

    if @link.new_record?
      @link.short_url = @link.generate_short_url
      if @link.save
        render status: :ok, json: { short_url: @link.short_url }
      else
        render status: :unprocessable_entity, json: { errors: @link.errors.full_messages }
      end
    else
      render status: :ok, json: { short_url: @link.short_url }
    end
  end

  def decode
    @link = Link.find_by!(short_url: params[:short_url])
    render status: :ok, json: { url: @link.url }
  end

  def update
    @link = Link.find_by!(short_url: params[:short_url])
    if @link.update!(link_params)
      links = Link.order(pinned: :desc, created_at: :desc)
      render status: :ok, json: { links: links }
    else
      render status: :unprocessable_entity, json: { errors: @link.errors.full_messages }
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :pinned)
    end
end
