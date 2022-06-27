module PropertiesHelper
  def property_thumbnail(property)
    img = proprety.photo.present? ? property.photo.thumb.url : "placeholder.ppg"
    image_tag img, class: "property-thumb"
  end
end
