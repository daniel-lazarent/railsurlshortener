class UrlsController < ApplicationController
  def new
	@shortened_url = Url.new
	@short_urls = Url.find(:all)
  end
  def create
	@shortened_url = Url.new(params[:url])
	#@shortened_url.key = ActiveSupport::Base64.encode64(@shortened_url.url)
	if @shortened_url.save
		flash[:shortened_id] = @shortened_url.id
		flash[:count] = @shortened_url.count
		flash[:org] = @shortened_url.url
		flash[:short_url] = @shortened_url.key
		redirect_to new_url_url
	else
		render :action => "new"
	end
  end
  def show
	@shortened_url = Url.where("key = ?", params[:key]).first
	@shortened_url.increment!(:count)
	redirect_to @shortened_url.url
  end
  def index
	@short_urls = Url.find(:all)
  end
  def ident
  @url = Url.where(:key => params['key']).first
	if @url
		redirect_to(@url.url)
	else
		render :text => "not found: #{params['key']}", :status => 404
	end
  end
end	