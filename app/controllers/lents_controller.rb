class LentsController < ApplicationController
  def index
    @lents = Lent.all_main.includes(:images)
  end
  def show
    @lents = Lent.find(params[:id]).lents(include: :images)
  end
  def gallery
    @images = Image.all.collect {|x| { image: "#{x.image_full}" }}
  end
end