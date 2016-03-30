class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    redirect_to links_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
