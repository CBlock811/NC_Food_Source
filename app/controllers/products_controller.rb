class ProductsController < ApplicationController
  respond_to :html, :js

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @product = Product.new
    authorize @product
  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.build(product_params)
    authorize @product

    if @product.save!
      flash[:notice] = "Product was created."
    else
      flash[:error] = "There was an error saving. Please try again."
    end

    respond_with(@product) do |f|
      f.html {redirect_to @supplier }
    end
  end

  def destroy
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.find(params[:id])
    authorize @product

    if @product.destroy
      flash[:notice] = "Product was deleted."
      redirect_to @supplier 
    else
      flash[:error] = "Product couldn't be deleted. Try again."
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
