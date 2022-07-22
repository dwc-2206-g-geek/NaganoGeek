class Public::OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @customer = current_customer
    @order = Order.new

  end

  def confirm
    # @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name

    @order = Order.new(order_params)
  if params[:order][:address_number] == "1"
    @order.address = current_customer.customer_address
  elsif params[:order][:address_number] == "2"
    if Address.exists?(name: params[:order][:registered])
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save
    else
      render :new
    end
  else
    redirect_to confirm_path
  end
  @cart_items = current_customer.cart_items.all
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }

  end

  def complete

  end

  def create
    cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity
      order_item.order_price = cart.item.price
      order_item.save
    end
    redirect_to confirm_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
  end

  def index
    @orders = Order.all
  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status,:created_at)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
