class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @link = current_user.links.create(link_params)

    if @link.save
      redirect_to links_path, :notice => "Your link has been added"
    else
      render "new"
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to links_path, :notice => "Your link has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path, :notice => "Your link has been deleted"
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
