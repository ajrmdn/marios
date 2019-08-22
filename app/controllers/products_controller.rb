class ProductsController < ApplicationController

  def index
    @american_made = Product.america
    @top = Product.three_most_recent
    render :index
  end

  def all
    @products = Product.all
    render :all
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:notice] = "Nope! Try again!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    @product.save
    if @product.update(product_params)
      flash[:notice] = "Product Updated"
      redirect_to products_path
    else
      flash[:notice] = "Nope! Try again!"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product DESTROYED!!!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
