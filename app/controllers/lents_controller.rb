class LentsController < ApplicationController
  before_action :set_lent, only: [:show]

  # GET /lents
  # GET /lents.json
  def index
    @lents = Lent.all_main.includes(:images)
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  # GET /lents/1
  # GET /lents/1.json
  def show
    @lents = @lent.lents(include: :images)
    respond_to do |format|
      format.js  
    end
    # render json: @lents
  end

  def gallery
    @data = Image.all.collect {|x| "{image:'#{x.image_full.to_s}'},"}
    respond_to do |format|
      format.html 
      format.js  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lent
      @lent = Lent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lent_params
      params.require(:lent).permit(:main_id, :is_main, :name, :image_full, :image_thumb, :active)
    end
end
