class PortfoliosController < ApplicationController
  layout 'portfolio'

  access all: [:show, :index], site_admin: :all

  before_action :set_portfolio, except: [:index, :new, :create]

  def index
    @portfolio_items = if params[:subtitle].present?
      Portfolio.subtitle_items(params[:subtitle])
    else
      Portfolio.all
    end
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path, notice: 'Record was removed'
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
        technologies_attributes: [:id, :name]
      )
  end
end
