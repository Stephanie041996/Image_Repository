class ImgsController < ApplicationController
  before_action :set_img, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[ edit update destroy ]


  # GET /imgs or /imgs.json
  def index
    @imgs = Img.order(created_at: :desc).limit(20)
  end

  # GET /imgs/1 or /imgs/1.json
  def show
  end

  def correct_user
@img = current_user.imgs.find_by(id: params[:id])
redirect_to imgs_path, notice:"Not Authorized to edit this Image" if @img.nil?
  end

  def search
    @imgs = Img.where("lower(caption) LIKE?", "%" + params[:q] + "%")
  end

  # GET /imgs/new
  def new
    # @img = current_user.img.build
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
