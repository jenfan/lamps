class LentsController < ApplicationController
  before_action :set_lent, only: [:show, :edit, :update, :destroy]

  # GET /lents
  # GET /lents.json
  def index
    @lents = Lent.all_main
    respond_to do |format|
      format.html {  }
      format.js  { }
    end
  end
  # GET /lents/1
  # GET /lents/1.json
  def show
    @lents = @lent.lents(include: :images)
    respond_to do |format|
      format.html {  }
      format.js  { }
    end
    # render json: @lents
  end

  # GET /lents/new
  def new
    @lent = Lent.new
  end

  # GET /lents/1/edit
  def edit
  end

  # POST /lents
  # POST /lents.json
  def create
    @lent = Lent.new(lent_params)

    respond_to do |format|
      if @lent.save
        format.html { redirect_to @lent, notice: 'Lent was successfully created.' }
        format.json { render :show, status: :created, location: @lent }
      else
        format.html { render :new }
        format.json { render json: @lent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lents/1
  # PATCH/PUT /lents/1.json
  def update
    render json: params
    return false
    respond_to do |format|
      if @lent.update(lent_params)
        format.html { redirect_to @lent, notice: 'Lent was successfully updated.' }
        format.json { render :show, status: :ok, location: @lent }
      else
        format.html { render :edit }
        format.json { render json: @lent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lents/1
  # DELETE /lents/1.json
  def destroy
    @lent.destroy
    respond_to do |format|
      format.html { redirect_to lents_url, notice: 'Lent was successfully destroyed.' }
      format.json { head :no_content }
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
