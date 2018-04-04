class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    # @lists = List.where(:isPublic => true).or(:user_id => current_user.id)
    @lists = List.where("isPublic = ? OR user_id = ?", true, current_user.id)

  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def favorites
    favorites = Favorite.where(:user_id => current_user.id)
    @lists = favorites.map(&:list)
  end

  def set_favorites
    list = List.find(params[:list_id].to_s)
    favorite = Favorite.where(:user_id => current_user.id, :list_id => list.id)

    if favorite.count > 0
      favorite.first.destroy
      if params[:root_path] == "fav"
        redirect_to "/favorites"
      else
        redirect_to "/lists"
      end
    else
      favorite = Favorite.new()
      favorite.user_id = current_user.id
      favorite.list_id = list.id
      if favorite.save
        redirect_to "/lists"
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :isPublic)
    end
end
