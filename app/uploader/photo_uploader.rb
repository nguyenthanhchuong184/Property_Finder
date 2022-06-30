# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog
  #storage LezciHana::Application.config.files_storage

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/#{model.class.to_s.underscore}/#{version_name}.png"
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [50, 50]
  end
  # version :thumb do
  #   process resize_to_fill: [350, 350]
  # end
  # version :small_thumb, from_version: :thumb do
  #   process resize_to_fill: [20, 20]
  # end
  #   version :medium do
  #     process :resize_to_fill_if_large => [80, 80]
  #   end

  #   version :large do
  #     process :resize_to_fill_if_large => [260, 260]
  #   end

  #   def resize_to_fill_if_large(width, height, gravity = "Center")
  #     manipulate! do |img|
  #       cols, rows = img[:dimensions]
  #       if cols > width && rows > height
  #         img.combine_options do |cmd|
  #           if width != cols || height != rows
  #             scale = [width / cols.to_f, height / rows.to_f].max
  #             cols = (scale * (cols + 0.5)).round
  #             rows = (scale * (rows + 0.5)).round
  #             cmd.resize "#{cols}x#{rows}"
  #           end
  #           cmd.gravity gravity
  #           cmd.background "rgba(255,255,255,0.0)"
  #           cmd.extent "#{width}x#{height}" if cols != width || rows != height
  #         end
  #       else
  #         img.resize "#{width}x#{height}>"
  #       end
  #       img = yield(img) if block_given?
  #       img
  #     end
  #   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
