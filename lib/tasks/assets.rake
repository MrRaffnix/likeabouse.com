require 'sprite_factory'

namespace :assets do
  desc 'recreate sprite images and css'
  task :resprite => :environment do
    icon_path = File.join Rails.root, "app", "assets", "images", "iconset"
    css_path = File.join Rails.root, "app", "assets", "stylesheets"
    
    ["0_tiny"].each do |iconsize|
      path = File.join(icon_path, iconsize)
      
      SpriteFactory.run!(path, sprite_factory_options(css_path, ".super_small_"))
    end
    
    
  end
end


def sprite_factory_options(folder, prefix)
  options = {
    library: :chunkypng,
    layout: :packed,
    style: :sass,
    csspath: "image_url('$IMAGE')",
    output_style: folder,
    selector: "img#{prefix}"
  }
end
