module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end  
	
	def meta_og_title
    content_for?(:meta_og_title) ? content_for(:meta_og_title) : DEFAULT_META["meta_og_title"]
  end	
	
	def meta_og_type
    content_for?(:meta_og_type) ? content_for(:meta_og_type) : DEFAULT_META["meta_og_type"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # ajoutez la ligne ci-dessous pour que le helper fonctionne indifféremment
    # avec une image dans vos assets ou une url absolue
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
