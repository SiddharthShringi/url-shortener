class LinksController < ApplicationController

  def show
    @link = Link.find_by!(short_url: params[:short_url])
    render status: :ok, json: { url: @link.url }

  end

  def create
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

  private
    def link_params
      params.require(:link).permit(:url)
    end
end
