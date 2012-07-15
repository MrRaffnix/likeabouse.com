require 'sprite_factory'

namespace :assets do
  desc 'recreate sprite images and css'
  task :resprite => :environment do
    icon_path = File.join Rails.root, "app", "assets", "images", "iconset"
    css_path = File.join Rails.root, "app", "assets", "stylesheets", "iconset"

    ["tiny", "minor", "small", "medium", "big", "large"].each do |iconsize|
      p "generating sprites for iconset: #{iconsize}"
      path = File.join(icon_path, iconsize)

      sass_path   = File.join(css_path, "_#{iconsize}.sass")
      sprite_path = File.join(icon_path, "#{iconsize}.png")

      SpriteFactory.run!(path, sprite_factory_options(sass_path, sprite_path, ".#{iconsize}_", "iconset/"))
      p "I am done with: #{iconsize}"
    end
  end
end

def sprite_factory_options(css_path, image_path, css_prefix, path_icon)
  options = {
    library: :chunkypng,
    layout: :packed,
    style: :sass,
    csspath: "'#{path_icon}$IMAGE'",
    output_style: css_path,
    output_image: image_path,
    selector: css_prefix
  }
end