class ProductsController < ApplicationController

  def show
    @supplier = Supplier.find(params[:supplier_id])
    @product = Product.find(params[:id])
  end

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @product = Product.new
  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.build(product_params)

    if @product.save!
      flash[:notice] = "Product was created."
      redirect_to @supplier
    else
      flash[:error] = "There was an error saving. Please try again."
      render :new
    end

  end

  def destroy
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.find(params[:id])
    #authorize @product

    if @product.destroy
      flash[:notice] = "Product was deleted."
    else
      flash[:error] = "Product couldn't be deleted. Try again."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
