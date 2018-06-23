class ShoesController < ApplicationController
  def index
  	# all shoes except buyer_id = 0 (no one buy) and uploade by user
  	puts current_user.id, '*****************************'
  	@shoes = Shoe.all.where(buyer_id: 0).where.not(user_id: current_user.id)
  end

  def show
  	# user' shoes buyer_id = 0
  	@shoesUserHaveButNoOne = Shoe.all.where(buyer_id: 0).where(user_id: current_user.id)
  	# User's shoes but has buyer_id taked
  	@shoesUserHaveButBuyer = Shoe.all.where(user_id: current_user.id).where.not(buyer_id: 0)
  	# all shoe but buyer_id = current_user.id
  	@shoesUserBought = Shoe.all.where(buyer_id: current_user.id)
  	puts current_user.id, '*****************************'
  end

  def create
  	new_shoe = Shoe.create(name: params[:name], user_id: current_user.id, buyer_id: 0, amount: params[:amount])
  	if new_shoe.valid?
  		redirect_to :back
  	else
  		redirect_to :back, alert: new_shoe.errors.full_messages
  	end
  end

  def update
  	shoe = Shoe.find_by(id: params[:id])
  	shoe.update(buyer_id: current_user.id)

  	redirect_to :back
  end

  def destroy
  	shoe = Shoe.find_by(id: params[:id])
  	shoe.destroy
  	redirect_to :back
  end




  def shoe
  	@shoe ||= Shoe.find_by(id: params[:id])
  end

  # def new_shoe
  # 	@new_shoe ||= Shoe.create(shoe_params)
  # end

  # private
  # 	def shoe_params
  # 		params.require(:shoe).permit(:name, :user_id, :buyer_id, :amount)
  # 	end


end
