  def index
     @tags = ActsAsTaggableOn::Tag.most_used
  end
