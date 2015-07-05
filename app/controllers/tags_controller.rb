class TagsController < ActionController::Base
  def show
  	@creative = Creative.find(params[:id])
  	s3_contents = open(@creative.resource_url).read
  	s3_object = JSON.parse(s3_contents)
  	@ad_tag_code = s3_object['ad_tag_code']
		render :layout => 'tag_display' 
  end
end