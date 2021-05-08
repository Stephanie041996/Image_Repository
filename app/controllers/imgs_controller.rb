class ImgsController < ApplicationController
  before_action :set_img, only: %i[ show edit update destroy ]

  # GET /imgs or /imgs.json
  def index
    @imgs = Img.all
  end

  # GET /imgs/1 or /imgs/1.json
  def show
  end

  # GET /imgs/new
  def new
    @img = Img.new
  end

  # GET /imgs/1/edit
  def edit
  end

  # POST /imgs or /imgs.json
  def create
    @img = current_user.imgs.build(img_params)
    # @img = Img.new(img_params)

    respond_to do |format|
      if @img.save
        format.html { redirect_to @img, notice: "Img was successfully created." }
        format.json { render :show, status: :created, location: @img }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imgs/1 or /imgs/1.json
  def update
    respond_to do |format|
      if @img.update(img_params)
        format.html { redirect_to @img, notice: "Img was successfully updated." }
        format.json { render :show, status: :ok, location: @img }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgs/1 or /imgs/1.json
  def destroy
    @img.destroy
    respond_to do |format|
      format.html { redirect_to imgs_url, notice: "Img was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_img
      @img = Img.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def img_params
      params.require(:img).permit(:caption, :image, :user_id)
    end
end
