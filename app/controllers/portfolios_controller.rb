class PortfoliosController < ApplicationController
  layout 'portfolio'

  access all: [:show, :index], site_admin: :all

  before_action :set_portfolio, except: [:index, :new, :create, :positions]

  def index
    @portfolio_items = Portfolio.by_position
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
    # 3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_path, notice: 'Portfolio created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path, notice: 'Portfolio updated'
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path, notice: 'Record was removed'
  end

  def positions
    params[:positions].each do |_, v|
      Portfolio.find(v[:id]).update!(position: v[:position])
    end

    render json: {status: :ok}
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio)
      .permit(
        :title,
        :subtitle,
        :body,
        :thumb_image,
        :main_image,
        technologies_attributes: [:id, :name, :_destroy]
      )
  end
end
