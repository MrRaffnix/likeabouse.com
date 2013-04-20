xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Likeabouse.com - linking your Interests"
    xml.description "Site about Links & Stuffs"
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.name
        xml.description post.description
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link exended_post_url(post)
        xml.guid post.link
      end
    end
  end
end