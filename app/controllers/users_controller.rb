class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index    
    tmp = 1
    @rank = calc_rank
    @offset = 
    @users = User.order(sort_column + " " + sort_direction).take(10)
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    id = params[:id]
    @user = User.find(id)
    if !@user.present?
      respond_to do |format|
        format.html { redirect_to users_url, notice: '404' }
        format.json { head :no_content }
      end
    end
    flash.keep(:notice) 

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '200' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    @rank = calc_rank
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '200' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    @rank = calc_rank

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: '200' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: '404' }
        format.json { head :no_content }
      end
    end
    flash.keep(:notice) 
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :score)
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "rank"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def initial_sort
      User.all.sort{|a,b| b[:score] <=> a[:score]}
    end

    def calc_rank
      tmp = 1
      @rank = initial_sort

      @rank.each{|r|
        r.rank = tmp 
        tmp = tmp+1
        r.save
      }
    end
    
end




