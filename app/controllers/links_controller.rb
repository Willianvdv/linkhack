class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    if params.member? :link
      @link = Link.new(link_params)
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :shortlink, :argsstr)
  end
end
