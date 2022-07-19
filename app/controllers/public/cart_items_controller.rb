class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer!


  def index
    @cart_item = CartItem.new #この記述はitem_detailのページにも記載,新規投稿のために使用
    @cart_items = CartItem.all #ログイン中のユーザに結びついたカートアイテムが欲しい
    @cart_items.customer_id = current_customer.id  #上の一行と合わせcurrent_customer.cart_itemsとしても
    @total = 0   #合計金額の算出に使用する変数
  end

  def create #このアクション内でupdateとcreateにアクションを分岐する。もしデータがあったら、update,なかったらcreate
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id :cart_item_params[:item_id] ) #カート内に同一商品が存在するか調べる
    # もしカート内にデータがあったなら、同一商品を足してアップデート
      @cart_item.amount += (cart_item_params[:amount]).to_i
      @cart_item.save
      redirect_to cart_items_path #投稿したらカートに遷移？
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update #カート内での数量変更処理
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
