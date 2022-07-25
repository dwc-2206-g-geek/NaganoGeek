class Public::OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @customer = current_customer
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
  if params[:order][:address_number] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  elsif params[:order][:address_number] == "2"
    if Address.where(id: params[:order][:address_id])
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save
      @order.postal_code = address_new.postal_code
      @order.address = address_new.address
      @order.name = address_new.name
    else
      render :new
    end
  else
    redirect_to request.referer
  end
  @cart_items = current_customer.cart_items.all
  @total = 0
  @total_payment = 0

  end

  def complete

  end

  def create
    cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
  @order.shipping_cost = 800
  if @order.save
    cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart.amount
      order_detail.price = cart.item.price
      order_detail.save
    end
    redirect_to complete_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :confirm
  end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_details.each do |order_detail|
      @total += (order_detail.price * 1.1).floor
    end
    @total_payment = @total + @order.shipping_cost.to_i
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
