class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolio_path, notice: 'Portfolio has been created'
    else
      flash.now[:notice] = 'Could not create portfolio'
      render :new
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
