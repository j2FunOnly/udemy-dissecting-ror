module PortfoliosHelper
  def image_generator(width, height)
    "https://placehold.it/#{width}x#{height}"
  end

  def portfolio_img(img, type = nil)
    return img if img.present?

    type == :thumb ? image_generator(350, 200) : image_generator(600, 400)
  end
end
